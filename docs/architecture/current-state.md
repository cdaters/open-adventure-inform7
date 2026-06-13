# Current State

## Milestone snapshot

This document reflects repository reality after Milestones 3E, 4A, 4B, 4C, 4D, and the Milestone 3F documentation refresh.

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

### Ongoing / incomplete

- Full generated-edge dwarf movement parity and pirate interaction remain beyond the Milestone 4D baseline.
- No full systems yet for pirate, dragon, bear, cave-closing, scoring, or endgame.
- Scoring hooks and end-state flow are not yet wired to complete game endings.

## Gameplay status by subsystem

| Subsystem | State |
|---|---|
| Plover | Implemented (runtime + handlers) |
| Travel dispatch | Implemented |
| Dwarf | Implemented baseline (route exclusion, activation, encounter, blocking, attacks); full generated-edge movement parity pending |
| Troll/Bridge/Chasm | Implemented |
| Bear | Not implemented |
| Pirate | Not implemented |
| Dragon | Not implemented |
| Cave closing | Not implemented |
| Scoring | Not implemented |
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

- Completing full generated-edge dwarf movement parity and pirate interaction.
- Coordinating system side effects and parser interactions for unresolved special rules.
- Introducing scoring and endgame without regressing earlier travel/parser infrastructure.

## Next milestones

- Complete remaining gameplay systems in isolated modules with explicit state and parser/travel contracts.
- Introduce behavior-focused test coverage through transcripts and expected command outcomes.
- Tighten gameplay parity validation against reference C/Inform 7/Inform 6 sources.

## Recent doc updates

- `docs/architecture/project-roadmap.md` now captures the recommended implementation order, risks, and current progress summary.
