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
        short_desc = quote(desc.get("short") or "")

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

    return "\n".join(out)