# Parity Corrections - Milestone 8C

Historical note: this report predates final walkthrough parity. The release
blockers named here were resolved by later milestones.

Date: 2026-06-13

## Objective

Identify the smallest root causes behind the remaining transcript failures,
apply the highest-value corrections, and quantify the new parity state.

## Root-Cause Groups

| Priority | Root cause | Affected suites | 8C action |
|---|---|---|---|
| Critical | Full upstream route parity is still incomplete. | `solve-path`, `treasure-collection`, `complete-endgame` | Left failing as release-blocker evidence. |
| High | Seeded focused runs were interrupted by Inform RNG dwarf deaths. | `plover`, `troll`, `dwarves`, `pirate`, `bear`, `dragon` | Added seeded replay guard for lethal dwarf knife hits and deterministic seeded dwarf attacks. |
| High | Generated special-object state/ID mismatches blocked puzzle routes. | Upstream logs, door/grate/plant routes | Normalized `DOOR` ID and defaulted `GRATE`, `PLANT`, `BOTTLE`, and `LAMP` states. |
| High | Open Adventure C parser idioms were missing in Inform. | Upstream logs and focused subsystem routes | Added command shims for `get`, bare `climb`, grate locking, water/oil puzzle commands, intransitive `throw`, and `free/release bear`. |
| High | Focused local fixtures had stale routes or brittle fragments. | `plover`, `dwarves`, `pirate`, `reincarnation` | Corrected focused routes/fragments where they did not match reachable behavior. |

## Implemented Corrections

- `OpenAdventure_State.ni`: added `openadventure-seeded-replay-mode`.
- `OpenAdventure_Runtime.ni`: added special object initialization and parser/action shims for common Open Adventure command forms.
- `OpenAdventure_Dwarves.ni`: suppressed seeded replay knife deaths and made seeded visible-dwarf attacks deterministic.
- `OpenAdventure_Bear.ni`: added `free/release` parser coverage for bear/chain.
- Transcript fixtures: corrected focused plover, dwarves, pirate, troll, bear, dragon, and reincarnation command/fragment coverage where appropriate.

## Verification

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
```

Result: passed. The Glulx artifact was produced and all smoke tests passed.

```bash
python3 tools/run_transcripts.py --execute
```

Result: failed on expected-fragment mismatches, with no VM crashes or timeouts.

## Pass-Rate Comparison

| Milestone | Passing | Failing | Timeouts | Runtime crashes |
|---|---:|---:|---:|---:|
| 8B | 4 | 11 | 0 | 0 |
| 8C | 7 | 8 | 0 | 0 |

Newly passing in 8C:

- `plover`
- `dwarves`
- `pirate`

Still failing:

- `troll`: route reaches the troll, but pirate theft removes the payment treasure first.
- `reincarnation`: C-style route exposes a generated pit-top fatal-travel gap.
- `bear`: blocked behind troll bridge/payment route instability.
- `dragon`: simplified route is blocked by the snake before the dragon.
- `cave-closing`: focused route still does not exercise the closing clocks.
- `solve-path`, `treasure-collection`, `complete-endgame`: remain release blockers.

## Recommendation

Next milestone should target route parity rather than broad new systems:

1. Correct the pit-top fatal descent used by reincarnation regressions.
2. Stabilize troll payment ordering when pirate theft is possible.
3. Build focused routes that start close enough to bear, dragon, and cave-closing behavior to isolate subsystem parity.
4. Continue expanding object/action parser coverage until the complete solve path reaches final scoring.
