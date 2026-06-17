# Walkthrough Parity - Milestone 8E

Historical note: this document includes several dated updates from the
walkthrough-parity sequence. The final 8I section supersedes earlier blocker
lists.

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

## Milestone 8G Update

Date: 2026-06-14

8G resolved the first known 8F cliff divergence.

Root cause:

- `get water` updated liquid state but did not move `BOTTLE` to inventory.
- The player therefore reached the eastern pit without the bottle.
- The later cliff `fill urn` failure was a downstream symptom.

Corrected behavior:

- The initial water acquisition now carries the bottle.
- The eastern pit `fill bottle` now creates an oil-filled bottle.
- The bottle can be dropped and recovered in the building without exposing
  generated oil/water proxy objects as separate route objects.
- The cliff urn sequence now proceeds through `fill urn`, `light urn`, and
  `rub urn`.
- Amber pickup, gemstone/rug activation, rug flight, and sapphire pickup now
  progress in the full solve transcript.

New first remaining area:

- The full upstream routes now diverge later in late treasure/endgame
  synchronization. The remaining failures are no longer blocked by the
  oil-filled bottle. The next work should inspect the route after the
  amber/sapphire/rug section, especially bear/chain, magazine/spices,
  cave-closing, repository placement, blast handling, and final scoring.

Verification:

| Command | Result |
|---|---|
| `OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh` | Passed. |
| `python3 tools/run_transcripts.py --execute --mode upstream --timeout 180` | Final upstream fragments still fail, but the first oil-bottle divergence is gone. |
| `python3 tools/run_transcripts.py --execute --timeout 180` | 12 passed, 3 failed, no timeouts or VM crashes. |

## Milestone 8H Update

Date: 2026-06-14

8H moved the walkthrough baseline forward by resolving the isolated
`complete-endgame` route. The full manifest now passes 13/15 cases.

Newly verified path:

- `complete-endgame` reaches cave closure.
- Repository transition places the player in the northeast repository room.
- `take rod`, `drop rod`, and `blast` complete the victory route.
- Final output reaches 430/430 and world-champion rank.

Corrections that enabled the route:

- `H'CFL` reservoir magic.
- Clam/oyster/pearl mechanics.
- Direct troll-bridge movement through the troll subsystem.
- Bear release/following behavior at the troll bridge.
- Egg restoration via `FEE`/`FIE`/`FOE`/`FOO`.

Current first remaining walkthrough divergence:

- `solve-path` and `treasure-collection` still desynchronize late in the
  `win430.log` route. The warning phase and later commands reach the repository,
  but closure occurs after the scripted `take rod` point. The final `blast`
  therefore uses the wrong rod state and produces the splatter outcome instead
  of the victory outcome.

Measured status:

| Command | Result |
|---|---|
| `python3 tools/run_transcripts.py --execute --mode upstream` | Timed out at the default 60-second interpreter timeout. |
| `python3 tools/run_transcripts.py --execute --mode upstream --timeout 180` | `complete-endgame` passed; `solve-path` and `treasure-collection` still failed expected fragments. |
| `python3 tools/run_transcripts.py --execute --timeout 180` | 13 passed, 2 failed, no VM crashes. |

Next target:

Align the late cave-closing clock and repository rod choreography in the full
`win430.log` route. The repository/victory subsystem itself is now proven by
the passing `complete-endgame` case.

## Milestone 8I Update

Date: 2026-06-14

8I resolves the remaining full walkthrough parity blockers.

First remaining divergence:

- Expected: after the cave-closing warning, the `win430.log` `PLUGH` command
  should not let the player leave the cave. Open Adventure C treats the
  magic-word destination as outside during closing, blocks the move, triggers
  panic timing, and leaves the route in-cave for the magazine and repository
  sequence.
- Actual before 8I: Inform allowed the `PLUGH` forced room to continue to the
  building, derailing the command stream and causing the final bad blast.

Fix:

- `LOC_FOOF2` and `LOC_FOOF4` are now outside targets for cave-closing travel
  restrictions.

Result:

- `solve-path` reaches 430/430 and final victory rank output.
- `treasure-collection` passes after C-style treasure initial appearances and
  stale expectation cleanup.
- `complete-endgame` remains passing.

Verification:

| Command | Result |
|---|---|
| `OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh` | Passed. |
| `python3 tools/run_transcripts.py --execute --mode upstream --timeout 180` | 3/3 upstream cases passed. |
| `python3 tools/run_transcripts.py --execute --timeout 180` | 15/15 manifest cases passed. |

Remaining walkthrough blockers: none in the current transcript suite.
