# Release Readiness - Milestone 8E

Date: 2026-06-13

## Recommendation

**Not Ready** for Release Candidate.

Milestone 8E removed multiple early full-walkthrough blockers, but the release
bar is unchanged: complete solve-path, treasure-collection, and endgame
transcripts still fail.

## Readiness Summary

| Area | Status | Notes |
|---|---|---|
| Glulx artifact | Good development target | `OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh` passes. |
| Z8 artifact | Not ready | Default Z8 compile remains over memory limits. |
| Smoke tests | Passing on Glulx | All smoke checks pass. |
| Transcript framework | Stable | Full suite completes with no timeouts or VM crashes. |
| Transcript pass rate | Stable, not RC-ready | 12/15 pass. |
| Focused subsystem coverage | Good local baseline | All focused transcript cases pass. |
| Full walkthrough parity | Improved but incomplete | Full logs progress farther but still miss final fragments. |
| Gameplay completeness | Not release-proven | Complete solve/endgame transcripts do not reach final scoring/endgame output. |

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

Failing cases:

- `solve-path`
- `treasure-collection`
- `complete-endgame`

## Remaining Release Blockers

| Blocker | Category | Required action |
|---|---|---|
| Full solve path fails | Release blocker | Continue from the current late-route desynchronization until final score/rank is reached. |
| Treasure collection fails | Release blocker | Stabilize all remaining treasure acquisition/deposit routes, including pirate chest handling. |
| Complete endgame fails | Release blocker | Stabilize cave closing, repository transition, blast outcomes, and final scoring flow. |
| Full C logs still desynchronize | Release blocker | Fix remaining route/object/action gaps after ogre/ruby progression. |
| Z8 default build fails | Release-target issue | Keep Glulx as primary release target unless Z8 size work resumes. |

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

Continue **full walkthrough parity** from the latest 8E output:

1. Isolate the next full-log divergence after the ogre/ruby gate.
2. Fix pirate chest and remaining treasure-route synchronization.
3. Re-run full upstream logs after each correction.
4. Drive at least one complete solve transcript to final score/rank before
   reassessing Beta status.

## Milestone 8F Assessment

Date: 2026-06-14

Recommendation remains **Not Ready** for Release Candidate.

8F preserved the stable baseline but did not improve the transcript pass count:

| Area | Status |
|---|---|
| Glulx artifact | Passing compile/smoke target. |
| Smoke tests | Passing. |
| Transcript framework | Completes all cases with no timeouts or VM crashes. |
| Transcript pass rate | 12/15. |
| Full solve path | Failing. |
| Full treasure collection | Failing. |
| Complete endgame | Failing. |

New evidence:

- Pirate pounce/chest routing is integrated with direct movement during
  upstream replay.
- Urn/rug/reservoir mechanics are now implemented at runtime.
- `N'BEH` reservoir parting works in the full transcript output.
- The first remaining full-route blocker is still before complete treasure
  parity: the first cliff `fill urn` cannot reliably see the oil-filled bottle
  in the upstream replay state.

Release classification: **Not Ready**.

Beta Candidate would require at least one complete solve route reaching final
score/rank and a categorized list of any remaining route differences. Release
Candidate still requires passing or explicitly accepted complete solve,
treasure, and endgame paths on Glulx.
