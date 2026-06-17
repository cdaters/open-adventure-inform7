# Divergence Analysis - Milestone 8G

Historical note: this report records an intermediate divergence. The current
full transcript manifest passes 15/15.

Date: 2026-06-14

## Objective

Milestone 8G investigated the first remaining full-walkthrough divergence:
the oil-filled bottle was expected to be available at the cliff urn sequence,
but the Inform 7 replay reached `fill urn` without a usable bottle of oil.

Compared sources:

- `build/transcripts/solve-path.out`
- `build/transcripts/treasure-collection.out`
- `build/transcripts/complete-endgame.out`
- `references/open-adventure-c/tests/win430.log`
- `references/open-adventure-c/tests/endgame428.log`

## Expected Open Adventure State

In the Open Adventure C walkthrough, the route establishes this state:

- Early in the route, `get water` takes the bottle and fills it with water.
- At the eastern pit, `fill bottle` replaces the bottle contents with oil.
- Later, the bottle is dropped in the building as an oil-filled bottle.
- After the pirate/chest route, `take bottle` retrieves that oil-filled bottle.
- At the cliff, the player is carrying the oil-filled bottle and the urn is
  empty.
- `fill urn` empties the bottle and fills the urn with oil.
- `light urn` lights the urn.
- `rub urn` creates the amber, enabling the rug/gemstone/sapphire route.

Expected local state at the cliff checkpoint:

| State | Expected value |
|---|---|
| Room | Cliff area containing the empty urn. |
| Inventory | Oil-filled bottle, rug, emerald, cage, and other route inventory. |
| Bottle | Present in inventory, state `OIL_BOTTLE`. |
| Urn | Present at cliff, state empty before `fill urn`. |
| Oil proxy | Represented through bottle state, not independently blocking play. |

## Actual Pre-Fix State

The Inform 7 replay diverged earlier than the visible cliff failure:

- `get water` filled the bottle state but left `BOTTLE` in the building.
- The generated `WATER` proxy moved to the player, so replay appeared to have
  liquid state without the actual container.
- At the eastern pit, `fill bottle` failed because the player did not carry the
  bottle.
- Later `drop bottle` reported that the bottle was already in the building.
- At the cliff, `fill urn` failed because there was no carried oil-filled
  bottle.

The first actual state mismatch was therefore the early `get water` command,
not the later `fill urn` command.

## Root Cause

Liquid acquisition verbs treated `get water` as a bottle-fill operation but did
not move the bottle into the player's inventory. That split the generated
liquid proxy state from the real bottle object state.

This affected downstream route state:

- The bottle stayed in the building.
- The eastern pit oil fill could not succeed.
- The oil-filled bottle could not be recovered later.
- The cliff urn could not be filled.
- Amber, rug hover, sapphire, and later treasure/endgame routing could not
  proceed correctly.

## Correction

The smallest root correction was made in `OpenAdventure_Runtime.ni`:

- `get water` and `take water` now require an available bottle, move the bottle
  to the player, and set bottle state to `WATER_BOTTLE`.
- `get oil` and `take oil` now require an available bottle at the eastern pit,
  move the bottle to the player, and set bottle state to `OIL_BOTTLE`.
- `fill bottle` remains a fill action and no longer owns the `get water` parser
  path.
- Dropping the bottle now keeps water/oil proxy objects hidden and preserves
  liquid contents through the bottle state.

## Verification

Commands run:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
```

Result: passed. The Glulx artifact compiled and all smoke checks passed.

```bash
python3 tools/run_transcripts.py --execute --mode upstream --timeout 180
```

Result: the three upstream walkthrough cases still fail final expected
fragments, but the oil-bottle divergence is eliminated.

```bash
python3 tools/run_transcripts.py --execute --timeout 180
```

Result: 12 transcript cases passed and 3 failed on expected-fragment
mismatches only. The failing cases remain `solve-path`,
`treasure-collection`, and `complete-endgame`.

Observed corrected behavior in `solve-path.out`:

- `fill bottle` at the eastern pit now reports that the bottle is full of oil.
- `fill urn` now empties the bottle and fills the urn with oil.
- `light urn` lights the urn.
- `rub urn` creates the amber.
- The route proceeds through amber pickup, gemstone/rug behavior, rug flight,
  and sapphire pickup.

## Remaining Divergence

The next remaining blocker is later than the 8F oil-bottle failure. The full
walkthroughs still do not reach their final fragments:

- `solve-path` still misses the final 430-point score/rank output.
- `treasure-collection` still misses all-treasure completion fragments.
- `complete-endgame` still misses repository/blast fragments.

The next investigation area is late treasure and endgame synchronization after
the amber/sapphire/rug section, including bear/chain, magazine/spices,
cave-closing, repository placement, blast handling, and final scoring.
