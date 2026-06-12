# Object Analysis (adventure.yaml)

## Scope

This analysis is derived directly from `source/adventure.yaml` and reflects the
Milestone 1B object-pass generation pass. No gameplay logic was added in this
milestone; only generation metadata and declarations are emitted.

## Method

The generator classifies each object in a single pass using:

- `treasure: true` → **treasure**
- known actor IDs (`DRAGON`, `TROLL`, `TROLL2`, `SNAKE`, `BEAR`, `DWARF`, `OGRE`) → **creature**
- `immovable` + any behavioral fields (`states`, `changes`, `sounds`, `texts`) →
  **puzzle object**
- explicit non-portable movable exception and static scenic IDs (from review of object
  semantics) → **scenery**
- remaining immovable objects → **infrastructure/system**
- remaining movable non-special entries → **portable item**
- `NO_OBJECT` / malformed placeholders → **unknown**

## Totals

- Total objects: **70**
- unknown: **1**
- treasure: **20**
- portable item: **17**
- scenery: **5**
- puzzle object: **16**
- infrastructure/system: **4**
- creature: **7**

## Objects needing custom Inform 7 behavior (23)

These are split into:

- `creature` (7): `DWARF`, `DRAGON`, `TROLL`, `TROLL2`, `SNAKE`, `BEAR`, `OGRE`
- `puzzle object` (16): `GRATE`, `STEPS`, `DOOR`, `FISSURE`, `OBJ_13`, `MIRROR`,
  `PLANT`, `CHASM`, `MESSAG`, `VEND`, `URN`, `CAVITY`, `RESER`, `OBJ_47`,
  `OBJ_48`, `SIGN`

All other non-`unknown` objects can start life as generated definitions and
location/property declarations, subject to later gameplay wiring.

- Objects likely fully generated now: **46** (`treasure + portable + scenery + infrastructure`)

## Schema irregularities

- `NO_OBJECT` has no `words`, no `locations`, and no `descriptions`.
- `NO_INV` equivalents: `NO_OBJECT`, `DWARF`, `KNIFE`, `BEAR`
- `NO_DESC` equivalents: `NO_OBJECT`, `DWARF`, `KNIFE`, `WATER`, `OIL`,
  `OBJ_29`, `OBJ_30`, `VOLCANO`, `OBJ_40`
- Empty description strings are present in several entries (eg. `SNAKE`, `FISSURE`,
  `MIRROR`, `PLANT`, `TROLL`, etc.), so first non-empty description is used
  for generated defaults.
- Multi-location records (initial + alternate): `GRATE`, `STEPS`, `FISSURE`, `PLANT2`,
  `OBJ_27`, `DRAGON`, `CHASM`, `TROLL`, `TROLL2`, `RESER`, `RUG`

## Initial and alternate locations

`LOC_NOWHERE` is treated as not initially placed in the map when emitting source.

| Object | Role | Initial | Alternate | States | Inventory | Vocabulary |
| --- | --- | --- | --- | --- | --- | --- |
| NO_OBJECT | unknown |  |  |  |  |  |
| KEYS | portable | LOC_BUILDING |  |  | Set of keys | keys, key |
| LAMP | portable | LOC_BUILDING |  | LAMP_DARK, LAMP_BRIGHT | Brass lantern | lamp, lante |
| GRATE | puzzle | LOC_GRATE | LOC_BELOWGRATE | GRATE_CLOSED, GRATE_OPEN | *grate | grate |
| CAGE | portable | LOC_COBBLE |  |  | Wicker cage | cage |
| ROD | portable | LOC_DEBRIS |  |  | Black rod | rod |
| ROD2 | portable | LOC_NOWHERE |  |  | Black rod | rod |
| STEPS | puzzle | LOC_PITTOP | LOC_MISTHALL | STEPS_DOWN, STEPS_UP | *steps | steps |
| BIRD | portable | LOC_BIRDCHAMBER |  | BIRD_UNCAGED, BIRD_CAGED, BIRD_FOREST_UNCAGED | Little bird in cage | bird |
| DOOR | puzzle | LOC_IMMENSE |  | DOOR_RUSTED, DOOR_UNRUSTED | *rusty door | door |
| PILLOW | portable | LOC_SOFTROOM |  |  | Velvet pillow | pillo, velve |
| SNAKE | creature | LOC_KINGHALL |  | SNAKE_BLOCKS, SNAKE_CHASED | *snake | snake |
| FISSURE | puzzle | LOC_EASTBANK | LOC_WESTBANK | UNBRIDGED, BRIDGED | *fissure | fissu |
| OBJ_13 | puzzle | LOC_DARKROOM |  |  | *stone tablet | table |
| CLAM | scenery | LOC_SHELLROOM |  |  | Giant clam  >GRUNT!< | clam |
| OYSTER | portable | LOC_NOWHERE |  |  | Giant oyster  >GROAN!< | oyste |
| MAGAZINE | portable | LOC_ANTEROOM |  |  | "Spelunker Today" | magaz, issue, spelu, "spel |
| DWARF | creature | LOC_NOWHERE |  |  |  | dwarf, dwarv |
| KNIFE | portable | LOC_NOWHERE |  |  |  | knife, knive |
| FOOD | portable | LOC_BUILDING |  |  | Tasty food | food, ratio |
| BOTTLE | portable | LOC_BUILDING |  | WATER_BOTTLE, EMPTY_BOTTLE, OIL_BOTTLE | Small bottle | bottl, jar |
| WATER | portable | LOC_NOWHERE |  |  | Water in the bottle | water, h2o |
| OIL | portable | LOC_NOWHERE |  |  | Oil in the bottle | oil |
| MIRROR | puzzle | LOC_MIRRORCANYON |  | MIRROR_UNBROKEN, MIRROR_BROKEN | *mirror | mirro |
| PLANT | puzzle | LOC_WESTPIT |  | PLANT_THIRSTY, PLANT_BELLOWING, PLANT_GROWN | *plant | plant, beans |
| PLANT2 | infrastructure | LOC_WESTEND | LOC_EASTEND |  | *phony plant | plant |
| OBJ_26 | scenery | LOC_TOPSTALACTITE |  |  | *stalactite | stala |
| OBJ_27 | scenery | LOC_WINDOW1 | LOC_WINDOW2 |  | *shadowy figure and/or window | shado, figur, windo |
| AXE | portable | LOC_NOWHERE |  | AXE_HERE, AXE_LOST | Dwarf's axe | axe |
| OBJ_29 | scenery | LOC_ORIENTAL |  |  | *cave drawings | drawi |
| OBJ_30 | infrastructure | LOC_NOWHERE |  |  | *pirate/genie | pirat, genie, djinn |
| DRAGON | creature | LOC_SECRET4 | LOC_SECRET6 | DRAGON_BARS, DRAGON_DEAD, DRAGON_BLOODLESS | *dragon | drago |
| CHASM | puzzle | LOC_SWCHASM | LOC_NECHASM | TROLL_BRIDGE, BRIDGE_WRECKED | *chasm | chasm |
| TROLL | creature | LOC_SWCHASM | LOC_NECHASM | TROLL_UNPAID, TROLL_PAIDONCE, TROLL_GONE | *troll | troll |
| TROLL2 | creature | LOC_NOWHERE | LOC_NOWHERE |  | *phony troll | troll |
| BEAR | creature | LOC_BARRENROOM |  | UNTAMED_BEAR, SITTING_BEAR, CONTENTED_BEAR, BEAR_DEAD |  | bear |
| MESSAG | puzzle | LOC_NOWHERE |  |  | *message in second maze | messa |
| VOLCANO | infrastructure | LOC_BREATHTAKING |  |  | *volcano and/or geyser | volca, geyse |
| VEND | puzzle | LOC_DEADEND13 |  | VEND_BLOCKS, VEND_UNBLOCKS | *vending machine | machi, vendi |
| BATTERY | portable | LOC_NOWHERE |  | FRESH_BATTERIES, DEAD_BATTERIES | Batteries | batte |
| OBJ_40 | infrastructure | LOC_SOFTROOM |  |  | *carpet and/or moss and/or curtains | carpe, moss |
| OGRE | creature | LOC_LARGE |  |  | *ogre | ogre |
| URN | puzzle | LOC_CLIFF |  | URN_EMPTY, URN_DARK, URN_LIT | *urn | urn |
| CAVITY | puzzle | LOC_NOWHERE |  | CAVITY_FULL, CAVITY_EMPTY | *cavity | cavit |
| BLOOD | scenery | LOC_NOWHERE |  |  | *blood | blood |
| RESER | puzzle | LOC_RESERVOIR | LOC_RESNORTH | WATERS_UNPARTED, WATERS_PARTED | *reservoir | reser |
| RABBITFOOT | portable | LOC_FOREST22 |  |  | Leporine appendage | appen, lepor |
| OBJ_47 | puzzle | LOC_DEBRIS |  |  | *mud | mud |
| OBJ_48 | puzzle | LOC_NUGGET |  |  | *note | note |
| SIGN | puzzle | LOC_ANTEROOM |  | INGAME_SIGN, ENDGAME_SIGN | *sign | sign |
| NUGGET | treasure | LOC_NUGGET |  |  | Large gold nugget | gold, nugge |
| OBJ_51 | treasure | LOC_WESTBANK |  |  | Several diamonds | diamo |
| OBJ_52 | treasure | LOC_FLOORHOLE |  |  | Bars of silver | silve, bars |
| OBJ_53 | treasure | LOC_SOUTHSIDE |  |  | Precious jewelry | jewel |
| COINS | treasure | LOC_WESTSIDE |  |  | Rare coins | coins |
| CHEST | treasure | LOC_NOWHERE |  |  | Treasure chest | chest, box, treas |
| EGGS | treasure | LOC_GIANTROOM |  | EGGS_HERE, EGGS_VANISHED, EGGS_DONE | Golden eggs | eggs, egg, nest |
| TRIDENT | treasure | LOC_WATERFALL |  |  | Jeweled trident | tride |
| VASE | treasure | LOC_ORIENTAL |  | VASE_WHOLE, VASE_DROPPED, VASE_BROKEN | Ming vase | vase, ming, shard, potte |
| EMERALD | treasure | LOC_PLOVER |  |  | Egg-sized emerald | emera |
| PYRAMID | treasure | LOC_DARKROOM |  |  | Platinum pyramid | plati, pyram |
| PEARL | treasure | LOC_NOWHERE |  |  | Glistening pearl | pearl |
| RUG | treasure | LOC_SECRET4 | LOC_SECRET6 | RUG_FLOOR, RUG_DRAGON, RUG_HOVER | Persian rug | rug, persi |
| OBJ_63 | treasure | LOC_BOULDERS2 |  |  | Rare spices | spice |
| CHAIN | treasure | LOC_BARRENROOM |  | CHAIN_HEAP, CHAINING_BEAR, CHAIN_FIXED | Golden chain | chain |
| RUBY | treasure | LOC_STOREROOM |  |  | Giant ruby | ruby |
| JADE | treasure | LOC_NOWHERE |  |  | Jade necklace | jade, neckl |
| AMBER | treasure | LOC_NOWHERE |  | AMBER_IN_URN, AMBER_IN_ROCK | Amber gemstone | amber, gemst |
| SAPPH | treasure | LOC_LEDGE |  |  | Star sapphire | sapph |
| OBJ_69 | treasure | LOC_REACHDEAD |  |  | Ebony statuette | ebony, statu |

## State information summary

- States present: many objects, especially movable and puzzle-like objects.
- Objects with state transitions are emitted with raw state token metadata comments and
  can be wired to custom Inform properties/phrases later.

## Notes for next milestone

- `generated/Objects.ni` should be regenerated through `python3 tools/yaml2inform.py`
  after parser changes; no manual edits are applied to generated output.
