# Runtime Framework Design (Milestone 3B)

This document defines the hand-maintained runtime layer that will execute against
`generated/*.ni` artifacts and `source/adventure.yaml` world data.

## Purpose

Milestone 3B builds a shared framework for later system implementations without
introducing high-volume gameplay behavior yet.

- preserve Open Adventure behavior with `open-adventure-c` as behavior authority,
- keep `source/adventure.yaml` authoritative for world structure,
- maintain generated files as disposable data artifacts,
- keep parser behavior and object grammar in one place,
- defer creature/puzzle/endgame systems to later milestones.

## Runtime source files added

- `OpenAdventure_State.ni`
- `OpenAdventure_Conditions.ni`
- `OpenAdventure_Runtime.ni`
- `OpenAdventure.ni` includes those files and generated outputs:
  - `generated/Rooms.ni`
  - `generated/Objects.ni`
  - `generated/Travel.ni`
  - `generated/Vocabulary.ni`

## State model

### Global state variables

- `openadventure-framework-ready` (truth): initialization gate.
- `openadventure-turn-counter` / `openadventure-tick-counter` (numbers): runtime
  progress counters.
- `openadventure-current-travel-rule-id` / `openadventure-active-*` fields:
  active traversal context and diagnostic text.
- `openadventure-subsystem-*` flags:
  `dwarves`, `pirate`, `dragon`, `troll`, `bear`, `treasure-scoring`,
  `cave-closing`, `endgame`.
- `openadventure-score-delta` and score-context fields for deferred score integration.
- `openadventure-framework-in-lookup` and related guards to avoid recursive lookup.

### Object/room identity model

- `adventure-id` property added to all rooms and things.
- `adventure-state` property added to all things for future puzzle/system state.
- bootstrap normalizer `initialize framework IDs` resolves `adventure-id` from
  generated identifiers, producing stable string keys suitable for generator tables.

### Gameplay flag model

- `openadventure-dwarves-movement-guard-enabled` indicates whether dwarf route
  filtering is active.
- `openadventure-nodwarves-mode` is the predicate spine for `nodwarves` conditions.
- `openadventure-subsystem-loading` is a temporary lifecycle lock during startup.

## Condition evaluation model

`OpenAdventure_Conditions.ni` introduces predicate evaluation entry points:

- inventory predicates:
  - `player carries object`
  - `player is with object`
- state predicates:
  - `openadventure object has state`
- travel predicates:
  - condition kind dispatch for `none`, `carry`, `with`, `not`, `pct`, `nodwarves`.

`pct` and `nodwarves` are represented as framework-level predicates and are
ready for later C-authored integration values.

Resolver helpers are included to map between:

- generated id text (`LOC_START`, `GRATE`, `EMERALD`) and runtime entities (`room`/`thing`),
- normalized textual IDs (space/underscore canonicalization),
- generated condition arguments and evaluated state.

## Event model

### Runtime event hooks

- `openadventure pre-travel hooks ...`
- `openadventure post-travel hooks ...`
- `openadventure inventory hooks ...` (carry/drop extension points)
- `openadventure scoring hooks ...`
- `openadventure command hooks ...`

Current behavior is no-op scaffolding, but all hooks are present and named for subsystem attachment.

### Why events are split this way

- keeps travel and parser behavior from object logic,
- allows systems (dwarf, troll, scoring, etc.) to subscribe without modifying shared control flow,
- supports event ordering and traceability in future Milestones.

## Subsystem registration and integration model

For Milestone 3B, registration is represented by:

- boolean subsystem flags (`openadventure-subsystem-*`),
- explicit enable procedures (`enable subsystem X`),
- travel interceptor gate phrase per subsystem:
  - `subsystem dwarves currently handles this travel`
  - `subsystem pirate currently handles this travel`
  - `subsystem dragon currently handles this travel`
  - `subsystem troll currently handles this travel`
  - `subsystem bear currently handles this travel`
  - `subsystem treasure-scoring currently handles this travel`
  - `subsystem cave-closing currently handles this travel`
  - `subsystem endgame currently handles this travel`

Future integration can replace each boolean with richer dependency data (priority and phase),
but this scaffold already gives a stable extension interface.

## Travel dispatch integration point

`OpenAdventure_Runtime.ni` exposes:

- initialization (`set up OpenAdventure runtime framework`)
- unified candidate predicate gate (`generated travel row ... can be selected`)
- framework initialization guard (ensures generated IDs are prepared before use)
- travel/event/score hook call surfaces

No movement behavior is hard-coded today beyond condition evaluation and guard plumbing.

## Dependency model

### Upstream dependencies

- Parser and motion vocabulary from `generated/Vocabulary.ni`
- Structured tables from `generated/Travel.ni`
- World locations/objects from `generated/Rooms.ni`, `generated/Objects.ni`
- World-state truth sources in `source/adventure.yaml` (via generator outputs)

### Runtime dependencies

- Travel condition evaluation relies on:
  - player inventory location,
  - normalized object/room IDs,
  - openadventure predicate state (including future `nodwarves`/dwarf logic).
- Systems are isolated by hooks, allowing independent implementation order.
- Scoring hook is separated from travel/puzzle/command hooks to avoid recursion.

## Implementation summary

### Done in Milestone 3B

- Added foundational runtime state declarations and identity/state properties.
- Added condition/predicate helpers for:
  - inventory checks,
  - `carry`/`with`/`not`/`pct`/`nodwarves` style travel predicates,
  - room/thing id normalization.
- Added hook surface for:
  - pre/post travel,
  - inventory change,
  - scoring,
  - parser/command events,
  - subsystem registration and dispatch gates.
- Connected framework scaffolding into `OpenAdventure.ni`.

### Deferred to Milestone 3C

- Implementing special/conditional travel semantics and all unresolved table entries.
- Dwarf/pirate/dragon/troll/bear/cave-closing/endgame logic.
- Score model integration with final scoring tables/thresholds.
- Event-driven side effects and full parser command routing.

## Recommendations for Milestone 3C

1. Bind `generated/Travel.ni` rows to a true generated dispatcher that:
   - resolves source/destination via `adventure-id`,
   - evaluates condition predicates through existing condition API,
   - emits `speak` vs `goto` actions consistently.
2. Convert `subsystem currently handles` stubs into rule-based or data-driven
   interceptors with explicit priorities:
   - high: dwarf/pirate movement filtering,
   - medium: troll/chasm/dragon/beast transitions,
   - low: scoring and endgame hooks.
3. Add explicit event listeners for:
   - score mutation,
   - inventory movement,
   - travel success/failure reporting.
4. Tighten diagnostics:
   - unresolved-row reporting,
   - per-system trace log,
   - regression checklist per unresolved table entry.
