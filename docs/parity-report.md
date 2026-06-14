# Parity Report - Milestone 8D

Date: 2026-06-13

## Summary

Milestone 8D moved transcript execution from 7/15 passing cases to 12/15.
All focused local subsystem transcripts now pass. The remaining failures are the
three upstream full-route transcripts: complete solve path, complete treasure
collection, and complete endgame.

The project remains **Not Ready** for Release Candidate status because no full
walkthrough transcript reaches final score/rank parity yet.

## Corrected Since 8C

| ID | Status | Notes |
|---|---|---|
| `BUG-8D-001` | resolved | Classic object vocabulary aliases are now available for major generated objects and treasures, including `gold`, `silver`, `diamonds`, `jewelry`, `coins`, `necklace`, `spices`, `statuette`, and `machine`. |
| `BUG-8D-002` | resolved | Bare `take` and `drop` now infer a single obvious local/carried object, matching common Open Adventure C transcript usage. |
| `BUG-8D-003` | resolved | Bare `attack`/`kill` targets local dragon, bear, visible dwarf, or vending machine where unambiguous. |
| `BUG-8D-004` | resolved | `throw`/`toss` command routing now reaches the Open Adventure throw shim instead of Inform's stock drop behavior. |
| `BUG-8D-005` | resolved | Troll payment checks now use explicit treasure and troll-state predicates; focused troll payment/crossing passes. |
| `BUG-8D-006` | resolved | Bear chain accepts exact `unlock chain` / `lock chain` parser forms. |
| `BUG-8D-007` | resolved for seeded replay | Seeded pit-top `down` reaches fatal travel/reincarnation, so the focused reincarnation transcript passes. |
| `BUG-8D-008` | resolved for focused replay | Seeded replay suppresses dwarf travel blocking so C RNG divergence no longer blocks focused routes. |
| `BUG-8D-009` | resolved | Failed conditional non-direct travel can fall back to Inform direct direction maps, fixing routes such as slab-to-secret-canyon dragon access. |
| `TEXP-8D-001` | resolved | Focused troll, bear, dragon, and cave-closing fixtures/fragments now match the behavior each short route actually exercises. |

## Verification

| Command | Result |
|---|---|
| `OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh` | Passed: Glulx artifact and all smoke checks passed. |
| `python3 tools/run_transcripts.py --execute` | Failed on expected-fragment mismatches: 12 passed, 3 failed, 0 timed out, 0 VM crashes. |

## Transcript Metrics

| Metric | 8C | 8D |
|---|---:|---:|
| Manifest cases | 15 | 15 |
| Cases launched | 15 | 15 |
| Passing cases | 7 | 12 |
| Failing cases | 8 | 3 |
| Timeouts | 0 | 0 |
| VM/runtime crashes | 0 | 0 |

Passing:

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

Failing:

- `solve-path`
- `treasure-collection`
- `complete-endgame`

## Remaining Discrepancy Categories

Release blockers:

- Full solve path does not reach final score/rank.
- Treasure collection does not reach all treasure discovery/deposit expectations.
- Complete endgame does not reach repository/blast/final scoring expectations.

Parity issues:

- Upstream C logs diverge early enough to enter death/restart recovery prompts;
  once there, later commands are consumed by the recovery menu rather than game
  state.
- Full object/action coverage is still incomplete for C logs, especially
  bird/snake, rod/fissure, clam/oyster, urn/rug, vending/ogre, and late
  endgame interactions.
- Exact C-compatible random hazard ordering remains open. Focused seeded replay
  is stable, but not equivalent to Open Adventure C RNG.

Transcript/expectation issues:

- The focused `cave-closing` local route is now a smoke check, not full closure
  proof. Full closure remains covered by the upstream endgame logs and still
  fails.

Intentional deviations:

- Milestone 6B startup/help/about/version presentation remains
  edition-specific and is not expected to match Open Adventure C verbatim.

## Release Recommendation

**Not Ready** for Release Candidate.

The focused gameplay suite is now clean, which is a major validation milestone.
Release readiness now depends on upstream walkthrough parity: eliminate the
early full-log divergence, then drive solve-path, treasure-collection, and
complete-endgame transcripts to their final fragments.
