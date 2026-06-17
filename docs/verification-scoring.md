# Verification Report - Treasure and Scoring System (Milestone 4F)

Historical note: this milestone report predates the current transcript suite.
For current release status, see `docs/current-state.md`.

## Commands executed

- `./build.sh --compile`
- `./test.sh`

## Results

- `./build.sh --compile`: **pass**
  - Inform 7 source translation succeeded.
  - Source size: 20351 words.
  - Artifact generated: `OpenAdventure.inform/Build/OpenAdventure.z8`.

- `./test.sh`: **pass**
  - Generation check passed.
  - Compile step passed.
  - Artifact exists.
  - Smoke tests passed:
    - `tests/smoke/01-build-artifacts.sh`
    - `tests/smoke/03-troll-system.sh`
    - `tests/smoke/04-dwarf-system.sh`
    - `tests/smoke/05-pirate-system.sh`
    - `tests/smoke/06-scoring-system.sh`

## Implemented behavior

- Scoring subsystem added in `OpenAdventure_Scoring.ni`.
- Inform scoring enabled through `Use scoring`.
- Score maximum set to `430`.
- Treasure scoring table added for all 20 Open Adventure treasures.
- Discovery and deposit state are tracked separately.
- Score recomputation includes:
  - treasure discovery points,
  - treasure deposit points,
  - survival/death component,
  - deep-cave component,
  - cave-closing/endgame hook state,
  - Witt's End magazine hook,
  - Open Adventure C's 2-point rounding component.
- Runtime score command reports the Open Adventure-style "garnered" message.
- Pirate chest discovery marks `CHEST` found through scoring.
- Pirate theft marks stolen treasures found before moving them to the chest location.
- Final unseen treasure readiness sets `openadventure-pirate-force-chest-ready`.
- Dwarf death now records the scoring death penalty before ending the story.

## Remaining gaps

- Historical note: transcript-level scoring coverage was pending when this
  report was written; current transcript status is tracked in
  `docs/transcript-results.md`.
- Reincarnation is still not implemented.
- Hint, save, novice, turn-loss, cave-closing, and terminal ranking outputs await their owning systems.
- Broken/stashed treasure edge cases should be tightened when object-state systems are expanded.
