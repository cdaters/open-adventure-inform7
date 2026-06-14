# Transcript Results

Date: 2026-06-14

## Latest Run

Command:

```bash
python3 tools/run_transcripts.py --execute --timeout 90
```

Result: passed, 15/15.

```text
ok - startup: startup
ok - travel: travel
ok - plover: plover
ok - troll: troll
ok - dwarves: dwarves
ok - pirate: pirate
ok - scoring: scoring
ok - reincarnation: reincarnation
ok - bear: bear
ok - dragon: dragon
ok - cave-closing: cave-closing
ok - endgame: endgame
ok - solve-path: full-walkthrough
ok - treasure-collection: treasure-collection
ok - complete-endgame: complete-endgame
```

## Upstream Walkthrough Coverage

The manifest includes three upstream-backed cases:

| Case | Reference | Status |
|---|---|---|
| `solve-path` | `references/open-adventure-c/tests/win430.chk` | Passing |
| `treasure-collection` | `references/open-adventure-c/tests/win430.chk` | Passing |
| `complete-endgame` | `references/open-adventure-c/tests/endgame428.chk` | Passing |

The latest upstream-specific command remains:

```bash
python3 tools/run_transcripts.py --execute --mode upstream --timeout 90
```

Expected result: 3/3 passing.

## Smoke Verification

Command:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
```

Result: passed. The command regenerated source, translated Inform 7, compiled a
valid Glulx artifact, validated the artifact header, and ran all executable
smoke scripts.

## Output Location

Transcript captures are written under:

```text
build/transcripts/
```

## Current Assessment

Transcript execution is operational for the Glulx release target. There are no
known release-blocking transcript failures for RC1.
