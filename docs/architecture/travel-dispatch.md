# Runtime Travel Dispatch (Milestone 3C)

## Objective

Milestone 3C implements the runtime integration between `generated/Travel.ni` non-direct travel rows and the hand-maintained framework in `OpenAdventure_Runtime.ni`, without implementing gameplay-specific movement systems.

The dispatcher consumes generated rows, evaluates conditions, supports forced/random/magic-word movement metadata, and invokes hand-written stubs for gameplay-specific travel specials.

## Dispatch Flow

1. Parser/runtime callers invoke:
   - `openadventure non-direct travel from source-id (source-id) with verb token (verb-token)` for command-driven movement.
   - `openadventure forced travel can be executed from source-id (source-id)` after a successful move to apply auto-transition entries.

2. Candidate scan (`openadventure non-direct travel...`):
   - sets pending-travel guard.
   - iterates `Table of Generated Travel Non-Direct Rules` in source order.
   - filters by matching source room.
   - filters out `forced` rows in the non-direct path.
   - calls `openadventure travel row ... can be selected` for each row.

3. Row filtering (`openadventure travel row ... can be selected`):
   - validates source room resolution.
   - enforces forced semantics (`goto_forced` requires empty token).
   - matches command token to generated verb list.
   - requires magic-word rows (`is-magic-word`) to opt into magic-category handling.
   - evaluates random rows via `random-chance`.
   - evaluates generic conditions via `condition ... currently holds in source location`.
   - applies subsystem gating stubs (`dwarves`, `pirate`, `dragon`, `troll`, `bear`, etc.) so later systems can block moves.
   - records active runtime context (`rule-id`, `source`, `verb`, `destination`).

4. Execution (`openadventure execute generated travel entry`):
   - `goto*` categories call `openadventure execute generated goto ...`.
   - `speak` and `speak_conditional` call `openadventure emit travel message`.
   - `special` and `special_conditional` call special handler.

5. Goto execution:
   - runs pre-travel hook.
   - moves player when destination resolves.
   - runs post-travel hook.
   - performs forced-travel dispatch from the destination room.

## Condition Evaluation Flow

- `condition` dispatch remains centralized in `OpenAdventure_Conditions.ni`.
- `cond_nodwarves` is represented by `condition-kind "nodwarves"`.
- In 3C, non-dwarf context semantics are:
  - allow the row by default for player movement.
  - allow future dwarf-mode exclusion by toggling `openadventure-nodwarves-mode` and inverting row handling in the calling subsystem.

## Unresolved Gameplay Dependencies

## Milestone 3C baseline

The dispatcher is wired, but the following rows are intentionally stubbed in 3C and remain unresolved gameplay behavior:

- `138`: `LOC_LONGWEST` condition `nodwarves` (dwarf routing filter)
- `216`: `LOC_SWCHASM` — `special` → special `3` (troll bridge/chasm)
- `226`: `LOC_NECHASM` — `special` → special `3` (troll bridge/chasm)

## Milestone 4A follow-up

Plover rows were implemented in `OpenAdventure_Plover.ni`:

- `110`: `LOC_Y2` → `special 2` (carry emerald)
- `190`: `LOC_ALCOVE` → `special 1`
- `193`: `LOC_PLOVER` → `special 1`
- `194`: `LOC_PLOVER` → `special 2`

Unresolved gameplay dependencies after 4A: rules `138`, `216`, and `226`.

## Extension Points

1. **Special travel handlers**
   - Add a concrete handler for special ID `3` (troll/bridge/chasm logic) in the movement system layer.
   - Keep the dispatch API stable so generated IDs map to runtime behavior.

2. **Subsystem routing gates**
   - Implement `subsystem * currently handles this travel` hooks for dwarf/pirate/dragon/troll/bear/cave-closing/endgame.
   - Return `true` when a subsystem fully owns the travel outcome.

3. **Message pipeline**
   - Replace placeholder `say "[message-id]"` emission with real message lookup integration when message artifacts are generated.

4. **Parser integration**
   - Route parser movement commands into `openadventure non-direct travel from source-id ...` once command grammar is in place.
   - Extend verb-token normalization to preserve multi-word travel commands (`EAST PASSA`, `PLOVE`, etc.) when needed.

## Remaining Blockers and Next-Step Recommendations

- Implement special handler for ID `3` before the troll/pirate/dragon/dwarf gameplay milestones.
- Implement dwarf-aware travel filtering (currently modeled only as a condition flag).
- Add message ID resolution so `speak`/`speak_conditional` rows display canonical Adventure text.
- Add integration tests across unresolved rows once baseline parser + command routing is stable.
