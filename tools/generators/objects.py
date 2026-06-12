import re


CREATURE_IDS = {
    "DWARF",
    "DRAGON",
    "TROLL",
    "TROLL2",
    "BEAR",
    "SNAKE",
    "OGRE",
}

SCENERY_IDS = {
    "CLAM",
    "OBJ_26",
    "OBJ_27",
    "OBJ_29",
    "BLOOD",
}

INFRASTRUCTURE_IDS = {
    "PLANT2",
    "OBJ_30",
    "VOLCANO",
    "OBJ_40",
}

# Explicit movable objects that are represented in YAML but should not be auto-treated as
# immediately portable in the first pass.
NON_PORTABLE_MOVABLE_EXCEPTIONS = {
    "CLAM",
}


def i7_identifier(name: str) -> str:
    return re.sub(r"[^A-Za-z0-9_]", "_", name)


def quote(text) -> str:
    if text is None:
        return ""
    return str(text).replace('"', "'").replace("\n", "\\n")


def _clean_list(values):
    return [quote(v) for v in (values or []) if v is not None and str(v).strip()]


def _listify(value):
    if value is None:
        return []
    if isinstance(value, list):
        return value
    return [value]


def _split_locations(loc_value):
    locs = _listify(loc_value)
    if not locs:
        return [], []
    return locs[:1], locs[1:]


def _first_description(obj):
    descriptions = obj.get("descriptions")
    if not descriptions:
        return ""
    for line in descriptions:
        if line is None:
            continue
        text = str(line).strip()
        if text:
            return text
    return ""


def _has_behavioral_fields(obj):
    return any(field in obj for field in ("states", "changes", "sounds", "texts"))


def _classify_object(obj_id: str, obj: dict) -> str:
    """
    Object role taxonomy used by Milestone 1B:
    - treasure: item has treasure: true.
    - creature: known actor entities (dwarf, snake, dragon, ogre, etc.).
    - puzzle: non-creature objects with mutable behavioral fields (states/changes/sounds/texts).
    - infrastructure/system: immovable non-treasure/scenery objects.
    - scenery: static environmental objects that are not candidates for generic "take" behavior.
    - portable: remaining non-immovable non-creature objects.
    - unknown: malformed/placeholder entries that cannot be mapped yet.
    """
    if obj_id == "NO_OBJECT":
        return "unknown"
    if obj.get("treasure"):
        return "treasure"
    if obj_id in CREATURE_IDS:
        return "creature"
    if obj.get("immovable") and _has_behavioral_fields(obj):
        return "puzzle"
    if obj_id in NON_PORTABLE_MOVABLE_EXCEPTIONS:
        return "scenery"
    if obj_id in SCENERY_IDS:
        return "scenery"
    if obj.get("immovable") and obj_id in INFRASTRUCTURE_IDS:
        return "infrastructure"
    if obj.get("immovable"):
        return "infrastructure"
    return "portable"


def _emit_object_block(obj_id, obj, role):
    i7_id = i7_identifier(obj_id)
    words = obj.get("words") or []
    initial_locations, alternate_locations = _split_locations(obj.get("locations"))
    initial_location = initial_locations[0] if initial_locations else None
    inv = obj.get("inventory")
    desc = _first_description(obj)
    states = obj.get("states") or []
    changes = _clean_list(obj.get("changes"))
    sounds = _clean_list(obj.get("sounds"))
    texts = _clean_list(obj.get("texts"))

    lines = []
    lines.append(f"[ {obj_id} ]")
    lines.append(f"[ role={role} ]")
    if initial_location:
        lines.append(f"[ initial_location={initial_location} ]")
    if alternate_locations:
        lines.append(
            "[ alternate_locations="
            + ", ".join(str(v) for v in alternate_locations)
            + " ]"
        )
    lines.append("[ vocabulary=" + ", ".join(str(v) for v in words) + " ]")
    if inv is not None:
        lines.append(f"[ inventory={quote(inv)} ]")
    if states:
        lines.append("[ states=" + ", ".join(str(v) for v in states) + " ]")
    if changes:
        lines.append("[ changes=" + ", ".join(changes) + " ]")
    if sounds:
        lines.append("[ sounds=" + ", ".join(sounds) + " ]")
    if texts:
        lines.append("[ texts=" + ", ".join(texts) + " ]")

    if role == "unknown":
        lines.append("[ unsupported placeholder entry ]")
        lines.append("")
        return lines

    if role == "scenery":
        lines.append(f"{i7_id} is a scenery.")
        lines.append(f"{i7_id} is fixed in place.")
    else:
        lines.append(f"{i7_id} is a thing.")
        if role in ("puzzle", "infrastructure", "creature"):
            lines.append(f"{i7_id} is fixed in place.")

    if desc:
        lines.append(f'The description of {i7_id} is "{quote(desc)}".')

    if initial_location and initial_location != "LOC_NOWHERE":
        lines.append(f"{i7_id} is in {initial_location}.")

    if role == "treasure":
        lines.append(f"[ scoring_candidate: true ]")

    lines.append("")
    return lines


def generate_objects(data):
    # Generate objects grouped and annotated by role for traceability.
    objects = data["objects"]
    by_role = {
        "unknown": [],
        "treasure": [],
        "portable": [],
        "scenery": [],
        "puzzle": [],
        "infrastructure": [],
        "creature": [],
    }

    for obj_id, obj in objects:
        role = _classify_object(obj_id, obj)
        by_role[role].append((obj_id, obj))

    out = []
    out.append("[ Generated Objects ]")
    out.append("[ Object role taxonomy ]")
    out.append("[ treasure: object with adventure.yaml treasure: true ]")
    out.append("[ portable: movable items (default unless special-cased) ]")
    out.append("[ scenery: static environmental objects ]")
    out.append("[ puzzle: mutable objects with states/changes/sounds/texts ]")
    out.append("[ infrastructure: immovable support objects in the physical model ]")
    out.append("[ creature: active actor entities ]")
    out.append("[ unknown: unrepresentable/placeholder entries ]")
    out.append("")
    out.append("[ role summary ]")
    out.append(
        "[ unknown="
        + str(len(by_role["unknown"]))
        + " | treasure="
        + str(len(by_role["treasure"]))
        + " | portable="
        + str(len(by_role["portable"]))
        + " | scenery="
        + str(len(by_role["scenery"]))
        + " | puzzle="
        + str(len(by_role["puzzle"]))
        + " | infrastructure="
        + str(len(by_role["infrastructure"]))
        + " | creature="
        + str(len(by_role["creature"]))
        + " ]"
    )
    out.append("")

    role_order = (
        "treasure",
        "portable",
        "scenery",
        "puzzle",
        "infrastructure",
        "creature",
        "unknown",
    )

    for role in role_order:
        objects_by_role = by_role[role]
        if not objects_by_role:
            continue
        out.append(f"[ Role: {role} ]")
        for obj_id, obj in objects_by_role:
            out.extend(_emit_object_block(obj_id, obj, role))

    return "\n".join(out)
