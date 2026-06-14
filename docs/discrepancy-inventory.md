# Transcript Discrepancy Inventory - Milestone 8E

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
| `BUG-8E-001` | implementation bug | C-style delayed dwarf activation implemented. |
| `BUG-8E-002` | replay parity issue | Upstream replay suppresses random dwarf/pirate movement to keep C logs on route. |
| `BUG-8E-003` | transcript issue | Transcript execution now sends commands interactively. |
| `BUG-8E-004` | implementation bug | Bird release/drop and snake removal implemented. |
| `BUG-8E-005` | implementation bug | Rod waving and jade necklace retrieval implemented. |
| `BUG-8E-006` | replay parity issue | Upstream replay no longer uses the focused pit-top fatal descent shim. |
| `BUG-8E-007` | replay parity issue | Hall King `SW` reaches the C-log secret canyon route after snake removal. |
| `BUG-8E-008` | implementation bug | Dragon/rug two-sided canyon visibility implemented. |
| `BUG-8E-009` | implementation bug | Direct fallback travel now runs post-travel subsystem hooks. |
| `BUG-8E-010` | implementation bug | Bridged fissure crossings work from both banks. |
| `BUG-8E-011` | replay parity issue | Ogre/dwarf-knife resolution opens storeroom/ruby route during upstream replay. |

## Current Per-Case Inventory

| Case | Result | Category | Current root cause | Severity |
|---|---|---|---|---|
| `startup` | pass | resolved | Startup/about/version output is reachable and stable. | resolved |
| `travel` | pass | resolved | Motion and magic-word dispatch work for focused travel. | resolved |
| `plover` | pass | resolved | Plover passage and emerald behavior pass focused replay. | resolved |
| `troll` | pass | resolved | Payment treasure throw and bridge crossing pass focused replay. | resolved |
| `dwarves` | pass | resolved | Seeded first dwarf axe encounter passes focused replay. | resolved |
| `pirate` | pass | resolved focused | Focused pirate theft route passes, but full chest route remains open. | medium |
| `scoring` | pass | resolved focused | Focused score command output is visible. | resolved |
| `reincarnation` | pass | resolved | Seeded fatal pit descent reaches reincarnation. | resolved |
| `bear` | pass | resolved | Food, chain unlock, and bear following pass focused replay. | resolved |
| `dragon` | pass | resolved | Dragon confrontation route passes focused replay and upstream route advances. | resolved |
| `cave-closing` | pass | transcript scope issue | Local smoke route passes, but it does not prove full closure. | medium |
| `endgame` | pass | resolved smoke | Endgame command-surface smoke remains stable. | resolved |
| `solve-path` | fail | release blocker | Upstream C solve log progresses deeper but still does not reach final 430-point rank. | critical |
| `treasure-collection` | fail | release blocker | Upstream C solve log still misses all treasure fragments. | critical |
| `complete-endgame` | fail | release blocker | Upstream C endgame log still misses repository/blast fragments. | critical |

## Remaining Fix Categories

Implementation bugs or incomplete systems:

- Pirate chest route under full upstream replay.
- Late treasure acquisition/deposit synchronization after ruby/diamonds.
- Clam/oyster/pearl and other late object-specific behavior still need full-log
  proof.
- Full cave-closing clocks and repository transition under upstream routes.
- Final scoring/ranking once complete routes reach game end.

Parity issues:

- Upstream replay uses deterministic shims for C RNG-dependent events; exact C
  RNG parity remains unresolved.
- Full upstream command logs still desynchronize before final fragments.

Transcript issues:

- Glulxe capture still contains status-window and character-echo noise.
- Upstream logs may need checkpointed segmentation to isolate late divergences
  faster.

## Priorities

Critical:

1. Fix the next late full-log divergence after ogre/ruby.
2. Stabilize pirate chest behavior in full walkthrough replay.
3. Drive `solve-path` to final score/rank.
4. Drive `complete-endgame` to repository/blast/final fragments.

High:

1. Finish remaining treasure/object action coverage used by upstream logs.
2. Add a focused full cave-closing transcript.
3. Decide whether C-compatible RNG is required for release parity or whether
   replay shims plus documented differences are sufficient.

Medium:

1. Improve Glulxe capture normalization.
2. Recheck exact score formatting after full routes are stable.
3. Keep Z8 as an experimental optimization track unless release goals change.
