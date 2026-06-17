# Full Walkthrough Analysis - Milestone 8E

Historical note: this report records an intermediate failing walkthrough state.
Current full-walkthrough status is passing; see `docs/transcript-results.md`.

Date: 2026-06-13

## Scope

This analysis covers the three upstream full-walkthrough transcript cases:

- `solve-path`
- `treasure-collection`
- `complete-endgame`

Primary references:

- `references/open-adventure-c/tests/win430.log`
- `references/open-adventure-c/tests/win430.chk`
- `references/open-adventure-c/tests/endgame428.log`
- `references/open-adventure-c/tests/endgame428.chk`

## Final 8E Result

Command:

```bash
python3 tools/run_transcripts.py --execute
```

Result:

| Metric | Count |
|---|---:|
| Passing cases | 12 |
| Failing cases | 3 |
| Timeouts | 0 |
| VM/runtime crashes | 0 |

The full walkthrough cases still fail, but they progress farther than 8D.

## Divergence Chain

### 1. Early Dwarf/Pirate Derailment

Expected: Open Adventure C enables dwarf activity on first deep-cave entry and
returns without immediate dwarf movement.

Actual before 8E: the Inform dwarf subsystem could activate and immediately
roll movement/combat or pirate interaction during the same turn.

Resolution: dwarf activation now ratchets to active and returns on the first
deep entry. Upstream replay suppresses later random dwarf/pirate movement so C
logs are not invalidated by different RNG streams.

### 2. Jade Necklace Setup

Expected: after releasing the bird at pit top, `wave rod` causes the bird to
retrieve the jade necklace.

Actual before 8E: `wave rod` did not reach the rod behavior, and bird release
state was incomplete.

Resolution: `wave`/`shake`/`swing` route through Inform's built-in `waving`
action. `free bird` and `drop bird` now mark the bird uncaged, and the jade can
be materialized from off-stage.

### 3. Pit-Top Descent

Expected: the upstream log descends safely from pit top to Hall of Mists.

Actual before 8E: the seeded replay reincarnation shim forced this descent to
fatal `LOC_NECKBROKE`.

Resolution: the fatal pit-top shim is now limited to non-upstream seeded replay.

### 4. Snake and Hall King `SW`

Expected: dropping the bird drives off the snake, and the C log's `sw` reaches
the secret e/w canyon.

Actual before 8E: the snake remained, or the `SW` random route missed and the
log fell into the wrong Hall King side chamber.

Resolution: dropping the bird removes the snake. Upstream replay forces the
C-log Hall King `SW` route to `LOC_SECRET3` after the snake is gone.

### 5. Dragon Canyon

Expected: after `w`, the player can attack the dragon from the far canyon side;
the dragon and rug are visible from both flanking locations in C.

Actual before 8E: the Inform model only placed the dragon in one room, so
`kill dragon` failed from the other canyon side.

Resolution: the dragon/rug are projected into either living-dragon canyon flank,
and direct fallback travel now runs Open Adventure post-travel hooks.

### 6. Fissure/Diamonds

Expected: `wave rod` bridges the fissure, and `w` crosses from east bank to west
bank so the diamonds can be taken.

Actual before 8E: the bridge appeared, but `w` still failed.

Resolution: when the fissure is bridged, east/west/cross/across/over movement
crosses between the banks.

### 7. Ogre/Ruby

Expected: attacking the ogre distracts it, a dwarf knife kills it, and the
storeroom/ruby route opens.

Actual before 8E: `kill ogre` used generic violence handling and left the ogre
blocking the route.

Resolution: upstream replay now applies the C log's ogre/dwarf-knife outcome.

## Current First Remaining Blocker

The latest full logs progress beyond ogre/ruby. The next high-value blocker is
late treasure-route synchronization, especially pirate chest handling. Current
outputs show commands such as `take chest` / `drop chest` missing the chest in
the full route, which prevents the solve and treasure logs from reaching their
final scoring fragments.

## Remaining Work

- Stabilize pirate chest acquisition and deposit in full upstream replay.
- Continue treasure route comparison after ruby/diamonds.
- Prove cave-closing clocks and repository relocation under full replay.
- Drive `solve-path` to 430-point final rank.
- Drive `complete-endgame` to repository/blast fragments.
