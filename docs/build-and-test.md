# Build and Test

This repository builds Open Adventure in Inform 7 from generated world data plus
hand-written runtime modules.

## Requirements

- Inform 7 10.1.2 command-line tools
- Inform 6 compiler from the Inform distribution
- Python 3
- A Glulx interpreter such as `glulxe` or `cheapglulxe`

The scripts can find the macOS Inform.app bundle at:

```text
/Applications/Inform.app/Contents
```

Environment variables can override tool paths:

- `OPENADVENTURE_INFORM_BIN`
- `OPENADVENTURE_INFORM_RESOURCES`
- `OPENADVENTURE_NI_BIN`
- `OPENADVENTURE_INFORM6_BIN`
- `OPENADVENTURE_CBLORB_BIN`
- `OPENADVENTURE_INFORM_PROJECT`
- `OPENADVENTURE_BUILD_ARTIFACT`

## Generate

```bash
./build.sh --generate-only
```

This regenerates:

- `generated/Rooms.ni`
- `generated/Objects.ni`
- `generated/Vocabulary.ni`
- `generated/Travel.ni`

## Build Glulx

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./build.sh --compile
```

Expected output:

```text
OpenAdventure.inform/Build/OpenAdventure.ulx
```

## Run Smoke Tests

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
```

`test.sh` verifies generation, compile/artifact creation when the compiler is
available, VM artifact headers, and executable smoke scripts in `tests/smoke/`.

## Run Transcript Tests

Full manifest:

```bash
python3 tools/run_transcripts.py --execute --timeout 90
```

Upstream-backed walkthrough subset:

```bash
python3 tools/run_transcripts.py --execute --mode upstream --timeout 90
```

Useful inspection commands:

```bash
python3 tools/run_transcripts.py --list
python3 tools/run_transcripts.py --dry-run
```

Transcript output is written under:

```text
build/transcripts/
```

## Z8

`./build.sh --compile` without a format override uses the historical
`Inform6/16` default and attempts Z-machine output. That path remains
experimental and is not the release target because the current game exceeds
practical Z8 memory limits.

Use the Glulx command above for release work.
