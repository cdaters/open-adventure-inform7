# Death and Reincarnation System (Milestone 5A)

## Scope

Milestone 5A implements Open Adventure death handling and reincarnation flow. Open Adventure C is authoritative; Advent.inf and Conley Inform 7 were checked for comparison.

## Source Trace

### Open Adventure C

The authoritative flow is `croak()` in `references/open-adventure-c/main.c`.

- Death count is stored in `game.numdie`.
- The number of possible deaths is `NDEATHS`, generated from `source/adventure.yaml` obituaries.
- On death, C increments `game.numdie`.
- If `game.closng` is true, no resurrection is offered; `DEATH_CLOSING` is printed and the game terminates.
- Otherwise, the matching obituary query is printed and the player is asked whether to reincarnate.
- If the player refuses, C prints `OK_MAN` and terminates.
- If the player accepts on the first or second death, C prints the obituary's `yes_response` and resurrects the player.
- If the player accepts on the third death, C prints the third `yes_response` and terminates.
- During reincarnation:
  - `WATER` and `OIL` are removed to `LOC_NOWHERE`.
  - all carried items are dropped at `game.oldlc2`, the last death/drop location.
  - carried `LAMP` is special: it is turned off and dropped at `LOC_START`.
  - the player is moved to `LOC_BUILDING`.
  - retreat state is reset so `back` cannot immediately undo death recovery.
- Dwarf knife death and dark-pit death both route into `croak()`.

### Advent.inf

Nelson's Inform 6 implementation has a comparable `AfterLife` routine:

- three death prompts/responses,
- no reincarnation during cave closing,
- carried inventory dropped where the player died,
- lantern moved back to the road and turned off,
- player returned to the building.

Its score model differs from Open Adventure C, so it is comparison material only for control flow and object disposition.

### Conley Inform 7

Conley's snapshot contains dwarf/death-adjacent behavior but does not provide a direct Open Adventure C reincarnation implementation. It is not used as the Milestone 5A behavior authority.

## Implemented Model

### State

Declared in `OpenAdventure_State.ni`:

- `openadventure-subsystem-reincarnation`.
- `openadventure-reincarnation-limit` (`3`).
- `openadventure-last-safe-room`.
- `openadventure-death-location`.
- `openadventure-last-death-cause`.
- `openadventure-reincarnation-in-progress`.
- `openadventure-reincarnation-last-result`.
- `openadventure-cave-closing-active`.

`openadventure-death-count` remains owned by the scoring subsystem so the survival-score component stays centralized.

### Death Causes

The active Milestone 5A integration point is dwarf knife death:

- `OpenAdventure_Dwarves.ni` now calls `handle openadventure death caused by "dwarf_knife"`.

The subsystem is written as a reusable handler for later death causes:

- dark-pit death,
- cave-closing death,
- dragon/bear/endgame deaths,
- explicit terminal failures.

### Resurrection Flow

`OpenAdventure_Reincarnation.ni` owns the death sequence:

1. Guard against recursive death handling.
2. Store the death cause and death location.
3. Record the scoring death penalty.
4. If cave closing is active, print the closing death message and end the story.
5. Print the appropriate obituary query.
6. Use Inform's yes/no consent prompt.
7. On refusal, print `OK` and end the story.
8. On accepted first/second death, print the matching yes response and resurrect.
9. On accepted third death, print the final yes response and end the story.

### Reincarnation Limits

`openadventure-reincarnation-limit` is `3`, matching the three obituary entries in `source/adventure.yaml`. As in C, the third death can ask the player but cannot produce another resurrection.

### Item Dropping Behavior

On resurrection:

- `WATER` and `OIL` are moved to `LOC_NOWHERE`.
- carried non-lamp items are dropped at `openadventure-death-location`, falling back to `openadventure-last-safe-room`.
- carried `LAMP` is moved to `LOC_START`.
- `DWARF` is moved to `LOC_NOWHERE` to clear the visible parser proxy after death.

The exact C reverse-object-order drop loop is not yet modeled because the generated Inform layer does not maintain numeric object-order iteration. This is a parity hardening point for future bird/cage-specific regression work.

### Lamp Handling

When the carried lamp is recovered from the player during reincarnation:

- `LAMP` is moved to `LOC_START`.
- `adventure-state of LAMP` is set to `LAMP_DARK`.

This preserves the Open Adventure C behavior boundary even though the full lamp power/light subsystem is not implemented yet.

### Score Penalties

Reincarnation calls `record openadventure death penalty` in `OpenAdventure_Scoring.ni`.

The scorer recomputes the survival component as:

- `(3 - openadventure-death-count) * 10`.

This matches the C `score.c` death component.

### Dwarf Integration

Dwarf knife hits no longer end the story directly. They now invoke the shared death handler, which decides whether to resurrect or terminate.

### Future Cave-Closing Integration

`openadventure-cave-closing-active` is present for the future cave-closing subsystem. When true, death handling prints the C closing-death message and terminates without offering reincarnation.

## Runtime Integration

- `OpenAdventure.ni` includes `OpenAdventure_Reincarnation.ni`.
- `build.sh` composes `OpenAdventure_Reincarnation.ni`.
- `OpenAdventure_Runtime.ni` registers the reincarnation subsystem and updates `openadventure-last-safe-room` after successful travel.
- `OpenAdventure_Dwarves.ni` calls the shared death handler on knife-hit death.
- `OpenAdventure_Scoring.ni` remains the score penalty authority.

## Parity Gaps

- Transcript-level death/reincarnation validation is pending.
- Dark-pit death is not yet wired because the full darkness/lamp hazard flow is not implemented.
- Cave-closing death is supported by state and handler logic but awaits the cave-closing subsystem.
- Reverse object-order dropping remains future parity work.
- Terminal score/ranking output remains part of the later endgame/termination milestone.
