# Current State

## Milestone snapshot

This document reflects repository reality after Milestones 3E, 4A, 4B, 4C, 4D, 4E, 4F, 5A, and the Milestone 3F documentation refresh.

## Build status

- `./build.sh --compile` succeeds.
- Story artifact currently produced: `OpenAdventure.inform/Build/OpenAdventure.z8`.
- Build script creates required output directories and assembles generated + runtime sources in one stage.

## Runtime architecture status

### Completed

- Runtime framework foundations:
  - Global state structures and variables (`OpenAdventure_State.ni`)
  - Condition predicates/evaluation helpers (`OpenAdventure_Conditions.ni`)
  - Core runtime hooks and registration (`OpenAdventure_Runtime.ni`)
- Runtime travel dispatch:
  - generated travel rows are evaluated through central runtime.
  - supports direct, random, forced, and magic-word travel.
- Plover subsystem implemented as generated+runtime integration path.
- Troll/bridge/chasm subsystem implemented and connected to special travel ID `3`.
- Dwarf subsystem now includes route exclusion, actor-slot state, deep-cave activation, first encounter, visible dwarf pressure, travel blocking, knife attacks, and attack handling.
- Milestone 4D covers rule `138`/`cond_nodwarves` as a dwarf-movement exclusion while keeping normal player travel available.
- Pirate subsystem now includes slot-6 dwarf integration, chest placement, treasure theft, pirate-forbidden room checks, and chest-found disabling.
- Milestone 4E wires dwarf/pirate ordering through the dwarf post-travel round.
- Milestone 4F adds treasure discovery/deposit tracking, Open Adventure C point classes, score recomputation, score command reporting, death-penalty bookkeeping, and pirate chest scoring integration.
- Milestone 5A adds shared death handling, obituary/consent flow, reincarnation limits, inventory disposition, lamp recovery, and dwarf death integration.

### Ongoing / incomplete

- Full generated-edge dwarf/pirate movement parity remains beyond the Milestone 4F baseline.
- No full systems yet for dragon, bear, cave-closing, or endgame.
- Terminal scoring/ranking output is not yet wired to complete game endings.
- Dark-pit and cave-closing death callers await their owning systems.

## Gameplay status by subsystem

| Subsystem | State |
|---|---|
| Plover | Implemented (runtime + handlers) |
| Travel dispatch | Implemented |
| Dwarf | Implemented baseline (route exclusion, activation, encounter, blocking, attacks); full generated-edge movement parity pending |
| Pirate | Implemented baseline (chest placement, treasure theft, dwarf ordering); final-treasure scoring integration implemented |
| Death/Reincarnation | Implemented baseline (dwarf death, consent flow, item/lamp disposition, score penalty); dark-pit/cave-closing callers pending |
| Troll/Bridge/Chasm | Implemented |
| Bear | Not implemented |
| Dragon | Not implemented |
| Cave closing | Not implemented |
| Scoring | Implemented baseline (treasure discovery/deposit, score recompute, pirate chest, death hook); terminal/endgame flow pending |
| Endgame | Not implemented |

## Source integration status

- Generated artifacts are produced from `source/adventure.yaml` and assembled into the Inform 7 source tree.
- Manual changes are concentrated in runtime and subsystem modules; generated files remain structured as generated outputs.
- OpenAdventure.ni and runtime files are included in build composition.

## Testing status

- Compilation smoke path is working and repeatable.
- Build/test scripts are present and documented.
- Transcript/integration behavioral tests are not yet complete for gameplay scenarios; compile/smoke coverage is complete.

## Unresolved blockers and risks

- Completing full generated-edge dwarf/pirate movement parity.
- Coordinating system side effects and parser interactions for unresolved special rules.
- Introducing cave-closing/endgame without regressing earlier travel/parser/scoring infrastructure.

## Next milestones

- Complete remaining gameplay systems in isolated modules with explicit state and parser/travel contracts.
- Introduce behavior-focused test coverage through transcripts and expected command outcomes.
- Tighten gameplay parity validation against reference C/Inform 7/Inform 6 sources.

## Recent doc updates

- `docs/architecture/project-roadmap.md` now captures the recommended implementation order, risks, and current progress summary.
