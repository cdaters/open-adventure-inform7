# Milestone 2C: Non-Direct Travel Translation

This document captures the generator-side travel architecture for all non-direct travel
categories after Milestone 2C.

## Scope

`tools/generators/travel.py` now emits two travel artifacts:

- direct room-to-room `Room is direction of Room` statements where deterministic exits
  can be emitted safely;
- a generated `Table of Generated Travel Non-Direct Rules` for the remaining
  categories (`goto`, `speak`, `special`).

Gameplay is still not implemented in `OpenAdventure.ni` by this milestone; the generated
table is structured metadata intended for an eventual generated runtime dispatcher.

## Rule surface covered in this milestone

`generated/Travel.ni` now classifies each non-direct rule into:

- `goto_direct`
- `goto_non_direct`
- `goto_forced`
- `goto_random`
- `goto_conditional`
- `goto_magic_word` (`XYZZY`, `PLUGH`)
- `speak` / `speak_conditional`
- `special` / `special_conditional`

For every rule, the table includes:

- source location
- action kind
- travel category
- destination
- verb set
- forced flag
- condition kind and arguments
- random percent
- magic-word marker
- handwritten dependency marker

The generator preserves source order so rule precedence and ambiguous transitions can
continue to be evaluated with first-match behavior during dispatcher implementation.

## Numeric results

From current generation (623 total travel rules):

- direct map rules: `337`
- non-direct rule rows: `286`
- resolved-by-generation: `616`
- unresolved rules: `7`
- unresolved rule IDs: `110, 138, 190, 193, 194, 216, 226`

Category counts in the non-direct table:

- `goto_conditional: 22`
- `goto_forced: 23`
- `goto_magic_word: 4`
- `goto_non_direct: 192`
- `goto_random: 5`
- `speak: 15`
- `speak_conditional: 19`
- `special: 4`
- `special_conditional: 2`

## Resolved vs unresolved by category

### Resolved in generator output (data+dispatch metadata)

- All non-direct `goto`:
  - forced
  - random
  - conditional
  - non-direct/no-direct
  - magic-word
- All `speak` and `speak_conditional` transitions

These remain behavior-neutral metadata and are now explicit in generated source instead
of inline placeholders.

### Still unresolved (requires handwritten Inform 7)

1. `special` transition family (IDs: `110`, `190`, `193`, `194`, `216`, `226`)
   - `special` travel action and `special_conditional` variants remain requiring gameplay
     movement logic.
2. one `goto` transition with `nodwarves` (ID `138`)
   - requires dwarf-system predicate integration; this is intentionally out of scope for
     generated world data.

No generic condition/operator in YAML is structurally unresolved; unresolved entries are
behavior-dependent.

## Open Adventure C behaviors used as reference

Milestone 2C used the C reference for how travel conditions and destinations are
intended to execute:

- `references/open-adventure-c/main.c`: condition chain in the movement loop and
  destination dispatch (`dest_goto`, `dest_speak`, `dest_special`).
- `references/open-adventure-c/dungeon.h`: condition and destination enums.
- `references/open-adventure-c/make_dungeon.py`: C-era encoding of `cond` variants and
  special travel constants.

Specific behaviors mapped into assumptions:

- `cond_goto` / `cond_pct` are percentage checks that can resolve through shared random
  predicate logic.
- `carry`, `with`, and `not` map to possession/location/state tests.
- `dest_speak` sets new location state without movement.
- `dest_special` values `1`, `2`, `3` are non-trivial special movement systems.

## Assumptions

1. Generator classification uses conservative mapping for direct exits to avoid
   direction-encoded behavior drift.
2. Non-direct entries are emitted in source order and grouped by source location for
   deterministic rule resolution.
3. `magic-word` movement can be represented via dispatch metadata and parser aliasing
   rather than immediate gameplay handling.
4. `special` and `nodwarves` are intentionally left for hand-maintained modules.

## Edge cases / notes

- Verb sets may include historical terms that are still meaningful in parser vocabulary,
  so they are preserved as text and not discarded.
- Multiple conditional branches for one location are represented one-to-one in the table;
  the runtime dispatcher must continue scanning as ordered rows.
- Randomized `goto` entries are explicit with `random_chance` values and should use the
  existing generated predicate layer.

## Recommended implementation boundary

- **Generator-managed:** all row extraction, rule classification, condition metadata
  encoding, unresolved-rule reporting.
- **Handwritten Inform 7 (outside this milestone):**
  special travel execution (`dest_special` semantics) and dwarves predicate integration.
- **Generator-managed runtime preparation (next milestone):**
  generated dispatcher actions that consume this table and evaluate supported conditions.

