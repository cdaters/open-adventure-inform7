# Plover System (Milestone 4A)

Historical note: this subsystem design predates final transcript parity. For
current release status, see `../current-state.md`.

## Objective

Implement the plover travel subsystem in the Inform runtime so the generated plover movement rows match Open Adventure behavior while leaving troll/bridge, dwarves, scoring, and cave-closing logic for later milestones.

## Rule coverage

| Rule ID | Source row | Source location | Source action | Condition | Destination/fallback | Purpose |
| --- | --- | --- | --- | --- | --- | --- |
| 110 | `LOC_Y2` travel block | `source/adventure.yaml:853` | `special_conditional` (`special 2`) | `carry EMERALD` | fallback scan from `LOC_FOOF5` | drop emerald and retry non-direct chain |
| 190 | `LOC_ALCOVE` travel block | `source/adventure.yaml:1674` | `special` (`special 1`) | none | `LOC_PLOVER` via tunnel token `EAST PASSA` | plover tunnel passability check |
| 193 | `LOC_PLOVER` travel block | `source/adventure.yaml:1687` | `special` (`special 1`) | none | `LOC_ALCOVE` via token `WEST PASSA OUT` | plover tunnel passability check |
| 194 | `LOC_PLOVER` travel block | `source/adventure.yaml:1689` | `special_conditional` (`special 2`) | `carry EMERALD` | fallback scan from `LOC_FOOF6` | drop emerald and retry non-direct chain |

`generated/Travel.ni` rows are present with these IDs and messages/conditions preserved.

## Source traces

### Open Adventure C

- `references/open-adventure-c/main.c:767-784` (`dest_special == 1`) enforces tunnel-capacity:
  - allows transit if hands are empty,
  - or exactly one item and that item is the emerald,
  - else stays in place and emits `MUST_DROP`.
- `references/open-adventure-c/main.c:785-806` (`dest_special == 2`) drops emerald and advances travel search to the sibling row (`continue` semantics).

### Nelson Inform 6

- `references/nelson-inform6/Advent.inf:2090-2120` models the same behavior in `In_Alcove` and `In_Plover_Room`:
  - tunnel check uses `children(player)` count and emerald exception,
  - failure prints:
    - `Something you're carrying won't fit through the tunnel with you.`
    - `You'd best take inventory and drop something.`
  - `Plover:` in `In_Plover_Room` moves emerald into room then returns player to `At_Y2`.

### Conley Inform 7

`references/conley-inform7/Adventure.ni` does not contain an equivalent plover-special implementation in this repository snapshot.

## Runtime implementation

Implemented in:

- `OpenAdventure_Plover.ni`
- `OpenAdventure_Runtime.ni` (special dispatch + priority guard)

### Runtime logic

1. `special 1` handling:
   - `openadventure execute plover passage special` calls a predicate `openadventure plover tunnel allows passage from`
     - if hand count is 0 → allow
     - if hand count is 1 and carried object is EMERALD → allow
     - otherwise print MUST_DROP message and reject
   - on success, dispatches generated goto via:
     - `LOC_ALCOVE + EAST PASSA -> LOC_PLOVER`
     - `LOC_PLOVER + WEST PASSA OUT -> LOC_ALCOVE`

2. `special 2` handling:
   - `openadventure execute plover emerald drop special`:
     - moves `EMERALD` from player to current source room,
     - sets fallback row destination `LOC_FOOF5` or `LOC_FOOF6`,
     - dispatches generated goto to the fallback.
   - `openadventure execute generated goto` then applies forced-travel chaining to the final room (`LOC_PLOVER` or `LOC_Y2`).

3. Priority/row selection guard:
   - In `openadventure travel row ... can be selected`, rows that would skip through `LOC_FOOF5/LOC_FOOF6` with `PLOVE` are rejected while carrying `EMERALD`, allowing `special 2` to execute before fallback motion rows.

## Room / item / travel dependencies

- Required rooms:
  - `LOC_Y2`, `LOC_ALCOVE`, `LOC_PLOVER`, `LOC_FOOF5`, `LOC_FOOF6`
- Required object:
  - `EMERALD`
- Travel interactions:
  - `LOC_Y2 + PLOVE + carry(EMERALD)` executes `special 2`
  - `LOC_Y2 + PLOVE + ¬carry(EMERALD)` executes `goto LOC_FOOF5`
  - `LOC_ALCOVE + EAST PASSA` executes tunnel special `1`
  - `LOC_PLOVER + WEST PASSA OUT` executes tunnel special `1`
  - `LOC_PLOVER + PLOVE + carry(EMERALD)` executes `special 2`

## Tests and validation notes

### Existing canonical regression source

`references/open-adventure-c/tests/plover.chk` already contains a full plover session; relevant checkpoints include:

- `plover` from `Y2` enters plover room and emerald appears.
- Entering with heavy burden yields tunnel failure message near alcove.
- `plover` in plover room with emerald in inventory transitions through plover fallback without carrying emerald.

### Suggested validation checklist for this milestone

1. `plover` from `Y2` with empty inventory.
   - Expected: move to `LOC_PLOVER`.
2. `e`/`passa` from `LOC_ALCOVE` with empty hands.
   - Expected: move to `LOC_PLOVER`.
3. Carry 2+ items into `LOC_ALCOVE` and attempt `e`/`passa`.
   - Expected: failure message and remain in `LOC_ALCOVE`.
4. Carry only emerald into `LOC_ALCOVE` and attempt `e`/`passa`.
   - Expected: move to `LOC_PLOVER`.
5. Carry emerald at `LOC_Y2` and issue `plove`.
   - Expected: emerald drops in room, then travel continues through `LOC_FOOF5` forced row to `LOC_PLOVER`.
6. Carry emerald at `LOC_PLOVER` and issue `plove`.
   - Expected: emerald drops in room, then travel continues through `LOC_FOOF6` forced row to `LOC_Y2`.

## Remaining blockers

- `216` and `226` (`special 3` troll/bridge/chasm travel) remain unresolved.
- `138` (`cond_nodwarves`) is now owned by `OpenAdventure_Dwarves.ni`; dwarf movement excludes that route while player travel remains available.

## Effort

- Plover special `1` handler: **small**
- Plover special `2` handler + fallback chaining: **small**
- Dispatch preemption for `EMERALD` + plover command: **small**
- Documentation and regression checklist: **small**
