# Known Differences

Date: 2026-06-17

This file records known gaps after Milestone 8I. Earlier milestone sections in
other reports may describe failures that have since been resolved.

## Release-Blocking Differences

None currently known for the Glulx RC1 transcript suite.

The full transcript manifest passes 15/15 with `--timeout 180`, including the
upstream-backed solve path, treasure-collection path, and complete endgame path.

## Open Issues

| ID | Area | Difference | Impact | Status |
|---|---|---|---|---|
| `BUG-7A-002` | Z8 target size | The Z8 build exceeds practical readable-memory limits. | Blocks Z8 release only. | Open |
| `PARITY-001` | random hazards | Dwarf and pirate random movement are not proven byte-for-byte identical to Open Adventure C's random candidate enumeration. | Transcript replay is stable; unlisted random play may still diverge. | Open |
| `PARITY-002` | parser breadth | The transcript suite covers major routes but not every classic parser phrasing. | Manual play may find accepted C phrasings not yet supported. | Open |
| `PARITY-003` | hints | Full Open Adventure hint eligibility and hint scoring are not a release focus yet. | Hint-specific C tests may diverge. | Future |
| `PARITY-004` | save/resume | C save/resume metadata and scoring behavior are not modeled in detail. | Save/resume parity is future work. | Future |
| `PARITY-005` | terminal capture | Interpreter output can include prompt/status artifacts in raw transcript captures. | Normalized transcript verification passes. | Open |

## Intentional Deviations

| ID | Area | Difference | Reason |
|---|---|---|---|
| `INTENT-001` | startup | Startup prints `Welcome to Adventure!` and a HELP prompt rather than C's instruction yes/no prompt. | Milestone 6B information-system requirement. |
| `INTENT-002` | help | HELP is a unified menu. | Designed presentation for this Inform 7 edition. |
| `INTENT-003` | history | Historical background is summarized rather than copying Nelson's full preface. | Preserve spirit while keeping original prose separate. |
| `INTENT-004` | version | VERSION identifies this Inform 7 edition, repository, and release line. | Edition identity and attribution. |

## Resolved Issues

| ID | Area | Resolution |
|---|---|---|
| `BUG-7A-001` | artifact build | `.z8` is no longer populated with generated Inform 6 source. |
| `BUG-7D-001` | runtime crash | Recursive carried-by-player predicate stack overflow resolved. |
| `BUG-7F-001` | motion vocabulary | Generated one-word motion/location vocabulary routes correctly. |
| `BUG-7F-002` | magic words | `plugh`, `xyzzy`, and related magic travel integrate with parser/travel dispatch. |
| `BUG-8A-001` | lamp parser | Lamp `on`/`off` command forms recognized. |
| `BUG-8B-001` | fatal travel | Fatal travel destinations invoke death/reincarnation handling. |
| `BUG-8I-001` | cave-closing escape | Post-warning magic-word movement to outside targets is blocked, restoring final walkthrough parity. |
| `BUG-11D-001` | verbose repeated-location reporting | Verbose movement now continues printing repeated-description forest and maze locations. |

## Recommended Future Work

- Add broader parser phrase coverage from Open Adventure C tests.
- Add dedicated hint and save/resume parity tests.
- Continue measuring Z8 memory only if Z-machine release becomes a priority.
- Run external playtest sessions before 1.0.
