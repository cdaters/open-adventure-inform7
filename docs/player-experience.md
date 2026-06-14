# Player Experience

Date: 2026-06-14

Milestone 10B reviewed common player commands and presentation issues while
preserving RC1 gameplay parity.

## Goals

- Prefer Adventure-style responses over generic Inform responses.
- Improve obvious parser affordances.
- Keep transcript parity at 15/15.
- Avoid core gameplay changes.

## Commands Reviewed

| Command | Current behavior after 10B |
|---|---|
| `enter` | Routes through Open Adventure travel where valid, including entering the building from the road. |
| `exit` | Routes through Open Adventure `OUT` travel where valid, including leaving the building. |
| `leave` | Routes like `exit` where Open Adventure has an `OUT` route. |
| `exit building` | Leaves the building through the Open Adventure `OUT` route. |
| `leave building` | Leaves the building through the Open Adventure `OUT` route. |
| `take all` | Takes available portable items with explicit per-object results. |
| `get all` | Same as `take all`. |
| `climb` | Routes through generated Open Adventure travel where valid; otherwise gives a travel-style refusal. |
| `enter slit` | At the slit, prints `You don't fit through a two-inch slit!`. |
| `enter crack` | Routes through Open Adventure crack travel where valid; otherwise reports no visible crack. |
| `enter stream` | At the surface stream, prints `Your feet are now wet.`; at the two-inch slit, prints the `DONT_FIT` text. |

## Issues Corrected

### Message Token Leaks

Generated `speak` travel rows were printing message labels such as `DONT_FIT`.
`OpenAdventure_Runtime.ni` now resolves known Open Adventure travel message
labels to player-facing text.

Example:

```text
> enter slit
You don't fit through a two-inch slit!
```

### Internal Room Identifiers

Rooms without source `short` descriptions could display internal identifiers
such as `LOC_FOREST10` during LOOK and in the status line.

`tools/generators/rooms.py` now emits fallback short descriptions. Forest rooms
use:

```text
You're in forest.
```

Other rooms fall back to a short first sentence or a cleaned room-id label.

### Score Notification Leakage

Moving west from the slit enters the cave/forest route that earns the
Open Adventure deep-cave score bonus. The score award is valid, but Inform's
default score notification printed:

```text
[Your score has just gone up by twenty-five points.]
```

Open Adventure C does not announce score changes during normal travel.
`OpenAdventure_Scoring.ni` now removes Inform's notify-score rule while keeping
score bookkeeping intact.

### Multiword Travel Intent

The parser bridge previously handled one-word Adventure travel tokens well but
let several natural two-word forms fall through to Inform's generic object
parser.

10B adds handling for:

- `exit building`
- `leave building`
- `enter slit`
- `enter crack`
- `enter stream`

## Presentation Review

Startup remains:

```text
Welcome to Adventure!

(Please type HELP for instructions and information.)
```

HELP, ABOUT, INFO, NEWS, and VERSION remain available. VERSION identifies the
Inform 7 edition and RC1 Glulx build.

## Verification Notes

Open Adventure C references used:

- `source/adventure.yaml` message labels, especially `DONT_FIT` and `FEET_WET`.
- `references/open-adventure-c/tests/illformed2.chk`, which verifies
  `enter stream` as `Your feet are now wet.`
- `references/open-adventure-c/score.c`, which computes score without
  per-turn score-change announcements.

Targeted local probes verified:

- `DONT_FIT` no longer leaks.
- `enter slit` prints the intended text.
- forest room headings no longer show `LOC_FOREST10`.
- west-from-slit no longer prints Inform score notification.
- building `exit`/`leave` forms route naturally.
- `take all` and `get all` produce cleaner output.

Full transcript verification should remain the release gate:

```bash
python3 tools/run_transcripts.py --execute --timeout 180
```
