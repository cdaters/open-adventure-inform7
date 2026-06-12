DIRECT_MAP_DIRECTIONS = {
    "NORTH": "north",
    "SOUTH": "south",
    "EAST": "east",
    "WEST": "west",
    "NE": "northeast",
    "SE": "southeast",
    "SW": "southwest",
    "NW": "northwest",
    "UP": "up",
    "DOWN": "down",
}

# Direction-like travel tokens that can be emitted as Inform 7 room adjacency.
# Some historical tokens are preserved for parser compatibility and are excluded from
# map matching unless they resolve to one of the above primitives.
TRAVEL_VERB_TO_DIRECTION = {
    "NORTH": "NORTH",
    "SOUTH": "SOUTH",
    "EAST": "EAST",
    "WEST": "WEST",
    "NE": "NE",
    "SE": "SE",
    "SW": "SW",
    "NW": "NW",
    "UP": "UP",
    "DOWN": "DOWN",
    "UPWAR": "UP",
    "INWAR": "INSIDE",
    "UPSTR": "UP",
    "DOWNS": "DOWN",
    "OUT": "OUT",
}

IGNORED_DIRECTION_VERBS = {"OUTDO"}
MAGIC_TRAVEL_VERBS = {"XYZZY", "PLUGH"}


def _format_verbs(verbs):
    if not verbs:
        return "<forced>"
    return " ".join(str(v) for v in verbs)


def _format_condition(condition):
    if condition is None:
        return "<none>"

    if isinstance(condition, list):
        return ", ".join(str(v) for v in condition)

    return str(condition)


def _is_random(cond):
    return isinstance(cond, list) and len(cond) >= 1 and cond[0] == "pct"


def _collect_goto_rule_metadata(rule):
    verbs = rule.get("verbs")
    cond = rule.get("cond")
    cond_text = _format_condition(cond)
    random_text = "yes" if _is_random(cond) else "no"
    forced = "yes" if verbs == [] else "no"
    return {
        "forced": forced,
        "conditional": "no" if cond is None else "yes",
        "random": random_text,
        "condition": cond_text,
        "status": "placeholder",
    }


def _collect_rules_by_action_type(travel_rules):
    by_type = {}
    for rule in travel_rules:
        action = rule.get("action")
        action_type = action[0] if isinstance(action, list) and action else "<unknown>"
        by_type.setdefault(action_type, []).append(rule)
    return by_type


def _emit_rule_line(rule, kind, status="placeholder", reason="unsupported for direct room map"):
    verbs = rule.get("verbs")
    meta = _collect_goto_rule_metadata(rule)
    if status:
        meta["status"] = status
    if reason:
        meta["reason"] = reason

    action = rule.get("action") or []
    destination = action[1] if isinstance(action, list) and len(action) > 1 else "<missing>"

    if kind == "goto":
        return (
            f"[ goto -> {destination} | verbs={_format_verbs(verbs)} | "
            f"forced={meta['forced']} | conditional={meta['conditional']} | "
            f"random={meta['random']} | condition={meta['condition']} | "
            f"status={meta['status']} | reason={meta['reason']} ]"
        )

    if kind == "speak":
        message = destination
        return (
            f"[ speak -> {message} | verbs={_format_verbs(verbs)} | "
            f"forced={meta['forced']} | conditional={meta['conditional']} | "
            f"condition={meta['condition']} | status={meta['status']} | "
            f"reason={meta['reason']} ]"
        )

    if kind == "special":
        special_code = destination
        return (
            f"[ special -> {special_code} | verbs={_format_verbs(verbs)} | "
            f"forced={meta['forced']} | conditional={meta['conditional']} | "
            f"condition={meta['condition']} | status={meta['status']} | "
            f"reason={meta['reason']} ]"
        )

    return (
        f"[ unknown action={action} | verbs={_format_verbs(verbs)} | "
        f"forced={meta['forced']} | conditional={meta['conditional']} | "
        f"condition={meta['condition']} | status={meta['status']} | "
        f"reason={meta['reason']} ]"
    )


def _extract_direct_direction(verbs):
    """
    Return a normalized I7 direction token when the rule can be represented as
    direct room-to-room adjacency, else None.

    A rule is considered direct if:
    * it has at least one mapped direction token,
    * all mapped direction tokens resolve to the same normalized direction,
    * and every non-ignored verb is a direction token we can map.
    """
    if not verbs:
        return None

    mapped_directions = []
    for verb in verbs:
        if verb in IGNORED_DIRECTION_VERBS:
            # Historical synonym with no reliable orientation in the YAML layer.
            continue
        direction = TRAVEL_VERB_TO_DIRECTION.get(verb)
        if direction is None:
            return None
        if direction not in DIRECT_MAP_DIRECTIONS:
            # Explicitly avoid emitting unsupported direction types as map connections.
            # This keeps generation conservative and parser/runtime-safe.
            return None
        mapped_directions.append(direction)

    if not mapped_directions:
        return None
    if len(set(mapped_directions)) != 1:
        return None
    return DIRECT_MAP_DIRECTIONS[mapped_directions[0]]


def _emit_direct_map_line(source, destination, direction):
    return f"{direction} of {source} is {destination}."


def generate_travel(data):
    # Milestone 2B direction-first generation:
    # 1) Emit real Inform 7 room adjacency when the rule is a deterministic,
    #    unambiguous goto transition.
    # 2) Emit all non-direct rules as generated placeholders to keep behavior
    #    parity with the YAML model until travel logic is implemented.
    out = []

    out.append("[ Generated Travel ]")
    out.append("")
    out.append("[ action taxonomy ]")
    out.append("[ goto: direct destination transition ]")
    out.append("[ speak: terminal message label ]")
    out.append("[ special: special movement case token ]")
    out.append("[ conditional: travel rule includes a cond field ]")
    out.append("[ random: conditional is [pct, N] ]")
    out.append("[ forced: verbs list is empty ]")
    out.append("[ unknown: any non-standard action type ]")
    out.append("[ direct map rule: goto+no cond+no forced+single mapped direction ]")
    out.append("[ non-direct travel rules are intentionally left as placeholders ]")
    out.append("")

    action_order = ("goto", "speak", "special", "<unknown>")
    total_direct_map_rules = 0
    total_travel_rules = 0
    total_travel_rules_placeholder = 0
    direct_locations = set()

    for loc_id, loc in data["locations"]:

        travel = loc.get("travel", [])
        if not travel:
            continue

        by_type = _collect_rules_by_action_type(travel)
        total_travel_rules += sum(len(rules) for rules in by_type.values())
        action_summary = ", ".join(
            f"{kind}={len(rules)}"
            for kind, rules in by_type.items()
            if kind in ("goto", "speak", "special", "<unknown>")
        )
        if not action_summary:
            action_summary = "no recognized travel actions"

        out.append(f"[ {loc_id} ]")
        out.append(f"[ action summary: {action_summary} ]")

        direct_rules = []
        non_direct_by_type = {}

        for kind in action_order:
            rules = by_type.get(kind, [])
            if not rules:
                continue

            if kind == "goto":
                for rule in rules:
                    action = rule.get("action") or []
                    destination = (
                        action[1]
                        if isinstance(action, list) and len(action) > 1
                        else "<missing>"
                    )
                    verbs = rule.get("verbs") or []
                    reason = "unknown"

                    if not verbs:
                        reason = "forced move"
                    elif any(verb in MAGIC_TRAVEL_VERBS for verb in verbs):
                        reason = "magic-word travel"
                    elif rule.get("cond") is not None:
                        reason = "conditional travel"
                    else:
                        direction = _extract_direct_direction(verbs)
                        if direction:
                            total_direct_map_rules += 1
                            direct_rules.append((direction, destination, rule))
                            continue
                        reason = "non-mappable or ambiguous direction"

                    total_travel_rules_placeholder += 1
                    non_direct_by_type.setdefault(kind, []).append((rule, reason))
            else:
                for rule in rules:
                    total_travel_rules_placeholder += 1
                    non_direct_by_type.setdefault(kind, []).append((rule, "non-direct"))

        if direct_rules:
            direct_locations.add(loc_id)
            out.append("[ direct map (goto) rules ]")
            for direction, destination, rule in direct_rules:
                out.append(_emit_direct_map_line(loc_id, destination, direction))
                out.append(
                    _emit_rule_line(
                        rule, "goto", status="direct_map", reason="direct adjacency"
                    )
                )

        for kind in action_order:
            entries = non_direct_by_type.get(kind, [])
            if not entries:
                continue

            out.append(f"[ {kind} rules ]")
            for rule, reason in entries:
                out.append(_emit_rule_line(rule, kind, status="placeholder", reason=reason))

        for kind, rules in by_type.items():
            if kind not in action_order:
                out.append(f"[ {kind} rules ]")
                for rule in rules:
                    total_travel_rules_placeholder += 1
                    out.append(_emit_rule_line(rule, kind))

            out.append("")

    out.append("[ generation summary ]")
    out.append(f"[ direct_map_rules={total_direct_map_rules} ]")
    out.append(f"[ direct_map_locations={len(direct_locations)} ]")
    out.append(f"[ total_travel_rules={total_travel_rules} ]")
    out.append(f"[ placeholder_rules={total_travel_rules_placeholder} ]")

    return "\n".join(out)
