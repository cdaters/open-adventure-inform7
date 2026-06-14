# Release Readiness - Milestone 8A

Date: 2026-06-13

## Recommendation

**Not Ready** for Release Candidate.

The project has a playable Glulx build and the parser no longer blocks basic
generated travel or magic-word routing. However, no transcript case currently
passes, default Z8 builds still fail, and several gameplay command surfaces
still block complete solve-path replay.

## Readiness Summary

| Area | Status | Notes |
|---|---|---|
| Glulx artifact | Ready for continued validation | `OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh` passes and emits a valid `.ulx`. |
| Z8 artifact | Not ready | `./build.sh --compile` fails by 7760 bytes over the version-8 limit. |
| Smoke tests | Passing on Glulx | All smoke checks pass under `Inform6/32`. |
| Transcript framework | Improved but not release-stable | Command sanitization and mode filtering work; long upstream replay still times out. |
| Transcript pass rate | Not ready | 0/15 cases pass in split local/upstream runs. |
| Generated travel parser | Improved | One-word generated travel and magic words route to runtime dispatch. |
| Gameplay completeness | Not release-proven | Lamp command, deterministic hazards, object/action routes, scoring/deposit, and endgame replay still need validation. |

## Work Completed in 8A

- Added canonical generated room-id resolution.
- Fixed runtime token-list matching for generated multi-token travel rows.
- Added parser bridge for generated one-word motion/location/magic commands.
- Fixed forced dispatch out of `LOC_FOOF*` rooms.
- Added transcript command sanitization for comments and initial C startup
  responses.
- Added an Inform `seed [number]` command for deterministic replay attempts.
- Improved Glulxe transcript normalization.
- Added transcript runner `--mode local` / `--mode upstream`.

## Verification Evidence

Default commands:

```bash
./build.sh --compile
./test.sh
```

Result: both fail because the default target is Z8 and still exceeds the
version-8 size limit. Inform 7 translation succeeds.

Playable target:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
```

Result: passed.

Transcript execution:

```bash
python3 tools/run_transcripts.py --execute --mode local --timeout 12
python3 tools/run_transcripts.py --execute --mode upstream --timeout 12
```

Result: 15 launched, 0 passed, 6 fragment mismatches, 9 timeouts.

## Remaining Release Blockers

| ID | Blocker | Required next action |
|---|---|---|
| `BUG-8A-001` | Lamp command parser/action integration is incomplete; `on` is unrecognized. | Implement lamp on/off command routing and re-run cave-route transcripts. |
| `PARITY-010` | Dwarf/reincarnation prompts interrupt focused routes after travel now reaches dwarf territory. | Validate seeded hazard ordering against Open Adventure C and adjust scripts or implementation. |
| `TEXP-8A-001` | Expected fragments are stale or unreachable in several focused fixtures. | Align local expected fragments with reachable, authoritative output. |
| `TFRAME-8A-001` | Upstream full replay still times out. | Improve prompt/end-of-game handling and run logs in smaller checkpointed segments if needed. |
| `BUG-7A-002` | Default Z8 build remains over memory limits. | Either switch default release target to Glulx or complete Z8 memory reduction. |

## Release Gate

The project should not enter Release Candidate until:

1. Glulx remains the selected release target or Z8 memory work is completed.
2. `./test.sh` passes in the intended release configuration.
3. Core local transcripts have a meaningful pass rate.
4. The complete solve path can be executed or all deviations are explicitly
   categorized.
5. Remaining release blockers are either fixed or documented as accepted
   limitations.

## Next Milestone Recommendation

Run a focused release-blocker milestone before another broad parity sweep:

1. Implement lamp on/off parser and action behavior.
2. Stabilize deterministic dwarf/reincarnation transcript behavior.
3. Align focused transcript expectations to authoritative reachable output.
4. Split upstream walkthrough logs into smaller replay checkpoints.
5. Re-evaluate Release Candidate readiness after transcript pass rate improves.
