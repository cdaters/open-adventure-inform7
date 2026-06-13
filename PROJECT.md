# Open Adventure Inform 7 Reconstruction

This repository is implementing Open Adventure in Inform 7 from a generated world model plus a hand-written runtime framework. The primary objective is compatibility with the original Open Adventure behavior while keeping generated content and gameplay systems clearly separated.

## Milestone progress (current)

| Milestone | Scope | Status | Result |
|---|---|---|---|
| 2A | Data source extraction | ✅ Complete | `source/adventure.yaml` stabilized and analyzed |
| 2B | Language and command analysis | ✅ Complete | Vocabulary and parser tokens mapped |
| 2C | Baseline architecture modeling | ✅ Complete | Core architecture docs and current-state baseline written |
| 2D | Unresolved travel investigation | ✅ Complete | seven unresolved travel rules identified and classified |
| 3A | Gameplay systems analysis | ✅ Complete | gameplay-system catalog and object/runtime classification |
| 3B | Runtime framework | ✅ Complete | state/condition/events foundations in runtime files |
| 3C | Travel dispatch integration | ✅ Complete | generated travel rows now flow through runtime dispatch |
| 3D | Plover system implementation | ✅ Complete | plover-specific travel handlers and integration implemented |
| 3E | Build/test infrastructure baseline | ✅ Complete | first compile works; smoke pipeline added |
| 3F | Documentation refresh | ✅ Complete | README/PROJECT/current-state refreshed; roadmap added |
| 4A | Plover-related gameplay implementation | ✅ Complete | plover travel handler and dispatch integration implemented |
| 4B | Troll / bridge / chasm implementation | ✅ Complete | travel rules `216` and `226` wired through special-ID 3 |
| 4C | Dwarf system | ✅ Complete | rule 138 nodwarves condition and dwarf subsystem integration |
| 4D | Dwarf system baseline | ✅ Complete | activation, first encounter, blocking, attacks, compile/test verification |
| 4E | Pirate system baseline | ✅ Complete | chest placement, treasure theft, dwarf/pirate ordering, compile/test verification |
| 4F | Treasure and scoring system | ✅ Complete | treasure tracking, deposit scoring, pirate chest scoring integration, compile/test verification |

## Current reality (after Milestone 4F)

### Completed

- Compilation pipeline can produce a working Inform 7 binary.
- Runtime travel dispatch supports generated travel rows, including random/forced/magic-word handling.
- Plover and troll/bridge/chasm subsystems are implemented and wired to the framework.
- Dwarf baseline behavior is implemented and verified by smoke tests.
- Pirate baseline behavior is implemented and verified by smoke tests.
- Treasure/scoring baseline is implemented and verified by smoke tests.
- Full generated-edge dwarf/pirate movement parity remains for upcoming hardening.

### In progress / Remaining

- Implement remaining gameplay systems without disturbing generated travel/world data.
- Replace explicit stubs for unresolved gameplay-only rules with deterministic rule handlers.
- Add robust behavioral regression via transcript testing (currently environment readiness and smoke checks only).

## Build status summary

Current build status is described in:
- `docs/build-status.md`

Current pipeline command is:
- `./build.sh --compile`

Current build artifact:
- `OpenAdventure.inform/Build/OpenAdventure.z8`

## Gameplay completion status

| Area | Status |
|---|---|
| Runtime/state scaffolding | Complete |
| Plover | Implemented |
| Troll / bridge / chasm | Implemented |
| Dwarves | Baseline implemented; full generated-edge movement parity pending |
| Pirate | Baseline implemented; final-treasure scoring integration implemented |
| Bear | Not implemented |
| Dragon | Not implemented |
| Cave closing | Not implemented |
| Scoring | Baseline implemented; full terminal/endgame scoring pending |
| Endgame | Not implemented |

## Current testing status

- Build smoke tests: available.
- Inform compilation: automated.
- Transcript/regression suite: still to be added.

See:
- `docs/testing-environment.md`
- `docs/build-and-test.md`

## Implementation approach

1. Keep `source/adventure.yaml` as data authority.
2. Continue classifying and stubbing unresolved rules until behavior is safe to implement.
3. Add systems as isolated runtime modules behind documented extension points.
4. Reconcile each system’s state and parser/travel dependencies before integration.
5. Run compile smoke test after each behavior milestone.

## Risk register

- Parser behavior divergence in generated command patterns.
- Incorrect sequencing between travel dispatch and unresolved action stubs.
- Incomplete understanding of game-state side effects for cave closing/endgame.

## Roadmap alignment

The active roadmap is now in
`docs/architecture/project-roadmap.md`.
