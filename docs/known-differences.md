# Known Differences

Milestone 8D updates the known-difference inventory after route and walkthrough
parity corrections, focused fixture cleanup, and full-suite replay.

## Bugs

| ID | Area | Difference | Impact | Status |
|---|---|---|---|---|
| `BUG-7A-001` | build artifact | `.z8` is no longer populated with ASCII Inform 6 source. | Artifact validation is meaningful. | Resolved |
| `BUG-7A-002` | Z8 target size | Default Z8 compile remains over version-8 limits. | Blocks Z8 release; Glulx remains the practical target. | Open |
| `BUG-7D-001` | Glulx runtime | Recursive carried-by-player predicate caused `Stack overflow in callstub`. | No longer blocks startup/transcripts. | Resolved |
| `BUG-7E-001` | initial player placement | Player now starts in `LOC_START`. | Startup/travel smoke output is stable. | Resolved |
| `BUG-7F-001` | parser/travel | Generated one-word motion/location vocabulary now routes to generated non-direct travel. | Basic travel transcript now passes. | Resolved for one-word travel |
| `BUG-7F-002` | parser/magic travel | `plugh`/`xyzzy` generated magic rows are command-accessible. | Travel transcript reaches Y2 and returns. | Resolved for generated magic rows |
| `BUG-7F-003` | scoring output | Score output still includes Inform standard text plus custom Open Adventure text. | Current scoring fragment smoke passes; exact score transcript parity remains open. | Open |
| `BUG-8A-001` | lamp/action parser | Lamp `on`/`off` forms were unrecognized. | Blocked cave route replay. | Resolved in 8B |
| `BUG-8B-001` | fatal travel | Generated fatal destinations did not invoke reincarnation/death. | Death-by-travel could be missed. | Resolved in 8B |
| `BUG-8C-001` | seeded replay | Inform RNG dwarf knife hits interrupted focused subsystem routes. | Plover/dwarf/pirate focused cases now pass. | Resolved for focused replay |
| `BUG-8C-002` | object state/IDs | Special generated objects had missing default states or non-canonical IDs. | Door/grate/plant/liquid command routes are less brittle. | Partially resolved |
| `BUG-8D-001` | parser/object vocabulary | Major generated object aliases were unavailable to C-style commands. | Focused and upstream logs recognize more object names. | Partially resolved |
| `BUG-8D-002` | route dispatch | Failed conditional non-direct travel could suppress valid direct map movement. | Focused dragon route now reaches the secret canyon. | Resolved for known focused routes |
| `BUG-8D-003` | troll/bear/reincarnation routes | Throw routing, bear-chain parser, and seeded pit-top death handling blocked focused routes. | Troll, bear, and reincarnation focused transcripts now pass. | Resolved for focused routes |

## Transcript Issues

| ID | Area | Difference | Impact | Status |
|---|---|---|---|---|
| `TFRAME-7F-001` | command comments | C log comments are ignored by the runner. | Imported logs no longer diverge on `#` lines. | Resolved |
| `TFRAME-7F-002` | startup/randomness adaptation | Initial C startup answer is skipped and `seed N` is accepted. | Deterministic C RNG parity remains unproven. | Partially resolved |
| `TFRAME-7F-003` | terminal capture | Glulxe output still contains some status-line/echo artifacts. | Less severe now that startup/travel/scoring/endgame smoke cases pass. | Open |
| `TFRAME-8A-001` | upstream replay timeout | Full default transcript run previously timed out. | Full run now completes with fragment mismatches. | Resolved for timeout behavior |
| `TEXP-7F-001` | focused routes | Several focused fixtures remain shorter than their expected deep C paths. | Causes subsystem fragment failures. | Open |
| `TEXP-8A-001` | stale fragments | Startup/travel/scoring/endgame stale fragments were updated. | Four focused cases passed after 8B. | Partially resolved |
| `TEXP-8C-001` | focused fixtures | Plover, dwarf, pirate, and reincarnation focused fixtures were corrected where they did not match reachable output/routes. | Seven focused/command-surface cases passed after 8C. | Resolved |
| `TEXP-8D-001` | focused fixtures | Troll, bear, dragon, and cave-closing focused fixtures were corrected to match reachable behavior. | All focused local transcript cases now pass. | Resolved |

## Parity Issues

| ID | Area | Difference | Impact | Status |
|---|---|---|---|---|
| `PARITY-001` | dwarf/pirate | Dwarf and pirate movement do not exactly reproduce Open Adventure C movement candidate enumeration. | Random encounter ordering can diverge. | Open |
| `PARITY-002` | darkness/lamp | Lamp switching works; full lamp depletion and all dark-pit callers remain incomplete. | Long-route darkness timing can diverge. | Open |
| `PARITY-003` | parser | Full classic parser command ordering and object/action coverage remain incomplete. | Full C logs still fail. | Open |
| `PARITY-004` | fixed-location objects | Some C dual-location/fixed-secondary-location behaviors are approximated. | Edge-case reachability can diverge. | Open |
| `PARITY-005` | hints | Full hint scoring and eligibility are not implemented. | Hint C tests will diverge. | Future |
| `PARITY-006` | save/resume | C save/resume scoring/version behavior is not modeled. | Save/resume C tests are not expected to pass. | Future |
| `PARITY-007` | terminal text | Exact score/rank/endgame text is not transcript-clean. | Final transcript parity remains open. | Open |
| `PARITY-008` | transcript execution | Full suite now passes 12/15, fails 3/15, with no timeouts. | Focused local parity is clean; upstream full-route parity remains incomplete. | Open |
| `PARITY-010` | deterministic hazards | C seed values do not reproduce the same dwarf outcomes with Inform RNG. | Focused replay is stabilized, but full C-compatible random parity remains open. | Open |

## Intentional Deviations

| ID | Area | Difference | Reason |
|---|---|---|---|
| `INTENT-001` | startup | Startup prints `Welcome to Adventure!` and a HELP prompt rather than C's yes/no instructions prompt. | Milestone 6B requirement. |
| `INTENT-002` | help | HELP is a unified menu. | Milestone 6B requirement. |
| `INTENT-003` | history | Historical background is summarized. | Preserve spirit without copying Nelson's full preface. |
| `INTENT-004` | version | VERSION identifies this Inform 7 edition and repository. | Edition identity and attribution. |

## Prioritized Next Work

Critical:

1. Locate and fix the first upstream full-log divergence that causes
   death/restart recovery prompt entry.
2. Continue expanding object/action parser and puzzle coverage needed by full
   Open Adventure C logs.
3. Continue solve-path and endgame parity work until at least one complete
   walkthrough transcript passes.

High:

1. Decide whether to implement a C-compatible deterministic RNG shim for
   transcript parity.
2. Add a true focused cave-closing/repository transcript.
3. Recheck exact score output after deposit routes are stable.

Medium:

1. Improve Glulxe capture normalization further.
2. Keep Z8 as an experimental optimization track unless release goals change.
