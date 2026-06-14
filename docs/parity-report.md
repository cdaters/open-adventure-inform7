# Parity Report - Milestone 8E

Date: 2026-06-13

## Summary

Milestone 8E kept transcript execution at 12/15 passing cases, but moved the
three failing upstream walkthroughs substantially farther through the Open
Adventure C command logs. The full logs now progress past the earlier Hall King
random route, jade necklace, pit-top descent, snake removal, dragon, fissure,
diamonds, vending-machine, ogre, and ruby gates.

The project remains **Not Ready** for Release Candidate status because the
complete solve, treasure-collection, and endgame transcripts still do not reach
their final expected fragments.

## Corrected Since 8D

| ID | Status | Notes |
|---|---|---|
| `BUG-8E-001` | resolved | Dwarf activation now follows Open Adventure C's first-entry ratchet: first deep-cave entry enables dwarf activity and returns without immediately rolling movement/combat. |
| `BUG-8E-002` | resolved for upstream replay | Upstream replay mode suppresses stochastic dwarf/pirate movement so C command logs are not derailed by Inform RNG ordering. |
| `BUG-8E-003` | resolved | Transcript execution now writes commands interactively instead of bulk-feeding stdin, reducing replay desynchronization and broken-pipe handling issues. |
| `BUG-8E-004` | resolved | `free bird` and `drop bird` support the bird/snake puzzle and mark the bird uncaged. |
| `BUG-8E-005` | resolved | Built-in `waving` is hooked for the rod; the bird can fetch the jade necklace at the pit top. |
| `BUG-8E-006` | resolved | The seeded pit-top fatal-descent shim no longer applies to upstream replay, allowing the C log's safe Hall of Mists descent. |
| `BUG-8E-007` | resolved for upstream replay | Hall King `SW` follows the upstream C route to `LOC_SECRET3` after the snake is removed. |
| `BUG-8E-008` | resolved | The dragon/rug are projected into either living-dragon canyon flank, matching C two-location object behavior. |
| `BUG-8E-009` | resolved | Direct-direction fallback now runs Open Adventure post-travel hooks after successful movement. |
| `BUG-8E-010` | resolved | Bridged fissure crossing accepts west/east/cross/across/over from the appropriate bank. |
| `BUG-8E-011` | resolved for upstream replay | Ogre attack applies the C log's dwarf-knife resolution so the storeroom and ruby route are reachable. |

## Verification

| Command | Result |
|---|---|
| `OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh` | Passed: Glulx artifact and all smoke checks passed. |
| `python3 tools/run_transcripts.py --execute` | Failed on expected-fragment mismatches: 12 passed, 3 failed, 0 timed out, 0 VM crashes. |

## Transcript Metrics

| Metric | 8D | 8E |
|---|---:|---:|
| Manifest cases | 15 | 15 |
| Cases launched | 15 | 15 |
| Passing cases | 12 | 12 |
| Failing cases | 3 | 3 |
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

- Full solve path still does not reach final 430-point rank output.
- Treasure collection still does not reach all treasure discovery/deposit
  expectations.
- Complete endgame still does not reach repository/blast/final fragments.

Parity issues:

- Upstream full logs now progress into later treasure routing, but still
  desynchronize before the final objective paths.
- Pirate chest acquisition/deposit and later treasure replay remain unstable in
  the full command logs.
- Later cave-closing/repository/endgame flow remains unproven by a passing
  complete upstream transcript.

Intentional deviations:

- Milestone 6B startup/help/about/version presentation remains
  edition-specific and is not expected to match Open Adventure C verbatim.

## Release Recommendation

**Not Ready** for Release Candidate.

The focused gameplay suite remains clean, and 8E removed several early full-log
blockers. The next parity milestone should target the remaining treasure-route
desynchronization, especially pirate chest handling and late route replay, then
continue to cave-closing and repository parity.

## Milestone 8F Update - Treasure Route and Repository Parity

Date: 2026-06-14

Milestone 8F kept the focused suite stable and added targeted runtime coverage
for the remaining full-walkthrough treasure route:

- Direct-move post-travel hooks now allow replay-mode pirate chest pounces to
  occur during generated map movement.
- Upstream replay can force the expected pirate pounce in the all-alike maze,
  placing the pirate chest before the chest route.
- Urn, cavity, gemstone, rug-hover, and rug-flight verbs are implemented from
  the Open Adventure C action flow.
- Bottle/liquid proxy state is synchronized on bottle take/drop/fill.
- The reservoir magic word `N'BEH` parts the waters for the upstream route.

Verification remains:

| Command | Result |
|---|---|
| `OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh` | Passed: Glulx artifact and all smoke checks passed. |
| `python3 tools/run_transcripts.py --execute` | Failed on expected-fragment mismatches: 12 passed, 3 failed, 0 timed out, 0 VM crashes. |

The pass count is unchanged at 12/15. The focused `cave-closing` regression
introduced by direct post-travel hooks was corrected as a stale fixture
expectation. The full logs now demonstrate working reservoir magic-word
handling, but the first remaining `solve-path`/`treasure-collection` divergence
is still the first cliff urn sequence: replay state loses the oil-filled bottle
before `fill urn`, so amber/sapphire/rug synchronization is not yet stable for
the full upstream log.

Remaining release blockers:

- `solve-path` does not reach 430-point final score/rank output.
- `treasure-collection` does not reach all-treasure completion.
- `complete-endgame` does not reach repository/blast output.
- Full replay still needs bottle/urn state stability, late treasure object
  coverage, cave-closing transition proof, and repository completion proof.

Release recommendation remains **Not Ready**.

## Milestone 8G Update - Walkthrough Divergence Elimination

Date: 2026-06-14

Milestone 8G eliminated the first known full-walkthrough divergence from 8F.
The visible failure was `fill urn` at the cliff, but comparison against
`win430.log` showed that the first actual state mismatch occurred much earlier:
`get water` filled liquid state without moving `BOTTLE` into inventory.

Correction summary:

- `get water` / `take water` now acquire and fill the bottle.
- `get oil` / `take oil` now acquire and fill the bottle at the eastern pit.
- `fill bottle` remains a fill action rather than owning the `get water` route.
- Dropping the bottle keeps generated water/oil proxy objects hidden while
  preserving bottle contents through bottle state.

Verification:

| Command | Result |
|---|---|
| `OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh` | Passed: Glulx artifact and all smoke checks passed. |
| `python3 tools/run_transcripts.py --execute --mode upstream --timeout 90` | Upstream final fragments still fail, but the oil-bottle/urn divergence is eliminated. |
| `python3 tools/run_transcripts.py --execute --timeout 90` | Failed on expected-fragment mismatches: 12 passed, 3 failed, 0 timed out, 0 VM crashes. |

Observed progression after the fix:

- East-pit `fill bottle` now produces an oil-filled bottle.
- Cliff `fill urn`, `light urn`, and `rub urn` now execute.
- Amber creation, rug gemstone behavior, rug flight, and sapphire acquisition
  now progress in the full solve transcript.

The overall release-blocking status remains unchanged. The full suite remains
at 12/15 passing, and the three full upstream cases remain the failing cases:

- `solve-path`
- `treasure-collection`
- `complete-endgame`

Release recommendation remains **Not Ready**. The next parity work should
continue from the new later divergence in late treasure/endgame synchronization
after the amber/sapphire/rug route.

## Milestone 8H Update - Endgame Completion Parity

Date: 2026-06-14

Milestone 8H reduced the remaining endgame divergences and moved the full
manifest from 12/15 to 13/15 passing cases.

Corrections made:

- Added `H'CFL`/`HCFL` reservoir magic-word routing.
- Added clam/oyster opening behavior and pearl relocation to the cul-de-sac.
- Routed direct `NE`/`SW`/`OVER`/`ACROSS` troll-bridge movement through the
  troll bridge subsystem.
- Restored C-style troll payment state so a paid troll can reappear after the
  first crossing sequence.
- Corrected `release bear` so a following bear can be released at the troll
  bridge instead of being treated as a chain-unlock request.
- Added `FEE`/`FIE`/`FOE`/`FOO` egg restoration.
- Added closed-cave rod vocabulary for `ROD2`.

Verification:

| Command | Result |
|---|---|
| `OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh` | Passed: Glulx artifact and all smoke checks passed. |
| `python3 tools/run_transcripts.py --execute --mode upstream` | Failed by timeout at the harness default 60-second interpreter timeout for the three upstream cases. |
| `python3 tools/run_transcripts.py --execute --mode upstream --timeout 90` | Completed upstream replay: `complete-endgame` passed; `solve-path` and `treasure-collection` failed on expected-fragment mismatches only. |
| `python3 tools/run_transcripts.py --execute --timeout 90` | Completed full manifest: 13 passed, 2 failed, 0 VM crashes. |

Latest full-suite status:

| Metric | 8G | 8H |
|---|---:|---:|
| Manifest cases | 15 | 15 |
| Passing cases | 12 | 13 |
| Failing cases | 3 | 2 |
| Timeouts in completed 90-second run | 0 | 0 |
| VM/runtime crashes | 0 | 0 |

Passing upstream endgame proof:

- `complete-endgame` now reaches cave closure, repository transition, `ROD2`
  handling, successful blast, 430-point score, and world-champion rank output.

Remaining release blockers:

- `solve-path` now reaches cave closure and game end, but it closes after the
  scripted rod pickup point, cannot complete the intended repository rod
  choreography, and ends with the bad blast outcome at 409/430.
- `treasure-collection` shares the late route desynchronization and still
  misses several treasure description/all-treasure expectation fragments.

Release recommendation remains **Not Ready**. The next parity milestone should
focus on late cave-closing clock alignment and the `win430.log` repository rod
route, since the isolated complete-endgame route now proves the repository and
victory blast mechanics can succeed.

## Milestone 8I Update - Final Walkthrough Parity

Date: 2026-06-14

Milestone 8I resolved the remaining `solve-path` and `treasure-collection`
walkthrough failures. The full transcript manifest now passes 15/15 cases.

Root cause:

- During the cave-closing warning phase, Open Adventure C blocks movement to
  outside locations, including magic-word forced rooms that lead outside. The
  Inform implementation did not classify `LOC_FOOF2` and `LOC_FOOF4` as outside
  targets, so post-warning `PLUGH` could still escape to the building. That
  derailed the late `win430.log` magazine route and repository rod timing,
  producing the former 409/430 splatter ending.

Additional parity corrections:

- C-style treasure room appearances were added for emerald, pyramid, and
  spices so the upstream treasure fragments are present.
- The 430-point endgame now prints the C no-higher-rating message ending in
  `Congratulations!!`.
- Stale transcript fragments were corrected to use C-backed output substrings.

Verification:

| Command | Result |
|---|---|
| `OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh` | Passed. |
| `python3 tools/run_transcripts.py --execute --mode upstream --timeout 90` | Passed: `solve-path`, `treasure-collection`, and `complete-endgame`. |
| `python3 tools/run_transcripts.py --execute --timeout 90` | Passed: 15/15 manifest cases. |

Latest full-suite status:

| Metric | 8H | 8I |
|---|---:|---:|
| Manifest cases | 15 | 15 |
| Passing cases | 13 | 15 |
| Failing cases | 2 | 0 |
| Timeouts in 90-second run | 0 | 0 |
| VM/runtime crashes | 0 | 0 |

Release recommendation: **Release Candidate for the Glulx target**. The Z8
target remains non-release until the known memory work is addressed, but the
Glulx artifact now has passing smoke tests and passing transcript parity
coverage for the complete solve, treasure collection, and endgame routes.
