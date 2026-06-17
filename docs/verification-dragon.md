# Verification Report - Dragon System (Milestone 5C)

Historical note: this milestone report predates the current transcript suite.
For current release status, see `docs/current-state.md`.

## Commands executed

- `./build.sh --compile`
- `./test.sh`

## Results

- `./build.sh --compile`: **pass**
  - Inform 7 source translation succeeded.
  - Source size: 23055 words.
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
    - `tests/smoke/07-reincarnation-system.sh`
    - `tests/smoke/08-bear-system.sh`
    - `tests/smoke/09-dragon-system.sh`

## Implemented behavior

- Dragon subsystem added in `OpenAdventure_Dragon.ni`.
- Dragon runtime state added in `OpenAdventure_State.ni`.
- Dragon subsystem included by `OpenAdventure.ni` and `build.sh`.
- Runtime post-travel hook added for dragon/scoring synchronization.
- Live dragon initializes to `DRAGON_BARS`; rug initializes to `RUG_DRAGON`.
- Attacking the live dragon asks for yes/no confirmation.
- A no answer leaves the dragon alive and prints the nasty-dragon warning.
- A yes answer kills the dragon, moves the dragon/rug/blood cluster to `LOC_SECRET5`, makes the rug portable, and moves the player to `LOC_SECRET5`.
- Throwing the axe at the dragon follows the C scales/bounce branch.
- Throwing the bird at the dragon burns and removes the bird.
- Taking the rug is blocked while the dragon is alive.
- Drinking dragon blood changes the dragon to `DRAGON_BLOODLESS`.
- `RUG` remains integrated with treasure scoring through the scoring table.

## Remaining gaps

- Historical note: transcript-level dragon coverage was pending when this
  report was written; current transcript status is tracked in
  `docs/transcript-results.md`.
- Exact C dual-location fixed-object behavior is approximated.
- Dragon-blood bird sound/listen parity awaits future sound behavior work.
- Broader parser command parity remains pending for the parser hardening milestone.
