# Release Readiness - Milestone 8D

Date: 2026-06-13

## Recommendation

**Not Ready** for Release Candidate.

Milestone 8D materially improved validation: Glulx tests pass, transcript
execution completes without timeouts, and 12 of 15 transcript cases pass. The
focused local gameplay suite is clean. Release Candidate status still requires
full solve-path, treasure-collection, and complete-endgame parity.

## Readiness Summary

| Area | Status | Notes |
|---|---|---|
| Glulx artifact | Good development target | `OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh` passes. |
| Z8 artifact | Not ready | Default Z8 compile remains over memory limits. |
| Smoke tests | Passing on Glulx | All smoke checks pass. |
| Transcript framework | Stable | Full suite completes with no timeouts or VM crashes. |
| Transcript pass rate | Improved, not RC-ready | 12/15 pass. |
| Focused subsystem coverage | Good local baseline | Startup, travel, plover, troll, dwarves, pirate, scoring, reincarnation, bear, dragon, cave-closing smoke, and endgame smoke pass. |
| Full walkthrough parity | Not proven | `solve-path`, `treasure-collection`, and `complete-endgame` still fail. |
| Gameplay completeness | Not release-proven | Complete solve/endgame transcripts do not reach final fragments. |

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
| Passing | 12 |
| Failing | 3 |
| Timeouts | 0 |
| Runtime crashes | 0 |

Passing cases:

- `startup`
- `travel`
- `plover`
- `troll`
- `dwarves`
- `pirate`
- `scoring`
- `reincarnation`
- `bear`
- `dragon`
- `cave-closing`
- `endgame`

Failing cases:

- `solve-path`
- `treasure-collection`
- `complete-endgame`

## Remaining Release Blockers

| Blocker | Category | Required action |
|---|---|---|
| Full solve path fails | Release blocker | Find first upstream divergence, then expand parser/object/action and route parity until the solve transcript reaches final score/rank. |
| Treasure collection fails | Release blocker | Stabilize all treasure acquisition/deposit routes and final all-treasures detection. |
| Complete endgame fails | Release blocker | Stabilize cave closing, repository transition, blast outcomes, and final scoring flow. |
| Full C logs enter recovery prompts | Release blocker | Fix the earlier gameplay divergence that causes death/restart prompt entry during upstream replay. |
| Full puzzle object coverage incomplete | Parity issue | Finish bird/snake, rod/fissure, clam/oyster, urn/rug, ogre, and late endgame object/action systems. |
| C seed behavior diverges | Parity issue | Decide whether release parity requires C-compatible RNG or documented deterministic route fixtures. |
| Z8 default build fails | Release-target issue | Keep Glulx as primary release target unless Z8 size work is completed. |

## Readiness Assessment

Not Ready:

- Complete walkthrough parity is not demonstrated.
- Endgame parity is not demonstrated.
- Full upstream transcripts still fail.

Beta:

- Plausible once at least one complete solve path passes and remaining
  differences are categorized.

Release Candidate:

- Requires passing or explicitly accepted complete solve, treasure, and endgame
  paths on Glulx.

## Next Milestone Recommendation

Focus on **upstream full-log divergence**:

1. Locate the first command in `win430.log` that causes a state divergence large
   enough to enter death/restart recovery.
2. Implement the missing puzzle/action coverage for that divergence.
3. Re-run full upstream logs after each correction.
4. Add a true focused cave-closing/repository transcript once closure clocks are
   reachable outside the huge upstream logs.
