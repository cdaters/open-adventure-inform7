# Milestone 2D: Unresolved Travel Investigation

This document maps the unresolved travel rows identified in `docs/architecture/non-direct-travel.md` and tracks implementation status.

Resolved status (from `generated/Travel.ni`): historically unresolved rule IDs were `110, 138, 190, 193, 194`; after Milestone 4B, unresolved travel blockers were down to `138`.
Milestone 4C resolves `138`, so there are no unresolved non-direct travel rows currently blocked by unresolved systems.

Milestone 4B resolves rules `216` and `226` (troll bridge/chasm special travel) and records the concrete implementation in `docs/architecture/troll-system.md`.

## Rule-by-rule analysis

| Rule | Source (`source/adventure.yaml`) | Destination | Action type | Condition | Objects | Messages at rule level | Implementation trace | Primary category | Effort |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 110 | `LOC_Y2` block at [source/adventure.yaml:839](source/adventure.yaml:839), travel row 853-855 | `special 2` (`src/adventure.yaml` action: `special` with numeric `2`) | `special_conditional` in generated table (`generated/Travel.ni:1255`) | `carry EMERALD` | `EMERALD` | no static travel message; special handler emits `MUST_DROP` indirectly when payload conditions fail in C path | Open Adventure C: `special` dispatch `case 2` in `references/open-adventure-c/main.c:785-806` drops emerald and advances to next rule; Advent.inf: `At_Y2` `before [Plover]` moves emerald to `In_Plover_Room` and sends player there; Conley Adventure.ni: has `Y2` and `Plugh` text, no equivalent `Plover` special-carry handling in this snapshot | movement behavior (puzzle logic) | **Generated:** add/retain `dest_special=2` row as generated metadata; **Hand-written:** implement special handler `special_travel_2` and wire to plover-entrance transition; **Extension:** keep handler symbol table keyed by special id for shared behavior across `At_Y2` + plover exits. |
| 190 | `LOC_ALCOVE` block at [source/adventure.yaml:1662](source/adventure.yaml:1662), east/passa rule at line 1674 | `special 1` | `special` (`generated/Travel.ni:1335`) | none | none | no static message | Open Adventure C: `special` dispatch `case 1` in `references/open-adventure-c/main.c:767-784` enforces emerald-only tunnel-fit; Advent.inf: `In_Alcove` east path is inline room rule returning `In_Plover_Room` only when `j == 0` or only emerald is carried, else prints squeeze message [Adventure.inf:2098-2104](references/nelson-inform6/Advent.inf:2098); Conley Adventure.ni: no `Alcove` or plover tunnel rule present | movement behavior | **Generated:** emit `special=1` as runtime-dispatch metadata and avoid hard-coded room-level rule; **Hand-written:** implement shared tunnel-fit evaluator used by both 190/193 and 194, returning destination + optional failure message; **Extension:** centralize inventory-capacity checks for future narrow-path mechanics. |
| 193 | `LOC_PLOVER` block at [source/adventure.yaml:1677](source/adventure.yaml:1677), west/passa/out rule at line 1687 | `special 1` | `special` (`generated/Travel.ni:1338`) | none | none | no static message | Open Adventure C: same `case 1` handler as above, inverse direction of tunnel exit allowed only with emerald-capacity rule; Advent.inf: `In_Plover_Room` west rule mirrors alcove rule and emits same squeeze text when overburdened [Adventure.inf:2115-2120](references/nelson-inform6/Advent.inf:2115); Conley Adventure.ni: no `In Plover Room`/`special` equivalent in this snapshot | movement behavior | **Generated:** retain as `dest_special=1` metadata; **Hand-written:** reuse handler from rule 190 (`special_travel_1`), driven by active verb and source context; **Extension:** expose direction+source-aware helper for other constrained passageways. |
| 194 | `LOC_PLOVER` block at [source/adventure.yaml:1677](source/adventure.yaml:1677), emerald conditional rule at line 1689 | `special 2` | `special_conditional` (`generated/Travel.ni:1339`) | `carry EMERALD` | `EMERALD` | no static message | Open Adventure C: `case 2` handler (same as rule 110): drops emerald and continues sibling-scan so follow-up plover movement path can resolve (`references/open-adventure-c/main.c:785-806`); Advent.inf: same `In_Plover_Room` `before Plover` path moves emerald into room and returns there (special-case), while `children(player)` checks are used for size; Conley: no plover section available | movement behavior (puzzle logic) | **Generated:** keep special+condition metadata (`dest_special=2` + carry check); **Hand-written:** implement as part of `special_travel_2` shared with rule 110, including fallback path scan; **Extension:** keep special2 available as a generic “drop-key-and-retry-current-motion” primitive. |

## Closed in Milestone 4B

| Rule | Source | Action | Result |
| --- | --- | --- | --- |
| 216 | `LOC_SWCHASM` over command at [source/adventure.yaml:1935](source/adventure.yaml:1935) | `special 3` (`generated/Travel.ni:1361`) | Implemented in `OpenAdventure_Troll.ni`; dispatch now routes through `oa-handle-troll-bridge-special`. |
| 226 | `LOC_NECHASM` over command at [source/adventure.yaml:1999](source/adventure.yaml:1999) | `special 3` (`generated/Travel.ni:1371`) | Implemented in `OpenAdventure_Troll.ni`; same handler used as 216 with side-agnostic chasm crossing state updates. |

## Closed in Milestone 4C

| Rule | Source | Result |
| --- | --- | --- |
| 138 | `LOC_LONGWEST` block at [source/adventure.yaml:1192](source/adventure.yaml:1192), south rule at line 1203 | `goto_conditional` (`generated/Travel.ni:1283`) | Implemented through the dwarf runtime surface in `OpenAdventure_Dwarves.ni` and `OpenAdventure_Conditions.ni`; row remains `nodwarves` metadata and now routes through `openadventure-dwarf-route is forbidden` so dwarf movement can apply Open Adventure's restriction while leaving player-facing dispatch available.

## In-file status update

- In remaining-unresolved gameplay notes: **none**.

## Cross-source notes

- In previously unresolved rows, the generated row exists with explicit action type and conditions, but behavior is not fully representable in metadata alone.
- `special` values map to C `dest_special` handlers as follows in `make_dungeon.py` (`references/open-adventure-c/make_dungeon.py:423-424`, `548-557`) and are dispatched in `main.c` (`references/open-adventure-c/main.c:766-860`).
- `nodwarves` is encoded as condition code `100` in generator output and passed through to runtime (`make_dungeon.py:441-442`, `523-525`) and checked in the C dwarf movement pass (`main.c:411`).
  - Milestone 4C surfaces this as `openadventure nodwarves traversal` in runtime, preserving existing generated metadata while making the gate implementation-owned.

## Recommendations

### Implemented milestone-specific recommendations

- `216` and `226`: implemented as a concrete special ID `3` handler in `OpenAdventure_Troll.ni`.
- `138` now routes through the dedicated dwarf subsystem surface and is no longer outstanding.
- Add dedicated travel blockers and state machine ownership as additional systems land (dwarf/pirate/etc.).

## Estimated effort summary

- Rule 110: **5**
- Rule 138: **6**
- Rule 190: **6**
- Rule 193: **4**
- Rule 194: **5**

Remaining unresolved travel effort (post-4C): **0 effort units**

## Mapping quality caveat

`references/conley-inform7/Adventure.ni` provides Y2 and long-hall room structure but does not include the chasm/troll bridge implementations present in other references, so full traceability for 216/226 remains one-way (C + Inform6). The remaining unresolved rules are documented with best-available source authority.
