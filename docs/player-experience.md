# Player Experience

Date: 2026-06-17

Milestones 10B, 10C, 11A, and 11C reviewed common player commands and
presentation issues while preserving RC1 gameplay parity.

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
| `climb` | Routes through generated Open Adventure travel where valid; otherwise reports that there is nothing here to climb. |
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

### Adventure-Style Failed Movement

Bare `in`, `out`, `enter`, `exit`, and `leave` commands now stay on the Open
Adventure travel path even when no route is available. Failed in/out attempts
use the Adventure message:

```text
I don't know in from out here.  Use compass points or name something in the general direction you want to go.
```

Failed `speak` travel rows such as `DONT_FIT` no longer trigger forced-travel
follow-up handling.

### Object and Inventory Presentation

Generated objects now have player-facing printed names from
`source/adventure.yaml` inventory labels while retaining canonical runtime IDs
through a generated identity table.

Inventory hides internal `WATER` and `OIL` carrier objects, so bottle contents
do not appear as separate inventory items.

## Presentation Review

Startup remains:

```text
Welcome to Adventure!

(Please type HELP for instructions and information.)
```

HELP, ABOUT, INFO, NEWS, and VERSION remain available. VERSION identifies the
Inform 7 edition and RC1 Glulx build.

The startup banner now identifies the implementation as Open Adventure in
Inform 7 by Craig Daters, while HELP/CREDITS preserve the full historical
lineage.

## Menu-Driven Help

Milestone 11A changed bare HELP from a typed subcommand list into an
interactive menu inspired by Graham Nelson's `Advent.inf` and Emily Short's
table-driven menu extensions.  Milestone 11C refines that menu into a more
polished in-game information system.

Top-level HELP topics:

- Instructions for Playing
- Historical Background
- Open Adventure
- About This Edition
- Credits
- Version Information

The menu uses a single concise instruction line for arrow-key movement,
RETURN/SPACE selection, and Q/ESC exit. N/P remain supported for compatibility.
While the menu is active, the status line shows compact menu context such as
`Open Adventure Help`, `Instructions`, `History`, or `Version Info` instead of
the room name, score, and move count.

Topic pages keep full headings, so `Instructions` in the status line opens a
page headed `Instructions for Playing`, `History` opens `Historical
Background`, and `Version Info` opens `Version Information`.

The Historical Background topic now reads as a concise historical overview:
Mammoth Cave and Stephen Bishop lead into early cave exploration, Will
Crowther's cave program, Don Woods's expansion, Open Adventure, and the Inform
7 edition.  The result presents the lineage Adventure -> Open Adventure ->
Open Adventure Inform 7 Edition as part of the game rather than as technical
release notes.

Existing direct commands such as `HELP INSTRUCTIONS`, `ABOUT`, `INFO`, `NEWS`,
and `VERSION` still print their focused information text directly.

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
- generated object IDs no longer appear in ordinary object listings.
- inventory no longer exposes `WATER`/`OIL` implementation objects.

Full transcript verification should remain the release gate:

```bash
python3 tools/run_transcripts.py --execute --timeout 180
```
