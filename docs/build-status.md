# Build Status - Verification Pass (Milestone 4E)

## Compile Attempt
- Command: `./build.sh --compile`
- Date: `2026-06-13`
- Result: **success**
- Output artifact: `OpenAdventure.inform/Build/OpenAdventure.z8`
- Verification rerun date: `2026-06-13`
  - Result: **success** after pirate subsystem baseline integration
- Output artifact: `OpenAdventure.inform/Build/OpenAdventure.z8`

## Prior Blocking Issues (Resolved)
1. Inform 7 parser errors from generated travel phrases using `openadventure ...` phrase naming and table row-context access.
2. Phrase dispatch helpers were rewritten to parser-safe internal names and explicit table field passing.
3. Build output directory `OpenAdventure.inform/Build` was missing, causing an Inform pipeline file-open failure during stage 15.
4. Troll handler parser/type issues in `OpenAdventure_Troll.ni` (`openadventure-runtime-check-result` assignment ambiguity and `thing has state` checks) were corrected in Milestone 4B verification.

## Current Build Configuration
- Source assembly: `build.sh` now composes:
  - generated room/object/travel/vocabulary files
  - runtime files:
    - `OpenAdventure_State.ni`
    - `OpenAdventure_Conditions.ni`
    - `OpenAdventure_Plover.ni`
    - `OpenAdventure_Troll.ni`
    - `OpenAdventure_Dwarves.ni`
    - `OpenAdventure_Pirate.ni`
    - `OpenAdventure_Runtime.ni`
- Output target: `OpenAdventure.inform/Build/OpenAdventure.z8`
- Project layout used for Inform compilation:
  - `OpenAdventure.inform/Source/OpenAdventure.generated.ni`
  - `OpenAdventure.inform/Materials/` (exists for Inform project scaffolding)
  - `OpenAdventure.inform/Build/` (created for artifacts)

## Missing Source Components
- No required source components are currently missing for baseline compilation.
- Gameplay systems still intentionally stubbed for later milestones (bear, dragon, cave-closing, scoring/endgame behaviors).
- Dwarf baseline behavior is implemented; full generated-edge movement parity remains a hardening task.
- Pirate baseline behavior is implemented; final-treasure scoring integration remains a hardening task.
- `frotz/dfrotz` and transcript-driven regression runner remain unavailable in the current environment.

## Recommended Next Actions
1. Keep compilation baseline stable and add regression checks in `test.sh`/`tests/smoke/` for successful generation + compilation.
2. Wire non-direct travel condition evaluation and special-handler behavior in later milestones.
3. Add transcript-driven test targets once gameplay behavior reaches a stable baseline.

## Latest Verification (Milestone 4E)
- Command results:
  - `./build.sh --compile` ✅
  - `./test.sh` ✅
  - all executable smoke tests in `tests/smoke/` ✅ (`01-build-artifacts.sh`, `03-troll-system.sh`, `04-dwarf-system.sh`, `05-pirate-system.sh`)
  - No generated-file integrity warnings after this pass.
