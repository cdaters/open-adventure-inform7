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
