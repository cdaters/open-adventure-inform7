# Gameplay Runtime Object Taxonomy (Milestone 3A)

This document maps object classes in `source/adventure.yaml` to runtime
integration points required by the generated engine and existing hand-written
gameplay systems.

## Context

The generated data in `source/adventure.yaml` can describe object identity,
vocabulary, location, portability, and initial property values.
It cannot, by itself, express:

- turn-based behavior,
- cross-room/world effects,
- parser verb routing beyond simple affordances,
- score or inventory side effects,
- timed/stateful NPC dynamics.

## Creature objects

| Object | Runtime role | Generated data | Runtime responsibilities beyond YAML | Required global state |
|---|---|---|---|---|
| `DWARF` | Active hostile NPC with movement and attack behavior | Name/aliases, initial `place`, movable status | periodic movement, encounter gating, conditional hostility, stealing mechanics, kill/death edge cases | `dwarves[]`, `dflag`, `loc/newloc/oldloc`, `cond` bit usage, `holdng`, parser branch coverage |
| `DRAGON` | Heavy hostile NPC + loot interaction | Name/aliases, initial room, state (`prop`) | one-way vulnerability (axe), delayed aggression model, kill/death + blood object side effects, room-dependent messaging | `loc/newloc`, `tally`, parser action handlers (`attack`, `strike`, `shoot`, etc.), optional world state checks |
| `TROLL` | NPC obstacle in bridge/chasm area | Name/aliases, room, fixedness | blocks route until condition met, reacts to carried objects, updates travel availability | `loc/newloc`, `obj.prop` flags, `tally`/score linkage, travel resolution |
| `TROLL2` | Second troll variant/continuation state | Name/aliases, room, state | secondary troll behavior, messaging/state split from `TROLL`, cleanup timing | `cond`/global object flags, travel, room checks |
| `SNAKE` | Moving/chasing NPC with room-aware behavior | Name/aliases, room, state | room entry triggers, flee/kill branches, delayed encounter resolution | `chloc/chloc2`, `loc/newloc`, object `prop` used as state |
| `BEAR` | Hostile/ambient creature | Name/aliases, room, state | attack/avoid behavior tied to chain/bait/equipment interactions | `loc/newloc`, parser checks for `CHAIN`, `FOOD`, `AXE` |
| `OGRE` | Hostile ambush-style creature | Name/aliases, room, state | limited turn-based combat style and movement edges | `loc/newloc`, `cond`, score/kill hooks |

## Puzzle objects

| Object | Runtime role | Generated data | Runtime responsibilities beyond YAML | Required global state |
|---|---|---|---|---|
| `GRATE` | Traversal gate | Fixed object, placement, prop seed | direction availability toggles, text/state transitions | room graph, travel resolution |
| `STEPS` | Movement puzzle object | Location and text metadata | step-by-step traversal constraints, fall/return constraints | travel, room states |
| `DOOR` | Passage control object | Fixedness + initial state | conditional passability by location/inventory, key-like gating logic | inventory + traversal + parser |
| `FISSURE` | Path-breaking terrain object | Location + base descriptors | one-way/blocked transitions and special fall behavior | room dependencies, travel exceptions |
| `OBJ_13` | Terrain/obstacle behavior object | Name+state metadata | special-case travel or action interception | room + travel + parser |
| `MIRROR` | Special puzzle object | Location and descriptors | mirrored-room/action aliasing behavior, parser ambiguity handling | parser, room state |
| `PLANT` | Multi-stage environment object | Fixed object, prop seed | lifecycle (withered/active) and effectful branch changes | room dependencies, parser, timing |
| `CHASM` | Hazard area | Fixed obstacle metadata | jump/fall/crossing rules plus risk progression | travel, `closed/closng`, parser actions |
| `MESSAG` | Story/message trigger object | Descriptive metadata | delayed/conditional text + gating side effects | room state + parser |
| `VEND` | Vendor/treasure-like puzzle object | Location + property value | custom buy/sell/request interactions with game state | scoring + parser verbs |
| `URN` | Container/discovery object | Location + prop | break/open/reveal transitions + contained reward side effects | room inventory checks + scoring |
| `CAVITY` | Secret/hidden-transition object | Location and noun data | conditionally exposed action behavior | room/travel state |
| `RESER` | Reservoir-like puzzle object | Placement metadata | container/consumption semantics affecting room conditions | room dependencies + scoring |
| `OBJ_47` | Legacy puzzle component | Generated as object metadata only | non-obvious action-to-state transitions | parser + stateful transitions |
| `OBJ_48` | Legacy puzzle component | Generated as object metadata only | non-obvious action-to-state transitions | parser + stateful transitions |
| `SIGN` | Informational object | Static text-bearing data | context-sensitive read/inspect behavior | parser + room state |

## Infrastructure/system objects

| Object | Runtime role | Generated data | Runtime responsibilities beyond YAML |
|---|---|---|---|
| `PLANT2` | Secondary plant model used by stateful plant logic | Fixed location + descriptors | mirrors/feeds state transitions of companion puzzle plant object | plant lifecycle state + parser messaging |
| `OBJ_30` | Ambient system marker | Static descriptors | interacts with specialized room/parser branches without obvious noun utility | room-level behavior hooks |
| `VOLCANO` | Environmental hazard/system object | Non-portable fixed object | special verb handling (`extinguish`, sight/sound narration), lore hooks | parser hook + optional game-mode condition |
| `OBJ_40` | Non-portable ambient actor/object | Static descriptors | environment side effects and location-specific text | room-dependent rendering |

## Cross-cutting runtime integration

- **Generated object handling**
  - static `id`, `names`, `synonyms`, `description`, `location`, `portable/fixed`, `initial prop`.
  - vocabulary wiring (for object lookup and parser recognition).
  - one-to-one object-to-room initial seeding.
- **Hand-written gameplay handlers**
  - action handlers that mutate object `prop` in response to verbs.
  - room transition interceptors that read object state.
  - special parser routing for objects with overloaded verbs.
  - cross-system side effects (`score`, `inventory`, NPC movement).
- **Reusable subsystem candidates**
  - generic finite-state object handler (state table by verb/source/destination),
  - generic door/grate/fissure pattern engine,
  - generic hazard-handoff travel wrapper,
  - generic parser-branch registry for noun-specific edge cases.

## Generated vs. hand-written split

- **Generated directly from YAML**
  - noun and syntax declarations
  - static placement and portability
  - baseline object description tables
  - initial room/object state values
- **Hand-written**
  - all turn-based NPC behavior and scheduling
  - travel interception and special movement failures
  - all messaging branches whose text depends on global variables
  - scoring, death conditions, and endgame triggers
  - parser special cases that bypass generic verbs

## Recommended implementation shape

1. Keep the object schema stable and declarative.
2. Add a central action dispatcher that consults per-system handlers after generic parser execution.
3. Use generated objects as data for:
   - room presence,
   - verb affordances,
   - baseline object text.
4. Treat each non-trivial object behavior as ownership of one gameplay system.
