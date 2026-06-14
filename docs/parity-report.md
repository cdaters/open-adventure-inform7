# Parity Report - Milestone 8C

Date: 2026-06-13

## Summary

Milestone 8C corrected several gameplay-parity blockers in the focused
transcript suite and improved transcript results from 4/15 passing cases to
7/15. The full suite still completes without VM crashes or timeouts.

The project is still not ready for Release Candidate status. The Glulx build is
playable and smoke-tested, but full solve, treasure collection, and endgame
transcripts remain parity failures.

## Corrected Since 8A

| ID | Status | Notes |
|---|---|---|
| `BUG-8A-001` | resolved | Lamp `on`/`off`/`light`/`extinguish` parser forms now update `LAMP_BRIGHT`/`LAMP_DARK` and print Open Adventure lamp messages. |
| `TFRAME-8A-001` | reduced/resolved for timeout behavior | The default transcript run now completes without timeout. Remaining upstream failures are fragment mismatches. |
| `TEXP-8A-001` | partially resolved | Startup, travel, scoring, and endgame command-surface expectations were aligned to reachable output. |
| `BUG-8B-001` | resolved | Fatal generated travel destinations now invoke death/reincarnation handling. |
| `BUG-8C-001` | resolved baseline | Seeded transcript replay no longer lets non-C Inform RNG kill focused routes with dwarf knife hits. |
| `BUG-8C-002` | resolved baseline | Special object IDs/states for `DOOR`, `GRATE`, `PLANT`, `BOTTLE`, and `LAMP` are normalized at runtime. |
| `BUG-8C-003` | partially resolved | Parser/action coverage now includes `get`, bare `climb`, `open/unlock grate`, `water plant`, `oil door`, `get water`, `get oil`, intransitive `throw`, and `free/release bear`. |

## Verification

| Command | Result |
|---|---|
| `OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh` | Passed: Glulx artifact and all smoke checks passed. |
| `python3 tools/run_transcripts.py --execute` | Failed: 7 passed, 8 failed, 0 timed out. |

## Transcript Metrics

| Metric | Count |
|---|---:|
| Manifest cases | 15 |
| Cases launched | 15 |
| Passing cases | 7 |
| Failing cases | 8 |
| Timeouts | 0 |
| VM/runtime crashes | 0 |

Passing:

- `startup`
- `travel`
- `plover`
- `dwarves`
- `pirate`
- `scoring`
- `endgame`

Failing:

- `troll`
- `reincarnation`
- `bear`
- `dragon`
- `cave-closing`
- `solve-path`
- `treasure-collection`
- `complete-endgame`

Detailed case notes are in `docs/transcript-results.md`.

## Remaining Discrepancy Categories

Release blockers:

- Full solve path does not pass.
- Treasure collection does not pass.
- Complete endgame does not pass.
- Object/action parser coverage remains incomplete for full Open Adventure C
  command logs.

Parity issues:

- Troll payment/bear route remains unstable because the pirate can steal the
  focused route's payment treasure before the bridge.
- Reincarnation focused route exposes a generated travel gap at `LOC_PITTOP`:
  `down` does not reach a fatal destination unless the nugget condition is met.
- Bear, dragon, and cave-closing routes are not yet verified through focused
  passing transcripts.

Transcript/expectation issues:

- Focused troll/bear/dragon/cave-closing fixtures still need route work before
  they verify the intended subsystem behavior.
- Full upstream transcripts remain authoritative failure evidence and are not
  expectation-aligned until the implementation reaches those outcomes.

Intentional deviations:

- Milestone 6B startup/help/about/version presentation remains
  edition-specific and is not expected to match Open Adventure C verbatim.

Enhancements:

- Z8 remains an experimental target until the size-reduction roadmap is
  executed.
- A C-compatible deterministic RNG shim would improve transcript parity but is
  not required for ordinary gameplay.

## Release Recommendation

**Not Ready** for Release Candidate.

The project is now in a better validation state: the transcript suite finishes,
basic travel passes, lamp commands work, plover/dwarf/pirate focused cases pass,
and score/startup/version smoke cases pass. Release readiness still requires
solve-path and endgame parity work plus broader object/action parser coverage.
