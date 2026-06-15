# Presentation Polish

Date: 2026-06-14

Milestone 10C reviewed player-facing presentation after RC1 parity work. The
goal was to keep the verified game behavior intact while reducing visible
implementation artifacts.

## Player Observations

Recent manual playtesting found these issues:

- Successful movement sometimes appeared inconsistent in how it presented room
  headings and descriptions.
- Failed in/out movement could fall through to generic Inform containment
  messages.
- Generated object identifiers could appear in room listings.
- `take all` output was hard to scan.
- Bottle contents appeared as separate carried objects in inventory.
- Failed `speak` travel rows could still enter the forced-travel follow-up path.

## Corrections

### Startup Identity

The story metadata now identifies the project as:

```text
Open Adventure in Inform 7
An Interactive Fiction by Craig Daters
```

The in-game credits continue to preserve the full lineage: Crowther and Woods,
Open Adventure by Eric S. Raymond and contributors, Graham Nelson's
`Advent.inf`, Chris Conley's Inform 7 reference, and this implementation.

### Movement Presentation

The Open Adventure travel dispatcher remains the primary route for movement.
Successful generated travel continues to show the destination heading and room
description through the existing Inform room display.

Failed bare `in`, `out`, `enter`, `exit`, and `leave` commands now use the
Adventure-style in/out refusal:

```text
I don't know in from out here.  Use compass points or name something in the general direction you want to go.
```

Failed `climb` now reports:

```text
There is nothing here to climb.
```

### Forced Travel Guard

The runtime now records the category of the last generated travel row.
Forced-travel follow-up runs only after a generated movement row. `speak` rows
such as `DONT_FIT` remain refusals and no longer enter forced-travel handling.

### Object Names

Generated objects now receive player-facing printed names from
`source/adventure.yaml` inventory labels. A generated object-ID table preserves
canonical runtime identity, so parser/travel/scoring logic no longer depends on
printed names.

This removes room-listing artifacts such as `OBJ_53`, `OBJ_69`, `CHAIN`, and
`BEAR` from ordinary player output.

### Inventory and Take All

`take all`/`get all` still collect available portable objects, but output is
line-oriented and uses the new printed names.

Inventory now hides internal liquid carrier objects (`WATER` and `OIL`) so the
bottle is presented as a single carried object rather than exposing
implementation state.

## Verification

Commands:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
python3 tools/run_transcripts.py --execute --timeout 180
```

Result: smoke tests passed and the full transcript manifest remained 15/15.
