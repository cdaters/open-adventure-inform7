# Transcript Discrepancy Inventory - Milestone 8C

Date: 2026-06-13

## Current Result

Command:

```bash
python3 tools/run_transcripts.py --execute
```

Result:

| Metric | Count |
|---|---:|
| Manifest cases | 15 |
| Passing cases | 7 |
| Failing cases | 8 |
| Timeouts | 0 |
| Runtime crashes | 0 |

## Resolved Discrepancies

| ID | Category | Resolution |
|---|---|---|
| `BUG-7F-001` | implementation bug | Generated one-word motion/location parser routing now reaches runtime travel. |
| `BUG-7F-002` | implementation bug | Generated magic words now route through travel and forced `FOOF` hops. |
| `BUG-8A-001` | implementation bug | Lamp `on`/`off` parser and state handling now work. |
| `BUG-8B-001` | implementation bug | Generated fatal travel destinations now invoke death/reincarnation. |
| `BUG-8C-001` | implementation bug | Seeded focused replay no longer lets Inform RNG kill routes with dwarf knife hits. |
| `BUG-8C-002` | implementation bug | Runtime now normalizes special generated object IDs/default states for door, grate, plant, bottle, and lamp. |
| `BUG-8C-003` | implementation bug | Added baseline parser/action coverage for common C command forms. |
| `TFRAME-7F-001` | transcript issue | C log comments are skipped. |
| `TFRAME-8A-001` | transcript issue | Full transcript execution no longer times out by default. |
| `TEXP-8A-001` | expectation issue | Startup, travel, scoring, and endgame smoke expectations were aligned. |
| `TEXP-8C-001` | expectation issue | Focused plover/pirate/reincarnation fragments were made robust to current Glulx output wrapping and reachable object text. |

## Current Per-Case Inventory

| Case | Result | Category | Current root cause | Severity |
|---|---|---|---|---|
| `startup` | pass | resolved expectation/capture issue | Expected fragments now match reachable startup/about/version output. | resolved |
| `travel` | pass | resolved implementation + expectation issue | Travel parser and magic-word routing work for this focused case; Y2 wording expectation was corrected. | resolved |
| `plover` | pass | resolved replay + expectation issue | Seeded dwarf death no longer interrupts; focused route reaches Plover and emerald. | resolved |
| `troll` | fail | route/parity issue | The route reaches the troll, but the pirate steals the carried payment treasure before `throw vase`; troll payment is not exercised. | high |
| `dwarves` | pass | resolved replay issue | Seeded focused route reaches visible dwarf attack and deterministic kill output. | resolved |
| `pirate` | pass | resolved route/expectation issue | Focused route reaches pirate pounce and chest-in-maze text. | resolved |
| `scoring` | pass | resolved expectation issue | Score smoke fragments now match visible score output. Exact score formatting remains a separate parity issue. | resolved |
| `reincarnation` | fail | travel-table parity issue | C-style fatal route reaches pit top, but generated Inform `down` only becomes fatal when carrying the nugget; the current route falls through to harmless commands. | high |
| `bear` | fail | route dependency issue | Bear route depends on the troll payment/bridge crossing that currently fails after pirate theft. | high |
| `dragon` | fail | route/object issue | Simplified route reaches Hall of the Mountain King and is blocked by the snake before dragon confrontation. | high |
| `cave-closing` | fail | transcript issue | Focused route does not exercise cave-closing clocks or repository transition. | high |
| `endgame` | pass | resolved expectation issue | Version command-surface expectation now matches reachable output. | resolved |
| `solve-path` | fail | release blocker | Full C solve log terminates but does not reach final score/rank. Object/action coverage and hazard parity remain incomplete. | critical |
| `treasure-collection` | fail | release blocker | Full C solve log terminates but does not reach treasure collection expectations. | critical |
| `complete-endgame` | fail | release blocker | Full C endgame log terminates but does not reach closure/repository/blast expectations. | critical |

## Required Fix Categories

Implementation bugs:

- Remaining object/action command coverage needed by C logs, including puzzle
  commands such as `open grate`, `water plant`, `oil door`, and `free bear`.
- Generated travel correction or handler coverage for the pit-top fatal descent
  used by reincarnation regressions.
- Exact score/deposit/final-rank behavior once complete routes reach those
  systems.

Parity issues:

- Full C-compatible dwarf/pirate deterministic behavior under Open Adventure C
  seeds remains open even though focused seeded replay is stabilized.
- Troll payment ordering when pirate theft can occur before the bridge.
- Bear, dragon, cave-closing, and endgame subsystem parity after routes
  are stable.

Transcript issues:

- Rework remaining focused subsystem command files so each case reaches the
  behavior it claims to verify.
- Split very long C logs into checkpointed transcripts if necessary for faster
  diagnosis.

Expectation issues:

- Keep expected fragments tied to reachable, authoritative output. Do not use
  deep C fragments in short smoke routes unless the route actually reaches them.

## Priorities

Critical:

1. Full solve path.
2. Treasure collection.
3. Complete endgame.

High:

1. Focused subsystem routes for plover, troll, dwarves, pirate, reincarnation,
   bear, dragon, and cave closing.
2. Object/action parser coverage.
3. C-compatible deterministic replay strategy or fixture-independent hazard
   validation.

Medium:

1. Exact score formatting.
2. Further Glulxe capture cleanup.
3. Z8 memory optimization.
