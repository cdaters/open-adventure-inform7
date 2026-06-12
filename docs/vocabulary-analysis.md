# Vocabulary Analysis (adventure.yaml)

Milestone 1C focuses on vocabulary inventory and parser-facing
classification.  This report is derived directly from
`source/adventure.yaml` and used by the generator-only approach.

## Scope

Vocabulary sources analyzed:

- `motions` (movement tokens)
- `actions` (command tokens)
- `objects` (object noun tokens)

No gameplay logic is added in this milestone; output is parser metadata only.

## Method

1. Read all entries from each source section in order.
2. Capture all non-null tokens per entry.
3. Classify tokens by semantic family:
   - motion
   - action
   - object
   - magic
   - abbreviation / historical shortcut
4. Detect overlaps between families.
5. Emit generated metadata comments in `generated/Vocabulary.ni`.

## Totals

- Total unique vocabulary entries: **321**
- motion words: **105**
- action words: **119**
- object words: **100**
- magic words: **9** (`xyzzy`, `plugh`, plus invalid-magic aliases)
- total motion entries: **76**
- total action entries: **58**
- total object entries: **70**
- abbreviations (<=2 chars, plus `?`): **22**
- historical shortcuts: **18**

## Motion Vocabulary

- Direction-like source IDs: `NORTH`, `SOUTH`, `EAST`, `WEST`, `NE`, `SE`,
  `SW`, `NW`, `UP`, `DOWN`, `INSIDE`, `OUTSIDE`
- Direction-like motion tokens: **28 unique**
- Location-like motion tokens: **77 unique**
- Motion entries with no tokens: `MOT_0`, `HERE`

Examples of directional vs location motion words:

- directional: `n`, `s`, `e`, `w`, `ne`, `sw`, `up`, `down`, `in`, `out`
- location: `road`, `building`, `forest`, `stream`, `plugh`, `xyzzy`, `reser` ...

## Action Vocabulary

- Action entries with multiple verbs (synonym groups): **27**
- `noaction` commands: **16**
- `oldstyle=false` flags: **3** (`CARRY`, `NOTHING`, `INVENTORY`)
- Action entries with no tokens: `ACT_NULL`, `ACT_UNKNOWN`

## Object Vocabulary

- Object entries with multiple words: **26**
- Object noun ambiguity exists (same token reused across multiple object entries).

## Synonym Groups

- motion synonym groups: **17**
- action synonym groups: **27**
- object synonym groups: **26**

## Parser Irregularities

1. YAML key `"NO"` under `actions` is parsed as boolean `False` before normalization.
2. `MOT_0`, `HERE`, `ACT_NULL`, `ACT_UNKNOWN` have null word lists (placeholders).
3. Shared tokens across families:
   - `conti` appears in both motion (`FORWARD`) and action (`GO`) vocabularies.
   - `reser` appears in both motion (`RESERVOIR`) and object (`RESER`) vocabularies.
   - `steps` appears in both motion (`MOT_34`) and object (`STEPS`) vocabularies.
4. The token `"\"spel"` includes a quote character in the source.
5. Magic handling is split: genuine magic (`xyzzy`/`plugh`) plus invalid
   magic aliases under `INVALIDMAGIC`.

## Automatically Translatable Vocabulary

These tokens should be safe to preserve as direct Inform 7 conveniences:

- Directions:
  - `n/s/e/w/u/d`, `north/south/east/west/up/down`, diagonals
  - `in`, `out` equivalents
- Action verbs:
  - `CARRY`: `take`, `carry`, `get`
  - `DROP`: `drop`
  - `LOOK`: `look`, `examine`, `x`
  - `GO`: `go`, `walk`, `continue`-style motion aliases
  - `UNLOCK`/`LOCK`: open/close/lock semantics
  - `INVENTORY`: `i`, `inventory`
  - `READ`: `read`

Object vocabulary itself can be emitted as noun vocab in generated Inform 7
definitions with no hand-written parsing needed.

## Parser Features Requiring Special Handling

The following still require parser-layer wiring (not yet implemented):

- **Non-directional motion words** (`road`, `building`, `stream`, `forest`, `reser`, etc.)
  must map through generated travel dispatch.
- **Magic words** (`xyzzy`, `plugh`, `sesam`, `opens`, `abra`, `abrac`,
  `shaza`, `hocus`, `pocus`) require dedicated parser branches.
- **Message-only commands** (`THANKYOU`, `HELP`, `NO`, `TREE`, `DIG`, `INFO`, `NEWS`,
  `ACT_VERSION`, etc.) should remain in command path and short-circuit without action
  effects.
- **Shared vocabulary across sections** (`conti`, `reser`, `steps`) needs context-sensitive
  disambiguation.

## Parser Compatibility Strategy

1. Keep all Adventure tokens as canonical accepted input.
2. Add Inform 7 conveniences only where unambiguous:
   - directional shortcuts and command synonyms (e.g., `n`, `x`, `i`, `l`, `take/get`).
3. Route all non-directional travel tokens via motion dispatcher generated from
   `Travel.ni` rules.
4. Preserve message-only command behavior for noaction words even while adding modern aliases.
   
Examples for the planned translation layer:

- `forest` / `road` / `stream` / `building` / `valle` as
  location-travel tokens feeding the generated travel resolver.
- `n` / `north` / `in` / `out` as `going` directional commands.
- `x` / `look` and `l` / `look` as `look/examine` compatibility.
- `take`, `carry`, `get` as `taking`.
- `xyzzy` as a special parser trigger mapped to the magic-flow branch.
