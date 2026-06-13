# Verification Report - Pirate System (Milestone 4E)

## Commands executed

- `./build.sh --compile`
- `./test.sh`

## Results

- `./build.sh --compile`: **pass**
  - Inform 7 source translation succeeded.
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

## Implemented behavior

- Pirate subsystem added in `OpenAdventure_Pirate.ni`.
- Pirate state added in `OpenAdventure_State.ni`.
- Pirate subsystem included by `OpenAdventure.ni` and `build.sh`.
- Pirate is initialized as dwarf slot `6`.
- Dwarf post-travel flow invokes pirate handling before dwarf attack output.
- Chest placement moves:
  - `CHEST` to `LOC_MAZEEND12`,
  - `MESSAG` to `LOC_DEADEND13`.
- Treasure theft moves carried/local stealable treasures to `LOC_MAZEEND12`.
- Pirate excludes `CHEST` from theft and protects `PYRAMID` in `LOC_DARKROOM` / `LOC_PLOVER`.
- Pirate-forbidden rooms mirror `COND_NOARRR`.

## Remaining gaps

- Full generated-edge movement parity for dwarf/pirate slot movement remains pending.
- Final unseen treasure branch requires future scoring/found-treasure integration.
- Transcript-level pirate tests are not yet available.
