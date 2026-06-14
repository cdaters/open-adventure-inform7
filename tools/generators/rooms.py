import re


def i7_identifier(name: str) -> str:
    """
    Convert LOC_FOO_BAR into LOC_FOO_BAR.
    Keep YAML IDs stable and legal for Inform.
    """
    return re.sub(r"[^A-Za-z0-9_]", "_", name)


def quote(text) -> str:
    if text is None:
        return ""
    return str(text).replace('"', "'")


def fallback_short_description(loc_id: str, loc: dict) -> str:
    if loc_id.startswith("LOC_FOREST"):
        return "You're in forest."

    desc = loc.get("description", {})
    long_desc = desc.get("long") or ""
    if long_desc:
        first_line = str(long_desc).strip().splitlines()[0].strip()
        first_sentence = first_line.split(".")[0].strip()
        if first_sentence and len(first_sentence) <= 64:
            return first_sentence + "."

    label = loc_id.removeprefix("LOC_").replace("_", " ").lower()
    label = re.sub(r"\d+$", "", label).strip()
    if not label:
        label = "nowhere"
    return label.capitalize() + "."


def generate_rooms(data):

    out = []

    out.append("[ Generated from adventure.yaml ]")
    out.append("[ Rooms ]")
    out.append("")

    locations = data["locations"]

    for loc_id, loc in locations:

        room_id = i7_identifier(loc_id)

        desc = loc.get("description", {})

        long_desc = quote(desc.get("long") or "")
        short_desc = quote(desc.get("short") or fallback_short_description(loc_id, loc))

        out.append(f"{room_id} is a room.")

        if long_desc:
            out.append(
                f'The description of {room_id} is "{long_desc}".'
            )

        if short_desc:
            out.append(
                f'The short description of {room_id} is "{short_desc}".'
            )

        out.append("")

    out.append("To decide what text is the OpenAdventure canonical room id of (candidate-room - room):")
    for loc_id, _loc in locations:
        room_id = i7_identifier(loc_id)
        out.append(f"\tif candidate-room is {room_id}:")
        out.append(f'\t\tdecide on "{room_id}";')
    out.append("\tdecide on the normalized adventure id from the printed name of candidate-room.")
    out.append("")

    return "\n".join(out)
