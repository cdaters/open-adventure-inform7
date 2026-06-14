# Known Differences

Milestones 7D-7E categorize known differences and blockers found while
installing, executing, and debugging transcript verification.

## Bugs

| ID | Area | Difference | Impact | Evidence |
|---|---|---|---|---|
| `BUG-7A-001` | build artifact | Corrected in Milestone 7B: `OpenAdventure.z8` is no longer populated with ASCII Inform 6 source. `ni` output now goes to `OpenAdventure.i6`, and `.z8` is written only after `inform6` succeeds. | No longer masks artifact failures; transcript execution still blocked by BUG-7A-002. | `./build.sh --compile`; missing `.z8` after failed `inform6`; `docs/verification-artifact.md`. |
| `BUG-7A-002` | build target size | Compiling the current Inform 6 source to Z-machine v8 overflows the fixed readable-memory limit: `110160` bytes used, `65536` maximum. | Blocks direct Z-code production without source/runtime size reduction or target strategy change. | `/Applications/Inform.app/Contents/MacOS/inform6 ... -v8` reports readable-memory overflow. |
| `BUG-7D-001` | Glulx runtime | Corrected in Milestone 7E: the phrase `(item - thing) is carried by the player` recursively called itself during scoring startup, causing `Glulxe fatal error: Stack overflow in callstub.` | No longer blocks startup or transcript execution. | `OpenAdventure_Conditions.ni`; `docs/verification-runtime.md`; `python3 tools/run_transcripts.py --execute`. |
| `BUG-7E-001` | initial player placement | Corrected in Milestone 7E: no initial player room was declared, so Inform started the player in `LOC_NOWHERE`, the first generated room. | No longer blocks startup/travel smoke output; start location is now `LOC_START`. | `OpenAdventure_State.ni`; `glulxe OpenAdventure.inform/Build/OpenAdventure.ulx` startup output. |

## Parity Issues

| ID | Area | Difference | Impact | Status |
|---|---|---|---|---|
| `PARITY-001` | dwarf/pirate | Dwarf and pirate movement use baseline pressure logic rather than full generated-edge C movement candidate enumeration. | Random encounter ordering and route pressure can diverge from Open Adventure C. | Documented in dwarf/pirate docs. |
| `PARITY-002` | darkness/lamp | Dark-pit hazard callers and full lamp depletion timing are not wired. | Death timing and dark-room behavior can diverge. | Pending future subsystem. |
| `PARITY-003` | parser | Full classic parser command ordering and ambiguity behavior are not transcript-clean. | Some object/verb permutations can diverge. | Transcript framework now executes; focused cases still miss expected fragments. |
| `PARITY-004` | fixed-location objects | Some C dual-location/fixed-secondary-location behaviors are approximated in Inform objects. | Edge-case room descriptions or object reachability can diverge. | Noted in dragon, troll, cave-closing docs. |
| `PARITY-005` | hints | Open Adventure hint scoring and eligibility are not implemented as a full subsystem. | Hint-related transcripts from C corpus will diverge. | Future enhancement. |
| `PARITY-006` | save/resume | Open Adventure C save/resume scoring and version-skew behavior is not modeled. | Save/resume C tests are not expected to pass. | Future enhancement. |
| `PARITY-007` | terminal text | Endgame score/rank output is baseline-compatible but not transcript-diffed cleanly against the C exact transcript. | Formatting differences may remain. | Transcript execution now runs; expected fragments still fail. |
| `PARITY-008` | transcript execution | After the runtime crash fix, 12 focused transcript cases execute but fail fragment checks, and 3 upstream long-path transcripts time out. | Runtime parity remains unproven even though startup is no longer blocked. | `python3 tools/run_transcripts.py --execute`; `docs/transcript-results.md`. |

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
| `FUTURE-001` | build | Reduce the generated Z-machine readable-memory footprint enough to emit a real runnable `.z8`, or keep Z8 as an explicitly experimental target. |
| `FUTURE-002` | transcript runner | Promote `tools/run_transcripts.py --execute` into CI once focused transcript cases are stable enough for deterministic pass/fail results. |
| `FUTURE-003` | C corpus | Import the full Open Adventure C `.log`/`.chk` suite into the manifest with expected pass/fail categorization. |
| `FUTURE-004` | randomness | Add deterministic random-seed controls for Inform transcript parity. |
| `FUTURE-005` | intest | Add Inform `intest` recipes for parser-level and command-level checks. |
| `FUTURE-006` | normalization | Add transcript filters for banner/version whitespace and interpreter prompt differences. |
