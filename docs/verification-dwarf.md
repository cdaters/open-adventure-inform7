# Verification Report - Dwarf Runtime Integration (Milestone 4D)

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

## Implemented behavior

- `cond_nodwarves` is integrated through condition dispatch:
  - `OpenAdventure_Conditions.ni` delegates dwarf-owned checks to:
    - `openadventure nodwarves traversal from source-location ... to destination-location ...`
- Normal player travel treats `nodwarves` as satisfied.
- Dwarf movement excludes `LOC_LONGWEST -> LOC_DIFFERENT1` through the dwarf route policy predicate.
- Runtime travel row evaluation passes context (`openadventure-active-source-loc`, `openadventure-active-travel-result`) so condition checks are deterministic.
- Dwarf actor slots are initialized at play start.
- Post-travel hooks arm first encounter on deep-cave entry, trigger first encounter, reveal/track visible dwarves, and resolve knife attacks.
- Pre-travel hooks block movement into a visible dwarf's previous room.
- `DWARF` is surfaced as an attackable parser noun while visible; attacking it can remove one actor slot.

## Deviations from Open Adventure C

- Dwarf movement pressure is simplified and does not yet enumerate the full generated `travel[]` candidate list.
- Pirate interaction points are not fully implemented.
- Knife-hit death ends the story directly; reincarnation is not implemented yet.

## Remaining blockers after 4D

1. Add transcript-level command tests.
2. Replace simplified movement pressure with full generated-edge candidate selection.
3. Resolve pirate-dwarf ordering and precedence when both systems target travel/room updates.
4. Add reincarnation/death recovery.

## Recommendation for next milestone

Proceed to transcript-level dwarf regressions and then full generated-edge dwarf movement parity.
