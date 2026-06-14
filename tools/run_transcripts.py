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
import select
import shutil
import subprocess
import sys
import time
from dataclasses import dataclass
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DEFAULT_MANIFEST = ROOT / "tests" / "transcripts" / "manifest.tsv"
DEFAULT_RESULTS = ROOT / "build" / "transcripts"
DEFAULT_Z_STORY = Path("OpenAdventure.inform/Build/OpenAdventure.z8")
DEFAULT_GLULX_STORY = Path("OpenAdventure.inform/Build/OpenAdventure.ulx")
ANSI_ESCAPE_RE = re.compile(r"\x1b\[[0-?]*[ -/]*[@-~]|\x1b[()][A-Za-z0-9]|\x1b[=>]|\x1b[@-_]")
BACKSPACE_RE = re.compile(r".\x08")


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
    while "\b" in output:
        output = BACKSPACE_RE.sub("", output)
    output = re.sub(r"[q]{12,}", "", output)
    output = re.sub(r"\n{3,}", "\n\n", output)
    return output


def sanitized_command_lines(path: Path) -> list[str]:
    lines: list[str] = []
    skipped_startup_answer = False
    saw_command = False
    for raw in path.read_text(encoding="utf-8").splitlines():
        stripped = raw.strip()
        if not stripped:
            continue
        if stripped.startswith("#"):
            continue
        if not saw_command and not skipped_startup_answer and stripped.lower() in {"n", "no"}:
            skipped_startup_answer = True
            saw_command = True
            continue
        saw_command = True
        lines.append(raw)
    return lines


def sanitized_commands(path: Path) -> bytes:
    recovery = ["yes", "quit", "yes"]
    return ("\n".join(sanitized_command_lines(path) + recovery) + "\n\n").encode("utf-8")


def read_available_output(process: subprocess.Popen[bytes]) -> bytes:
    if process.stdout is None:
        return b""
    chunks: list[bytes] = []
    while True:
        ready, _, _ = select.select([process.stdout], [], [], 0)
        if not ready:
            break
        try:
            chunk = os.read(process.stdout.fileno(), 4096)
        except BlockingIOError:
            break
        if not chunk:
            break
        chunks.append(chunk)
    return b"".join(chunks)


def drain_output_until_quiet(
    process: subprocess.Popen[bytes],
    timeout_at: float,
    quiet_seconds: float = 0.05,
    max_wait_seconds: float = 2.0,
) -> bytes:
    if process.stdout is None:
        return b""
    output = bytearray()
    last_output_at = time.monotonic()
    wait_until = min(timeout_at, time.monotonic() + max_wait_seconds)
    while time.monotonic() < wait_until:
        if process.poll() is not None:
            output.extend(read_available_output(process))
            break
        remaining = max(0.0, min(0.05, wait_until - time.monotonic()))
        ready, _, _ = select.select([process.stdout], [], [], remaining)
        if ready:
            chunk = os.read(process.stdout.fileno(), 4096)
            if chunk:
                output.extend(chunk)
                last_output_at = time.monotonic()
                continue
            break
        if time.monotonic() - last_output_at >= quiet_seconds:
            break
    return bytes(output)


def run_interpreter_interactive(command: list[str], command_lines: list[str], timeout: int) -> subprocess.CompletedProcess[bytes]:
    process = subprocess.Popen(
        command,
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        cwd=ROOT,
    )
    if process.stdout is not None:
        os.set_blocking(process.stdout.fileno(), False)
    timeout_at = time.monotonic() + timeout
    output = bytearray()
    output.extend(drain_output_until_quiet(process, timeout_at))
    for line in command_lines + ["yes", "quit", "yes", ""]:
        if time.monotonic() >= timeout_at:
            process.kill()
            raise subprocess.TimeoutExpired(command, timeout, output=bytes(output))
        if process.poll() is not None:
            break
        if process.stdin is not None:
            try:
                process.stdin.write((line + "\n").encode("utf-8"))
                process.stdin.flush()
            except BrokenPipeError:
                break
        output.extend(drain_output_until_quiet(process, timeout_at))
    if process.stdin is not None:
        try:
            process.stdin.close()
        except BrokenPipeError:
            pass
    while process.poll() is None:
        if time.monotonic() >= timeout_at:
            process.kill()
            output.extend(read_available_output(process))
            raise subprocess.TimeoutExpired(command, timeout, output=bytes(output))
        output.extend(drain_output_until_quiet(process, timeout_at, max_wait_seconds=0.25))
    output.extend(read_available_output(process))
    return subprocess.CompletedProcess(command, process.returncode, bytes(output), None)


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
        return [interpreter, "-ml", "no", "-width", "120", "-height", "999", str(story)]
    return [interpreter, str(story)]


def run_case(case: TranscriptCase, interpreter: str, kind: str, story: Path, results_dir: Path, timeout: int) -> bool:
    results_dir.mkdir(parents=True, exist_ok=True)
    output_path = results_dir / f"{case.case_id}.out"
    command = interpreter_command(interpreter, kind, story)
    command_lines = sanitized_command_lines(case.commands)
    if case.mode == "upstream":
        command_lines.insert(0, "replay upstream")
    try:
        completed = run_interpreter_interactive(command, command_lines, timeout)
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
    parser.add_argument("--mode", choices=("local", "upstream"), help="run only cases with this manifest mode")
    parser.add_argument("--timeout", type=int, default=60, help="per-transcript interpreter timeout in seconds")
    args = parser.parse_args()

    manifest = args.manifest if args.manifest.is_absolute() else ROOT / args.manifest
    cases = load_manifest(manifest)
    if args.mode:
        cases = [case for case in cases if case.mode == args.mode]
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
