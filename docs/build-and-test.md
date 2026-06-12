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

Inform 7 compilation currently requires a project bundle/directory in this repo (for now, defaulting to `OpenAdventure.inform`).

`build.sh` invokes the Inform CLI binary available either in `PATH` or via the bundled app.

```bash
./build.sh --compile
```

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
2. Optionally compiles via Inform CLI.
3. Optionally runs `cBlorb` packaging.
4. Writes status lines to `build/build.log`.

### `test.sh`

`test.sh` performs an initial smoke verification:

1. Generation succeeds and core generated files exist.
2. Compile runs when a project and compiler are discoverable.
3. At least one playable artifact (`.z8`, `.z5`, `.ulx`) is detected after compilation.
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

Transcript-based tests are currently blocked by missing runtime CLI support in this
environment (`frotz`/`dfrotz` are not guaranteed). The project still supports a
future path using one of:

- dfrotz transcript input mode
- a CI-provided IF interpreter with transcript output
- native Inform testing recipes (`intest`) as command-driven expected output checks

Recommended next step:

1. Add a canonical transcript fixture under `tests/transcripts/` and expected file under `tests/expected/`.
2. Add a smoke script that feeds transcript commands into the interpreter and diffs output.
3. Gate the smoke check on available interpreter.
