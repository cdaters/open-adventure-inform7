# Transcript Discrepancy Inventory - Milestone 8D

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
| Passing cases | 12 |
| Failing cases | 3 |
| Timeouts | 0 |
| Runtime crashes | 0 |

## Resolved Discrepancies

| ID | Category | Resolution |
|---|---|---|
| `BUG-7F-001` | implementation bug | Generated one-word motion/location parser routing reaches runtime travel. |
| `BUG-7F-002` | implementation bug | Generated magic words route through travel and forced `FOOF` hops. |
| `BUG-8A-001` | implementation bug | Lamp `on`/`off` parser and state handling work. |
| `BUG-8B-001` | implementation bug | Generated fatal travel destinations invoke death/reincarnation. |
| `BUG-8C-001` | implementation bug | Seeded focused replay no longer lets Inform RNG kill routes with dwarf knife hits. |
| `BUG-8C-002` | implementation bug | Runtime normalizes special generated object IDs/default states for door, grate, plant, bottle, and lamp. |
| `BUG-8C-003` | implementation bug | Baseline parser/action coverage handles common C command forms. |
| `BUG-8D-001` | implementation bug | Major generated object and treasure vocabulary aliases are understood. |
| `BUG-8D-002` | implementation bug | Bare `take`/`drop` inference handles single-candidate cases. |
| `BUG-8D-003` | implementation bug | Bare `attack`/`kill` inference handles local combat/puzzle targets. |
| `BUG-8D-004` | implementation bug | `throw`/`toss` route to Open Adventure throw handling. |
| `BUG-8D-005` | implementation bug | Troll payment/crossing focused route passes. |
| `BUG-8D-006` | implementation bug | Bear chain no-tool parser forms pass. |
| `BUG-8D-007` | implementation bug | Seeded pit-top fatal descent reaches reincarnation. |
| `BUG-8D-008` | implementation bug | Direct-direction fallback allows valid map routes after failed non-direct conditionals. |
| `TFRAME-7F-001` | transcript issue | C log comments are skipped. |
| `TFRAME-8A-001` | transcript issue | Full transcript execution no longer times out by default. |
| `TEXP-8D-001` | expectation issue | Focused troll, bear, dragon, and cave-closing routes/fragments now match reachable behavior. |

## Current Per-Case Inventory

| Case | Result | Category | Current root cause | Severity |
|---|---|---|---|---|
| `startup` | pass | resolved | Startup/about/version output is reachable and stable. | resolved |
| `travel` | pass | resolved | Motion and magic-word dispatch work for focused travel. | resolved |
| `plover` | pass | resolved | Plover passage and emerald behavior pass focused replay. | resolved |
| `troll` | pass | resolved | Payment treasure throw and bridge crossing pass focused replay. | resolved |
| `dwarves` | pass | resolved | Seeded dwarf encounter and attack pass focused replay. | resolved |
| `pirate` | pass | resolved | Pirate pounce/theft route passes focused replay. | resolved |
| `scoring` | pass | resolved | Focused score command output is visible. | resolved |
| `reincarnation` | pass | resolved | Seeded fatal pit descent reaches reincarnation. | resolved |
| `bear` | pass | resolved | Food, chain unlock, and bear following pass focused replay. | resolved |
| `dragon` | pass | resolved | Slab/secret-canyon confrontation route passes focused replay. | resolved |
| `cave-closing` | pass | transcript scope issue | Local smoke route passes, but it does not prove full closure. | medium |
| `endgame` | pass | resolved smoke | Endgame command-surface smoke remains stable. | resolved |
| `solve-path` | fail | release blocker | Upstream C solve log diverges and does not reach final 430-point rank. | critical |
| `treasure-collection` | fail | release blocker | Upstream C solve log diverges and does not reach all treasure fragments. | critical |
| `complete-endgame` | fail | release blocker | Upstream C endgame log diverges and does not reach repository/blast fragments. | critical |

## Remaining Fix Categories

Implementation bugs or incomplete systems:

- Full bird/snake puzzle coverage.
- Full rod/fissure behavior.
- Full clam/oyster/pearl behavior.
- Full urn/rug/amber/rabbit-foot route behavior.
- Full vending/ogre behavior beyond the vending-machine attack toggle.
- Full cave-closing clocks and repository transition under upstream routes.
- Final scoring/ranking once complete routes reach game end.

Parity issues:

- C seed values do not reproduce exact Open Adventure C hazard order in Inform.
- Full upstream command logs currently diverge into death/restart recovery,
  causing later commands to be interpreted at the recovery prompt.
- Focused seeded replay is intentionally stabilized for local validation, but
  it is not full C RNG parity.

Transcript issues:

- The local `cave-closing` case should eventually be replaced or supplemented
  by a true focused closure-clock/repository transcript.
- Upstream logs may need checkpointed segmentation to isolate the first
  divergent command faster.

## Priorities

Critical:

1. Identify the first upstream full-log divergence that causes death/restart
   prompt entry.
2. Drive `solve-path` to final score/rank.
3. Drive `treasure-collection` to all treasure fragments.
4. Drive `complete-endgame` to repository/blast/final fragments.

High:

1. Implement missing puzzle object/action coverage used by upstream logs.
2. Add a focused full cave-closing transcript.
3. Decide whether C-compatible RNG is necessary for release parity or whether
   deterministic focused routes plus documented differences are sufficient.

Medium:

1. Improve Glulxe capture normalization.
2. Recheck exact score formatting after full routes are stable.
3. Keep Z8 as an experimental optimization track unless release goals change.
