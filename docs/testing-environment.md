# Testing Environment Report

## Environment probe summary (as of 2026-06-12)

- Inform 7 authoring toolchain exists locally inside the macOS `Inform.app` bundle.
- CLI binaries are **present but not on PATH** by default.
- No `frotz` / `dfrotz` binaries are currently available in `PATH`.
- No dedicated project test harness or `.inform` project folder exists in this repository.

## Detected toolchain binaries

- `/Applications/Inform.app/Contents/MacOS/Inform`
  - confirmed executable
  - reports via `--version`: `inform7 version 10.1.2`
- `/Applications/Inform.app/Contents/MacOS/ni`
  - `inform6/Inform 7 compiler binary` in bundle
  - responds when invoked with a path argument
- `/Applications/Inform.app/Contents/MacOS/inform6`
  - responds as `Inform 6.41 for MacOS`
  - `--version` is not supported by that binary
- `/Applications/Inform.app/Contents/MacOS/cBlorb`
  - reported `inblorb: a releaser and packager for IF story files`
- `/Applications/Inform.app/Contents/MacOS/inblorb` equivalent helper is available through `cBlorb`
- `/Applications/Inform.app/Contents/MacOS/intest`
  - command-line test runner is available (`intest` syntax/help available)
- `/Applications/Inform.app/Contents/MacOS/glulxe-client`
  - runtime client for Glulx in Inform bundle

## PATH probes

- `command -v inform` -> not found
- `command -v ni` -> not found
- `command -v inform6` -> not found
- `command -v cBlorb` -> not found
- `command -v frotz` -> not found
- `command -v dfrotz` -> not found
- `command -v intest` -> not found

## Build commands

Because bundle binaries are not exported to PATH, use either direct paths or add symlinks.

1) Preferred one-time setup (local shell):

- `ln -s /Applications/Inform.app/Contents/MacOS/Inform /usr/local/bin/inform7`
- `ln -s /Applications/Inform.app/Contents/MacOS/ni /usr/local/bin/ni`
- `ln -s /Applications/Inform.app/Contents/MacOS/inform6 /usr/local/bin/inform6`
- `ln -s /Applications/Inform.app/Contents/MacOS/cBlorb /usr/local/bin/cBlorb`
- `ln -s /Applications/Inform.app/Contents/MacOS/intest /usr/local/bin/intest`

2) Generate latest source artifacts:

- `python3 tools/yaml2inform.py`

3) Compile from Inform source:

- The repository currently has loose `.ni` files (no `.inform` project), so the exact compile command depends on creating a project wrapper expected by Inform 7.
- Practical interim command patterns in this environment are:
  - `inform7 <PROJECT_DIR>` (using Inform 7 GUI-style project invocation)
  - `ni <PROJECT_DIR>/Build/ ...` (backend compiler entrypoint)

4) Package into blorb/game output (when release files are generated):

- `/Applications/Inform.app/Contents/MacOS/cBlorb -project <project-dir>`

## Test commands

### Inform/inform7 project-level tests

- `intest <project-dir>`
- `intest <project-dir> -using <recipe> -test`

### Manual regression execution

- If a playable build (`.z8`/`.ulx`) is produced, run it with available runtime/client.
- `glulxe` equivalent available from Inform bundle: `/Applications/Inform.app/Contents/MacOS/glulxe-client`.

## Frotz/dfrotz availability

- `frotz` and `dfrotz` are not available on `PATH`.
- No confirmed standalone `dfrotz`/`frotz` binary in current environment.
- For automated transcript-style testing, add one of these interpreters or use a CI-compatible IF interpreter already in pipeline.

## Automated transcript testing feasibility

Current status: partially blocked.

- Blocked by missing `frotz/dfrotz` executables for direct transcript replay automation.
- Blocked by lack of a local `.inform` project + test recipe (`*.intest`) in this repository.
- `intest` is present, so once a project scaffold and recipes are added, automated test harnessing becomes straightforward.

## Recommended next steps for testability

1) Create an Inform project wrapper for `OpenAdventure.ni` and generated files in a `.inform` directory.
2) Add symlinks for Inform CLI tools or wrapper scripts.
3) Export a `.z8` build target in the project and verify deterministic build output.
4) Add `intest` recipes for key travel and command regressions (e.g. plover / dwarf / scoring checkpoints).
5) Install `dfrotz` (or another Z-machine interpreter with transcript mode) and hook a scripted transcript diff check.

Example future automated loop:

- `intest <project> -using <recipe> -test`
- run generated transcript against golden transcript with diff in CI
