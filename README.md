# Open Adventure in Inform 7

Inform 7 reconstruction of the original Colossal Cave Adventure (Open Adventure), built from generated world data (`source/adventure.yaml`) with a lightweight runtime architecture for parser, state, and travel dispatch.

## Current status (Milestone 4F refresh)

Current snapshot after work completed up through:
- Milestone 3E (first compilable Inform 7 build)
- Milestone 4A (Plover subsystem implementation)
- Milestone 4B (Troll/bridge/chasm travel subsystem)
- Milestone 3F (repository documentation refresh)
- Milestone 4C (Dwarf travel-gating integration)
- Milestone 4D (Dwarf baseline behavior and verification)
- Milestone 4E (Pirate baseline behavior and dwarf integration)
- Milestone 4F (Treasure tracking and scoring baseline)

## What is working today

- Inform 7 compilation is functional:
  - `./build.sh --compile` completes.
  - Build artifact: `OpenAdventure.inform/Build/OpenAdventure.z8`.
- Generated core world generation still drives rooms, objects, travel rows, vocabulary, and base gameplay constants.
- Runtime scaffolding is present:
  - `OpenAdventure_State.ni`
  - `OpenAdventure_Conditions.ni`
  - `OpenAdventure_Runtime.ni`
  - `OpenAdventure_Plover.ni`
  - `OpenAdventure_Dwarves.ni`
  - `OpenAdventure_Pirate.ni`
  - `OpenAdventure_Scoring.ni`
- Travel dispatch runtime exists with generated row integration:
  - direct travel dispatch
  - forced travel dispatch
  - random travel dispatch
  - magic-word dispatch
- Explicit unresolved gameplay rules remain as stubs where behavior is not yet safely generated.

## Remaining work (behavioral parity)

- Dwarf route restriction, activation, first encounter, blocking, and attacks (implemented baseline)
- Pirate chest placement, treasure theft, and dwarf/pirate ordering (implemented baseline)
- Treasure discovery/deposit scoring, pirate chest scoring integration, and score reporting hooks (implemented baseline)
- Full generated-edge dwarf/pirate movement parity (pending hardening)
- Bear system
- Dragon system
- Cave-closing system
- Endgame and full terminal scoring flow
- Final parser/UX alignment and transcript regression harness

## Milestone completion matrix

| Milestone | Status | Notes |
|---|---|---|
| 2A | ✅ | Data extraction and command scaffolding |
| 2B | ✅ | Vocabulary and command analysis |
| 2C | ✅ | World model normalization and baseline architecture docs |
| 2D | ✅ | Unresolved travel rules traced and categorized |
| 3A | ✅ | Gameplay systems identification and runtime boundaries |
| 3B | ✅ | Runtime framework foundation added |
| 3C | ✅ | Runtime travel dispatch wired to generated rules |
| 3D | ✅ | Unresolved travel dependencies documented and implemented for plover travel |
| 3E | ✅ | First real Inform 7 build succeeds |
| 3F | ✅ | Documentation refresh and roadmap added |
| 4A | ✅ | Plover runtime subsystem and notes |
| 4B | ✅ | Troll/bridge/chasm travel subsystem |
| 4C | ✅ | Dwarf subsystem travel restriction and runtime condition support |
| 4D | ✅ | Dwarf baseline behavior + compile/smoke verification |
| 4E | ✅ | Pirate baseline behavior + dwarf integration + compile/smoke verification |
| 4F | ✅ | Treasure/scoring baseline + pirate chest integration + compile/smoke verification |

## Build and validation entry points

- `./build.sh --generate-only` — regenerate source files from `source/adventure.yaml`.
- `./build.sh --compile` — assemble and compile an Inform 7 build.
- `./test.sh` — smoke-style build test entrypoint.

See:
- `docs/build-and-test.md`
- `docs/build-status.md`
- `docs/testing-environment.md`

## Key docs

- `PROJECT.md` — overall project plan and milestone tracking
- `docs/architecture/current-state.md` — canonical state overview
- `docs/architecture/project-roadmap.md` — recommended implementation path
- `docs/architecture/runtime-framework.md` — runtime architecture contract
- `docs/architecture/travel-dispatch.md` — travel dispatch and condition flow
- `docs/architecture/plover-system.md` — plover behavior and dependencies
- `docs/architecture/dwarf-system.md` — dwarf behavior and dependencies
- `docs/architecture/pirate-system.md` — pirate behavior and dependencies
- `docs/architecture/scoring-system.md` — treasure and scoring behavior

## References

- `references/open-adventure-c/` (authoritative behavior for porting)
- `references/conley-inform7/` (Inform 7 reference implementation)
- `references/nelson-inform6/` (Inform 6 reference implementation)

## Contributing notes

- `source/adventure.yaml` remains authoritative for world data.
- Generated files are regenerated artifacts and should not be hand-edited except when intentionally updating generator output contracts.
- Gameplay-specific systems should be implemented as dedicated runtime modules once behavior is fully traced.
