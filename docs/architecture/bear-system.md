# Bear System (Milestone 5B)

## Scope

Milestone 5B implements the Open Adventure bear puzzle baseline and its troll/bridge interaction. Open Adventure C is authoritative; Advent.inf and Conley Inform 7 were checked for comparison.

## Source Trace

### Open Adventure C

The main behavior lives in `references/open-adventure-c/actions.c` and the bridge interaction in `references/open-adventure-c/main.c`.

- `feed()` consumes `FOOD`, releases a lost axe from bear protection, and changes `BEAR` to `SITTING_BEAR`.
- `chain()` prevents unlocking while `BEAR` is `UNTAMED_BEAR`, changes `CHAIN` to `CHAIN_HEAP`, and changes non-dead `BEAR` to `CONTENTED_BEAR`.
- `vcarry()` prevents taking the untamed bear or chained friendly bear; the unchained bear can be carried/follow the player.
- `discard()` lets a dropped carried bear drive the troll away.
- `throwit()` routes thrown food to bear feeding and makes an axe thrown at an untamed bear inaccessible until the bear is fed.
- Special travel `3` collapses the bridge if the bear is carried across, kills the bear, and routes into death/reincarnation.

### Advent.inf

Nelson's Inform 6 implementation has the same broad state machine: friendly bear after feeding, following after taking the unchained bear, locked chain blocking, troll scaring, and bridge collapse while the bear follows.

### Conley Inform 7

Conley's snapshot includes parser/lock foundations and food object handling, but not a close Open Adventure C bear implementation.

## Implemented Model

### State

Declared in `OpenAdventure_State.ni`:

- `openadventure-subsystem-bear`.
- `openadventure-bear-is-following`.
- `openadventure-bear-guards-axe`.
- `openadventure-bear-last-event`.

Object state remains stored through `adventure-state`:

- `BEAR`: `UNTAMED_BEAR`, `SITTING_BEAR`, `CONTENTED_BEAR`, `BEAR_DEAD`.
- `CHAIN`: `CHAIN_HEAP`, `CHAINING_BEAR`, `CHAIN_FIXED`.
- `AXE`: `AXE_HERE`, `AXE_LOST`.
- `TROLL`: `TROLL_UNPAID`, `TROLL_PAIDONCE`, `TROLL_GONE`.
- `CHASM`: `TROLL_BRIDGE`, `BRIDGE_WRECKED`.

### Bear State Transitions

- Startup initializes `BEAR` to `UNTAMED_BEAR` and `CHAIN` to `CHAINING_BEAR` when blank.
- Feeding an untamed bear consumes `FOOD` and sets `BEAR` to `SITTING_BEAR`.
- Unlocking the chain after feeding sets `CHAIN` to `CHAIN_HEAP` and `BEAR` to `CONTENTED_BEAR`.
- Taking a contented, unchained bear moves it to the player and marks it following.
- Dropping the bear clears following.
- Bridge collapse sets `BEAR` to `BEAR_DEAD`.

### Food Interactions

`OpenAdventure_Bear.ni` adds a narrow `feeding` action:

- `feed bear` feeds the bear if food is here or carried.
- `feed food` maps to the bear when the bear is present.
- `give food to bear` and `throw food at bear` also feed the bear.

### Chain Interactions

- `open/unlock chain` and `unlock chain with keys` call the bear-chain unlock handler.
- `close/lock chain` and `lock chain with keys` call the bear-chain lock handler.
- Unlocking requires `KEYS` here or carried.
- Unlocking while the bear is untamed prints the C `BEAR_BLOCKS` message.
- Taking a locked chain prints the C locked-chain responses.
- Once unlocked, `CHAIN` is portable and remains a scoring treasure.

### Axe Interactions

- Attacking the bear with bare hands prints the C bear-hands or friendly-confusion messages.
- Throwing `AXE` at an untamed bear moves the axe to the room, fixes it in place, sets `AXE_LOST`, and marks it guarded.
- Feeding the bear clears the guarded-axe state and makes the axe portable again.

### Troll Interactions

- Dropping the carried bear at either side of the troll bridge marks `TROLL_GONE`, moves the troll away, and prints the bear-scares-troll message.
- `OpenAdventure_Troll.ni` now routes bear bridge collapse into `handle openadventure death caused by "bear_bridge"`.
- Bridge collapse sets `CHASM` to `BRIDGE_WRECKED`, `TROLL` to `TROLL_GONE`, and `BEAR` to `BEAR_DEAD`.

### Movement and Following

The C implementation models the bear as carried/toting. The Inform 7 baseline does the same by moving `BEAR` to the player after `take bear`.

`OpenAdventure_Runtime.ni` also calls `run openadventure bear post-travel hooks ...` so bear-following state remains synchronized after movement.

### Scoring Implications

`CHAIN` is already present in `Table of Open Adventure Treasure Scores`. Making the chain portable after unlock allows the existing scoring subsystem to award discovery/deposit credit when the player finds and deposits it.

No separate bear score delta is added in Milestone 5B.

## Runtime Integration

- `OpenAdventure.ni` includes `OpenAdventure_Bear.ni`.
- `build.sh` composes `OpenAdventure_Bear.ni`.
- `OpenAdventure_Runtime.ni` runs bear post-travel hooks after dwarf hooks and before scoring hooks.
- `OpenAdventure_Troll.ni` delegates bridge-collapse death to the reincarnation subsystem.
- `OpenAdventure_Scoring.ni` scores `CHAIN` through existing treasure tracking.

## Parity Gaps

- Transcript-level bear puzzle validation is pending.
- The C exact object-order and fixed-second-location mechanics are approximated through Inform object placement.
- Full troll dual-location display remains a future hardening task inherited from the troll subsystem.
- Full lamp/darkness context for bear following is pending the darkness/lamp hazard subsystem.
