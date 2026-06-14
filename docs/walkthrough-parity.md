# Walkthrough Parity - Milestone 8D

Date: 2026-06-13

## Objective

Drive transcript execution toward complete walkthrough parity by correcting
shared route, parser, and fixture causes behind the remaining focused failures.

## Outcome

Milestone 8D improved transcript results from 7/15 to 12/15 passing cases. All
focused local transcript cases pass. The three remaining failures are the
upstream full-route transcripts:

- `solve-path`
- `treasure-collection`
- `complete-endgame`

## Fixes Applied

- Added generated object and treasure vocabulary aliases.
- Added bare `take`/`drop` single-candidate inference.
- Added bare `attack`/`kill` target inference and vending-machine attack
  toggling.
- Routed bare `throw`/`toss` through Open Adventure throw handling.
- Corrected troll payment handling for accepted treasure throws.
- Added exact bear-chain `unlock chain` / `lock chain` commands.
- Added seeded pit-top fatal descent for focused reincarnation replay.
- Suppressed dwarf travel blocking during seeded focused replay.
- Added direct-direction fallback after failed generated non-direct travel
  conditionals.
- Corrected focused troll, bear, dragon, and cave-closing routes/fragments.

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

## Remaining Walkthrough Blockers

The upstream logs still diverge before final objectives. Current transcript
output shows the full solve and treasure logs entering the death/restart
recovery prompt; later commands are then consumed by that prompt instead of game
state. This makes final score, all-treasure, and endgame fragments unreachable.

Likely remaining contributors:

- Incomplete full bird/snake puzzle behavior.
- Incomplete rod/fissure behavior.
- Incomplete clam/oyster/pearl behavior.
- Incomplete urn/rug/amber/rabbit-foot route behavior.
- Incomplete ogre and late-game object/action coverage.
- Cave-closing and repository transition not yet proven under full upstream
  command replay.
- C-compatible random hazard ordering remains unresolved.

## Recommendation

The next milestone should isolate the first upstream full-log divergence and
fix that root cause before adding more broad parser shims. The focused local
suite is now useful as a regression guard; progress should be measured by how
far `win430.log` and `endgame428.log` advance before divergence.
