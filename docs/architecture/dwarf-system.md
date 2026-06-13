# Dwarf System (Milestone 4D)

## Scope and goals

Milestone 4D targets Open Adventure dwarf behavior: the `cond_nodwarves` route filter, dwarf activation state, first encounter, visible dwarf pressure, travel blocking, knife attacks, and player attacks against visible dwarves.

Authoritative behavior references:

- `references/open-adventure-c/main.c`
- `references/conley-inform7/Adventure.ni`
- `references/nelson-inform6/Advent.inf`

## Source trace summary

### Open Adventure C

- `cond_nodwarves` appears in generated travel row data, but it is a dwarf-movement exclusion marker. Normal player travel treats the condition as satisfied.
- Dwarf logic is owned by shared movement state (`game.dwarves[]`), with higher-level behavior driven by dungeon-depth and encounter checks.
- Active dwarves can block a retreat into their previous location. `LOC_LONGWEST -> LOC_DIFFERENT1` is the key no-dwarf movement route in current generated row coverage.

### Conley Inform 7 / Nelson I6

- Both implementations express explicit dwarf/constraint hooks and keep travel-guard semantics separate from world definitions.
- Dwarf side effects are modeled through runtime predicates that are consulted during travel and state update.

## Implemented dwarf model in this milestone

### State model (implemented)

- `openadventure-dwarf-movement-pass`: turn-scoped guard for dwarf update checks.
- `openadventure-dwarf-activity-level`: `0` dormant, `1` armed after deep-cave entry, `2+` active encounter/attack tempo.
- `openadventure-nodwarves-mode`: compatibility flag for evaluating generated `nodwarves` condition rows in dwarf-owned contexts.
- `openadventure-dwarves-travel-in-progress`: recursion guard around post-travel dwarf processing.
- `openadventure-dwarf-kill-count`: count of dwarves removed by first-encounter attrition or player attack.
- `Table of Open Adventure Dwarf Actors`: six actor slots with location, previous location, visibility, and alive state.
- `openadventure-dwarf-route is forbidden`: authoritative policy predicate used by nodwarves checks.

All state is declared in `OpenAdventure_State.ni`.

### Dwarf behavior covered

- Rule `138` remains player-passable and is excluded from dwarf movement via `openadventure-dwarf-route is forbidden`.
- First deep-cave entry arms the dwarf subsystem.
- First encounter has a 5% trigger chance, drops `AXE`, removes up to two non-pirate dwarf slots, and moves any collocated survivor away.
- Active rounds can reveal dwarves in the player's current deep-cave room, keep seen dwarves tracking the player, and throw knives on repeated contact.
- Seen dwarves can block travel back to their previous location with the canonical block message.
- `DWARF` is moved into the player location while at least one visible dwarf is present, so parser commands such as `attack dwarf` have a concrete noun.
- Attacking `DWARF` has a 60% kill chance and updates the actor table; attacking `AXE` redirects to dwarf attack only when a visible dwarf is present.

### Travel and parser integration

- Runtime exposes shared state used by travel dispatch (`openadventure-active-source-loc`, `openadventure-active-travel-result`, `openadventure-runtime-check-result`).
- Non-direct row evaluator passes destination and source context into the condition check.
- Runtime pre-travel hooks call dwarf travel-block checks before movement.
- Runtime post-travel hooks advance dwarf activation and encounter state after movement.

## Implementation notes / parity gaps

### Remaining parity gaps

- Random dwarf movement is intentionally simplified relative to the C `travel[]` candidate scan; it preserves visible pressure, previous-location blocking, and the `nodwarves` route exclusion but does not yet enumerate every generated travel edge as a dwarf candidate.
- Pirate behavior is represented only by slot `6`; full treasure theft and pirate/dwarf precedence remain future work.
- Death currently ends the story directly instead of using Open Adventure's reincarnation flow.
- Transcript-level tests are still smoke/static checks because no command transcript runner is available in the repository yet.

## File map

- `OpenAdventure_Dwarves.ni`
  - Actor state initialization, route policy, encounter updates, travel block checks, knife attack flow, and parser behavior for attacking visible dwarves.
- `OpenAdventure_Conditions.ni`
  - `condition-kind "nodwarves"` delegation.
- `OpenAdventure_Runtime.ni`
  - travel dispatch context + forced/non-direct row eval and pre-travel hooks.
- `OpenAdventure_State.ni`
  - dwarf and runtime booleans/flags.

## Required next milestone actions

1. Replace simplified pressure movement with full generated-travel candidate selection.
2. Implement pirate treasure theft and pirate/dwarf ordering.
3. Add reincarnation/death recovery instead of direct story termination.
4. Add transcript-level validations for first encounter, blocking, missed attacks, successful attacks, and death.

## Estimated effort

- Rule-138 route exclusion integration: completed.
- Dwarf activation/encounter/combat baseline: completed.
- Full generated-edge dwarf movement parity: pending.
- Pirate interaction integration: pending.
- Transcript regressions for dwarf behaviors: pending.
