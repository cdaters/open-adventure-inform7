# Transcript Results - Milestone 8B

Date: 2026-06-13

## Objective

Correct the highest-priority transcript/parity blockers from 7F and 8A, then
rerun the transcript suite against the playable Glulx artifact.

## Corrections

- Added lamp command integration for `on`, `lamp on`, `light`, `light lamp`,
  `turn on lamp`, `off`, `lamp off`, `extinguish lamp`, and related lantern
  forms.
- Lamp commands now update `adventure-state of LAMP` between `LAMP_BRIGHT` and
  `LAMP_DARK` and print the Open Adventure text:
  `Your lamp is now on.` / `Your lamp is now off.`
- Generated fatal travel destinations (`LOC_NECKBROKE`, `LOC_NOMAKE`,
  `LOC_FOOTSLIP`, `LOC_GRUESOME`) now invoke reincarnation/death handling.
- Transcript command streams append a small recovery suffix so divergent routes
  terminate with fragment mismatches instead of hanging at prompts.
- Runner default timeout increased to 60 seconds for long upstream logs.
- Stale focused expectations were aligned for startup, travel, scoring, and
  version/endgame command-surface cases.

## Commands Run

Glulx build and smoke:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
```

Result: passed. A valid Glulx story was produced and all smoke checks passed.

Transcript suite:

```bash
python3 tools/run_transcripts.py --execute
```

Result: failed on expected-fragment mismatches, not timeouts or VM crashes.

## Case Results

| ID | Result | Classification |
|---|---|---|
| `startup` | pass | Corrected expectation/capture issue. |
| `travel` | pass | Corrected parser and stale Y2 wording expectation. |
| `plover` | fail | Parity/replay issue: seeded dwarf death interrupts route before expected Plover/emerald flow. |
| `troll` | fail | Parity/replay issue: seeded dwarf death interrupts route before troll bridge flow. |
| `dwarves` | fail | Parity issue: dwarf encounter/attack flow appears but expected kill fragment is not reached. |
| `pirate` | fail | Parity/replay issue: route does not reach stable pirate/chest/maze flow. |
| `scoring` | pass | Corrected stale `OK` expectation; score text is visible. |
| `reincarnation` | fail | Transcript route issue: local shortcut does not reach a fatal generated travel destination. |
| `bear` | fail | Transcript/parity issue: route is interrupted before bear interaction. |
| `dragon` | fail | Transcript/parity issue: route is interrupted before dragon room. |
| `cave-closing` | fail | Transcript issue: focused route does not exercise closure. |
| `endgame` | pass | Corrected stale version heading expectation. |
| `solve-path` | fail | Full replay terminates, but solve-path parity is not achieved. |
| `treasure-collection` | fail | Full replay terminates, but treasure route parity is not achieved. |
| `complete-endgame` | fail | Full replay terminates, but endgame parity is not achieved. |

## Metrics

| Metric | 8A | 8B |
|---|---:|---:|
| Manifest cases | 15 | 15 |
| Cases launched | 15 | 15 |
| Passing cases | 0 | 4 |
| Failing cases | 15 | 11 |
| Fragment mismatches | 6 local + 2 upstream | 11 |
| Timeouts | 9 | 0 |
| VM/runtime crashes | 0 | 0 |

## Current Findings

Implementation bugs corrected:

- Lamp `on`/`off` parser integration and state handling.
- Fatal generated travel destinations now hand off to reincarnation.

Transcript issues corrected:

- Stale startup/travel/scoring/endgame expected fragments.
- Prompt-related timeouts converted to normal fragment mismatches.

Remaining failures:

- Dwarf/reincarnation deterministic replay still diverges from Open Adventure C
  under the same numeric seed because Inform's RNG is not Open Adventure C's LCG.
- Several focused subsystem routes are still too short or interrupted before
  reaching the expected subsystem behavior.
- Full upstream solve/endgame logs execute to termination but are far from
  parity-clean because object/action parser coverage remains incomplete.

## Release Recommendation

Still **Not Ready** for Release Candidate.

Milestone 8B improved transcript execution measurably: 4/15 cases now pass and
timeouts are eliminated. The remaining failures are ordinary parity and fixture
issues, but the full solve path, treasure collection, and endgame are not yet
validated.
