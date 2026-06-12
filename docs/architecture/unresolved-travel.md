# Milestone 2D: Unresolved Travel Investigation

This document maps the unresolved travel rows identified in `docs/architecture/non-direct-travel.md` and records where each rule is implemented today.

Resolved status (from `generated/Travel.ni`): unresolved rule IDs = `110, 138, 190, 193, 194, 216, 226`.

## Rule-by-rule analysis

| Rule | Source (`source/adventure.yaml`) | Destination | Action type | Condition | Objects | Messages at rule level | Implementation trace | Primary category | Effort |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 110 | `LOC_Y2` block at [source/adventure.yaml:839](source/adventure.yaml:839), travel row 853-855 | `special 2` (`src/adventure.yaml` action: `special` with numeric `2`) | `special_conditional` in generated table (`generated/Travel.ni:1255`) | `carry EMERALD` | `EMERALD` | no static travel message; special handler emits `MUST_DROP` indirectly when payload conditions fail in C path | Open Adventure C: `special` dispatch `case 2` in `references/open-adventure-c/main.c:785-806` drops emerald and advances to next rule; Advent.inf: `At_Y2` `before [Plover]` moves emerald to `In_Plover_Room` and sends player there; Conley Adventure.ni: has `Y2` and `Plugh` text, no equivalent `Plover` special-carry handling in this snapshot | movement behavior (puzzle/weight handling) | **Generated:** add/retain `dest_special=2` row as generated metadata; **Hand-written:** implement special handler `special_travel_2` and wire to plover-entrance transition; **Extension:** keep handler symbol table keyed by special id for shared behavior across `At_Y2` + plover exits. | 5 |
| 138 | `LOC_LONGWEST` block at [source/adventure.yaml:1192](source/adventure.yaml:1192), south rule at line 1203 | `LOC_DIFFERENT1` via `goto` conditional | `goto_conditional` (`generated/Travel.ni:1283`) | `nodwarves` | none | no message in travel row; message behavior is movement filtering result | Open Adventure C: `travel[kk].nodwarves` checked in dwarf mover (`references/open-adventure-c/main.c:411`), so this exit is excluded from pirate-facing movement candidates; make_dungeon encodes special condition as `cond == 100` -> `nodwarves` (`references/open-adventure-c/make_dungeon.py:441-448`, `523-568`); Advent.inf: `At_West_End_Of_Long_Hall` has `s_to Different_Maze_1` ([Advent.inf:879-887](references/nelson-inform6/Advent.inf:879)), no dwarf-blocking condition; Conley Adventure.ni: `West End of Long Hall` exists but no south-to-maze transition in this snapshot (`[West End ... is west from East End...]` etc), so no direct equivalent | movement behavior | **Generated:** preserve `cond_nodwarves` metadata in travel rows; **Hand-written:** integrate parser/runtime check against current dwarf movement policy before applying this exit and keep fallback to `Different_Maze`-equivalent behavior; **Extension:** add a reusable “exit blocked for dwarves” predicate reusable by future map regions. | 6 |
| 190 | `LOC_ALCOVE` block at [source/adventure.yaml:1662](source/adventure.yaml:1662), east/passa rule at line 1674 | `special 1` | `special` (`generated/Travel.ni:1335`) | none | none | no static message | Open Adventure C: `special` dispatch `case 1` in `references/open-adventure-c/main.c:767-784` enforces emerald-only tunnel-fit; Advent.inf: `In_Alcove` east path is inline room rule returning `In_Plover_Room` only when `j == 0` or only emerald is carried, else prints squeeze message [Adventure.inf:2098-2104](references/nelson-inform6/Advent.inf:2098); Conley Adventure.ni: no `Alcove` or plover tunnel rule present | movement behavior | **Generated:** emit `special=1` as runtime-dispatch metadata and avoid hard-coded room-level rule; **Hand-written:** implement shared tunnel-fit evaluator used by both 190/193 and 194, returning destination + optional failure message; **Extension:** centralize inventory-capacity checks for future narrow-path mechanics. | 6 |
| 193 | `LOC_PLOVER` block at [source/adventure.yaml:1677](source/adventure.yaml:1677), west/passa/out rule at line 1687 | `special 1` | `special` (`generated/Travel.ni:1338`) | none | none | no static message | Open Adventure C: same `case 1` handler as above, inverse direction of tunnel exit allowed only with emerald-capacity rule; Advent.inf: `In_Plover_Room` west rule mirrors alcove rule and emits same squeeze text when overburdened [Adventure.inf:2115-2120](references/nelson-inform6/Advent.inf:2115); Conley Adventure.ni: no `In Plover Room`/`special` equivalent in this snapshot | movement behavior | **Generated:** retain as `dest_special=1` metadata; **Hand-written:** reuse handler from rule 190 (`special_travel_1`), driven by active verb and source context; **Extension:** expose direction+source-aware helper for other constrained passageways. | 4 |
| 194 | `LOC_PLOVER` block at [source/adventure.yaml:1677](source/adventure.yaml:1677), emerald conditional rule at line 1689 | `special 2` | `special_conditional` (`generated/Travel.ni:1339`) | `carry EMERALD` | `EMERALD` | no static message | Open Adventure C: `case 2` handler (same as rule 110): drops emerald and continues sibling-scan so follow-up plover movement path can resolve (`references/open-adventure-c/main.c:785-806`); Advent.inf: same `In_Plover_Room` `before Plover` path moves emerald into room and returns there (special-case), while `children(player)` checks are used for size; Conley: no plover section available | movement behavior (puzzle logic) | **Generated:** keep special+condition metadata (`dest_special=2` + carry check); **Hand-written:** implement as part of `special_travel_2` shared with rule 110, including fallback path scan; **Extension:** keep special2 available as a generic “drop-key-and-retry-current-motion” primitive. | 5 |
| 216 | `LOC_SWCHASM` block at [source/adventure.yaml:1935](source/adventure.yaml:1935), over rule at line 1950 | `special 3` | `special` (`generated/Travel.ni:1361`) | none | none | no static message; movement success/failure messaging comes from bridge/troll routine | Open Adventure C: `case 3` in `references/open-adventure-c/main.c:807-860` handles troll-state transitions, cross-room calculation, bridge collapse + bear drop, and returns/tells as needed; Advent.inf: `On_Sw_Side_Of_Chasm` + `CrossRicketyBridge` function, `Jump` hard-fail, bridge/troll text and bridge collapse logic (`references/nelson-inform6/Advent.inf:2396-2430`); Conley Adventure.ni: no chasm/troll/bridge section present | movement behavior (gameplay system) | **Generated:** retain special3 row as opaque special id; **Hand-written:** implement shared `special_travel_3` with side-effects exactly matching current C/Inf behavior (troll payment state, deadflag, bear/bridge collapse); **Extension:** model chasm crossings as dedicated gameplay system events so other room pairs can reuse stateful crossing logic. | 8 |
| 226 | `LOC_NECHASM` block at [source/adventure.yaml:1999](source/adventure.yaml:1999), over rule at line 2010 | `special 3` | `special` (`generated/Travel.ni:1371`) | none | none | no static message; as above, messaging is in runtime special handler | Open Adventure C: same `case 3` handler used for both chasm sides (`main.c:807-860`); Advent.inf: `On_Ne_Side_Of_Chasm` `sw_to CrossRicketyBridge` and shared `CrossRicketyBridge` object/routine [Adventure.inf:2504-2510](references/nelson-inform6/Advent.inf:2504); Conley Adventure.ni: no chasm section | movement behavior (gameplay system) | **Generated:** no new generator logic needed beyond special dispatch mapping; **Hand-written:** share `special_travel_3` with rule 216 and keep room-agnostic state transitions; **Extension:** add a parameterized chasm bridge descriptor for future side-specific variants. | 8 |

## Cross-source notes

- In all seven cases the generated row exists with explicit action type and conditions, but they require behavior that is not expressible in plain generated travel metadata alone.
- `special` values map to C `dest_special` handlers as follows in `make_dungeon.py` (`references/open-adventure-c/make_dungeon.py:423-424`, `548-557`) and are dispatched in `main.c` (`references/open-adventure-c/main.c:766-860`).
- `nodwarves` is encoded as condition code `100` in generator output and passed through to runtime (`make_dungeon.py:441-442`, `523-525`) and checked in the C dwarf movement pass (`main.c:411`).

## Recommendations

### Generated implementation
- Keep these seven rows in generated data, but annotate them with runtime `travel_action` tags:
  - `special1` (plover tunnel capacity)
  - `special2` (plover-emerald handling)
  - `special3` (chasm/troll bridge handling)
  - `cond_nodwarves` (blocked for dwarf movement candidate selection)

### Hand-written implementation
- Add a hand-authored movement-special layer in Inform 6/7 (not `OpenAdventure.ni`, per milestone constraint) that:
  1. reads `generated/Travel.ni` rows;
  2. dispatches special ids to local handlers;
  3. mirrors C/Inf side effects and messages closely;
  4. treats `nodwarves` as an exclusion predicate for candidate exits during movement.

### Future extension point
- Introduce a `travel_special_handlers` registry keyed by special id and a separate `movement_predicate_registry` keyed by predicate id.
  - This allows adding new special movement mechanics without changing generated YAML/Travel emitter structure.
  - Keeps generator logic stable while gameplay logic evolves in dedicated runtime code.

## Estimated effort summary

- Rule 110: **5**
- Rule 138: **6**
- Rule 190: **6**
- Rule 193: **4**
- Rule 194: **5**
- Rule 216: **8**
- Rule 226: **8**

Total estimated implementation effort (analysis-only guidance): **42 effort units**

## Mapping quality caveat

`references/conley-inform7/Adventure.ni` provides Y2 and long-hall room structure but does not include the plover/alcove/chasm passage implementations present in other references, so full one-to-one traceability for rules `190, 193, 194, 216, 226` is not available in that snapshot.
