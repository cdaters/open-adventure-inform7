# Dragon System (Milestone 5C)

## Scope

Milestone 5C implements the Open Adventure dragon confrontation and room-transformation baseline. Open Adventure C is authoritative; Advent.inf and Conley Inform 7 were checked for comparison.

## Source Trace

### Open Adventure C

The active behavior is in `references/open-adventure-c/actions.c`.

- `attack()` chooses the live `DRAGON` as an intransitive attack target when present and `DRAGON` is `DRAGON_BARS`.
- Attacking the live dragon prints `BARE_HANDS_QUERY` and asks a yes/no confirmation through `silent_yes_or_no()`.
- A negative answer prints `NASTY_DRAGON` and leaves the dragon alive.
- An affirmative answer changes `DRAGON` to `DRAGON_DEAD`, changes `RUG` to `RUG_FLOOR`, moves the fixed dragon, rug, blood, and objects from the two dragon-side locations into `LOC_SECRET5`, then moves the player to `LOC_SECRET5`.
- Throwing `AXE` at the live dragon prints `DRAGON_SCALES` and drops the axe.
- Dropping/throwing the caged bird at the live dragon burns the bird and removes it.
- Drinking `BLOOD` removes the blood, changes `DRAGON` to `DRAGON_BLOODLESS`, and marks `game.blooded`.
- `listobjects()` treats `RUG` specially: when first seen under the dragon, its state becomes `RUG_DRAGON` until the dragon is killed.

### Advent.inf

Nelson's Inform 6 version models the same confirmation pattern with an `is_being_attacked` flag. `yes` kills the dragon and creates a corpse; `no` cancels. It also blocks taking the rug while the dragon remains present.

### Conley Inform 7

Conley's Inform 7 snapshot includes the secret canyon region but does not provide a direct Open Adventure C dragon port. It is comparison material for parser conventions only.

## Implemented Model

### State

Declared in `OpenAdventure_State.ni`:

- `openadventure-subsystem-dragon`.
- `openadventure-dragon-last-event`.
- `openadventure-dragon-room-transformed`.
- `openadventure-dragon-blood-drunk`.

Object state remains stored through `adventure-state`:

- `DRAGON`: `DRAGON_BARS`, `DRAGON_DEAD`, `DRAGON_BLOODLESS`.
- `RUG`: `RUG_DRAGON`, `RUG_FLOOR`, `RUG_HOVER`.

### Dragon State Transitions

- Startup initializes `DRAGON` to `DRAGON_BARS` and `RUG` to `RUG_DRAGON`.
- Attacking the live dragon asks the bare-hands confirmation.
- Answering no leaves `DRAGON` as `DRAGON_BARS`.
- Answering yes changes `DRAGON` to `DRAGON_DEAD`, changes `RUG` to `RUG_FLOOR`, makes the rug portable, moves the dragon cluster to `LOC_SECRET5`, and moves the player to `LOC_SECRET5`.
- Drinking `BLOOD` changes `DRAGON` to `DRAGON_BLOODLESS` and removes the blood.

### Confrontation Flow

`OpenAdventure_Dragon.ni` handles:

- `attack dragon`, plus the Inform built-in equivalents `kill`, `fight`, and `hit`.
- Adventure-specific synonyms `strike dragon` and `slay dragon`.
- yes/no confirmation through Inform's `the player consents` prompt.

This keeps the interaction in one command flow, matching the C `attack()` branch rather than requiring a persistent multi-turn prompt state.

### Dragon Death Handling

Dragon death is not a player death path. Milestone 5C does not call the reincarnation subsystem from dragon combat.

The transformation does:

- fix the dead dragon in `LOC_SECRET5`;
- move `RUG` to `LOC_SECRET5`;
- make `RUG` portable;
- move `BLOOD` to `LOC_SECRET5`;
- move objects present in `LOC_SECRET4` or `LOC_SECRET6` to `LOC_SECRET5`;
- run normal runtime post-travel hooks from the attack source to `LOC_SECRET5`.

### Room Transformation

The generated travel table already contains the C dragon gate:

- travel from `LOC_SECRET1` south to `LOC_SECRET5` requires `not DRAGON DRAGON_BARS`;
- travel from `LOC_SECRET3` west to `LOC_SECRET5` requires `not DRAGON DRAGON_BARS`;
- direct attempts from the side dragon rooms print `NASTY_DRAGON`.

Changing `DRAGON` away from `DRAGON_BARS` therefore opens the generated routes without adding a dragon-specific travel override.

### Treasure Access and Scoring

`RUG` is already in `Table of Open Adventure Treasure Scores` for 2 discovery points and 14 deposit points. While the dragon is alive, `RUG` is fixed in place and taking it is blocked. When the dragon dies, `RUG` becomes portable and the scoring subsystem can discover/deposit it through existing hooks.

No independent score is awarded for killing the dragon in Open Adventure C.

### Other Interactions

- Throwing `AXE` at a live dragon prints the scales message and drops the axe in the current room.
- Throwing `BIRD` at a live dragon burns and removes the bird.
- Giving objects to the dragon reports that the dragon is implacable.
- Taking `BLOOD` reports that there are too few drops to carry.
- Drinking `BLOOD` sets the blood-drunk state for future bird-sound parity work.

## Runtime Integration

- `OpenAdventure.ni` includes `OpenAdventure_Dragon.ni`.
- `build.sh` composes `OpenAdventure_Dragon.ni`.
- `OpenAdventure_State.ni` stores dragon runtime flags.
- `OpenAdventure_Runtime.ni` runs dragon post-travel hooks after bear hooks and before scoring hooks.
- `OpenAdventure_Scoring.ni` scores `RUG` through existing treasure tracking.
- `OpenAdventure_Reincarnation.ni` is reused for death systems, but dragon combat does not currently invoke it because the C dragon branch does not kill the player.

## Parity Gaps

- Transcript-level dragon regression tests are pending.
- The exact C fixed-secondary-location representation is approximated with Inform object moves from `LOC_SECRET4` and `LOC_SECRET6` into `LOC_SECRET5`.
- Drinking blood records state, but bird-sound changes that depend on `game.blooded` await the later sound/listen behavior pass.
- Full parser parity for every attack/throw variant remains part of the broader parser hardening work.
