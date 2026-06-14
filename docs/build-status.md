# Build Status - Milestone 7B

Date: 2026-06-13

## Current Result

- Default command: `./build.sh --compile`
- Default target: `Inform6/16` -> `OpenAdventure.inform/Build/OpenAdventure.z8`
- Result: **blocked**
- Blocking stage: Inform 6 story-file emission
- Error: current generated I6 exceeds the Z-machine readable-memory limit:
  - readable memory used: `110160` bytes
  - Z-machine maximum: `65536` bytes

The previous false-positive artifact has been corrected. `ni` output is now written to:

- `OpenAdventure.inform/Build/OpenAdventure.i6`

`OpenAdventure.inform/Build/OpenAdventure.z8` is only written after `inform6` successfully creates and validates a Z-machine story header. On the current source, no `.z8` file is produced.

## Build Chain

1. `tools/yaml2inform.py` regenerates `generated/*.ni` from `source/adventure.yaml`.
2. `build.sh` composes `OpenAdventure.inform/Source/OpenAdventure.generated.ni`.
3. `ni` translates Inform 7 to Inform 6 source:
   - `OpenAdventure.inform/Build/OpenAdventure.i6`
4. `inform6` attempts to compile the I6 intermediate:
   - Z-machine default: `-v8`
   - Glulx diagnostic path: `-G`
5. `build.sh` validates the final artifact header before reporting success.
6. `cBlorb`/inblorb packaging remains optional and is not reached by the current default compile.

## Verification Commands

Default Z-machine target:

```bash
./build.sh --compile
```

Result: fails at `inform6` with readable-memory overflow and produces no `.z8`.

Diagnostic Glulx target:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 \
./build.sh --compile
```

Result: succeeds and produces:

- `OpenAdventure.inform/Build/OpenAdventure.ulx`
- `file`: `Glulx game data (Version 3.1.0) Compiled by Inform`

## Test Status

- `./test.sh`: **fails**, because the default Z-machine compile fails.
- Glulx diagnostic command:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 \
./test.sh
```

Result: **passes** generation, compile, artifact-header validation, and smoke tests.

## Remaining Artifact Blocker

Milestone 7B corrected BUG-7A-001's mislabeled artifact behavior, but did not produce a runnable Z-machine story file. The remaining blocker is BUG-7A-002: the current Inform 7 output uses too much Z-machine readable memory. Resolving that requires source/runtime size reduction, a different Z-machine generation strategy, or accepting Glulx as the runnable artifact target.
