#!/usr/bin/env python3
"""Compatibility wrapper for exporting the Inform 7 Author Edition project."""

from __future__ import annotations

import argparse
import re
import subprocess
import uuid
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DEFAULT_PROJECT = ROOT / "OpenAdventure-AuthorEdition.inform"
EXTENSION_AUTHOR = "OpenAdventure"

RUNTIME_FILES = [
    "OpenAdventure_State.ni",
    "OpenAdventure_Conditions.ni",
    "OpenAdventure_Plover.ni",
    "OpenAdventure_Troll.ni",
    "OpenAdventure_Bear.ni",
    "OpenAdventure_Dwarves.ni",
    "OpenAdventure_Pirate.ni",
    "OpenAdventure_Scoring.ni",
    "OpenAdventure_Reincarnation.ni",
    "OpenAdventure_Dragon.ni",
    "OpenAdventure_CaveClosing.ni",
    "OpenAdventure_Endgame.ni",
    "OpenAdventure_Information.ni",
    "OpenAdventure_Runtime.ni",
]

GENERATED_FILES = [
    ("Rooms.ni", "OpenAdventure Rooms"),
    ("Objects.ni", "OpenAdventure Objects"),
    ("Vocabulary.ni", "OpenAdventure Vocabulary"),
    ("Travel.ni", "OpenAdventure Travel"),
]


SETTINGS_PLIST = """<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>IFCompilerOptions</key>
	<dict>
		<key>IFSettingNaturalInform</key>
		<true/>
	</dict>
	<key>IFLibrarySettings</key>
	<dict>
		<key>IFSettingLibraryToUse</key>
		<string>Natural</string>
	</dict>
	<key>IFMiscSettings</key>
	<dict>
		<key>IFSettingInfix</key>
		<false/>
	</dict>
	<key>IFOutputSettings</key>
	<dict>
		<key>IFSettingCreateBlorb</key>
		<false/>
		<key>IFSettingZCodeVersion</key>
		<integer>256</integer>
	</dict>
	<key>IFRandomSettings</key>
	<dict/>
</dict>
</plist>
"""


def read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8")


def write_text(path: Path, text: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text, encoding="utf-8")


def normalized_ifid(project: Path) -> str:
    uuid_file = project / "uuid.txt"
    if uuid_file.exists():
        ifid = read_text(uuid_file).strip()
    else:
        ifid = str(uuid.uuid4()).upper()
    if not ifid:
        raise ValueError(f"empty IFID in {uuid_file}")
    return ifid


def materials_dir_for(project: Path) -> Path:
    return project.with_suffix(".materials")


def run_generator() -> None:
    subprocess.run(["python3", str(ROOT / "tools" / "yaml2inform.py")], cwd=ROOT, check=True)


def source_preamble() -> str:
    lines = []
    for line in read_text(ROOT / "OpenAdventure.ni").splitlines():
        if not line.startswith("Include "):
            lines.append(line)
    return "\n".join(lines) + "\n"


def runtime_extension_title(filename: str) -> str:
    stem = filename.removesuffix(".ni")
    if stem.startswith("OpenAdventure_"):
        stem = stem.removeprefix("OpenAdventure_")
    return "OpenAdventure " + stem.replace("_", " ")


def source_module_specs() -> list[tuple[str, str]]:
    specs = list(GENERATED_FILES)
    specs.extend((filename, runtime_extension_title(filename)) for filename in RUNTIME_FILES)
    return specs


def source_module_names() -> list[str]:
    return [filename for filename, _title in source_module_specs()]


def prepared_rooms() -> str:
    text = read_text(ROOT / "generated" / "Rooms.ni")
    text = text.replace("The short description of ", "The printed name of ")
    text = text.replace("[sic]", "[bracket]sic[close bracket]")
    text = text.replace(
        "[Witt Construction Company]",
        "[bracket]Witt Construction Company[close bracket]",
    )
    return text


def prepared_objects() -> str:
    output = []
    in_door_block = False
    section_re = re.compile(r"^\[[ \t]*[A-Z0-9_]+[ \t]*\]$")
    for line in read_text(ROOT / "generated" / "Objects.ni").splitlines():
        if line == "[ DOOR ]":
            in_door_block = True
            output.append(line)
            continue
        if section_re.match(line) and in_door_block and line != "[ DOOR ]":
            in_door_block = False
        if in_door_block:
            if line == "DOOR is a thing.":
                output.append("The door object is a thing.")
                continue
            if "DOOR" in line:
                output.append(line.replace("DOOR", "the door object"))
                continue
        if line.startswith("DOOR\t"):
            output.append(line.replace("DOOR", "the door object", 1))
            continue
        output.append(line)
    return "\n".join(output) + "\n"


def split_quoted(line: str) -> list[str]:
    return re.findall(r'"[^"]*"|[^\s]+', line)


def emit_table_row(line: str) -> str | None:
    line = line.strip()
    if not line:
        return None
    line = re.sub(r"[.,]$", "", line)
    fields = split_quoted(line)
    if len(fields) < 2:
        return None
    return "\t".join(fields)


def prepared_travel() -> str:
    output = []
    in_table = 0
    saw_table_name = False
    saw_header = False

    for line in read_text(ROOT / "generated" / "Travel.ni").splitlines():
        if in_table == 0:
            if line == "[ Non-direct dispatch metadata table ]":
                in_table = 1
                continue
            output.append(line)
            continue

        if in_table == 1:
            if line == "Table of Generated Travel Non-Direct Rules":
                output.append(line)
                saw_table_name = True
                in_table = 2
            continue

        if in_table == 2 and saw_table_name:
            if re.match(r"^rule-id\s", line):
                header = line.strip()
                header = re.sub(r" \([^)]+\)", "", header)
                header = re.sub(r"\s+", "\t", header)
                output.append(header)
                saw_header = True
                continue
            if saw_header and line:
                row = emit_table_row(line)
                if row is not None:
                    output.append(row)

    return "\n".join(output) + "\n"


def compose_story() -> str:
    include_lines = "\n".join(
        f"Include {title} by {EXTENSION_AUTHOR}."
        for _filename, title in source_module_specs()
    )
    return "".join(
        [
            "[ Open Adventure Author Edition ]\n",
            "[ Generated by tools/make_author_edition.py. ]\n",
            "[ Source modules are exported from canonical repository files. ]\n",
            "[ Edit source/adventure.yaml, OpenAdventure_*.ni, OpenAdventure.ni, or future Author Layer files, then regenerate this project. ]\n\n",
            source_preamble(),
            "\n",
            "[ Exported source module spine ]\n",
            include_lines,
            "\n",
        ]
    )


def source_module_texts() -> list[tuple[str, str]]:
    modules = [
        ("Rooms.ni", prepared_rooms()),
        ("Objects.ni", prepared_objects()),
        ("Vocabulary.ni", read_text(ROOT / "generated" / "Vocabulary.ni")),
        ("Travel.ni", prepared_travel()),
    ]
    modules.extend((filename, read_text(ROOT / filename)) for filename in RUNTIME_FILES)
    return modules


def extension_text(title: str, source_filename: str, body: str) -> str:
    return "".join(
        [
            f"Version 1 of {title} by {EXTENSION_AUTHOR} begins here.\n\n",
            f"[ Exported from {source_filename} by tools/make_author_edition.py. ]\n\n",
            body.rstrip(),
            "\n\n",
            f"{title} ends here.\n",
        ]
    )


def desired_project_files(project: Path) -> dict[Path, str]:
    files = {project / "Source" / "story.ni": compose_story()}
    title_by_filename = dict(source_module_specs())
    extension_dir = materials_dir_for(project) / "Extensions" / EXTENSION_AUTHOR
    for filename, text in source_module_texts():
        title = title_by_filename[filename]
        files[extension_dir / f"{title}.i7x"] = extension_text(title, filename, text)
    files[project / "Settings.plist"] = SETTINGS_PLIST
    return files


def cleanup_stale_source_modules(project: Path) -> None:
    source_dir = project / "Source"
    for filename in source_module_names():
        stale_path = source_dir / filename
        if stale_path.exists():
            stale_path.unlink()
    old_extension_dir = project / "Materials" / "Extensions" / EXTENSION_AUTHOR
    for _filename, title in source_module_specs():
        stale_extension = old_extension_dir / f"{title}.i7x"
        if stale_extension.exists():
            stale_extension.unlink()


def write_project(project: Path, regenerate: bool) -> None:
    if regenerate:
        run_generator()

    cleanup_stale_source_modules(project)
    for path, text in desired_project_files(project).items():
        write_text(path, text)
    uuid_file = project / "uuid.txt"
    write_text(uuid_file, normalized_ifid(project))
    (project / "Materials").mkdir(parents=True, exist_ok=True)
    materials_dir = materials_dir_for(project)
    materials_dir.mkdir(parents=True, exist_ok=True)
    (project / "Build").mkdir(parents=True, exist_ok=True)
    (project / "Index").mkdir(parents=True, exist_ok=True)
    gitkeep = materials_dir / ".gitkeep"
    if not gitkeep.exists():
        gitkeep.write_text("", encoding="utf-8")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Assemble OpenAdventure-AuthorEdition.inform for Inform 7 IDE use."
    )
    parser.add_argument(
        "--project",
        type=Path,
        default=DEFAULT_PROJECT,
        help="Author Edition .inform project path.",
    )
    parser.add_argument(
        "--no-generate",
        action="store_true",
        help="Reuse existing generated/*.ni files instead of regenerating from adventure.yaml.",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    project = args.project
    if not project.is_absolute():
        project = ROOT / project
    write_project(project, regenerate=not args.no_generate)
    rel_project = project.relative_to(ROOT) if project.is_relative_to(ROOT) else project
    print(f"[author-edition] wrote {rel_project / 'Source' / 'story.ni'}")
    print(f"[author-edition] wrote {len(source_module_names())} source modules")
    print(f"[author-edition] wrote {rel_project / 'Settings.plist'}")
    print("[author-edition] Inform 7 IDE target: Glulx")


if __name__ == "__main__":
    main()
