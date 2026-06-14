# Testing Environment Report

## Environment probe summary (as of 2026-06-13)

- Inform 7 authoring toolchain exists locally inside the macOS `Inform.app` bundle.
- CLI binaries are **present but not on PATH** by default.
- `dfrotz` is available in `PATH` at `/opt/homebrew/bin/dfrotz`.
- A local `.inform` project folder exists at `OpenAdventure.inform`.

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
- `command -v dfrotz` -> `/opt/homebrew/bin/dfrotz`
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

- `./build.sh --compile`
- This now runs the full command-line chain: `ni` -> `inform6`.
- The default Z-machine target is currently blocked by Inform 6 readable-memory overflow.
- A diagnostic Glulx artifact can be built with:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 \
./build.sh --compile
```

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

- `dfrotz` is available at `/opt/homebrew/bin/dfrotz`.
- `frotz` is not currently required because `dfrotz` is sufficient for plain transcript execution once a runnable story file exists.
- For automated transcript-style testing, add one of these interpreters or use a CI-compatible IF interpreter already in pipeline.

## Automated transcript testing feasibility

Current status: partially blocked.

- Transcript manifest and dry-run validation now exist in `tools/run_transcripts.py` and `tests/transcripts/`.
- Direct transcript replay is blocked because no runnable `OpenAdventure.inform/Build/OpenAdventure.z8` can currently be emitted.
- The command-line build no longer stops after Inform 7 translation; it writes `OpenAdventure.inform/Build/OpenAdventure.i6`, invokes `inform6`, and validates final artifacts.
- Attempting to compile the current I6 source to Z-machine v8 currently exceeds the Z-machine readable-memory limit (`110160` bytes used, `65536` maximum).
- `intest` is present, so once a project scaffold and recipes are added, automated test harnessing becomes straightforward.

## Recommended next steps for testability

1) Reduce generated/runtime readable-memory usage enough for Z-machine v8, or formally adopt Glulx as the executable target.
2) Add symlinks for Inform CLI tools or wrapper scripts if building outside the current local path assumptions.
3) Export a runnable story target and verify deterministic build output.
4) Add `intest` recipes for key travel and command regressions (e.g. plover / dwarf / scoring checkpoints).
5) Install `dfrotz` (or another Z-machine interpreter with transcript mode) and hook a scripted transcript diff check.

Example future automated loop:

- `intest <project> -using <recipe> -test`
- run generated transcript against golden transcript with diff in CI
