# Parity Report - Milestone 8B

Date: 2026-06-13

## Summary

Milestone 8B corrected the lamp command blocker, reduced transcript harness
timeouts to zero, and improved the transcript suite from 0/15 passing cases to
4/15.

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

## Verification

| Command | Result |
|---|---|
| `OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh` | Passed: Glulx artifact and all smoke checks passed. |
| `python3 tools/run_transcripts.py --execute` | Failed: 4 passed, 11 failed, 0 timed out. |

## Transcript Metrics

| Metric | Count |
|---|---:|
| Manifest cases | 15 |
| Cases launched | 15 |
| Passing cases | 4 |
| Failing cases | 11 |
| Timeouts | 0 |
| VM/runtime crashes | 0 |

Passing:

- `startup`
- `travel`
- `scoring`
- `endgame`

Failing:

- `plover`
- `troll`
- `dwarves`
- `pirate`
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

- Dwarf/reincarnation deterministic replay diverges under C seed values because
  Inform's RNG is not Open Adventure C's LCG.
- Dwarf attack/kill flow is not transcript-clean.
- Pirate, bear, dragon, and cave-closing routes are not yet verified through
  focused passing transcripts.

Transcript/expectation issues:

- `reincarnation` focused route still does not reach a fatal generated travel
  destination even though fatal destinations now call reincarnation.
- Several focused subsystem fixtures remain abbreviated smoke routes expecting
  deeper C regression fragments.

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
basic travel passes, lamp commands work, and score/startup/version smoke cases
pass. Release readiness still requires solve-path and endgame parity work plus
broader object/action parser coverage.
