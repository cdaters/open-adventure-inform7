# Verification Report - Death and Reincarnation System (Milestone 5A)

Historical note: this milestone report predates the current transcript suite.
For current release status, see `docs/current-state.md`.

## Commands executed

- `./build.sh --compile`
- `./test.sh`

## Results

- `./build.sh --compile`: **pass**
  - Inform 7 source translation succeeded.
  - Source size: 21021 words.
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

## Implemented behavior

- Reincarnation subsystem added in `OpenAdventure_Reincarnation.ni`.
- Reincarnation state added in `OpenAdventure_State.ni`.
- Runtime subsystem registration added in `OpenAdventure_Runtime.ni`.
- Runtime post-travel hooks update the last safe room.
- Dwarf knife death now routes through `handle openadventure death caused by "dwarf_knife"`.
- Death handling records a scoring penalty through `OpenAdventure_Scoring.ni`.
- Death handling prints obituary prompts and responses from `source/adventure.yaml`.
- Accepted first/second deaths resurrect the player in `LOC_BUILDING`.
- Third accepted death terminates after the final obituary response.
- Refused reincarnation prints `OK` and terminates.
- Cave-closing death path terminates without offering reincarnation.
- Reincarnation removes `WATER` and `OIL`, drops carried items at the death/drop room, moves carried `LAMP` to `LOC_START`, and sets `adventure-state of LAMP` to `LAMP_DARK`.

## Remaining gaps

- Historical note: transcript-level death/reincarnation coverage was pending
  when this report was written; current transcript status is tracked in
  `docs/transcript-results.md`.
- Dark-pit death needs the future darkness/lamp hazard integration.
- Cave-closing death awaits the cave-closing subsystem to set `openadventure-cave-closing-active`.
- Reverse object-order dropping is not yet modeled.
- Terminal score/ranking output remains tied to later endgame work.
