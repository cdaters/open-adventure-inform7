# Milestone 4B: Troll / Bridge / Chasm System

## Objective

Implement the Open Adventure troll/bridge travel rules (`216`, `226`) through the runtime
special-travel pipeline while leaving larger endgame or scoring systems for later milestones.

## Rule coverage

| Rule | Source | Action | Condition | Destination | Travel result |
| --- | --- | --- | --- | --- | --- |
| 216 | `LOC_SWCHASM` | `special` (`3`) | none | `over` (to `LOC_NECHASM`) | Troll bridge crossing from SW side |
| 226 | `LOC_NECHASM` | `special` (`3`) | none | `over` (to `LOC_SWCHASM`) | Troll bridge crossing from NE side |

## Reference trace summary

- **Open Adventure C**: `references/open-adventure-c/main.c` case `3` in the
  travel dispatcher is the source of truth for bridge payment/state transitions and bear
  collision collapse behavior.
  - `TROLL_PAIDONCE` means the troll has just allowed a crossing and now blocks re-crossing
    until state resets to `TROLL_UNPAID`.
  - `TROLL_UNPAID` transitions to `TROLL_PAIDONCE` after a successful bridge crossing.
  - If player carries `BEAR`, the bridge collapses; state changes are propagated to `CHASM`.
- **Inform 6** (`references/nelson-inform6/Advent.inf`) models the bridge and troll as
  room/thing objects (`On_Sw_Side_Of_Chasm`, `On_Ne_Side_Of_Chasm`, `Troll`, `RicketyBridge`,
  `Wreckage`) and uses function `CrossRicketyBridge` for entry gating and collapse text.
  - If troll has already taken a treasure or is absent, the function allows crossing but
    keeps bridge state transitions pending.
  - If the bear is following, `deadflag` is raised with the collapse narration.
- **Conley Inform 7**: this snapshot does not contain a direct equivalent implementation
  for the chasm/troll bridge mechanism; behavior is therefore reconstructed from the C and
  Inform 6 sources.

## Runtime state model

### `CHASM`

- `TROLL_BRIDGE`: bridge available and troll can block
- `BRIDGE_WRECKED`: bridge no longer passable (handled by existing `BRIDGE_GONE` row logic in travel)

### `TROLL`

- `TROLL_UNPAID`: default/cold state; first crossing without prior payment
- `TROLL_PAIDONCE`: one paid crossing is active; next cross blocks and resets
- `TROLL_GONE`: consumed by bear-collapse path (preliminary integration in this milestone)

### `BEAR`

- `UNTAMED_BEAR`: baseline carry/travel interactions
- `BEAR_DEAD`: terminal branch marker from bridge-collapse path (death side effects deferred)

State initialization and ownership are handled in `When play begins` in `OpenAdventure_Troll.ni`:

- enables `subsystem troll`
- sets unresolved states when empty values are found.

## Room and object dependencies

- Chasm rooms: `LOC_SWCHASM`, `LOC_NECHASM`
- Supporting objects: `TROLL`, `BEAR`, `CHASM`
- Travel rows are only resolved through `generated/Travel.ni` special-ID `3` rows.

## Travel behavior implementation (runtime)

Implemented in `OpenAdventure_Troll.ni`:

1. Register special-ID routing in `OpenAdventure_Runtime.ni`:
   - `oa-dispatch-openadventure-special` case for special ID `3` now calls
     `oa-handle-troll-bridge-special`.
2. `OpenAdventure_Troll.ni` provides:
   - destination helper that maps `LOC_SWCHASM` ↔ `LOC_NECHASM`
   - `TROLL_UNPAID → TROLL_PAIDONCE` on first paid crossing path
   - `TROLL_PAIDONCE` branch that blocks subsequent immediate crossing attempt and resets
     to `TROLL_UNPAID`
   - Bear collapse path:
     - sets `CHASM` to `BRIDGE_WRECKED`
     - moves `BEAR` with player into destination
     - sets `BEAR` fixed and `BEAR_DEAD`
     - emits collapse message

## Open items / blockers (resolved status)

- `216`/`226` are now implemented as concrete hand-authored runtime handlers.
- The legacy one-way death/reincarnation semantics from C (`croak()`) are **not yet modeled**
  in this repository's current scaffold; this remains a later integration point.
- Troll and bridge object/room narration details (`TROLL` noun behavior, wreckage propagation,
  special room descriptions) are implemented only to the extent required for travel resolution.

## Parser + travel dependencies

- Handler is invoked only through `openadventure non-direct travel` in `OpenAdventure_Runtime.ni`.
- No direct parser verb customizations are added in 4B; movement command compatibility remains in
  existing travel-row verb matching.

## Integration notes

- `subsystem troll` is enabled at startup so subsystem priority checks can later override
  or coordinate with future movement/event systems.
- Existing special-handling flow remains stable so remaining gameplay systems can continue to use
  the same dispatch shape.

## Tests and validation

### Smoke tests added

- `tests/smoke/03-troll-system.sh` checks:
  - `generated/Travel.ni` still contains `LOC_SWCHASM` and `LOC_NECHASM` rows for special `3`.
  - `OpenAdventure_Runtime.ni` dispatches special ID `3` to `oa-handle-troll-bridge-special`.
  - `OpenAdventure_Troll.ni` exposes the bridge handler and startup state defaults.

### Recommended manual checks

1. `over` from `LOC_SWCHASM` with `TROLL` default/unpaid.
2. Repeat `over` on return path while in paid state and verify block message.
3. Traverse with `BEAR` carried to exercise bridge-collapse branch text.

## Effort (4B)

- Rule 216: **5**
- Rule 226: **5**
- Total 4B effort: **10**
