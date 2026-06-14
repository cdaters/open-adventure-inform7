# Current State

## Milestone snapshot

This document reflects repository reality after Milestones 3E, 4A, 4B, 4C, 4D, 4E, 4F, 5A, 5B, 5C, 5D, 6A, 6B, 7A, 7B, and the Milestone 3F documentation refresh.

## Build status

- Inform 7 translation succeeds.
- `./build.sh --compile` now runs the complete `ni` -> `inform6` chain and fails honestly at the default Z-machine emission stage.
- No default `OpenAdventure.inform/Build/OpenAdventure.z8` is currently produced because `inform6` reports `110160` bytes of readable memory against the Z-machine maximum of `65536`.
- Diagnostic Glulx builds can produce `OpenAdventure.inform/Build/OpenAdventure.ulx`.
- Build script creates required output directories, assembles generated + runtime sources, writes `OpenAdventure.inform/Build/OpenAdventure.i6`, and validates final VM artifact headers.

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
- Milestone 5B adds bear feeding, chain lock/unlock handling, bear following, troll-scaring, bridge-collapse death, and chain scoring integration.
- Milestone 5C adds dragon confrontation, yes/no confirmation, room transformation, rug release, blood handling, and rug scoring integration.
- Milestone 5D adds cave-closing warning clocks, panic timing, exit restrictions, repository transition, reincarnation suppression, and cave-closing score integration.
- Milestone 6A adds repository endgame behavior, blast outcomes, mirror/dwarf disturbance endings, final scoring, and ranking output.
- Milestone 6B adds startup presentation, HELP menu, ABOUT, INFO, NEWS, credits, and version information.
- Milestone 7A adds the transcript regression framework, suite manifest, walkthrough inventory, parity report, and known-differences inventory.

### Ongoing / incomplete

- Full generated-edge dwarf/pirate movement parity remains beyond the Milestone 4F baseline.
- Transcript execution is blocked because the default Z-machine artifact cannot yet be emitted.
- Dark-pit death callers await their owning systems.

## Gameplay status by subsystem

| Subsystem | State |
|---|---|
| Plover | Implemented (runtime + handlers) |
| Travel dispatch | Implemented |
| Dwarf | Implemented baseline (route exclusion, activation, encounter, blocking, attacks); full generated-edge movement parity pending |
| Pirate | Implemented baseline (chest placement, treasure theft, dwarf ordering); final-treasure scoring integration implemented |
| Death/Reincarnation | Implemented baseline (dwarf death, consent flow, item/lamp disposition, score penalty, cave-closing suppression); dark-pit callers pending |
| Troll/Bridge/Chasm | Implemented |
| Bear | Implemented baseline (feeding, chain, following, troll interaction, bridge-collapse death); transcript parity pending |
| Dragon | Implemented baseline (confrontation, confirmation, room transformation, rug release, blood handling); transcript parity pending |
| Cave closing | Implemented baseline (warning clocks, exit restrictions, repository transition); endgame integration present |
| Scoring | Implemented baseline (treasure discovery/deposit, score recompute, pirate chest, death hook); terminal/endgame flow integrated |
| Endgame | Implemented baseline (repository, blast outcomes, dwarf disturbance, final score/rank); transcript parity pending |
| Information | Implemented baseline (startup, HELP menu, ABOUT, INFO, NEWS, credits, version); transcript parity pending |
| Transcript framework | Implemented manifest and dry-run validation; executable replay blocked pending runnable story artifact |

## Source integration status

- Generated artifacts are produced from `source/adventure.yaml` and assembled into the Inform 7 source tree.
- Manual changes are concentrated in runtime and subsystem modules; generated files remain structured as generated outputs.
- OpenAdventure.ni and runtime files are included in build composition.

## Testing status

- Compilation smoke path is working and repeatable.
- Build/test scripts are present and documented.
- Transcript/integration behavioral fixtures are present; executable replay is blocked pending runnable story output.

## Unresolved blockers and risks

- Completing full generated-edge dwarf/pirate movement parity.
- Coordinating system side effects and parser interactions for unresolved special rules.
- Hardening endgame transcript parity without regressing earlier travel/parser/scoring infrastructure.

## Next milestones

- Complete remaining gameplay systems in isolated modules with explicit state and parser/travel contracts.
- Introduce behavior-focused test coverage through transcripts and expected command outcomes.
- Tighten gameplay parity validation against reference C/Inform 7/Inform 6 sources.

## Recent doc updates

- `docs/architecture/project-roadmap.md` now captures the recommended implementation order, risks, and current progress summary.
