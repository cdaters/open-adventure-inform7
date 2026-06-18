#!/usr/bin/env python3
"""Synchronize the generated Inform 7 Author Edition project.

The canonical repository source remains source/adventure.yaml, generator code,
OpenAdventure.ni, and OpenAdventure_*.ni.  The Author Edition source tree is an
export artifact.  This tool intentionally avoids full-file bidirectional import.
"""

from __future__ import annotations

import argparse
import difflib
import sys
import tempfile
from pathlib import Path

import make_author_edition as author


ROOT = Path(__file__).resolve().parents[1]


def rel(path: Path) -> str:
    try:
        return str(path.relative_to(ROOT))
    except ValueError:
        return str(path)


def desired_files(project: Path) -> dict[Path, str]:
    return author.desired_project_files(project)


def exported_author_edition_exists(project: Path) -> bool:
    return (project / "Source" / "story.ni").exists()


def resolve_project_path(project: Path | None, destination: Path | None) -> Path:
    if project is not None and destination is not None:
        raise ValueError("--project and --destination cannot be used together")
    if destination is not None:
        destination = destination.expanduser()
        if not destination.is_absolute():
            destination = ROOT / destination
        if destination.suffix == ".inform":
            return destination
        return destination / author.DEFAULT_PROJECT.name
    project = project or author.DEFAULT_PROJECT
    project = project.expanduser()
    if not project.is_absolute():
        project = ROOT / project
    return project


def diff_file(path: Path, desired: str) -> list[str]:
    current = path.read_text(encoding="utf-8") if path.exists() else ""
    if current == desired:
        return []
    return list(
        difflib.unified_diff(
            current.splitlines(keepends=True),
            desired.splitlines(keepends=True),
            fromfile=rel(path),
            tofile=f"{rel(path)} (generated)",
        )
    )


def run_diff(project: Path, regenerate: bool, temp_if_missing: bool) -> int:
    if regenerate:
        author.run_generator()
    if temp_if_missing and not exported_author_edition_exists(project):
        with tempfile.TemporaryDirectory(prefix="openadventure-author-diff-") as tmp:
            temp_project = Path(tmp) / author.DEFAULT_PROJECT.name
            author.write_project(temp_project, regenerate=False)
            return run_diff(temp_project, regenerate=False, temp_if_missing=False)
    differences: list[str] = []
    for path, desired in desired_files(project).items():
        differences.extend(diff_file(path, desired))
    if not differences:
        print("[author-edition] no differences")
        return 0
    sys.stdout.writelines(differences)
    return 1


def run_export(project: Path, regenerate: bool) -> int:
    author.write_project(project, regenerate=regenerate)
    print(f"[author-edition] wrote {rel(project / 'Source' / 'story.ni')}")
    print(f"[author-edition] wrote {len(author.source_module_names())} source modules")
    print(f"[author-edition] wrote {rel(project / 'Settings.plist')}")
    print("[author-edition] Inform 7 IDE target: Glulx")
    return 0


def run_import(_project: Path) -> int:
    print(
        "[author-edition] import is intentionally unsupported for the exported "
        "Author Edition source tree. Move durable changes into source/adventure.yaml, "
        "OpenAdventure_*.ni, OpenAdventure.ni, or the future Author Layer, "
        "then run --export.",
        file=sys.stderr,
    )
    return 2


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Export or compare OpenAdventure-AuthorEdition.inform."
    )
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--export", action="store_true", help="write the Author Edition project")
    mode.add_argument("--diff", action="store_true", help="show differences without writing the Author Edition")
    mode.add_argument("--import", dest="import_", action="store_true", help="explain why full import is unsupported")
    destination = parser.add_mutually_exclusive_group()
    destination.add_argument(
        "--project",
        type=Path,
        default=None,
        help="Author Edition .inform project path.",
    )
    destination.add_argument(
        "--destination",
        type=Path,
        default=None,
        help=(
            "Author workspace directory, or an explicit .inform project path. "
            "When a directory is given, OpenAdventure-AuthorEdition.inform is "
            "written inside it."
        ),
    )
    parser.add_argument(
        "--no-generate",
        action="store_true",
        help="Reuse existing generated/*.ni files instead of regenerating from adventure.yaml.",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    project = resolve_project_path(args.project, args.destination)
    regenerate = not args.no_generate
    if args.import_:
        return run_import(project)
    if args.diff:
        temp_if_missing = args.project is None and args.destination is None
        return run_diff(project, regenerate=regenerate, temp_if_missing=temp_if_missing)
    return run_export(project, regenerate=regenerate)


if __name__ == "__main__":
    raise SystemExit(main())
