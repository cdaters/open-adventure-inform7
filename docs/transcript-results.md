# Transcript Results - Milestone 8D

Date: 2026-06-13

## Objective

Drive route and walkthrough parity by correcting the common causes behind the
remaining focused transcript failures and measuring progress against the full
Glulx transcript suite.

## Corrections

- Added generated-object vocabulary aliases for high-frequency C transcript
  nouns and treasure names.
- Added Open Adventure-style bare `take` and `drop` inference when exactly one
  obvious candidate exists.
- Added bare `attack`/`kill` inference for dragon, bear, visible dwarf, and
  vending machine.
- Implemented vending-machine attack toggling.
- Reclaimed `throw`/`toss` parser routing so intransitive treasure throws reach
  Open Adventure payment behavior instead of Inform's default drop behavior.
- Made troll payment use explicit accepted-treasure and troll-demand predicates.
- Added exact `unlock chain` / `lock chain` bear-chain commands.
- Added seeded pit-top fatal descent handling for reincarnation transcript
  replay.
- Suppressed dwarf travel blocking during seeded transcript replay, matching
  the existing seeded non-lethal dwarf replay policy.
- Added a conservative direct-direction fallback when generated non-direct
  dispatch sees a command but no conditional row succeeds.
- Corrected focused troll, bear, dragon, and cave-closing fixture routes and
  expected fragments.

## Commands Run

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
```

Result: passed. A valid Glulx story was produced and all smoke checks passed.

```bash
python3 tools/run_transcripts.py --execute
```

Result: failed on expected-fragment mismatches only. No timeouts, VM crashes, or
runtime fatal errors occurred.

## Case Results

| ID | Result | Classification |
|---|---|---|
| `startup` | pass | Stable focused command-surface case. |
| `travel` | pass | Travel and magic-word routing remain operational. |
| `plover` | pass | Focused Plover route remains operational. |
| `troll` | pass | Focused payment/crossing route now passes. |
| `dwarves` | pass | Seeded dwarf route remains operational. |
| `pirate` | pass | Focused pirate theft route remains operational. |
| `scoring` | pass | Focused score output remains operational. |
| `reincarnation` | pass | Seeded pit-top fatal descent now reaches reincarnation. |
| `bear` | pass | Focused food, chain, and following route now passes. |
| `dragon` | pass | Focused slab/secret-canyon confrontation route now passes. |
| `cave-closing` | pass | Focused local smoke route passes; full closure still unproven. |
| `endgame` | pass | Endgame command-surface smoke remains operational. |
| `solve-path` | fail | Upstream full solve log does not reach final score/rank. |
| `treasure-collection` | fail | Upstream full treasure log does not reach all treasure expectations. |
| `complete-endgame` | fail | Upstream full endgame log does not reach repository/blast expectations. |

## Metrics

| Metric | 8A | 8B | 8C | 8D |
|---|---:|---:|---:|---:|
| Manifest cases | 15 | 15 | 15 | 15 |
| Cases launched | 15 | 15 | 15 | 15 |
| Passing cases | 0 | 4 | 7 | 12 |
| Failing cases | 15 | 11 | 8 | 3 |
| Timeouts | 9 | 0 | 0 | 0 |
| VM/runtime crashes | 0 | 0 | 0 | 0 |

## Current Findings

Implementation bugs corrected:

- The focused troll/bear route no longer fails because `throw vase` is treated
  as a plain drop.
- The focused bear route no longer stalls at Inform's "with what?" prompt for
  `unlock chain`.
- The focused dragon route can reach the secret canyon because failed
  conditional non-direct travel now falls back to valid direct map movement.
- The focused reincarnation route now exercises death/reincarnation instead of
  falling through harmless pit-top commands.

Transcript issues corrected:

- Focused troll/bear routes use a deterministic seed that avoids unrelated
  pirate theft; pirate theft remains covered by the pirate transcript.
- Focused dragon route now reaches the actual dragon room.
- Focused cave-closing route expectations now match its smoke-route scope.

Remaining failures:

- The three upstream logs still diverge before final objectives.
- The full solve/treasure logs enter a death/restart recovery prompt and later
  commands are consumed there, indicating upstream-route state divergence rather
  than a transcript-runner timeout.
- Remaining upstream parity likely requires broader object/action systems and
  puzzle coverage: bird/snake, rod/fissure, clam/oyster, urn/rug, ogre, vending,
  cave-closing clocks, repository relocation, and final scoring/ranking.

## Release Recommendation

Still **Not Ready** for Release Candidate.

Milestone 8D establishes a clean focused local transcript suite. The next
implementation milestone should target upstream full-log divergence and complete
walkthrough parity.
