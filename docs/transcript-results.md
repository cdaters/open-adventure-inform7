# Transcript Results - Milestone 8E

Date: 2026-06-13

## Objective

Identify and eliminate the first divergences in the full Open Adventure
walkthrough transcripts: `solve-path`, `treasure-collection`, and
`complete-endgame`.

## Corrections

- Added line-at-a-time interactive transcript execution for Glulxe.
- Added upstream replay mode and injected it for upstream manifest cases.
- Corrected dwarf activation timing to match Open Adventure C's delayed first
  encounter behavior.
- Suppressed random dwarf/pirate movement during upstream replay so C command
  logs are not invalidated by different RNG streams.
- Implemented bird release/drop behavior, including driving away the snake.
- Routed rod waving through Inform's built-in `waving` action and added jade
  necklace retrieval.
- Scoped the seeded pit-top death shim away from upstream replay.
- Added upstream replay handling for the Hall King `SW` route after the snake is
  gone.
- Projected the living dragon/rug into either dragon canyon side and ensured
  direct fallback movement runs post-travel hooks.
- Added bridged fissure crossing for west/east/cross/across/over movement.
- Added upstream ogre attack resolution so the storeroom and ruby route are
  reachable.

## Commands Run

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
```

Result: passed. A valid Glulx story was produced and all smoke checks passed.

```bash
python3 tools/run_transcripts.py --execute
```

Result: failed on expected-fragment mismatches only. No timeouts, VM crashes, or
runtime fatal errors occurred.

## Case Results

| ID | Result | Classification |
|---|---|---|
| `startup` | pass | Stable focused command-surface case. |
| `travel` | pass | Travel and magic-word routing remain operational. |
| `plover` | pass | Focused Plover route remains operational. |
| `troll` | pass | Focused payment/crossing route remains operational. |
| `dwarves` | pass | Seeded dwarf route updated for C-style first axe encounter. |
| `pirate` | pass | Focused pirate theft route remains operational. |
| `scoring` | pass | Focused score output remains operational. |
| `reincarnation` | pass | Seeded fatal pit descent still reaches reincarnation. |
| `bear` | pass | Focused food, chain, and following route remains operational. |
| `dragon` | pass | Focused dragon route remains operational. |
| `cave-closing` | pass | Focused smoke route passes; full closure remains unproven. |
| `endgame` | pass | Endgame command-surface smoke remains operational. |
| `solve-path` | fail | Upstream log progresses deeper but still misses final score/rank. |
| `treasure-collection` | fail | Upstream log still misses all-treasure fragments. |
| `complete-endgame` | fail | Upstream log still misses repository/blast fragments. |

## Metrics

| Metric | 8A | 8B | 8C | 8D | 8E |
|---|---:|---:|---:|---:|---:|
| Manifest cases | 15 | 15 | 15 | 15 | 15 |
| Cases launched | 15 | 15 | 15 | 15 | 15 |
| Passing cases | 0 | 4 | 7 | 12 | 12 |
| Failing cases | 15 | 11 | 8 | 3 | 3 |
| Timeouts | 9 | 0 | 0 | 0 | 0 |
| VM/runtime crashes | 0 | 0 | 0 | 0 | 0 |

## Current Findings

Implementation bugs corrected:

- The first deep-cave dwarf activation no longer immediately triggers random
  movement/combat.
- The upstream logs no longer derail at the Plover/jade setup, Hall King snake
  route, dragon canyon, fissure crossing, or ogre/ruby gate.
- Direct-direction fallback now participates in runtime subsystem hooks.

Remaining failures:

- The three upstream logs still diverge before final objectives.
- `solve-path` reaches later treasure-routing commands but still cannot complete
  the full final score/rank path.
- `complete-endgame` reaches the ogre/ruby section but still does not reach
  repository/blast fragments.
- Pirate chest handling and later treasure/endgame route synchronization are
  the next high-value investigation areas.

## Release Recommendation

Still **Not Ready** for Release Candidate.

Milestone 8E improved walkthrough depth but not the case pass count. The next
milestone should continue from the current full-log divergence, focusing on
pirate chest and late treasure/endgame route parity.

## Milestone 8F Results

Date: 2026-06-14

Commands run:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
```

Result: passed. Inform 7 translated successfully, Inform 6 produced a valid
Glulx story, and all smoke checks passed.

```bash
python3 tools/run_transcripts.py --execute
```

Result: failed on expected-fragment mismatches only.

| Metric | 8E | 8F |
|---|---:|---:|
| Manifest cases | 15 | 15 |
| Cases launched | 15 | 15 |
| Passing cases | 12 | 12 |
| Failing cases | 3 | 3 |
| Timeouts | 0 | 0 |
| VM/runtime crashes | 0 | 0 |

Passing cases:

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

Failing cases:

- `solve-path`: still misses final 430-point score/rank fragments.
- `treasure-collection`: still misses early and final all-treasure fragments.
- `complete-endgame`: still misses repository and blast fragments.

8F movement:

- The focused suite remains stable at 12 passing cases.
- The direct-hook `cave-closing` expectation was updated to match the now-active
  first dwarf encounter.
- `N'BEH` now parts the reservoir during full replay.
- Full replay still diverges at the first cliff urn sequence because the
  oil-filled bottle is not reliably present when the upstream log issues
  `fill urn`.
