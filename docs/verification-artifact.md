# Artifact Verification - Milestone 7B

Date: 2026-06-13

## Objective

Verify whether `OpenAdventure.inform/Build/OpenAdventure.z8` is a real runnable Z-machine story file and correct the build chain where possible.

## Findings

The original `build.sh` wrote `ni` output directly to `OpenAdventure.inform/Build/OpenAdventure.z8`. That file began with generated Inform 6 source text instead of Z-code bytes.

The build chain is now corrected:

1. `ni` writes Inform 6 source to `OpenAdventure.inform/Build/OpenAdventure.i6`.
2. `inform6` compiles the intermediate source.
3. `build.sh` writes the requested artifact only after VM-header validation.

## Z-machine Verification

Command:

```bash
./build.sh --compile
```

Result: **failed at Inform 6**.

Key diagnostic:

```text
110160 bytes readable memory used (maximum 65536)
Compiled with 1 error
```

Artifact check:

```bash
file OpenAdventure.inform/Build/OpenAdventure.z8
```

Result:

```text
OpenAdventure.inform/Build/OpenAdventure.z8: cannot open ... (No such file or directory)
```

This is the correct post-fix behavior for the failing target: no stale or mislabeled `.z8` is left behind.

`dfrotz` check:

```bash
dfrotz -q -p -m -w 120 -h 999 OpenAdventure.inform/Build/OpenAdventure.z8
```

Result:

```text
Fatal error: Cannot open story file
```

`dfrotz` cannot launch because no runnable Z-machine artifact can currently be emitted.

## Diagnostic Glulx Verification

Command:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 \
./build.sh --compile
```

Result: **passed**.

Artifact check:

```bash
file OpenAdventure.inform/Build/OpenAdventure.ulx
```

Result:

```text
OpenAdventure.inform/Build/OpenAdventure.ulx: Glulx game data (Version 3.1.0) Compiled by Inform
```

Header check:

```text
00000000: 476c 756c 0003 0102 0007 ce00 000e 0000  Glul............
```

## Test Verification

Default target:

```bash
./test.sh
```

Result: **failed** because the default Z-machine compile fails at `inform6`.

Diagnostic Glulx target:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 \
./test.sh
```

Result: **passed**.

## Transcript Verification

Dry run:

```bash
python3 tools/run_transcripts.py --dry-run
```

Result:

```text
validated 15 transcript cases from tests/transcripts/manifest.tsv
```

Execution:

```bash
python3 tools/run_transcripts.py --execute
```

Result:

```text
transcript execution blocked: story file not found: .../OpenAdventure.inform/Build/OpenAdventure.z8
```

## Status

BUG-7A-001 is corrected: the build pipeline no longer treats Inform 6 source as a `.z8` story file.

Milestone 7B success criteria are not fully met because BUG-7A-002 remains: the current generated Inform 6 source cannot fit in Z-machine readable memory. A runnable Glulx artifact can be produced, but a runnable `OpenAdventure.z8` cannot yet be produced from the current source.
