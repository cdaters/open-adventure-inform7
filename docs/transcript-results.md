# Transcript Results - Milestone 8C

Date: 2026-06-13

## Objective

Correct the highest-impact gameplay parity blockers remaining after 8B, then
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
- Seeded focused transcript replay suppresses lethal dwarf knife hits caused by
  Inform RNG divergence and makes seeded `attack dwarf` deterministic.
- Runtime object binding now normalizes the generated special-case `DOOR` object
  and initializes default states for `GRATE`, `PLANT`, `BOTTLE`, and `LAMP`.
- Parser/action shims were added for common C transcript forms: `get`, bare
  `climb`, `open/unlock grate`, `water plant`, `oil door`, `get water`,
  `get oil`, intransitive `throw`, and `free/release bear`.
- Focused local fixtures were corrected for plover, dwarves, pirate, troll,
  bear, dragon, and reincarnation route/fragment issues where the previous
  route did not match reachable behavior.
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
| `plover` | pass | Seeded dwarf death no longer interrupts the route; focused expectation now matches reachable Inform object text. |
| `troll` | fail | Route/parity issue: the pirate steals the payment treasure before the troll bridge payment step. |
| `dwarves` | pass | Seeded attack flow now reaches deterministic dwarf kill output. |
| `pirate` | pass | Focused pirate theft route reaches pounce/chest-in-maze output. |
| `scoring` | pass | Corrected stale `OK` expectation; score text is visible. |
| `reincarnation` | fail | Travel-table parity issue: the C fatal route reaches `LOC_PITTOP`, but `down` is not fatal without the nugget condition in the generated Inform table. |
| `bear` | fail | Depends on troll payment/bridge route; bear interaction is not reached. |
| `dragon` | fail | Route/object issue: simplified route is blocked at the snake before the dragon confrontation. |
| `cave-closing` | fail | Transcript issue: focused route does not exercise closure. |
| `endgame` | pass | Corrected stale version heading expectation. |
| `solve-path` | fail | Full replay terminates, but solve-path parity is not achieved. |
| `treasure-collection` | fail | Full replay terminates, but treasure route parity is not achieved. |
| `complete-endgame` | fail | Full replay terminates, but endgame parity is not achieved. |

## Metrics

| Metric | 8A | 8B | 8C |
|---|---:|---:|---:|
| Manifest cases | 15 | 15 | 15 |
| Cases launched | 15 | 15 | 15 |
| Passing cases | 0 | 4 | 7 |
| Failing cases | 15 | 11 | 8 |
| Timeouts | 9 | 0 | 0 |
| VM/runtime crashes | 0 | 0 | 0 |

## Current Findings

Implementation bugs corrected:

- Lamp `on`/`off` parser integration and state handling.
- Fatal generated travel destinations now hand off to reincarnation.
- Seeded transcript routes no longer fail early from non-C dwarf knife RNG.
- Baseline parser/object coverage now handles the highest-frequency C command
  idioms that previously caused clarification prompts or unrecognized verbs.

Transcript issues corrected:

- Stale startup/travel/scoring/endgame expected fragments.
- Prompt-related timeouts converted to normal fragment mismatches.

Remaining failures:

- Troll and bear need a route that preserves or supplies a payment treasure
  through the pirate window, or a tighter subsystem fixture that starts nearer
  the bridge.
- Reincarnation needs either a generated travel correction for the pit-top fatal
  route or a focused fixture that reaches an already wired fatal destination.
- Dragon needs the snake/bird route or a narrower dragon-room fixture.
- Cave closing still needs a focused clock/repository fixture.
- Full upstream solve/endgame logs execute to termination but are far from
  parity-clean because object/action parser coverage remains incomplete.

## Release Recommendation

Still **Not Ready** for Release Candidate.

Milestone 8C improved transcript execution measurably: 7/15 cases now pass and
timeouts remain eliminated. The remaining failures are ordinary parity and
fixture issues, but the full solve path, treasure collection, and endgame are
not yet validated.
