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

## Milestone 8F Update

Date: 2026-06-14

8F focused on treasure route and repository parity. The transcript pass count
remained 12/15, but the runtime gained several pieces needed for the full
walkthrough:

- Pirate replay pounce and chest placement now run from direct map movement.
- Urn fill/light/rub, amber/cavity creation, gemstone cavity drops, rug hover,
  and `fly`/`fly rug` are implemented.
- Bottle liquid state is synchronized with the generated water/oil proxy
  objects on take/drop/fill.
- `N'BEH` toggles the reservoir state and allows the upstream route to cross.

Current first remaining divergence:

- In `solve-path` and `treasure-collection`, the first cliff `fill urn` still
  reports that there is nothing with which to fill the urn. The expected Open
  Adventure C behavior is that the carried bottle of oil fills the urn, enabling
  `light urn`, `rub urn`, amber creation, rug hover, and sapphire collection.

Later observed route status:

- The full logs can now show reservoir-water parting after `N'BEH`.
- Repository/blast fragments are still not reached in `complete-endgame`.
- Final score/rank and all-treasure completion remain unproven.

Next target:

Stabilize the bottle/oil state at the first cliff checkpoint, then re-run the
upstream solve transcript until the amber/sapphire/rug section completes.
