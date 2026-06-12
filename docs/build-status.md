# Build Status - Milestone 3E

## Compile Attempt
- Command: `./build.sh --compile`
- Date: `2026-06-12`
- Result: **success**
- Output artifact: `OpenAdventure.inform/Build/OpenAdventure.z8`

## Prior Blocking Issues (Resolved)
1. Inform 7 parser errors from generated travel phrases using `openadventure ...` phrase naming and table row-context access.
2. Phrase dispatch helpers were rewritten to parser-safe internal names and explicit table field passing.
3. Build output directory `OpenAdventure.inform/Build` was missing, causing an Inform pipeline file-open failure during stage 15.

## Current Build Configuration
- Source assembly: `build.sh` now composes:
  - generated room/object/travel/vocabulary files
  - runtime files:
    - `OpenAdventure_State.ni`
    - `OpenAdventure_Conditions.ni`
    - `OpenAdventure_Plover.ni`
    - `OpenAdventure_Runtime.ni`
- Output target: `OpenAdventure.inform/Build/OpenAdventure.z8`
- Project layout used for Inform compilation:
  - `OpenAdventure.inform/Source/OpenAdventure.generated.ni`
  - `OpenAdventure.inform/Materials/` (exists for Inform project scaffolding)
  - `OpenAdventure.inform/Build/` (created for artifacts)

## Missing Source Components
- No required source components are currently missing for baseline compilation.
- Gameplay systems still intentionally stubbed for later milestones (dwarf, troll, cave-closing, scoring/endgame behaviors).

## Recommended Next Actions
1. Keep compilation baseline stable and add regression checks in `test.sh`/`tests/smoke/` for successful generation + compilation.
2. Wire non-direct travel condition evaluation and special-handler behavior in later milestones.
3. Add transcript-driven test targets once gameplay behavior reaches a stable baseline.
