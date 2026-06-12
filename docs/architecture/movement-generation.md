# Movement Generation (Milestone 2B)

This document captures the concrete generator output for direct movement edges from
`source/adventure.yaml` in `tools/generators/travel.py`.

## Scope

Milestone 2B focuses on **generator-side direct room-to-room movement generation** only:

- emit direct Inform 7 map connections where supported;
- keep all non-direct rules as generated placeholders in `Travel.ni`;
- do not implement runtime behavior or parser/gameplay wiring yet.

## Generation strategy

The generator now classifies each travel entry before emission.

1. **Direct map candidate**

- `action == "goto"`;
- no `cond` field (unconditional);
- `verbs` not empty (non-forced);
- no magic-word verbs (`XYZZY`, `PLUGH`);
- all verbs map to a single supported direction (`N/S/E/W/NE/SE/NW/SW/UP/DOWN`);
- no unsupported or mixed direction families.

2. **Placeholder**

All other travel entries are emitted as metadata comments with:

- status `placeholder`,
- a short reason (`forced move`, `conditional travel`, `non-mappable or ambiguous direction`,
  `magic-word travel`, etc.),
- existing conditional metadata (`condition`, `random`, `forced`).

The source `LOC_*` structure and action-type grouping are preserved.

## Current counts

- total travel rules in source: **623**
- direct map connections generated: **337**
- travel rules remaining as placeholders: **286**
- locations containing at least one direct map line: **106**

Remaining-rule breakdown:

- `goto`: **246**
  - forced: **23**
  - conditional: **27**
  - random (`cond: [pct, N]`): **5** (subset of conditional)
  - non-mappable/ambiguous direction: **192**
  - magic-word: **4**
- `speak`: **34**
- `special`: **6**

## Unresolved edge cases

- **Mixed travel verbs**: rules with both direction and non-direction tokens such as
  `["ROAD", "WEST", "UPWAR"]` or `["ENTER", "BUILD", "INWAR", "EAST"]` require rule-dispatch behavior.
- **Conditional and random transitions**: these need predicate/random evaluation.
- **Forced transitions**: `verbs: []` transitions are automatic and remain logic-only.
- **Magic words and special movement**: `XYZZY`/`PLUGH` and `special` action kinds are
  still behaviorally unresolved.
- **Parser-specific aliases** (`FORES`, `BUILD`, `DEPRE`, `DOWNWAR`, etc.) appear in travel tokens and are preserved as travel-dispatch placeholders.

## Assumptions

1. Direct map generation should not change gameplay behavior.
   Therefore only clear, deterministic, unconditional directional exits are emitted.
2. `INSIDE`/`OUTSIDE` style transitions are intentionally not emitted as map
   edges yet, because the direct map strategy must remain conservative and parser-safe.
3. Generated comments are expected to become the input for the later generated
   travel dispatcher in Milestone 2C+.
