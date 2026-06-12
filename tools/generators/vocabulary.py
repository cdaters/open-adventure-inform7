def quote(text) -> str:
    if text is None:
        return ""
    return str(text).replace('"', "'")


def _normalize_entry_id(raw_id):
    """Normalize YAML keys that YAML parsers may coerce into booleans.

    adventure.yaml historically uses bare NO as a key under actions.  YAML's
    implicit-typing parser resolves that to bool False, so we recover the
    canonical token for downstream reporting.
    """
    if isinstance(raw_id, bool):
        return "YES" if raw_id is True else "NO"
    return str(raw_id)


def _to_word_list(value):
    if value is None:
        return []
    return [quote(w) for w in value if w is not None]


def _join_words(words):
    if not words:
        return "<none>"
    return ", ".join(str(w) for w in words)


# Motion ids that map directly to I7 direction-like behavior in the
# conceptual parser design:
# north/east/south/west, up/down, in/out, diagonal directions.
DIRECTION_MOTION_IDS = {
    "NORTH",
    "SOUTH",
    "EAST",
    "WEST",
    "NE",
    "SE",
    "SW",
    "NW",
    "UP",
    "DOWN",
    "INSIDE",
    "OUTSIDE",
}


MAGIC_MOTION_IDS = {"XYZZY", "PLUGH"}
MAGIC_ACTION_IDS = {"INVALIDMAGIC"}


ACTION_I7_EQUIVALENTS = {
    "CARRY": "I7 take/get",
    "DROP": "I7 drop",
    "LOOK": "I7 look/examine",
    "GO": "I7 go/walk/travel",
    "UNLOCK": "I7 open/lock",
    "LOCK": "I7 close/lock",
    "INVENTORY": "I7 inventory",
    "READ": "I7 read",
    "SAY": "I7 say",
    "SAVE": "I7 save command",
    "RESUME": "I7 restore/restart command",
    "FEE": "I7 say word without gameplay effect",
    "FIE": "I7 say word without gameplay effect",
    "FOE": "I7 say word without gameplay effect",
    "FOO": "I7 say word without gameplay effect",
    "FUM": "I7 say word without gameplay effect",
}


HISTORICAL_SHORTCUTS = {
    "g",  # get/take
    "i",  # inventory
    "l",  # look
    "x",  # look/examine
    "z",  # short command token
    "?",  # help
    "n",
    "s",
    "e",
    "w",
    "u",
    "d",
    "ne",
    "nw",
    "se",
    "sw",
    "in",
    "out",
}


def _collect_section_pairs(section):
    return [
        (
            _normalize_entry_id(raw_id),
            raw_id,
            (entry or {}),
            _to_word_list((entry or {}).get("words")),
        )
        for (raw_id, entry) in section
    ]


def _build_token_index(motion_pairs, action_pairs, object_pairs):
    """
    Build token->sources index for overlap detection.
    """
    token_index = {}
    for source_name, pairs in (
        ("motion", motion_pairs),
        ("action", action_pairs),
        ("object", object_pairs),
    ):
        for entry_id, _, _, words in pairs:
            for word in words:
                token_index.setdefault(word, []).append((source_name, entry_id))
    return token_index


def _emit_section_header():
    return [
        "[ Generated Vocabulary ]",
        "[ Adventure vocabulary is canonical: source/adventure.yaml ]",
        "[ Taxonomy ]",
        "[ motion: movement-trigger words ]",
        "[ action: command-verb words ]",
        "[ object: object noun words ]",
        "[ magic: tokens that trigger magic-like behavior ]",
        "[ abbreviation: compact input forms preserved from classic parser ]",
        "[ historical_shortcut: one-char/legacy convenience token from classic Adventure ]",
        "",
    ]


def _emit_summary(motion_pairs, action_pairs, object_pairs, token_index):
    motion_words = [word for _, _, _, words in motion_pairs for word in words]
    action_words = [word for _, _, _, words in action_pairs for word in words]
    object_words = [word for _, _, _, words in object_pairs for word in words]

    unique_motion = sorted(set(motion_words))
    unique_action = sorted(set(action_words))
    unique_object = sorted(set(object_words))
    unique_all = sorted(set(unique_motion + unique_action + unique_object))

    abbreviations = sorted(
        {word for word in unique_all if len(word) <= 2 or word == "?"}
    )
    historical_shortcuts = sorted(
        word for word in unique_all if word in HISTORICAL_SHORTCUTS
    )

    direction_like = []
    location_like = []
    for motion_id, _, _, words in motion_pairs:
        role = (
            "direction"
            if motion_id in DIRECTION_MOTION_IDS
            or any(w in {"n", "s", "e", "w", "u", "d", "ne", "nw", "se", "sw"} for w in words)
            else "location"
        )
        for word in words:
            target = direction_like if role == "direction" else location_like
            target.append((word, motion_id))

    magic_words = set()
    for motion_id, _, _, words in motion_pairs:
        if motion_id in MAGIC_MOTION_IDS:
            magic_words.update(words)
    for action_id, _, _, words in action_pairs:
        if action_id in MAGIC_ACTION_IDS:
            magic_words.update(words)

    noaction_actions = [
        action_id for action_id, _, entry, _ in action_pairs if entry.get("noaction")
    ]

    oldstyle_false_actions = [
        action_id for action_id, _, entry, _ in action_pairs if entry.get("oldstyle") is False
    ]
    oldstyle_false_motions = [
        motion_id for motion_id, _, entry, _ in motion_pairs if entry.get("oldstyle") is False
    ]

    overlap_tokens = sorted(
        (
            token,
            sorted(set(source for source, _ in refs)),
        )
        for token, refs in token_index.items()
        if len(set(source for source, _ in refs)) > 1
    )

    motion_null = sorted(
        entry_id for entry_id, _, entry, words in motion_pairs if not words
    )
    action_null = sorted(
        entry_id for entry_id, _, entry, words in action_pairs if not words
    )

    rows = []
    rows.append("[ section summaries ]")
    rows.append(f"[ motions: entries={len(motion_pairs)} unique_tokens={len(unique_motion)} ]")
    rows.append(f"[ actions: entries={len(action_pairs)} unique_tokens={len(unique_action)} ]")
    rows.append(f"[ objects: entries={len(object_pairs)} unique_tokens={len(unique_object)} ]")
    rows.append(
        f"[ total_unique_vocabulary={len(unique_all)} "
        f"motion_words={len(unique_motion)} action_words={len(unique_action)} "
        f"object_words={len(unique_object)} magic_words={len(magic_words)} ]"
    )
    rows.append(f"[ abbreviations={len(abbreviations)} historical_shortcuts={len(historical_shortcuts)} ]")
    rows.append(
        f"[ noaction_actions={len(noaction_actions)} oldstyle_false_actions={len(oldstyle_false_actions)} "
        f"oldstyle_false_motions={len(oldstyle_false_motions)} ]"
    )
    rows.append("")
    rows.append("[ direction-like motion words ]")
    rows.append("[ " + ", ".join(f"{word}←{source}" for word, source in sorted(direction_like)) + " ]")
    rows.append("[ location-like motion words ]")
    rows.append(
        "[ "
        + ", ".join(f"{word}←{source}" for word, source in sorted(location_like))
        + " ]"
    )
    rows.append("[ magic words ]")
    rows.append("[ " + ", ".join(sorted(magic_words)) + " ]")
    rows.append("[ abbreviations ]")
    rows.append("[ " + ", ".join(abbreviations) + " ]")
    rows.append("[ historical shortcuts ]")
    rows.append("[ " + ", ".join(historical_shortcuts) + " ]")
    rows.append("[ token collisions across motion/action/object ]")
    if overlap_tokens:
        for token, sources in overlap_tokens:
            rows.append(f"[ {token}: {'/'.join(sources)} ]")
    else:
        rows.append("[ none ]")
    rows.append("[ irregular entries ]")
    rows.append("[ motion_no_words=" + ", ".join(motion_null or ["<none>"]) + " ]")
    rows.append("[ action_no_words=" + ", ".join(action_null or ["<none>"]) + " ]")
    rows.append("")
    rows.append("[ action classification notes ]")
    if noaction_actions:
        rows.append("[ message_only_actions=" + ", ".join(noaction_actions) + " ]")
    if oldstyle_false_actions:
        rows.append(
            "[ oldstyle_false_actions="
            + ", ".join(oldstyle_false_actions)
            + " ]"
        )
    if oldstyle_false_motions:
        rows.append(
            "[ oldstyle_false_motions="
            + ", ".join(oldstyle_false_motions)
            + " ]"
        )
    rows.append("")
    rows.append("[ modern parser equivalents ]")
    rows.append("[ These can be generated as convenience aliases once parser wiring exists. ]")
    for action_id in sorted(ACTION_I7_EQUIVALENTS):
        rows.append(f"[ {action_id}: {ACTION_I7_EQUIVALENTS[action_id]} ]")
    rows.append("")
    rows.append("[ special parser handling required ]")
    rows.append("[ location-like motion tokens ]")
    rows.append("[ non-direction tokens should be routed to a generated travel dispatcher ]")
    rows.append("[ shared tokens between sections require disambiguation context ]")
    rows.append("[ invalid magic and version/info/news/help/no/yes/wiz commands are message-only ]")
    return rows


def _emit_block(section_name, entries):
    rows = [f"[ {section_name} vocabulary ]"]
    for entry_id, _, entry, words in entries:
        oldstyle = entry.get("oldstyle", True)
        if section_name == "motion":
            if entry_id in MAGIC_MOTION_IDS:
                role = "magic"
            elif entry_id in DIRECTION_MOTION_IDS:
                role = "direction"
            else:
                role = "travel"
            rows.append(f"[ {entry_id} | {role} | words={_join_words(words)} ]")
        elif section_name == "action":
            if entry_id in MAGIC_ACTION_IDS:
                role = "magic"
            else:
                role = "command"
            note = []
            if entry.get("noaction"):
                note.append("noaction")
            if oldstyle is False:
                note.append("oldstyle=false")
            if entry_id in ACTION_I7_EQUIVALENTS:
                note.append(f"i7_equivalent={ACTION_I7_EQUIVALENTS[entry_id]}")
            rows.append(
                f"[ {entry_id} | {role} | words={_join_words(words)} | "
                + f"{'; '.join(note) if note else 'no_flags'} ]"
            )
        else:
            rows.append(
                f"[ {entry_id} | object_name | words={_join_words(words)} ]"
            )

        if len(words) > 1:
            rows.append(
                f"[ synonym group: {entry_id} = {' | '.join(words)} ]"
            )
    rows.append("")
    return rows


def _emit_synonym_groups(motion_pairs, action_pairs, object_pairs):
    rows = ["[ synonym groups ]"]

    def _emit(prefix, pairs):
        groups = [
            (entry_id, words)
            for entry_id, _, _, words in pairs
            if len(words) > 1
        ]
        rows.append(f"[ {prefix} groups={len(groups)} ]")
        for entry_id, words in groups:
            rows.append(f"[ {entry_id}: {' | '.join(words)} ]")

    _emit("motion", motion_pairs)
    _emit("action", action_pairs)
    _emit("object", object_pairs)
    rows.append("")
    return rows


def generate_vocabulary(data):
    # Generate a parser-focused inventory of adventure.yaml vocabulary.
    # No gameplay behavior is emitted yet; this is classification and
    # compatibility metadata for the next parser implementation step.
    motions = _collect_section_pairs(data["motions"])
    actions = _collect_section_pairs(data["actions"])
    objects = _collect_section_pairs(data["objects"])

    token_index = _build_token_index(motions, actions, objects)

    out = []
    out.extend(_emit_section_header())
    out.extend(_emit_summary(motions, actions, objects, token_index))
    out.extend(_emit_synonym_groups(motions, actions, objects))
    out.extend(_emit_block("motion", motions))
    out.extend(_emit_block("action", actions))
    out.extend(_emit_block("object", objects))

    return "\n".join(out)
