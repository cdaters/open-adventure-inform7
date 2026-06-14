# Known Differences

Milestone 8A updates the known-difference inventory after repairing the
generated travel parser bridge and improving transcript replay.

## Bugs

| ID | Area | Difference | Impact | Status |
|---|---|---|---|---|
| `BUG-7A-001` | build artifact | Corrected in Milestone 7B: `.z8` is no longer populated with ASCII Inform 6 source. | No longer masks artifact failures. | Resolved |
| `BUG-7A-002` | Z8 target size | Default Z8 compile still overflows the version-8 readable-memory/story-size limits. Milestone 8A measured `exceeds version-8 limit (512K) by 7760 bytes`. | Blocks Z8 release; does not block Glulx-only development. | Open |
| `BUG-7D-001` | Glulx runtime | Corrected in Milestone 7E: recursive carried-by-player predicate caused `Stack overflow in callstub`. | Startup/transcript execution no longer crashes. | Resolved |
| `BUG-7E-001` | initial player placement | Corrected in Milestone 7E: player now starts in `LOC_START`. | Startup/travel smoke output is stable. | Resolved |
| `BUG-7F-001` | parser/travel | Generated one-word motion/location vocabulary was not routed to generated non-direct travel. | Previously blocked most travel transcripts at the road. | Reduced/resolved in 8A for generated one-word travel tokens. |
| `BUG-7F-002` | parser/magic travel | `xyzzy`/`plugh` generated magic rows were not command-accessible. | Previously blocked cave shortcut and Plover/Y2 routing. | Reduced/resolved in 8A for generated magic rows. |
| `BUG-7F-003` | scoring output | Score output still includes Inform standard score text and/or capture-overwritten custom text. | Blocks clean scoring transcript parity. | Open |
| `BUG-8A-001` | lamp/action parser | `on` remains unrecognized in transcript output, so lamp lighting does not work through the current command surface. | Release blocker: prevents stable cave solve, plover, troll, bear, dragon, and endgame transcript routes. | Open |

## Transcript Issues

| ID | Area | Difference | Impact | Status |
|---|---|---|---|---|
| `TFRAME-7F-001` | command comments | Open Adventure C ignores `#` lines in logs; the runner previously sent them to Inform. | Imported logs diverged before gameplay. | Resolved in 8A. |
| `TFRAME-7F-002` | startup/randomness adaptation | C logs include an initial instructions response and `seed N`. | Initial response and seed now have support; deterministic encounter parity is not yet proven. | Partially resolved |
| `TFRAME-7F-003` | terminal capture | Glulxe output contains status-line and character-echo artifacts. | Some fragment failures remain false negatives, especially HELP/version headings. | Partially reduced |
| `TFRAME-8A-001` | upstream replay | Full upstream command logs still time out under the Glulx runner. | Blocks full solve/treasure/endgame parity validation. | Open |
| `TEXP-7F-001` | focused routes | Some local fixtures are short smoke routes expecting deeper C-regression fragments. | Still causes unreachable expected fragments after parser fixes. | Open |
| `TEXP-8A-001` | stale fragments | Some fragments no longer match generated text, e.g. expected `You're in Y2.` while output is `You're at "Y2".` | Produces false failures in otherwise improved travel replay. | Open |

## Parity Issues

| ID | Area | Difference | Impact | Status |
|---|---|---|---|---|
| `PARITY-001` | dwarf/pirate | Dwarf and pirate movement use baseline pressure logic rather than full generated-edge C movement candidate enumeration. | Random encounter ordering can diverge from Open Adventure C. | Open |
| `PARITY-002` | darkness/lamp | Dark-pit hazard callers and full lamp depletion timing are not wired. | Death timing and dark-room behavior can diverge. | Open |
| `PARITY-003` | parser | Full classic parser command ordering and ambiguity behavior are not transcript-clean. | Object/verb permutations can diverge. | Open |
| `PARITY-004` | fixed-location objects | Some C dual-location/fixed-secondary-location behaviors are approximated. | Edge-case room descriptions or object reachability can diverge. | Open |
| `PARITY-005` | hints | Full Open Adventure hint scoring and eligibility are not implemented. | Hint-related C transcripts will diverge. | Future |
| `PARITY-006` | save/resume | Open Adventure C save/resume scoring and version-skew behavior is not modeled. | Save/resume C tests are not expected to pass. | Future |
| `PARITY-007` | terminal text | Endgame score/rank output is not transcript-diffed cleanly against C exact transcript. | Formatting differences may remain. | Open |
| `PARITY-008` | transcript execution | Current split transcript run launches all 15 cases but passes none. | Runtime parity remains unproven. | Open |
| `PARITY-010` | deterministic hazards | With `seed` support, dwarf encounters now appear in focused routes, but they interrupt scripted paths with death/reincarnation prompts. | Dwarf/reincarnation ordering needs parity review and fixture adjustment. | Open |

## Intentional Deviations

| ID | Area | Difference | Reason |
|---|---|---|---|
| `INTENT-001` | startup | Startup prints `Welcome to Adventure!` and a HELP prompt rather than Open Adventure C's yes/no instructions prompt. | Milestone 6B explicitly requested Nelson-style startup presentation. |
| `INTENT-002` | help | HELP is a unified menu rather than only the C plain HELP text. | Milestone 6B requested a polished menu. |
| `INTENT-003` | history | Nelson's long historical preface is summarized rather than copied in full. | Keeps player-facing text concise while preserving historical context. |
| `INTENT-004` | version | VERSION identifies this Inform 7 implementation and repository in addition to Open Adventure upstream. | Required for edition identity and accurate attribution. |

## Future Enhancements

| ID | Area | Enhancement |
|---|---|---|
| `FUTURE-001` | build | Reduce generated Z-machine memory enough to emit a `.z8`, or keep Z8 explicitly experimental. |
| `FUTURE-002` | transcript runner | Promote transcript execution into CI once cases have deterministic pass/fail behavior. |
| `FUTURE-003` | C corpus | Import more Open Adventure C `.log`/`.chk` cases with expected pass/fail categorization. |
| `FUTURE-004` | randomness | Validate Inform deterministic seed behavior against Open Adventure C's LCG-driven regression seeds. |
| `FUTURE-005` | intest | Add Inform `intest` recipes for parser-level and command-level checks. |
| `FUTURE-006` | normalization | Continue improving transcript filters for banner/version whitespace and Glulxe prompt differences. |

## Prioritized Next Work

Critical:

1. Fix `BUG-8A-001` so lamp `on`/`off` commands work through the player parser.
2. Stabilize dwarf/reincarnation prompt handling in focused transcript routes.
3. Replace stale/unreachable focused expected fragments with route-accurate
   fragments.
4. Make upstream replay terminate reliably under the transcript runner.

High:

1. Re-run subsystem transcripts after lamp/action parser fixes.
2. Classify remaining subsystem failures as implementation bugs, parity
   differences, or transcript expectation issues.
3. Decide whether default project commands should target Glulx for release
   readiness, leaving Z8 as experimental.

Medium:

1. Improve Glulxe capture enough to preserve HELP/version headings.
2. Recheck score output after capture and deposit-route issues are isolated.
