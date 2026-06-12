def generate_travel(data):

    out = []

    out.append("[ Generated Travel ]")
    out.append("")

    for loc_id, loc in data["locations"]:

        travel = loc.get("travel", [])

        if not travel:
            continue

        out.append(f"[ {loc_id} ]")

        for rule in travel:

            action = rule.get("action")

            if not action:
                continue

            if action[0] == "goto":

                destination = action[1]

                out.append(
                    f"[ goto {destination} via {rule['verbs']} ]"
                )

            else:

                out.append(
                    f"[ special action {action} via {rule['verbs']} ]"
                )

        out.append("")

    return "\n".join(out)