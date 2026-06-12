# Milestone 2A: Travel Translation Design

This document defines how to translate `source/adventure.yaml` travel rules into
Inform 7 source in a way that preserves Open Adventure behavior while keeping the
YAML as the source of truth.

It is a design artifact only: no gameplay behavior is implemented yet, and no file
except generated outputs is edited by hand.

## 1) Travel rule classes (from `docs/travel-analysis.md`)

The rules are normalized by:

- `action`:
  - `goto`: move to another location
  - `speak`: emit a message key
  - `special`: invoke a special travel code
- metadata:
  - `cond` present -> conditional rule
  - `cond` = `[pct, N]` -> random rule
  - `verbs: []` -> forced rule
  - `verbs` includes `XYZZY` / `PLUGH` -> magic-word travel

Current totals in YAML:

- total locations: **185**
- locations with travel: **184**
- total travel rules: **623**
- action mix: **583 goto**, **34 speak**, **6 special**
- conditional rules: **49**
- forced rules: **23**

## 2) Direct map connection candidates

## What counts as a direct map connection

A rule is a direct map candidate when it is all of:

- `goto`
- no `cond`
- non-empty `verbs`
- direction-only semantics
- safe to emit as `X is east of Y`, `north of`, etc.

For an initial conservative release, “direction-only” means one of:

`NORTH, SOUTH, EAST, WEST, NE, SE, SW, NW, UP, DOWN, INSIDE, OUTSIDE`.

## Counts

- **326** rules meet this conservative criteria.
- A second pass can treat `OUT`, `UPWAR`, `INWAR` as parser aliases of `out`, `up`, `in`.
  That would add **50** more deterministic statements, for a total of **376**.

Everything else still needs rule-based translation.

Estimated direct map rules:

- conservative estimate: **326**
- practical with directional aliases: **376**

## 3) Categories requiring generated rule logic

The remainder requires rulebook logic rather than direct `room` adjacency statements.

Using the conservative direct-map baseline (**326**):

- non-map rules total: **297**
- includes:
  - `goto` non-directional/unconditional: **153**
  - `goto` conditional (`cond`): **28**
  - `goto` forced (`verbs == []`): **23**
  - `goto` magic-word (`XYZZY` / `PLUGH`): **4**
  - `speak`: **34**
  - `special`: **6**

Using the alias-extended direct-map baseline (**376**), generated rule logic requirement drops to:

- **247** rules
- same structure, fewer unconditional non-directional moves.

Estimated hand-written behavior:

- **6** rules (`special` action) need explicit gameplay behavior now because their
  target semantics (`1`, `2`, `3`) are special-case movement codes from the
  source implementation.
- The other 297/247 rules are expressible with generated rule dispatch and generic
  condition evaluation once state predicates are in place.

## 4) Translation strategy

### A. Keep map edges where possible

Generate direct `Room is direction of Room` statements for conservative direction-only
`goto` rules. This keeps the common case in the Inform world graph and preserves
existing map reasoning behavior.

### B. Build a generated travel dispatcher for all other movement rules

Generate a normalized rule table with fields:

- source location
- destination/action target
- action type (`goto`, `speak`, `special`)
- required verbs
- condition payload (if any)
- forced/random flags

Order must be preserved to mirror YAML first-match behavior where ambiguity is
intentional.

### C. Movement resolution path

1. Parser normalizes input to a canonical motion token set.
2. If the token is a mapped compass/out-like direction, use the generated map edge.
3. Else run generated travel dispatch:
   - filter by current room
   - filter forced rules when no command verb is present
   - test conditions (`carry`, `with`, `not`, `pct`, `nodwarves`)
   - execute:
     - `goto`: move
     - `speak`: print message key
     - `special`: queue special travel branch
4. If multiple matches, pick first match.
5. If no match, emit standard “no direction” feedback.

### D. Random and conditional handling

- `pct` conditions are evaluated with `a random chance of N%`.
- `not` comparisons reference object/state labels from YAML object definitions.
- `with` and `carry` require object location/carry checks.
- `nodwarves` is a condition hook and will need coordinated dwarf-state predicate once
  hand-authored systems are wired.

## 5) Edge cases

- Mixed verb lists (`[EAST, PASSA]`, `[WEST, OUT]`, etc.) can mean one room uses a
  single destination for multiple command tokens.
- Forced transitions (`verbs: []`) are command-independent and must run outside normal
  `go` action flow.
- Multi-rule directional attempts exist in adjacent rooms (maze and mazes paths); order
  matters and must remain stable.
- `LOC_*` sections can include one-way behavior and self-looping transitions.
- Random movement can duplicate a normal exit but is chance-gated; map statements
  cannot encode this.
- Some tokens are shared with objects/actions (`conti`, `reser`, `steps` in the overall
  world model), so parser token classification must stay context-sensitive.

## 6) Risks

- Over-aggressive direct mapping may accidentally remove message-only travel semantics
  (for example, `LOOK`-style room words that are not true cardinal movement in Open Adventure style).
- Special travel actions (`action: ["special", ...]`) are under-specified without the C
  special-case logic reference; translating them incorrectly changes gameplay.
- Condition evaluation depends on future object/state/property representation.
- Motion words that are not strict compass directions (`UPWAR`, `INWAR`, `OUT`) still need
  legacy behavior and parser compatibility.
- Parser modernization must not alter game logic (especially random travel and forced transitions).

## 7) Recommended implementation order

1. Implement travel table generation from `generated/Travel.ni` comments into a typed
   dispatch structure (data-only, no behavior).
2. Emit direct map edges for strict direction-only `goto` rules.
3. Add generic generated dispatcher for non-direct `goto`.
4. Add forced and random `goto` handling.
5. Add `speak` path (message key lookup/prompt behavior).
6. Add special-motion handling stubs for `action: ["special", 1|2|3]`.
7. Add parser hooks for non-compass movement tokens and magic words.
8. Fill condition evaluators (`carry`, `with`, `not`, `nodwarves`) once object/state APIs
   are available.
