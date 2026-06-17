# Cave Closing System (Milestone 5D)

Historical note: this subsystem design predates final transcript parity. For
current release status, see `../current-state.md`.

## Scope

Milestone 5D implements the Open Adventure cave-closing baseline: warning clock, panic clock, repository transition, exit restrictions, and integration with scoring and reincarnation. Open Adventure C is authoritative; Advent.inf and Conley Inform 7 were checked for comparison.

## Source Trace

### Open Adventure C

The authoritative flow is `closecheck()` and movement handling in `references/open-adventure-c/main.c`.

- Initial clocks are `WARNTIME = 30`, `FLASHTIME = 50`, and `PANICTIME = 15`.
- The cave begins counting down after all treasures have been located, represented in C by `game.tally == 0`.
- `clock1` ticks only while the player is in deep cave and not at `LOC_Y2`.
- When `clock1` reaches zero:
  - the grate is closed;
  - the fissure is unbridged;
  - dwarves and pirate are removed;
  - troll is removed and `TROLL2` is restored;
  - the live bear is removed;
  - the chain and axe are freed;
  - `CAVE_CLOSING` is printed;
  - `game.closng` becomes true.
- While `closng` is true, attempted movement to outside locations is blocked with `EXIT_CLOSED`; the first such attempt sets `clock2` to `PANICTIME`.
- Otherwise `clock2` continues down from `FLASHTIME`.
- When `clock2` reaches zero, C relocates the player and repository objects into `LOC_NE`/`LOC_SW`, destroys carried objects, prints `CAVE_CLOSED`, and sets `game.closed`.
- Death during `closng` prints `DEATH_CLOSING` and terminates without reincarnation.

### Advent.inf

Nelson's Inform 6 implementation has the same broad late-game shape: cave-closing flag, repository rooms, blocked exits, and no reincarnation once closing has started.

### Conley Inform 7

Conley's snapshot is an earlier implementation and does not provide a direct Open Adventure C cave-closing model. It is comparison material only for parser and room naming.

## Implemented Model

### State

Declared in `OpenAdventure_State.ni`:

- `openadventure-subsystem-cave-closing`.
- `openadventure-cave-clock1`.
- `openadventure-cave-clock2`.
- `openadventure-cave-panic-clock`.
- `openadventure-cave-closing-active`.
- `openadventure-cave-closed-active`.
- `openadventure-cave-panic-active`.
- `openadventure-cave-closing-last-event`.
- `openadventure-cave-last-clock-turn`.

The existing `openadventure-cave-closing-active` flag remains shared with the reincarnation subsystem.

### Closing Triggers

`OpenAdventure_CaveClosing.ni` treats the scoring table's treasure-found flags as C's `tally`.

The warning countdown can tick only when:

- every row in `Table of Open Adventure Treasure Scores` is found;
- the player is in a deep-cave room according to the existing dwarf/scoring deep-cave predicate;
- the player is not at `LOC_Y2`;
- the cave is not already fully closed.

### Warning Messages

When `clock1` reaches zero, the subsystem prints the C `CAVE_CLOSING` text and records `openadventure-cave-closing-last-event` as `warning`.

Attempted exit during warning mode prints the C `EXIT_CLOSED` text and records panic.

When `clock2` reaches zero, the subsystem prints the C `CAVE_CLOSED` text before moving the player to the repository view.

### Clock Behavior

- `openadventure-cave-clock1` starts at `30`.
- `openadventure-cave-clock2` starts at `50`.
- `openadventure-cave-panic-clock` is `15`.
- Once warning mode begins, `clock1` is set to `-1`, matching the C sentinel.
- If the player attempts to leave for an outside room during warning mode, `clock2` is reset to `15` the first time and `openadventure-cave-panic-active` becomes true.
- A per-turn guard prevents the runtime post-travel hook and Inform `Every turn` rule from ticking the same turn twice.

### Repository Transition

When the cave closes completely:

- carried items are moved to `LOC_NOWHERE`;
- `BOTTLE`, `PLANT`, `OYSTER`, `LAMP`, `ROD`, `DWARF`, and `MIRROR` are moved to `LOC_NE`;
- `GRATE`, `SIGN`, `SNAKE`, `BIRD`, `CAGE`, `ROD2`, and `PILLOW` are moved to `LOC_SW`;
- object states are set for the repository baseline, including `EMPTY_BOTTLE`, `PLANT_THIRSTY`, `LAMP_DARK`, `ENDGAME_SIGN`, `SNAKE_CHASED`, and `BIRD_CAGED`;
- the player is moved to `LOC_NE`;
- `openadventure-cave-closed-active` becomes true.

This is the repository setup needed by the later endgame/blast milestone.

### Travel Restrictions

The subsystem blocks travel to outside/surface rooms while warning mode is active and the cave is not fully closed. It does this in two places:

- `openadventure pre-travel hooks ...` for runtime-dispatched travel;
- a `Before going to a room ...` rule for direct Inform map travel.

The blocked outside set covers the surface/pre-cave rooms used by the current generated map: start, hill, building, valley, road end, cliff, slit, and outside grate.

### Object Relocation

Warning phase side effects approximate the C relocation model through Inform object placement:

- dwarves and pirate actor slots are cleared;
- `DWARF` parser proxy is moved away;
- `TROLL` is removed and `TROLL2` is restored at the chasm;
- live `BEAR` is removed;
- `CHAIN` becomes portable and heap-state;
- `AXE` becomes portable and available.

Full C fixed-secondary-location behavior is approximated, as in prior troll/bear/dragon milestones.

### Death and Reincarnation

The cave-closing subsystem sets `openadventure-cave-closing-active` when warning mode begins. `OpenAdventure_Reincarnation.ni` already checks that flag and, when true, prints the C closing-death message and ends the story instead of offering reincarnation.

### Scoring Implications

Warning mode calls `mark openadventure cave closing score reached`, which awards the C `closng` score component through the existing scoring subsystem.

The closed-cave final bonus remains reserved for the endgame/blast outcome milestone, because the C bonus depends on terminal outcomes: ordinary closed, splatter, defeat, or victory.

## Runtime Integration

- `OpenAdventure.ni` includes `OpenAdventure_CaveClosing.ni`.
- `build.sh` composes `OpenAdventure_CaveClosing.ni`.
- `OpenAdventure_State.ni` stores cave-closing clocks and phase flags.
- `OpenAdventure_Runtime.ni` calls cave-closing pre-travel and post-travel hooks.
- `OpenAdventure_Reincarnation.ni` uses `openadventure-cave-closing-active` to suppress resurrection.
- `OpenAdventure_Scoring.ni` awards the cave-closing score hook.

## Parity Gaps

- Historical note: this was written before the current transcript suite.
  Current transcript status is tracked in `../transcript-results.md`.
- Turn-threshold penalties and lamp depletion remain part of later clock/lamp hardening.
- Exact C fixed-location mechanics are approximated through Inform placement.
- Endgame blast outcomes and final closed-cave bonus selection are deferred to the endgame milestone.
