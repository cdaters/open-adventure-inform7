# Endgame System

Milestone 6A adds the Open Adventure repository endgame that follows cave closing.

## Source Authority

Open Adventure C is authoritative for implemented behavior:

- `actions.c::blast()` selects the blast outcome after `game.closed`.
- `actions.c::vbreak()` breaks the mirror only after the cave is closed and wakes the dwarves.
- `actions.c::wake()` wakes the repository dwarf only after the cave is closed.
- `score.c::score()` defines closed-cave bonuses and final endgame scoring.

Nelson Inform 6 is used as an implementation comparison for the repository room layout and parser affordances. Conley Inform 7 has no complete endgame and is not authoritative for this subsystem.

## Repository Rooms

The generated world already contains:

- `LOC_NE`: northeast end of the repository.
- `LOC_SW`: southwest end of the repository.

Milestone 5D moves the player to `LOC_NE` when the second cave-closing clock expires and relocates repository objects:

- `LOC_NE`: empty bottle, plant, oyster, lamp, normal rod, sleeping dwarf, mirror.
- `LOC_SW`: grate, endgame sign, snake, bird, cage, rusty-mark rod, pillow.

Milestone 6A records repository readiness in `openadventure-repository-ready` and treats `LOC_NE` and `LOC_SW` as the endgame rooms.

## Blast Outcomes

The `BLAST` action follows Open Adventure C for bare and transitive blast commands:

- If the cave is not closed, or the rusty-mark rod is not present, print `Blasting requires dynamite.`
- If the rusty-mark rod is carried or in the player location, print the splatter message and end the game with a 25-point closed-cave bonus.
- If the player is at `LOC_NE` and the rod is elsewhere, print the defeat message and end the game with a 30-point closed-cave bonus.
- Otherwise print the victory message and end the game with a 45-point closed-cave bonus.

The intended victory is to move the rusty-mark rod away from the player side, stand on the opposite side, and `BLAST`.

## Repository Puzzle Behavior

The repository puzzle is intentionally small:

- The player can move between `LOC_NE` and `LOC_SW`.
- The rusty-mark rod acts as the dynamite proxy.
- The blast result depends on where the player and rod are when `BLAST` is typed.
- Disturbing the repository mirror or sleeping dwarf is fatal.

The generated `MIRROR` object is relocated to `LOC_NE`; this preserves the generated object model while implementing the C mirror break behavior where the object exists.

## Dwarf Disturbance

After the cave is closed:

- Attacking the mirror changes `MIRROR` to `MIRROR_BROKEN`, prints the shatter message, wakes the dwarves, and ends the game.
- Attacking the sleeping dwarf wakes the dwarves and ends the game.
- Waking the dwarf prints the prod-dwarf message, then wakes the dwarves and ends the game.

This path receives the C `none` closed-cave bonus of 10 points.

## Final Scoring

The endgame subsystem reuses `OpenAdventure_Scoring.ni`:

- `mark openadventure cave closed bonus 10` for no-blast dwarf-awakening endgame.
- `mark openadventure cave closed bonus 25` for splatter.
- `mark openadventure cave closed bonus 30` for defeat.
- `mark openadventure cave closed bonus 45` for victory.
- `mark openadventure quit bonus earned` for terminal endgame completion.

The final score is recomputed before the story ends and the existing ranking phrase prints the rank text.

## Runtime Integration

Integration points:

- `OpenAdventure_State.ni`: endgame completion, last outcome, final bonus, repository-ready state.
- `OpenAdventure_CaveClosing.ni`: repository initialization after the cave fully closes.
- `OpenAdventure_Runtime.ni`: post-travel endgame hook after cave-closing hooks.
- `OpenAdventure_Scoring.ni`: closed-cave bonus and final not-quitting bonus.

The endgame subsystem does not alter cave-closing clocks or treasure tracking; it only consumes the closed-cave state.
