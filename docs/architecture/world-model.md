# Open Adventure YAML World Model

`source/adventure.yaml` is the single source of truth for world data. Hand-authored
`OpenAdventure.ni` adds behavior, while everything that can be described structurally
in the YAML is generated into Inform 7 source files.

The top-level sections are:

- `motions` (movement vocabulary)
- `hints` (hint metadata and text)
- `locations` (map graph + room state)
- `dwarflocs` (initial dwarf placement metadata)
- `arbitrary_messages` (reusable message templates)
- `classes` (score-band classification text)
- `turn_thresholds` (long-play score penalties)
- `objects` (portable items, scenery, creatures, puzzle objects, etc.)
- `obituaries` (death and reincarnation prompts)
- `actions` (command vocabulary and parser-facing defaults)

The order is not required for gameplay logic, but in practice it groups related
systems in a way that is easy to compare with the Open Adventure C behavior.

## Locations

Each location is a room node in the navigation graph. A location entry includes:

- `description.long` and `description.short` (full vs repeatable room text)
- `description.maptag` (used for mapping/documentation style metadata)
- `conditions` (room flags, e.g. `LIT`, `DEEP`, `NOBACK`, `FLUID`, `OILY`)
- `hints` (which hint IDs can trigger while here)
- optional room `sound` tag and `loud` override behavior
- `travel` (all outgoing transitions)

Most locations have multiple `travel` entries. The first matching rule defines movement
outcome in the current design; condition evaluation controls applicability.

Key insight: location state and room flags are also checked by travel conditions, so the
world map is not static; it is a stateful graph driven by object and special flags.

## Travel System

Travel is data-driven and sits in `locations[*].travel`.

Each rule has:

- `verbs`: one or more symbolic movement tokens (from `motions`)
- optional `cond`: predicates that must pass
- `action`: a tuple `[kind, target]`

The canonical action kinds observed in YAML are:

- `goto` — move to another location
- `speak` — emit a message (usually via a message key)
- `special` — branch token for special-case movement behavior

`cond` entries encode:

- `[pct, N]`: random success rate (percent chance)
- `[carry, OBJ]`: require player carrying `OBJ`
- `[with, OBJ]`: require carrying or being at `OBJ`’s location
- `[not, OBJ, STATE]`: require object state mismatch/condition
- `[nodwarves]`: condition tied to dwarf-avoidance behavior

Current analysis summary:

- total locations: **185**
- locations with at least one travel rule: **184**
- total travel rules: **623**
- action mix: **583 goto**, **34 speak**, **6 special**, **0 unknown**
- random rules (pct-based): **12**
- forced rules (empty `verbs`) — automatic transitions: **23**

Because the parser and gameplay are split, this section tells you *what can happen*.
Actual movement side effects are implemented in hand-written Inform code.

## Objects

`objects` is the master entity table. Objects can represent anything physically present or
conceptual from the gameplay model, and object IDs drive both object logic and travel
conditions.

Per-object fields include:

- `words`: vocabulary tokens that identify the object
- `locations`: initial placement (some objects have one or two locations)
- `inventory`: default inventory listing text
- `treasure`: boolean score flag
- `immovable`: explicit mobility control
- `states`: symbolic state labels (`STATE_0`, `STATE_1`, ...)
- `descriptions`: description per state or a single description
- `changes`: state-change text output
- `sounds` / `texts`: object-specific ambient and literal text

Observed object roles from analysis:

- treasure: **20**
- portable item: **17**
- scenery: **5**
- puzzle object: **16**
- creature: **7**
- infrastructure/system object: **4**
- unknown: **1**
- total objects: **70**

Relationship to gameplay:

- State labels are shared with other systems (notably travel conditions), so object
  data is not cosmetic; it controls logic.
- Some objects require special Inform behavior (creatures, puzzle objects, and several
  special infrastructure actors), while many generated declarations can start fully
  generated and then be wired up in hand-maintained logic.

## Vocabulary

Vocabulary is split into two explicit sections:

- `motions`: command words for movement and room targeting
- `actions`: command words for parser-level action handling

Object nouns live in each object’s `words` field, not a separate section.

Important patterns:

- `oldstyle` flags in `motions`/`actions` control whether single-letter or abbreviated
  forms are legal in the original mode.
- `noaction: true` actions only output messages and do not attempt gameplay side effects.
- Some tokens overlap across motion/action/object roles and are therefore context sensitive.

The parser needs to preserve these tokens first, then layer modern conveniences where
they do not alter gameplay outcomes.

## Actions

`actions` entries are command groups with:

- action key (`ACT_*`, `CARRY`, `GO`, etc.)
- a shared `message` template (used when action is not implemented directly)
- `words` token list
- optional `noaction` short-circuit semantics
- optional `oldstyle` flag

This section is your parser contract. It maps player tokens to expected behavior
(or explicit message-only fallback), including classic help/version/quit/info/abort
and magic-word response branches.

## Messages

`arbitrary_messages` provides reusable narrative/feedback strings. They are indexed by
symbolic keys (e.g. `CAVE_NEARBY`, `BAD_DIRECTION`, `GRATE_NOWAY`) and referenced by
travel actions and action/message handlers.

The file also defines formatting placeholders:

- `%d` numeric insertion
- `%s` string insertion
- `%S` pluralization conditional
- `%V` version string

`obituaries` are an ordered sequence of death/revival prompts with paired responses.

## Hints and scoring thresholds

Hint entries include:

- stable ID (`hint` anchor / name)
- unlock trigger metadata (`turns`, `penalty`, `question`, `hint` text)
- location gating via location references

`classes` and `turn_thresholds` are global scoring messages:

- `classes` maps score bands to class text
- `turn_thresholds` penalizes prolonged play

## System relationships (how it fits together)

- `motions` tokens feed parser input and are consumed in `locations[*].travel.verbs`.
- `actions` and `NOACTION` actions provide command-level parser behavior and messages.
- `objects` supply both world entities and condition targets for travel logic.
- `conditions` inside locations and travel rules provide dynamic movement constraints.
- `messages` are the glue text layer connecting travel/actions with the feedback system.
- `hints` attach contextually by location and use hint-specific penalties.
- `dwarflocs`/`classes`/`turn_thresholds`/`obituaries` influence game systems that sit
  outside pure movement/object generation and are expected to be implemented in hand-written
  gameplay code.

In practice: this YAML is a declarative world specification; parser and behavior code
interpret it. As long as new contributors keep edits in generated data and generator
logic, the same file can evolve without changing hand-authored rule code.
