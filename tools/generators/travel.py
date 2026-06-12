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


def _to_i7_text(value):
    if value is None:
        return "<none>"
    text = str(value)
    return text.replace('"', '""')


def _format_verbs(verbs):
    if not verbs:
        return "<forced>"
    return " ".join(str(v) for v in verbs)


def _condition_meta(cond):
    if cond is None:
        return {
            "kind": "none",
            "arg1": "<none>",
            "arg2": "<none>",
            "pct": 0,
            "needs_handwritten_predicate": False,
            "handwritten_note": "<none>",
        }

    if not isinstance(cond, list) or not cond:
        return {
            "kind": "unsupported",
            "arg1": _to_i7_text(cond),
            "arg2": "<none>",
            "pct": 0,
            "needs_handwritten_predicate": True,
            "handwritten_note": "unsupported condition payload",
        }

    cond_type = cond[0]
    args = cond[1:]
    cond_arg1 = str(args[0]) if len(args) >= 1 else "<none>"
    cond_arg2 = str(args[1]) if len(args) >= 2 else "<none>"
    if cond_type == "pct":
        pct = int(args[0]) if len(args) >= 1 and isinstance(args[0], int) else 0
    else:
        pct = 0

    if cond_type == "nodwarves":
        return {
            "kind": "nodwarves",
            "arg1": "<none>",
            "arg2": "<none>",
            "pct": 0,
            "needs_handwritten_predicate": True,
            "handwritten_note": "dwarf-avoidance predicate is implemented in hand-written dwarf logic",
        }

    return {
        "kind": cond_type,
        "arg1": cond_arg1,
        "arg2": cond_arg2,
        "pct": pct,
        "needs_handwritten_predicate": False,
        "handwritten_note": "<none>",
    }


def _classify_goto_kind(rule):
    verbs = rule.get("verbs") or []
    cond = rule.get("cond")

    if not verbs:
        return "goto_forced"

    if _is_magic_word(rule):
        return "goto_magic_word"

    if isinstance(cond, list) and cond and cond[0] == "pct":
        return "goto_random"

    if cond is not None:
        return "goto_conditional"

    if _extract_direct_direction(verbs):
        return "goto_direct"

    return "goto_non_direct"


def _is_magic_word(rule):
    return any(verb in MAGIC_TRAVEL_VERBS for verb in rule.get("verbs") or [])


def _needs_handwritten(rule):
    action = (rule.get("action") or [])
    action_kind = action[0] if isinstance(action, list) and action else "<unknown>"

    condition = _condition_meta(rule.get("cond"))
    handwritten_reason = []

    if action_kind == "special":
        handwritten_reason.append("special travel token requires hand-authored special-case movement logic")

    if condition["needs_handwritten_predicate"]:
        handwritten_reason.append(condition["handwritten_note"])

    return (bool(handwritten_reason), "; ".join(handwritten_reason) if handwritten_reason else "<none>")


def _collect_rules_by_action_type(travel_rules):
    by_type = {}
    for rule in travel_rules:
        action = rule.get("action")
        action_type = action[0] if isinstance(action, list) and action else "<unknown>"
        by_type.setdefault(action_type, []).append(rule)
    return by_type


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


def _emit_dispatch_table_row(rule_id, rule):
    return (
        f"{rule_id} "
        f'"{_to_i7_text(rule["source"])}" '
        f'"{_to_i7_text(rule["action"])}" '
        f'"{_to_i7_text(rule["travel_category"])}" '
        f'"{_to_i7_text(rule["destination"])}" '
        f'"{_to_i7_text(rule["verbs"])}" '
        f'{rule["forced"]} '
        f'"{_to_i7_text(rule["condition_kind"])}" '
        f'"{_to_i7_text(rule["condition_arg1"])}" '
        f'"{_to_i7_text(rule["condition_arg2"])}" '
        f'{rule["random_chance"]} '
        f'{rule["is_magic_word"]} '
        f'{rule["requires_handwritten"]} '
        f'"{_to_i7_text(rule["handwritten_reason"])}"'
    )


def _emit_non_direct_table(rows):
    lines = []
    lines.append("")
    lines.append("[ Non-direct dispatch metadata table ]")
    lines.append("Table of Generated Travel Non-Direct Rules")
    lines.append(
        "rule-id (number) source-loc (text) action-kind (text) travel-category (text) "
        "target (text) verbs (text) forced (truth state) condition-kind (text) "
        "condition-arg-1 (text) condition-arg-2 (text) "
        "random-chance (number) is-magic-word (truth state) "
        "requires-handwritten (truth state) handwritten-reason (text)"
    )
    if not rows:
        lines.append("[ no non-direct rules ]")
        return lines

    for row in rows:
        lines.append(_emit_dispatch_table_row(row["rule_id"], row))
    lines.append("")
    return lines


def generate_travel(data):
    out = []

    out.append("[ Generated Travel ]")
    out.append("[ Milestone 2C: generated travel dispatch for non-direct rules ]")
    out.append("[ action taxonomy ]")
    out.append("[ goto: direct destination transition ]")
    out.append("[ goto_direct: unconditional single mapped direction ]")
    out.append("[ goto_non_direct: deterministic non-mappable / ambiguous verb forms ]")
    out.append("[ goto_forced: verbs=[] (automatic transition) ]")
    out.append("[ goto_magic_word: includes XYZZY / PLUGH ]")
    out.append("[ goto_random: cond [pct, N] ]")
    out.append("[ goto_conditional: cond types carry/with/not/.. ]")
    out.append("[ speak: terminal message label ]")
    out.append("[ special: special movement code ]")
    out.append("[ generated table fields: source-loc, action-kind, travel-category, verbs, "
               "condition-kind, condition args, random-chance, magic-word marker, "
               "and handwritten requirement ]")
    out.append("[ special and nodwarves conditions remain unresolved (hand-written dependencies). ]")
    out.append("")

    action_order = ("goto", "speak", "special", "<unknown>")
    total_direct_map_rules = 0
    total_travel_rules = 0
    total_non_direct_rules = 0
    direct_locations = set()
    travel_categories = {}
    non_direct_rows = []
    unresolved_rules = []
    rule_id = 1

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
        local_non_direct_count = 0

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
                    category = _classify_goto_kind(rule)

                    if category == "goto_direct":
                        direction = _extract_direct_direction(verbs)
                        if direction:
                            total_direct_map_rules += 1
                            direct_rules.append((direction, destination, rule))
                            continue

                    requires_handwritten, handwritten_reason = _needs_handwritten(rule)
                    condition = _condition_meta(rule.get("cond"))
                    travel_categories.setdefault(category, 0)
                    travel_categories[category] += 1
                    non_direct_rows.append(
                        {
                            "rule_id": rule_id,
                            "source": loc_id,
                            "action": "goto",
                            "travel_category": category,
                            "destination": str(destination),
                            "verbs": _format_verbs(verbs),
                            "forced": "true" if not verbs else "false",
                            "condition_kind": condition["kind"],
                            "condition_arg1": condition["arg1"],
                            "condition_arg2": condition["arg2"],
                            "random_chance": condition["pct"] if category == "goto_random" else 0,
                            "is_magic_word": "true" if _is_magic_word(rule) else "false",
                            "requires_handwritten": "true" if requires_handwritten else "false",
                            "handwritten_reason": handwritten_reason,
                        }
                    )
                    if requires_handwritten:
                        unresolved_rules.append(rule_id)
                    rule_id += 1
                    local_non_direct_count += 1

            else:
                for rule in rules:
                    action = rule.get("action") or []
                    destination = (
                        action[1]
                        if isinstance(action, list) and len(action) > 1
                        else "<missing>"
                    )
                    if kind == "speak":
                        category = "speak_conditional" if rule.get("cond") is not None else "speak"
                    elif kind == "special":
                        category = "special_conditional" if rule.get("cond") is not None else "special"
                    else:
                        category = "unknown"

                    travel_categories.setdefault(category, 0)
                    travel_categories[category] += 1
                    requires_handwritten, handwritten_reason = _needs_handwritten(rule)
                    condition = _condition_meta(rule.get("cond"))
                    verbs = rule.get("verbs")
                    non_direct_rows.append(
                        {
                            "rule_id": rule_id,
                            "source": loc_id,
                            "action": kind,
                            "travel_category": category,
                            "destination": str(destination),
                            "verbs": _format_verbs(verbs),
                            "forced": "true" if not verbs else "false",
                            "condition_kind": condition["kind"],
                            "condition_arg1": condition["arg1"],
                            "condition_arg2": condition["arg2"],
                            "random_chance": condition["pct"] if category == "goto_random" else 0,
                            "is_magic_word": "true" if _is_magic_word(rule) else "false",
                            "requires_handwritten": "true" if requires_handwritten else "false",
                            "handwritten_reason": handwritten_reason,
                        }
                    )
                    if requires_handwritten:
                        unresolved_rules.append(rule_id)
                    rule_id += 1
                    local_non_direct_count += 1

        if direct_rules:
            direct_locations.add(loc_id)
            out.append("[ direct map (goto) rules ]")
            for direction, destination, _ in direct_rules:
                out.append(_emit_direct_map_line(loc_id, destination, direction))

        for kind, rules in by_type.items():
            if kind not in action_order:
                travel_category = "unknown"
                travel_categories.setdefault(travel_category, 0)
                for rule in rules:
                    travel_categories[travel_category] += 1
                    requires_handwritten, handwritten_reason = _needs_handwritten(rule)
                    condition = _condition_meta(rule.get("cond"))
                    destination = "<missing>"
                    action = rule.get("action") or []
                    if isinstance(action, list) and len(action) > 1:
                        destination = action[1]
                    verbs = rule.get("verbs")
                    non_direct_rows.append(
                        {
                            "rule_id": rule_id,
                            "source": loc_id,
                            "action": str(action[0]) if action else "<unknown>",
                            "travel_category": travel_category,
                            "destination": str(destination),
                            "verbs": _format_verbs(verbs),
                            "forced": "true" if not verbs else "false",
                            "condition_kind": condition["kind"],
                            "condition_arg1": condition["arg1"],
                            "condition_arg2": condition["arg2"],
                            "random_chance": 0,
                            "is_magic_word": "true" if _is_magic_word(rule) else "false",
                            "requires_handwritten": "true" if requires_handwritten else "false",
                            "handwritten_reason": handwritten_reason,
                        }
                    )
                    if requires_handwritten:
                        unresolved_rules.append(rule_id)
                    rule_id += 1
                    local_non_direct_count += 1

        out.append("")
        if local_non_direct_count:
            out.append(f"[ non-direct travel rules emitted to dispatch table: {local_non_direct_count} ]")

    total_non_direct_rules = len(non_direct_rows)
    out.extend(_emit_non_direct_table(non_direct_rows))

    out.append("[ generation summary ]")
    out.append(f"[ direct_map_rules={total_direct_map_rules} ]")
    out.append(f"[ direct_map_locations={len(direct_locations)} ]")
    out.append(f"[ total_travel_rules={total_travel_rules} ]")
    out.append(f"[ non_direct_rules={total_non_direct_rules} ]")
    resolved_by_generation = total_travel_rules - len(unresolved_rules)
    out.append(f"[ resolved_by_generation={resolved_by_generation} ]")
    out.append(f"[ unresolved_rules={len(unresolved_rules)} ]")
    out.append(f"[ unresolved_rule_ids={unresolved_rules or ['<none>']} ]")
    out.append("[ travel category counts ]")
    for category in sorted(travel_categories):
        out.append(f"[ {category}={travel_categories[category]} ]")

    return "\n".join(out)
