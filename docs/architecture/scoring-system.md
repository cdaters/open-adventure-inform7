# Treasure and Scoring System (Milestone 4F)

## Scope

Milestone 4F implements Open Adventure treasure tracking and score bookkeeping. Open Adventure C is authoritative; Advent.inf and Conley Inform 7 were checked for comparison.

## Source Trace

### Open Adventure C

- `score.c` computes the score from current state rather than relying on a permanently accumulated score.
- Treasure scoring totals 298 points:
  - each treasure before `CHEST`: 12 points total,
  - `CHEST`: 14 points total,
  - each treasure after `CHEST`: 16 points total.
- Each found treasure contributes 2 points.
- Deposit credit is only awarded when a found treasure is safely in `LOC_BUILDING`:
  - pre-chest treasures: 10 deposit points,
  - `CHEST`: 12 deposit points,
  - post-chest treasures: 14 deposit points.
- Survival contributes `(NDEATHS - game.numdie) * 10`; with three possible deaths this is 30 points before the first death.
- Additional score hooks cover not quitting, getting well into the cave, cave closing, closed-cave bonus, Witt's End magazine placement, hint/turn/save penalties, and ranking output.
- `listobjects()` marks objects found when visible. The pirate's final-chest branch depends on the same found-treasure tally.

### Advent.inf

- Nelson's Inform 6 version uses a `Treasure` class with `depositpoints`.
- It awards discovery points when a treasure is first taken/seen and deposit points when safely deposited.
- It subtracts for death and for carrying treasure through reincarnation.
- Its score maximum and exact point allocation differ from Open Adventure C, so it is comparison material only.

### Conley Inform 7

- Conley's snapshot uses `Use no scoring` and does not provide a direct Open Adventure C scoring model.
- It is not used as the behavior authority for Milestone 4F.

## Implemented Model

### State

Declared in `OpenAdventure_State.ni`:

- `openadventure-score-total`.
- `openadventure-score-maximum` (`430`).
- `openadventure-score-delta`, `openadventure-score-event-reason`, and `openadventure-score-event-source`.
- `openadventure-score-manual-adjustment`.
- `openadventure-death-count`.
- `openadventure-treasures-found-count`.
- `openadventure-treasures-deposited-count`.
- endgame hook flags for deep cave, cave closing, closed-cave bonus, and quit bonus.
- `Table of Open Adventure Treasure Scores`.

The treasure table mirrors the Open Adventure C object order and point classes:

- `NUGGET` through `COINS`: 2 discovery + 10 deposit.
- `CHEST`: 2 discovery + 12 deposit.
- `EGGS` through `OBJ_69`: 2 discovery + 14 deposit.

### Treasure Classification

`Table of Open Adventure Treasure Scores` is the scoring subsystem's treasure authority. It covers the same 20 treasure objects marked `treasure: true` in `source/adventure.yaml` and reused by the pirate subsystem.

### Discovery Scoring

`OpenAdventure_Scoring.ni` marks a treasure found when it is carried by the player or present in the player's current room. The first found mark awards the table's 2 discovery points and increments `openadventure-treasures-found-count`.

This is the Inform 7 equivalent of the C `listobjects()` found-treasure side effect.

### Deposit Scoring

A found treasure is deposited when it is directly in `LOC_BUILDING`. The first deposited mark awards the table's deposit points and increments `openadventure-treasures-deposited-count`.

Deposit scoring deliberately follows the C rule that full treasure credit is only available after the treasure has been found.

### Pirate Chest Scoring

`CHEST` remains hidden until the pirate places it. When the player reaches the pirate chest location and the chest is present, `OpenAdventure_Pirate.ni` marks `CHEST` found through the scoring subsystem.

The scoring subsystem also updates `openadventure-pirate-force-chest-ready` when all non-chest treasures have been found and the chest is still hidden. This implements the C `tally == 1` final unseen treasure branch used by the pirate.

### Death Penalties

`record openadventure death penalty` increments `openadventure-death-count` up to the C limit of three deaths and recomputes the survival component. Milestone 5A routes active death handling through `OpenAdventure_Reincarnation.ni`, which calls this scoring hook.

### Endgame Hooks

The scoring subsystem exposes hooks for later cave-closing/endgame work:

- `mark openadventure deep cave score reached` (+25).
- `mark openadventure cave closing score reached` (+25).
- `mark openadventure cave closed bonus ...` (+10/+25/+30/+45 equivalent hook).
- `mark openadventure quit bonus earned` (+4).

Milestone 4F wires deep-cave scoring through runtime post-travel hooks. Cave-closing and endgame callers will be added with those systems.

### Ranking Hooks

`To say openadventure ranking for score ...` implements the Open Adventure C class thresholds from `source/adventure.yaml`:

- 45, 120, 170, 250, 320, 375, 410, 426, 429, 9999.

Terminal ranking output is not yet wired to a full endgame termination flow.

## Runtime Integration

- `OpenAdventure.ni` enables Inform scoring with `Use scoring` and includes `OpenAdventure_Scoring.ni`.
- `build.sh` composes `OpenAdventure_Scoring.ni` into generated source.
- `OpenAdventure_Runtime.ni` runs scoring post-travel hooks after dwarf/pirate hooks.
- The runtime score delta hook delegates to the scoring subsystem when enabled.
- `OpenAdventure_Pirate.ni` marks stolen/found treasure and chest discovery through the scoring subsystem.
- `OpenAdventure_Reincarnation.ni` records death penalties through the scoring subsystem.
- `OpenAdventure_Bear.ni` makes `CHAIN` portable after bear-chain unlock so existing treasure deposit scoring can apply.

## Parity Gaps

- Transcript-level scoring validation is still pending because the repository does not yet have a command transcript harness.
- Broken/stashed treasure edge cases will need revisiting when dragon, bear, vase, eggs, and endgame object-state systems are implemented.
- Hint, save, novice, turn-loss, and full termination/ranking output hooks are not yet wired to completed gameplay systems.
