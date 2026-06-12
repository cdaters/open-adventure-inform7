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


def _collect_rules_by_action_type(travel_rules):
    by_type = {}
    for rule in travel_rules:
        action = rule.get("action")
        action_type = action[0] if isinstance(action, list) and action else "<unknown>"
        by_type.setdefault(action_type, []).append(rule)
    return by_type


def _emit_rule_line(rule, kind):
    verbs = rule.get("verbs")
    cond = rule.get("cond")
    forced = "yes" if verbs == [] else "no"
    cond_text = _format_condition(cond)
    random_text = "yes" if _is_random(cond) else "no"

    action = rule.get("action") or []
    destination = action[1] if isinstance(action, list) and len(action) > 1 else "<missing>"

    if kind == "goto":
        return (
            f"[ goto -> {destination} | verbs={_format_verbs(verbs)} | "
            f"forced={forced} | conditional={'no' if cond is None else 'yes'} | "
            f"random={random_text} | condition={cond_text} ]"
        )

    if kind == "speak":
        message = destination
        return (
            f"[ speak -> {message} | verbs={_format_verbs(verbs)} | "
            f"forced={forced} | conditional={'no' if cond is None else 'yes'} | "
            f"condition={cond_text} ]"
        )

    if kind == "special":
        special_code = destination
        return (
            f"[ special -> {special_code} | verbs={_format_verbs(verbs)} | "
            f"forced={forced} | conditional={'no' if cond is None else 'yes'} | "
            f"condition={cond_text} ]"
        )

    return (
        f"[ unknown action={action} | verbs={_format_verbs(verbs)} | "
        f"forced={forced} | conditional={'no' if cond is None else 'yes'} | "
        f"condition={cond_text} ]"
    )


def generate_travel(data):
    # Classify travel entries without generating gameplay logic yet.
    # We keep the classification in machine-readable comment blocks:
    #   - goto: move directly to a destination location.
    #   - speak: emit a message label.
    #   - special: dispatch to one of the special movement cases in C source.
    #
    # Secondary buckets used by the movement translator later:
    #   - conditional: a rule has `cond` and therefore needs predicate evaluation.
    #   - random: `cond` is [pct, N], meaning probabilistic branching.
    #   - forced: empty verbs list means the transition is automatic (command-independent).
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
    out.append("")

    action_order = ("goto", "speak", "special", "<unknown>")

    for loc_id, loc in data["locations"]:

        travel = loc.get("travel", [])
        if not travel:
            continue

        by_type = _collect_rules_by_action_type(travel)
        action_summary = ", ".join(
            f"{kind}={len(rules)}"
            for kind, rules in by_type.items()
            if kind in ("goto", "speak", "special", "<unknown>")
        )
        if not action_summary:
            action_summary = "no recognized travel actions"

        out.append(f"[ {loc_id} ]")
        out.append(f"[ action summary: {action_summary} ]")

        for kind in action_order:
            rules = by_type.get(kind, [])
            if not rules:
                continue

            out.append(f"[ {kind} rules ]")
            for rule in rules:
                out.append(_emit_rule_line(rule, kind))

        for kind, rules in by_type.items():
            if kind not in action_order:
                out.append(f"[ {kind} rules ]")
                for rule in rules:
                    out.append(_emit_rule_line(rule, kind))

        out.append("")

    return "\n".join(out)
