# Current State

## Milestone snapshot

This document reflects repository reality after Milestones 3E and 4A and the Milestone 3F documentation refresh.

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

### Ongoing / incomplete

- Unresolved travel rules with gameplay requirements remain stubbed.
- No full systems yet for dwarf, troll, pirate, dragon, bear, cave-closing, scoring, or endgame.
- Scoring hooks and end-state flow are not yet wired to complete game endings.

## Gameplay status by subsystem

| Subsystem | State |
|---|---|
| Plover | Implemented (runtime + handlers) |
| Travel dispatch | Implemented |
| Dwarf | Not implemented |
| Troll/Bridge/Chasm | Not implemented |
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
- Transcript/integration behavioral tests are not yet complete; only scaffolded for next milestone.

## Unresolved blockers and risks

- Correctly matching non-direct travel edge behavior for remaining systems.
- Coordinating system side effects and parser interactions for unresolved special rules.
- Introducing scoring and endgame without regressing earlier travel/parser infrastructure.

## Next milestones

- Complete remaining gameplay systems in isolated modules with explicit state and parser/travel contracts.
- Introduce behavior-focused test coverage through transcripts and expected command outcomes.
- Tighten gameplay parity validation against reference C/Inform 7/Inform 6 sources.

## Recent doc updates

- `docs/architecture/project-roadmap.md` now captures the recommended implementation order, risks, and current progress summary.
