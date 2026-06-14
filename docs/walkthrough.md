# Walkthrough

This document records the Milestone 7A walkthrough sources used for parity verification.

## Canonical Complete Solve

The canonical complete solve-path transcript for this milestone is Ryan Sarson's 430-point Open Adventure run:

- Commands: `references/open-adventure-c/tests/win430.log`
- Expected output: `references/open-adventure-c/tests/win430.chk`
- Transcript manifest entry: `solve-path`

The run finishes with:

- all treasures collected and deposited;
- the cave closed;
- the repository endgame solved;
- final score `430 out of a possible 430`.

The final command sequence in the canonical run is:

```text
sw
take rod
ne
drop rod
sw
blast
```

The expected result is the victory blast, final score, and world-champion ranking.

## Complete Treasure Collection

The complete treasure-collection transcript uses the same upstream 430-point run:

- Commands: `references/open-adventure-c/tests/win430.log`
- Expected output: `references/open-adventure-c/tests/win430.chk`
- Transcript manifest entry: `treasure-collection`

Treasures exercised by the route include:

- nugget;
- diamonds;
- silver bars;
- jewelry;
- coins;
- chest;
- eggs;
- trident;
- vase;
- emerald;
- pyramid;
- pearl;
- rug;
- spices;
- chain;
- ruby;
- jade;
- amber;
- sapphire;
- ebony statuette.

## Complete Endgame

The complete endgame transcript is tracked separately so late-game object relocation and blast variants can be verified independently:

- Commands: `references/open-adventure-c/tests/endgame428.log`
- Expected output: `references/open-adventure-c/tests/endgame428.chk`
- Transcript manifest entry: `complete-endgame`

Additional Open Adventure C endgame reference transcripts:

- `references/open-adventure-c/tests/splatter.log`
- `references/open-adventure-c/tests/splatter.chk`
- `references/open-adventure-c/tests/defeat.log`
- `references/open-adventure-c/tests/defeat.chk`
- `references/open-adventure-c/tests/breakmirror.log`
- `references/open-adventure-c/tests/breakmirror.chk`
- `references/open-adventure-c/tests/wakedwarves.log`
- `references/open-adventure-c/tests/wakedwarves.chk`

## Focused Local Suites

Focused local transcript command files live in `tests/transcripts/suites/`:

- `startup.txt`
- `travel.txt`
- `plover.txt`
- `troll.txt`
- `dwarves.txt`
- `pirate.txt`
- `scoring.txt`
- `reincarnation.txt`
- `bear.txt`
- `dragon.txt`
- `cave-closing.txt`
- `endgame.txt`

Each focused suite has an expected-fragment file under `tests/transcripts/expected/`.

## Running the Transcript Framework

Validate manifest and fixture structure:

```sh
python3 tools/run_transcripts.py --dry-run
```

List registered suites:

```sh
python3 tools/run_transcripts.py --list
```

Execute the full Glulx transcript manifest:

```sh
python3 tools/run_transcripts.py --execute --timeout 90
```

Execute only the upstream-backed walkthrough cases:

```sh
python3 tools/run_transcripts.py --execute --mode upstream --timeout 90
```

Current status:

- Glulx transcript execution is operational.
- The full manifest passes 15/15.
- The upstream solve, treasure-collection, and complete-endgame cases pass.
- Z8 remains experimental and is not the release target.
