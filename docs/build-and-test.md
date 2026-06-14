# Build and Test (Milestone 3D)

## Purpose

This milestone introduces repository-level build and test scripts so the game can be
regenerated, compiled, and smoke-tested from a clean environment.

## Files added

- `build.sh` — pipeline runner for source generation, compilation, and packaging.
- `test.sh` — smoke check driver that validates generation and (when configured) compile/artifact production.
- `tests/smoke/` — smoke test scripts.
- `tests/transcripts/` — transcript fixtures for future automated runs.
- `tests/expected/` — expected outputs for future transcript diffs and checks.

## Build workflow

### 1) Regenerate world data

```bash
python3 tools/yaml2inform.py
```

This is handled automatically by `build.sh`.

### 2) Compile Inform source

Inform 7 compilation currently requires a project bundle/directory in this repo (defaulting to `OpenAdventure.inform`).

`build.sh` invokes `ni` and `inform6` either from `PATH` or from the bundled macOS Inform app.

```bash
./build.sh --compile
```

The default target is Z-machine v8 (`Inform6/16` -> `OpenAdventure.inform/Build/OpenAdventure.z8`). The current source translates to Inform 6 but cannot yet be emitted as Z8 because the generated I6 exceeds the Z-machine readable-memory limit.

Optional explicit override:

```bash
./build.sh --compile --project /path/to/OpenAdventure.inform
```

### 3) Package artifacts

If a project is configured and `cBlorb` is available:

```bash
./build.sh --compile --package
```

### 4) Combined flow

```bash
./build.sh
```

This runs generation and (if requested) downstream steps.

## How the scripts work

### `build.sh`

1. Regenerates `generated/*.ni` from `source/adventure.yaml`.
2. Composes `OpenAdventure.inform/Source/OpenAdventure.generated.ni`.
3. Optionally translates Inform 7 to `OpenAdventure.inform/Build/OpenAdventure.i6` with `ni`.
4. Optionally compiles the I6 intermediate with `inform6`.
5. Validates the VM artifact header before reporting success.
6. Optionally runs `cBlorb` packaging.
7. Writes status lines to `build/build.log`.

### `test.sh`

`test.sh` performs an initial smoke verification:

1. Generation succeeds and core generated files exist.
2. Compile runs when a project and compiler are discoverable.
3. A playable artifact (`.z8`, `.z5`, `.ulx`) is detected and its VM header is valid after successful compilation.
4. Executes any executable smoke scripts in `tests/smoke/*.sh`.

You can control strictness using env flags:

- `OPENADVENTURE_TEST_STRICT_COMPILE=1` — fail when compile cannot run.
- `OPENADVENTURE_TEST_INTEST=1` — run optional `intest` step if test hook exists.

## Intest integration

`intest` is present in the local toolchain and can be used once recipe files are added.

Recommended setup:

1. Add `.inform` project and game release target.
2. Add `.intest` recipes under `tests/` (for example, `tests/smoke/` and `tests/regression/`).
3. Invoke:

```bash
intest <project-dir> -test
# or
intest <project-dir> -using tests/some.recipe -test
```

A lightweight smoke hook can be added and executed from `test.sh` as the toolchain
matures.

## Transcript testing (future)

Milestone 7A adds a transcript manifest and runner:

- `tools/run_transcripts.py`
- `tests/transcripts/manifest.tsv`
- `tests/transcripts/suites/`
- `tests/transcripts/expected/`

Structural transcript validation runs through `tests/smoke/13-transcript-framework.sh`.

Executable transcript tests are currently blocked because the default
Z-machine target cannot be emitted. The build pipeline no longer writes Inform 6
source text to `OpenAdventure.inform/Build/OpenAdventure.z8`; `ni` writes
`OpenAdventure.inform/Build/OpenAdventure.i6`, then `inform6` fails the Z8 stage
with `110160` bytes of readable memory against the `65536` byte Z-machine limit.
`dfrotz` is available in the current local environment, but it cannot run until a
real `.z8` exists.

The project still supports a future path using one of:

- dfrotz transcript input mode
- a CI-provided IF interpreter with transcript output
- native Inform testing recipes (`intest`) as command-driven expected output checks

Current validation commands:

```bash
python3 tools/run_transcripts.py --dry-run
python3 tools/run_transcripts.py --list
```

Future execution command once a runnable story exists:

```bash
OPENADVENTURE_STORY=/path/to/OpenAdventure.z8 python3 tools/run_transcripts.py --execute
```

Recommended next step:

1. Reduce the Z-machine readable-memory footprint or formally select a Glulx runtime artifact.
2. Point `OPENADVENTURE_STORY` at a runnable Z-code story file.
3. Promote transcript execution from manual verification into CI.

Diagnostic Glulx build path:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 \
./build.sh --compile
```
