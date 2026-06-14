#!/usr/bin/env python3
"""Run Open Adventure transcript fixtures.

The manifest format is tab-separated:

    id  area  commands  expected  reference  mode

`commands` and `expected` are paths relative to the repository root. `expected`
contains output fragments, one per non-empty non-comment line.
"""

from __future__ import annotations

import argparse
import os
import re
import shutil
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DEFAULT_MANIFEST = ROOT / "tests" / "transcripts" / "manifest.tsv"
DEFAULT_RESULTS = ROOT / "build" / "transcripts"
DEFAULT_Z_STORY = Path("OpenAdventure.inform/Build/OpenAdventure.z8")
DEFAULT_GLULX_STORY = Path("OpenAdventure.inform/Build/OpenAdventure.ulx")
ANSI_ESCAPE_RE = re.compile(r"\x1b\[[0-?]*[ -/]*[@-~]|\x1b[()][A-Za-z0-9]|\x1b[=>]|\x1b[@-_]")


@dataclass
class TranscriptCase:
    case_id: str
    area: str
    commands: Path
    expected: Path
    reference: str
    mode: str


def load_manifest(path: Path) -> list[TranscriptCase]:
    cases: list[TranscriptCase] = []
    for line_number, raw in enumerate(path.read_text(encoding="utf-8").splitlines(), start=1):
        line = raw.strip()
        if not line or line.startswith("#"):
            continue
        fields = line.split("\t")
        if len(fields) != 6:
            raise SystemExit(f"{path}:{line_number}: expected 6 tab-separated fields")
        case_id, area, commands, expected, reference, mode = fields
        cases.append(
            TranscriptCase(
                case_id=case_id,
                area=area,
                commands=(ROOT / commands).resolve(),
                expected=(ROOT / expected).resolve() if expected != "-" else Path("-"),
                reference=reference,
                mode=mode,
            )
        )
    return cases


def validate_cases(cases: list[TranscriptCase]) -> None:
    seen: set[str] = set()
    for case in cases:
        if case.case_id in seen:
            raise SystemExit(f"duplicate transcript id: {case.case_id}")
        seen.add(case.case_id)
        if not case.commands.exists():
            raise SystemExit(f"{case.case_id}: missing commands file: {case.commands}")
        if str(case.expected) != "-" and not case.expected.exists():
            raise SystemExit(f"{case.case_id}: missing expected file: {case.expected}")


def story_kind(path: Path) -> str | None:
    try:
        header = path.read_bytes()[:4]
    except OSError:
        return None
    if header[:1] and 1 <= header[0] <= 8:
        return "zcode"
    if header == b"Glul":
        return "glulx"
    return None


def find_interpreter(kind: str) -> str | None:
    explicit = os.environ.get("OPENADVENTURE_INTERPRETER")
    if explicit:
        return explicit

    candidates = {
        "zcode": ("dfrotz", "frotz", "bocfel"),
        "glulx": ("glulxe", "cheapglulxe"),
    }.get(kind, ())
    for candidate in candidates:
        found = shutil.which(candidate)
        if found:
            return found
    return None


def default_story_path() -> Path:
    explicit = os.environ.get("OPENADVENTURE_STORY")
    if explicit:
        return Path(explicit)
    glulx = ROOT / DEFAULT_GLULX_STORY
    if glulx.exists():
        return DEFAULT_GLULX_STORY
    return DEFAULT_Z_STORY


def expected_fragments(path: Path) -> list[str]:
    fragments: list[str] = []
    for raw in path.read_text(encoding="utf-8").splitlines():
        line = raw.rstrip("\n")
        if not line.strip() or line.lstrip().startswith("#"):
            continue
        fragments.append(line)
    return fragments


def normalize_output(output: str) -> str:
    output = ANSI_ESCAPE_RE.sub("", output)
    output = output.replace("\r\n", "\n").replace("\r", "\n")
    return output


def runtime_failure(output: str) -> str | None:
    lowered = output.lower()
    if "fatal error" in lowered:
        for line in output.splitlines():
            if "fatal error" in line.lower():
                return line.strip()
        return "fatal error"
    return None


def interpreter_command(interpreter: str, kind: str, story: Path) -> list[str]:
    name = Path(interpreter).name
    if kind == "zcode" and name in {"dfrotz", "frotz", "bocfel"}:
        return [interpreter, "-q", "-p", "-m", "-w", "120", "-h", "999", str(story)]
    if kind == "glulx" and name in {"glulxe", "cheapglulxe"}:
        return [interpreter, "-width", "120", "-height", "999", str(story)]
    return [interpreter, str(story)]


def run_case(case: TranscriptCase, interpreter: str, kind: str, story: Path, results_dir: Path, timeout: int) -> bool:
    results_dir.mkdir(parents=True, exist_ok=True)
    output_path = results_dir / f"{case.case_id}.out"
    command = interpreter_command(interpreter, kind, story)
    stdin_payload = case.commands.read_bytes() + b"\n"
    try:
        completed = subprocess.run(
            command,
            input=stdin_payload,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            cwd=ROOT,
            check=False,
            timeout=timeout,
        )
    except subprocess.TimeoutExpired as exc:
        output = normalize_output((exc.stdout or b"").decode("utf-8", errors="replace"))
        output_path.write_text(output, encoding="utf-8")
        print(f"not ok - {case.case_id}: interpreter timed out after {timeout}s; see {output_path}")
        return False
    output = normalize_output(completed.stdout.decode("utf-8", errors="replace"))
    output_path.write_text(output, encoding="utf-8")
    if completed.returncode != 0:
        print(f"not ok - {case.case_id}: interpreter exited {completed.returncode}; see {output_path}")
        return False
    failure = runtime_failure(output)
    if failure is not None:
        print(f"not ok - {case.case_id}: interpreter runtime failure: {failure}; see {output_path}")
        return False
    if str(case.expected) != "-":
        missing = [fragment for fragment in expected_fragments(case.expected) if fragment not in output]
        if missing:
            print(f"not ok - {case.case_id}: missing expected fragments; see {output_path}")
            for fragment in missing:
                print(f"  missing: {fragment}")
            return False
    print(f"ok - {case.case_id}: {case.area}")
    return True


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--manifest", type=Path, default=DEFAULT_MANIFEST)
    parser.add_argument("--story", type=Path, default=default_story_path())
    parser.add_argument("--results-dir", type=Path, default=DEFAULT_RESULTS)
    parser.add_argument("--list", action="store_true", help="list transcript cases")
    parser.add_argument("--dry-run", action="store_true", help="validate files without executing")
    parser.add_argument("--execute", action="store_true", help="execute transcripts")
    parser.add_argument("--timeout", type=int, default=20, help="per-transcript interpreter timeout in seconds")
    args = parser.parse_args()

    manifest = args.manifest if args.manifest.is_absolute() else ROOT / args.manifest
    cases = load_manifest(manifest)
    validate_cases(cases)

    if args.list:
        for case in cases:
            print(f"{case.case_id}\t{case.area}\t{case.mode}\t{case.reference}")
        return 0

    if args.dry_run or not args.execute:
        print(f"validated {len(cases)} transcript cases from {manifest.relative_to(ROOT)}")
        return 0

    story = args.story if args.story.is_absolute() else ROOT / args.story
    if not story.exists():
        print(f"transcript execution blocked: story file not found: {story}", file=sys.stderr)
        return 2
    kind = story_kind(story)
    if kind is None:
        print(
            "transcript execution blocked: story file is not executable Z-code or Glulx "
            f"({story}); set OPENADVENTURE_STORY to a runnable story file",
            file=sys.stderr,
        )
        return 2
    interpreter = find_interpreter(kind)
    if interpreter is None:
        print(
            "transcript execution blocked: set OPENADVENTURE_INTERPRETER or install "
            f"a {kind} interpreter",
            file=sys.stderr,
        )
        return 2

    passed = 0
    for case in cases:
        if run_case(case, interpreter, kind, story, args.results_dir, args.timeout):
            passed += 1
    return 0 if passed == len(cases) else 1


if __name__ == "__main__":
    raise SystemExit(main())
