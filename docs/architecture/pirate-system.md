# Pirate System (Milestone 4E)

## Scope

Milestone 4E implements the Open Adventure pirate baseline and integrates it with the dwarf subsystem. Open Adventure C remains authoritative, with Advent.inf and Conley Inform 7 used as comparison references.

## Source Trace

### Open Adventure C

- The pirate is dwarf slot `6` (`PIRATE == NDWARVES`) and starts at `LOC_MAZEEND12`, the eventual chest location.
- The alternate message location is `LOC_DEADEND13`.
- Pirate handling runs from `spotted_by_pirate()` inside `dwarfmove()`, after the dwarf/pirate slot has moved and become visible, but before normal dwarf attack output.
- Pirate handling is skipped when:
  - the actor is not dwarf slot `6`,
  - the player is at the chest location,
  - the chest has already been found,
  - the current/new location is pirate-forbidden (`COND_NOARRR`) by the outer dwarf movement gate.
- The pirate ignores the pyramid in its protected source rooms (`LOC_DARKROOM`, `LOC_PLOVER`).
- If the player is carrying any stealable treasure, the pirate places the chest, prints `PIRATE_POUNCES`, and moves carried/local stealable treasures to `LOC_MAZEEND12`.
- If only the final unseen treasure condition is active, the pirate can be spotted carrying the chest and places it without stealing.
- If there is no theft or chest placement, the pirate may emit `PIRATE_RUSTLES`.

### Advent.inf

- Pirate is a daemon separate from the dwarf object, but it uses similar room restrictions (`nodwarf`, light checks).
- If a dwarf is present, the pirate appears and runs away.
- The Inform 6 implementation has explicit `has_stolen_something` / `has_been_spotted` flags and moves treasure to its dead end.

### Conley Inform 7

- Conley focuses on dwarf patrol behavior; pirate behavior is not a close match for Open Adventure C in this snapshot.
- The Open Adventure C implementation is therefore the behavior authority for Milestone 4E.

## Implemented Model

### State

Declared in `OpenAdventure_State.ni`:

- `openadventure-pirate-chest-location`: `LOC_MAZEEND12`.
- `openadventure-pirate-message-location`: `LOC_DEADEND13`.
- `openadventure-pirate-chest-placed`.
- `openadventure-pirate-chest-found`.
- `openadventure-pirate-has-stolen`.
- `openadventure-pirate-force-chest-ready`.
- `openadventure-pirate-last-theft-count`.
- `Table of Open Adventure Pirate Treasures`.

### Activation

- `OpenAdventure_Pirate.ni` enables the pirate subsystem at play start.
- Pirate handling only runs after dwarf activation reaches active encounter state (`openadventure-dwarf-activity-level >= 2`).
- The dwarf subsystem owns call ordering and invokes pirate handling during the dwarf round.

### Movement and Appearance

- The pirate reuses dwarf slot `6`.
- Current implementation follows the Milestone 4D simplified dwarf-pressure model:
  - existing seen/current/prior-room contact can trigger pirate appearance,
  - otherwise a small random appearance chance can trigger in eligible deep-cave rooms.
- Pirate-forbidden rooms mirror `COND_NOARRR`.

### Treasure Theft

- `Table of Open Adventure Pirate Treasures` lists all generated treasures.
- `CHEST` is excluded from theft.
- `PYRAMID` is protected in `LOC_DARKROOM` and `LOC_PLOVER`.
- When carried treasure is present, the pirate:
  - places `CHEST` at `LOC_MAZEEND12`,
  - places `MESSAG` at `LOC_DEADEND13`,
  - prints `PIRATE_POUNCES`,
  - moves carried and local stealable treasures to the chest location.

### Chest Mechanics

- `CHEST` starts hidden at `LOC_NOWHERE`.
- Chest placement sets `adventure-state of CHEST` to `PIRATE_CHEST_PLACED`.
- Entering the chest location while the chest is there marks it found and sets `PIRATE_CHEST_FOUND`.
- Once found, the pirate no longer acts.

### Dwarf/Pirate Ordering

- `OpenAdventure_Dwarves.ni` invokes:
  - `run openadventure pirate post-dwarf-round in current-room with dwarf-count visible-dwarves`
- This happens after normal dwarf visibility has been computed and before normal dwarf presence/knife output is printed.
- The pirate does not increment normal dwarf attack counters and does not throw knives.

## Parity Gaps

- Full C-style generated-edge movement for dwarf slot `6` depends on the future dwarf movement hardening task.
- The final-treasure `tally == 1` chest-placement branch is represented by `openadventure-pirate-force-chest-ready`; scoring/found-treasure integration will set it in a later milestone.
- Transcript-level behavioral validation is still pending.
