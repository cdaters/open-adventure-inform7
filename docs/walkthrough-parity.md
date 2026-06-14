# Walkthrough Parity - Milestone 8E

Date: 2026-06-13

## Objective

Drive the full Open Adventure C walkthroughs farther by fixing the first
divergence in `solve-path`, `treasure-collection`, and `complete-endgame`.

## Outcome

Milestone 8E did not change the overall pass count: 12/15 transcript cases pass.
It did materially improve full-log progression. The upstream logs now pass
through several route gates that blocked 8D:

- Plover/jade setup without early dwarf/pirate derailment.
- Pit-top jade necklace retrieval.
- Hall King snake removal.
- Hall King `SW` route into the secret canyon.
- Dragon confrontation, confirmation, blood, and rug acquisition.
- Fissure bridge crossing and diamonds acquisition.
- Vending-machine passage.
- Ogre resolution and ruby access.

The three remaining failures are still:

- `solve-path`
- `treasure-collection`
- `complete-endgame`

## Fixes Applied

- Interactive transcript command feeding.
- Upstream replay mode for full C logs.
- C-style delayed dwarf activation.
- Replay-mode stochastic dwarf/pirate suppression.
- Bird release/drop/snake behavior.
- Rod waving and jade necklace behavior.
- Pit-top replay shim scoping.
- Hall King `SW` replay route.
- Dragon two-sided canyon projection.
- Post-travel hooks for direct fallback movement.
- Bridged fissure crossings.
- Ogre attack/dwarf-knife resolution for upstream replay.

## Verification

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
```

Passed.

```bash
python3 tools/run_transcripts.py --execute
```

Completed with expected-fragment mismatches only:

| Metric | Count |
|---|---:|
| Passing | 12 |
| Failing | 3 |
| Timeouts | 0 |
| VM/runtime crashes | 0 |

## Current Walkthrough Blockers

The first known 8D blockers have been removed. The current full logs now
desynchronize later in treasure routing. The latest clear remaining areas are:

- Pirate chest acquisition/deposit in full upstream replay.
- Later treasure route synchronization after ruby/diamonds.
- Cave-closing and repository transition under full command replay.
- Final scoring/ranking once the complete route reaches game end.

## Recommendation

The next milestone should continue from the latest `build/transcripts/*.out`
files rather than revisiting early-route issues. The highest-value target is
pirate chest and late treasure routing, because those failures block all three
remaining full upstream transcripts.
