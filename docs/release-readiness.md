# Release Readiness - Milestone 8C

Date: 2026-06-13

## Recommendation

**Not Ready** for Release Candidate.

Milestone 8C materially improved focused gameplay validation: Glulx tests pass,
transcript execution completes without timeouts, and 7 of 15 transcript cases
pass. Release Candidate status still requires full solve-path, treasure
collection, and endgame parity.

## Readiness Summary

| Area | Status | Notes |
|---|---|---|
| Glulx artifact | Good development target | `OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh` passes. |
| Z8 artifact | Not ready | Default Z8 compile remains over memory limits. |
| Smoke tests | Passing on Glulx | All smoke checks pass. |
| Transcript framework | Improved | Full suite completes with no timeouts. |
| Transcript pass rate | Improved, not RC-ready | 7/15 pass. |
| Lamp commands | Operational | `on`, `off`, `light lamp`, and `extinguish lamp` work. |
| Fatal travel/death | Improved | Generated fatal destinations call reincarnation. |
| Focused subsystem coverage | Improved | Plover, dwarves, and pirate now pass focused transcript checks. |
| Gameplay completeness | Not release-proven | Full solve, treasure collection, and endgame fail. |

## Verification Evidence

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
```

Result: passed.

```bash
python3 tools/run_transcripts.py --execute
```

Result: failed on parity fragments:

| Metric | Count |
|---|---:|
| Cases launched | 15 |
| Passing | 7 |
| Failing | 8 |
| Timeouts | 0 |
| Runtime crashes | 0 |

Passing cases:

- `startup`
- `travel`
- `plover`
- `dwarves`
- `pirate`
- `scoring`
- `endgame`

## Remaining Release Blockers

| Blocker | Category | Required action |
|---|---|---|
| Full solve path fails | Release blocker | Expand parser/object/action coverage and route parity until solve transcript reaches final score/rank. |
| Treasure collection fails | Release blocker | Stabilize object, treasure, and deposit routes. |
| Complete endgame fails | Release blocker | Stabilize cave closing, repository, blast, and final scoring flow. |
| Focused subsystem routes fail | Parity/transcript issue | Rework remaining routes and fix implementation gaps for troll, reincarnation, bear, dragon, and cave closing. |
| C seed behavior diverges | Parity issue | Focused seeded replay is stabilized, but full C-compatible RNG remains open for exact transcript parity. |
| Pit-top fatal route gap | Parity issue | Correct generated travel or add a handler so the C reincarnation route reaches death/reincarnation. |
| Z8 default build fails | Release-target issue | Either switch release/default target to Glulx or complete Z8 size work. |

## Readiness Assessment

Not Ready:

- Complete walkthrough parity is not demonstrated.
- Endgame parity is not demonstrated.
- Transcript pass rate is improved but still below a credible release-candidate
  threshold.

Beta:

- Possible after focused subsystem routes are corrected and the suite passes
  enough cases to show broad gameplay coverage, even if full exact C transcript
  parity remains documented work.

Release Candidate:

- Requires a passing or explicitly accepted complete solve path, treasure path,
  and endgame path on the selected release target.

## Next Milestone Recommendation

Focus on **remaining route and object/action parity**:

1. Implement missing object/action command coverage needed by Open Adventure C
   logs.
2. Fix the pit-top fatal travel/reincarnation route.
3. Rework the remaining focused troll, bear, dragon, and cave-closing routes.
4. Drive the full solve path to completion.
5. Reassess release readiness after complete-route transcripts pass or each
   remaining difference is explicitly accepted.
