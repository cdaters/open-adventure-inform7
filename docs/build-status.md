# Build Status

Date: 2026-06-17

## Current Release Build

The release target is Glulx.

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./build.sh --compile
```

Expected artifact:

```text
OpenAdventure.inform/Build/OpenAdventure.ulx
```

The Glulx artifact is validated by checking the VM header for `Glul`.

## Z8 Status

The default `Inform6/16` Z-machine path remains experimental and is not a
release target.

The build pipeline is corrected: `ni` output is written to
`OpenAdventure.inform/Build/OpenAdventure.i6`, and `.z8` is only accepted after
`inform6` creates a valid Z-machine story file. The earlier false positive where
Inform 6 source text appeared as `OpenAdventure.z8` is resolved.

The current generated game still exceeds practical Z8 readable-memory limits, so
Z8 remains non-release pending memory-reduction work.

## Build Chain

1. `tools/yaml2inform.py` regenerates `generated/*.ni` from
   `source/adventure.yaml`.
2. `build.sh` composes `OpenAdventure.inform/Source/OpenAdventure.generated.ni`.
3. `ni` translates Inform 7 to Inform 6 source:
   `OpenAdventure.inform/Build/OpenAdventure.i6`.
4. `inform6` compiles the I6 intermediate:
   - Glulx release path: `-G`
   - Z-machine experiment path: `-v8`
5. `build.sh` validates the final artifact header before reporting success.
6. `cBlorb` packaging remains optional.

## Verification Commands

Release build and smoke verification:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
```

Transcript verification:

```bash
python3 tools/run_transcripts.py --execute --timeout 180
```

Upstream walkthrough verification:

```bash
python3 tools/run_transcripts.py --execute --mode upstream --timeout 180
```

Latest documented status:

- Glulx build and smoke tests: passing.
- Full transcript manifest: 15/15 passing.
- Upstream solve, treasure, and endgame subset: 3/3 passing.
