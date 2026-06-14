# Transcript Discrepancy Inventory - Milestone 8B

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
| Passing cases | 4 |
| Failing cases | 11 |
| Timeouts | 0 |
| Runtime crashes | 0 |

## Resolved Discrepancies

| ID | Category | Resolution |
|---|---|---|
| `BUG-7F-001` | implementation bug | Generated one-word motion/location parser routing now reaches runtime travel. |
| `BUG-7F-002` | implementation bug | Generated magic words now route through travel and forced `FOOF` hops. |
| `BUG-8A-001` | implementation bug | Lamp `on`/`off` parser and state handling now work. |
| `BUG-8B-001` | implementation bug | Generated fatal travel destinations now invoke death/reincarnation. |
| `TFRAME-7F-001` | transcript issue | C log comments are skipped. |
| `TFRAME-8A-001` | transcript issue | Full transcript execution no longer times out by default. |
| `TEXP-8A-001` | expectation issue | Startup, travel, scoring, and endgame smoke expectations were aligned. |

## Current Per-Case Inventory

| Case | Result | Category | Current root cause | Severity |
|---|---|---|---|---|
| `startup` | pass | resolved expectation/capture issue | Expected fragments now match reachable startup/about/version output. | resolved |
| `travel` | pass | resolved implementation + expectation issue | Travel parser and magic-word routing work for this focused case; Y2 wording expectation was corrected. | resolved |
| `plover` | fail | parity/replay issue | Seeded dwarf death interrupts route before Plover/emerald expectations. C RNG parity is not reproduced. | high |
| `troll` | fail | parity/replay issue | Seeded dwarf death interrupts route before troll bridge behavior. | high |
| `dwarves` | fail | parity issue | Dwarf encounter/knife appears; expected dwarf kill path is not reached. | high |
| `pirate` | fail | parity/replay issue | Route does not reach stable pirate/chest/maze behavior. | high |
| `scoring` | pass | resolved expectation issue | Score smoke fragments now match visible score output. Exact score formatting remains a separate parity issue. | resolved |
| `reincarnation` | fail | transcript route issue | Local shortcut route reaches dirty passage, where `jump` is harmless; it does not reach generated fatal travel. | high |
| `bear` | fail | transcript/parity issue | Route is interrupted before bear interaction. | high |
| `dragon` | fail | transcript/parity issue | Route is interrupted before dragon confrontation. | high |
| `cave-closing` | fail | transcript issue | Focused route does not exercise cave-closing clocks or repository transition. | high |
| `endgame` | pass | resolved expectation issue | Version command-surface expectation now matches reachable output. | resolved |
| `solve-path` | fail | release blocker | Full C solve log terminates but does not reach final score/rank. Object/action coverage and hazard parity remain incomplete. | critical |
| `treasure-collection` | fail | release blocker | Full C solve log terminates but does not reach treasure collection expectations. | critical |
| `complete-endgame` | fail | release blocker | Full C endgame log terminates but does not reach closure/repository/blast expectations. | critical |

## Required Fix Categories

Implementation bugs:

- Remaining object/action command coverage needed by C logs, including puzzle
  commands such as `open grate`, `water plant`, `oil door`, and `free bear`.
- Exact score/deposit/final-rank behavior once complete routes reach those
  systems.

Parity issues:

- Dwarf/pirate deterministic behavior under Open Adventure C seeds.
- Dwarf kill and death/reincarnation ordering in focused routes.
- Bear, dragon, pirate, cave-closing, and endgame subsystem parity after routes
  are stable.

Transcript issues:

- Rework focused subsystem command files so each case reaches the behavior it
  claims to verify.
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
