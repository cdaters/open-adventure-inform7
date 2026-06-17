# Final Walkthrough Analysis - Milestone 8I

Date: 2026-06-14

## Objective

Milestone 8I resolved the remaining full walkthrough divergences affecting
`solve-path` and `treasure-collection`.

## First Remaining Divergence

The first shared implementation divergence was the post-warning `PLUGH` command
in `win430.log`.

Expected Open Adventure C behavior:

- The cave-closing warning phase sets `closng`.
- Any move to an outside location during `closng` is blocked.
- Magic-word forced locations that lead outside are subject to the same block.
- The blocked escape triggers panic timing and leaves the player in the cave.
- The subsequent route can reach the anteroom, take the magazine, drop it at
  Witt's End, close the cave, move through the repository rod sequence, and
  blast for victory.

Actual Inform behavior before 8I:

- `PLUGH` after the warning moved through `LOC_FOOF4` to the building.
- The command stream desynchronized from the C route.
- `take magazine` failed.
- Repository closure happened at the wrong point for the scripted rod sequence.
- `blast` produced the splatter ending at 409/430.

## State Comparison

Expected late state:

- Inventory/treasure state: all treasures found, deposited where required, and
  magazine deposited at Witt's End for the final 1 point.
- Score state: 430/430 after victory blast.
- Endgame state: cave closed, player uses `ROD2` choreography, final blast is
  the victory outcome.

Actual late state after 8I:

- `solve-path` reaches 430/430 and final rank output.
- `treasure-collection` reaches the C-backed treasure appearance and final
  score fragments.
- `complete-endgame` remains passing.

## Corrections

- Classified `LOC_FOOF2` and `LOC_FOOF4` as outside targets for cave-closing
  travel restrictions.
- Added C-style initial appearances for emerald, pyramid, and spices.
- Added the C no-higher-rating message after a 430-point endgame.
- Updated stale transcript fragments:
  - The solve rank check now uses a stable C-backed substring.
  - The treasure collection all-treasures marker was replaced with the C-backed
    430-point final score fragment.
  - The focused plover emerald expectation now matches the C-style treasure
    appearance.

## Verification

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
```

Passed.

```bash
python3 tools/run_transcripts.py --execute --mode upstream --timeout 180
```

Passed:

- `solve-path`
- `treasure-collection`
- `complete-endgame`

```bash
python3 tools/run_transcripts.py --execute --timeout 180
```

Passed: 15/15 transcript cases.

## Classification

Project classification after 8I: **release candidate for Glulx**.

The Z8 target remains outside the release path until the previously documented
memory work is completed.
