Version 1 of OpenAdventure Objects by OpenAdventure begins here.

[ Exported from Objects.ni by tools/make_author_edition.py. ]

[ Generated Objects ]
[ Object role taxonomy ]
[ treasure: object with adventure.yaml treasure: true ]
[ portable: movable items (default unless special-cased) ]
[ scenery: static environmental objects ]
[ puzzle: mutable objects with states/changes/sounds/texts ]
[ infrastructure: immovable support objects in the physical model ]
[ creature: active actor entities ]
[ unknown: unrepresentable/placeholder entries ]

[ role summary ]
[ unknown=1 | treasure=20 | portable=17 | scenery=5 | puzzle=16 | infrastructure=4 | creature=7 ]

[ Role: treasure ]
[ NUGGET ]
[ role=treasure ]
[ initial_location=LOC_NUGGET ]
[ vocabulary=gold, nugge ]
[ inventory=Large gold nugget ]
NUGGET is a thing.
The printed name of NUGGET is "large gold nugget".
The description of NUGGET is "There is a large sparkling nugget of gold here!".
NUGGET is in LOC_NUGGET.
[ scoring_candidate: true ]

[ OBJ_51 ]
[ role=treasure ]
[ initial_location=LOC_WESTBANK ]
[ vocabulary=diamo ]
[ inventory=Several diamonds ]
OBJ_51 is a thing.
The printed name of OBJ_51 is "several diamonds".
OBJ_51 is plural-named.
The description of OBJ_51 is "There are diamonds here!".
OBJ_51 is in LOC_WESTBANK.
[ scoring_candidate: true ]

[ OBJ_52 ]
[ role=treasure ]
[ initial_location=LOC_FLOORHOLE ]
[ vocabulary=silve, bars ]
[ inventory=Bars of silver ]
OBJ_52 is a thing.
The printed name of OBJ_52 is "bars of silver".
OBJ_52 is plural-named.
The description of OBJ_52 is "There are bars of silver here!".
OBJ_52 is in LOC_FLOORHOLE.
[ scoring_candidate: true ]

[ OBJ_53 ]
[ role=treasure ]
[ initial_location=LOC_SOUTHSIDE ]
[ vocabulary=jewel ]
[ inventory=Precious jewelry ]
OBJ_53 is a thing.
The printed name of OBJ_53 is "precious jewelry".
The description of OBJ_53 is "There is precious jewelry here!".
OBJ_53 is in LOC_SOUTHSIDE.
[ scoring_candidate: true ]

[ COINS ]
[ role=treasure ]
[ initial_location=LOC_WESTSIDE ]
[ vocabulary=coins ]
[ inventory=Rare coins ]
COINS is a thing.
The printed name of COINS is "rare coins".
COINS is plural-named.
The description of COINS is "There are many coins here!".
COINS is in LOC_WESTSIDE.
[ scoring_candidate: true ]

[ CHEST ]
[ role=treasure ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=chest, box, treas ]
[ inventory=Treasure chest ]
CHEST is a thing.
The printed name of CHEST is "treasure chest".
The description of CHEST is "The pirate's treasure chest is here!".
[ scoring_candidate: true ]

[ EGGS ]
[ role=treasure ]
[ initial_location=LOC_GIANTROOM ]
[ vocabulary=eggs, egg, nest ]
[ inventory=Golden eggs ]
[ states=EGGS_HERE, EGGS_VANISHED, EGGS_DONE ]
EGGS is a thing.
The printed name of EGGS is "golden eggs".
EGGS is plural-named.
The description of EGGS is "There is a large nest here, full of golden eggs!".
EGGS is in LOC_GIANTROOM.
[ scoring_candidate: true ]

[ TRIDENT ]
[ role=treasure ]
[ initial_location=LOC_WATERFALL ]
[ vocabulary=tride ]
[ inventory=Jeweled trident ]
TRIDENT is a thing.
The printed name of TRIDENT is "jeweled trident".
The description of TRIDENT is "There is a jewel-encrusted trident here!".
TRIDENT is in LOC_WATERFALL.
[ scoring_candidate: true ]

[ VASE ]
[ role=treasure ]
[ initial_location=LOC_ORIENTAL ]
[ vocabulary=vase, ming, shard, potte ]
[ inventory=Ming vase ]
[ states=VASE_WHOLE, VASE_DROPPED, VASE_BROKEN ]
[ changes=The vase is now resting, delicately, on a velvet pillow., The ming vase drops with a delicate crash., You have taken the vase and hurled it delicately to the ground. ]
VASE is a thing.
The printed name of VASE is "ming vase".
The description of VASE is "There is a delicate, precious, ming vase here!".
VASE is in LOC_ORIENTAL.
[ scoring_candidate: true ]

[ EMERALD ]
[ role=treasure ]
[ initial_location=LOC_PLOVER ]
[ vocabulary=emera ]
[ inventory=Egg-sized emerald ]
EMERALD is a thing.
The printed name of EMERALD is "egg-sized emerald".
The description of EMERALD is "There is an emerald here the size of a plover's egg!".
EMERALD is in LOC_PLOVER.
[ scoring_candidate: true ]

[ PYRAMID ]
[ role=treasure ]
[ initial_location=LOC_DARKROOM ]
[ vocabulary=plati, pyram ]
[ inventory=Platinum pyramid ]
PYRAMID is a thing.
The printed name of PYRAMID is "platinum pyramid".
The description of PYRAMID is "There is a platinum pyramid here, 8 inches on a side!".
PYRAMID is in LOC_DARKROOM.
[ scoring_candidate: true ]

[ PEARL ]
[ role=treasure ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=pearl ]
[ inventory=Glistening pearl ]
PEARL is a thing.
The printed name of PEARL is "glistening pearl".
The description of PEARL is "Off to one side lies a glistening pearl!".
[ scoring_candidate: true ]

[ RUG ]
[ role=treasure ]
[ initial_location=LOC_SECRET4 ]
[ alternate_locations=LOC_SECRET6 ]
[ vocabulary=rug, persi ]
[ inventory=Persian rug ]
[ states=RUG_FLOOR, RUG_DRAGON, RUG_HOVER ]
RUG is a thing.
The printed name of RUG is "persian rug".
The description of RUG is "There is a Persian rug spread out on the floor!".
RUG is in LOC_SECRET4.
[ scoring_candidate: true ]

[ OBJ_63 ]
[ role=treasure ]
[ initial_location=LOC_BOULDERS2 ]
[ vocabulary=spice ]
[ inventory=Rare spices ]
OBJ_63 is a thing.
The printed name of OBJ_63 is "rare spices".
OBJ_63 is plural-named.
The description of OBJ_63 is "There are rare spices here!".
OBJ_63 is in LOC_BOULDERS2.
[ scoring_candidate: true ]

[ CHAIN ]
[ role=treasure ]
[ initial_location=LOC_BARRENROOM ]
[ vocabulary=chain ]
[ inventory=Golden chain ]
[ states=CHAIN_HEAP, CHAINING_BEAR, CHAIN_FIXED ]
CHAIN is a thing.
The printed name of CHAIN is "golden chain".
The description of CHAIN is "There is a golden chain lying in a heap on the floor!".
CHAIN is in LOC_BARRENROOM.
[ scoring_candidate: true ]

[ RUBY ]
[ role=treasure ]
[ initial_location=LOC_STOREROOM ]
[ vocabulary=ruby ]
[ inventory=Giant ruby ]
RUBY is a thing.
The printed name of RUBY is "giant ruby".
The description of RUBY is "There is an enormous ruby here!".
RUBY is in LOC_STOREROOM.
[ scoring_candidate: true ]

[ JADE ]
[ role=treasure ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=jade, neckl ]
[ inventory=Jade necklace ]
JADE is a thing.
The printed name of JADE is "jade necklace".
The description of JADE is "A precious jade necklace has been dropped here!".
[ scoring_candidate: true ]

[ AMBER ]
[ role=treasure ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=amber, gemst ]
[ inventory=Amber gemstone ]
[ states=AMBER_IN_URN, AMBER_IN_ROCK ]
AMBER is a thing.
The printed name of AMBER is "amber gemstone".
The description of AMBER is "There is a rare amber gemstone here!".
[ scoring_candidate: true ]

[ SAPPH ]
[ role=treasure ]
[ initial_location=LOC_LEDGE ]
[ vocabulary=sapph ]
[ inventory=Star sapphire ]
SAPPH is a thing.
The printed name of SAPPH is "star sapphire".
The description of SAPPH is "A brilliant blue star sapphire is here!".
SAPPH is in LOC_LEDGE.
[ scoring_candidate: true ]

[ OBJ_69 ]
[ role=treasure ]
[ initial_location=LOC_REACHDEAD ]
[ vocabulary=ebony, statu ]
[ inventory=Ebony statuette ]
OBJ_69 is a thing.
The printed name of OBJ_69 is "ebony statuette".
The description of OBJ_69 is "There is a richly-carved ebony statuette here!".
OBJ_69 is in LOC_REACHDEAD.
[ scoring_candidate: true ]

[ Role: portable ]
[ KEYS ]
[ role=portable ]
[ initial_location=LOC_BUILDING ]
[ vocabulary=keys, key ]
[ inventory=Set of keys ]
KEYS is a thing.
The printed name of KEYS is "set of keys".
The description of KEYS is "There are some keys on the ground here.".
KEYS is in LOC_BUILDING.

[ LAMP ]
[ role=portable ]
[ initial_location=LOC_BUILDING ]
[ vocabulary=lamp, lante ]
[ inventory=Brass lantern ]
[ states=LAMP_DARK, LAMP_BRIGHT ]
[ changes=Your lamp is now off., Your lamp is now on. ]
LAMP is a thing.
The printed name of LAMP is "brass lantern".
The description of LAMP is "There is a shiny brass lamp nearby.".
LAMP is in LOC_BUILDING.

[ CAGE ]
[ role=portable ]
[ initial_location=LOC_COBBLE ]
[ vocabulary=cage ]
[ inventory=Wicker cage ]
CAGE is a thing.
The printed name of CAGE is "wicker cage".
The description of CAGE is "There is a small wicker cage discarded nearby.".
CAGE is in LOC_COBBLE.

[ ROD ]
[ role=portable ]
[ initial_location=LOC_DEBRIS ]
[ vocabulary=rod ]
[ inventory=Black rod ]
ROD is a thing.
The printed name of ROD is "black rod".
The description of ROD is "A three foot black rod with a rusty star on an end lies nearby.".
ROD is in LOC_DEBRIS.

[ ROD2 ]
[ role=portable ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=rod ]
[ inventory=Black rod ]
ROD2 is a thing.
The printed name of ROD2 is "black rod".
The description of ROD2 is "A three foot black rod with a rusty mark on an end lies nearby.".

[ BIRD ]
[ role=portable ]
[ initial_location=LOC_BIRDCHAMBER ]
[ vocabulary=bird ]
[ inventory=Little bird in cage ]
[ states=BIRD_UNCAGED, BIRD_CAGED, BIRD_FOREST_UNCAGED ]
[ sounds=The bird's singing is quite melodious., The bird does not seem inclined to sing while in the cage., It almost seems as though the bird is trying to tell you something., To your surprise, you can understand the bird's chirping; it is\nsinging about the joys of its forest home., The bird does not seem inclined to sing while in the cage., The bird is singing to you in gratitude for your having returned it to\nits home.  In return, it informs you of a magic word which it thinks\nyou may find useful somewhere near the Hall of Mists.  The magic word\nchanges frequently, but for now the bird believes it is '%s'.  You\nthank the bird for this information, and it flies off into the forest. ]
BIRD is a thing.
The printed name of BIRD is "little bird in cage".
The description of BIRD is "A cheerful little bird is sitting here singing.".
BIRD is in LOC_BIRDCHAMBER.

[ PILLOW ]
[ role=portable ]
[ initial_location=LOC_SOFTROOM ]
[ vocabulary=pillo, velve ]
[ inventory=Velvet pillow ]
PILLOW is a thing.
The printed name of PILLOW is "velvet pillow".
The description of PILLOW is "A small velvet pillow lies on the floor.".
PILLOW is in LOC_SOFTROOM.

[ OYSTER ]
[ role=portable ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=oyste ]
[ inventory=Giant oyster  >GROAN!< ]
[ sounds=Even though it's an oyster, the critter's as tight-mouthed as a clam., It says the same thing it did before.  Hm, maybe it's a pun? ]
OYSTER is a thing.
The printed name of OYSTER is "giant oyster  >GROAN!<".
The description of OYSTER is "There is an enormous oyster here with its shell tightly closed.".

[ MAGAZINE ]
[ role=portable ]
[ initial_location=LOC_ANTEROOM ]
[ vocabulary=magaz, issue, spelu, "spel ]
[ inventory='Spelunker Today' ]
[ texts=I'm afraid the magazine is written in dwarvish.  But penciled on one\ncover you see, 'Please leave the magazines at the construction site.' ]
MAGAZINE is a thing.
The printed name of MAGAZINE is "Spelunker Today".
The description of MAGAZINE is "There are a few recent issues of 'Spelunker Today' magazine here.".
MAGAZINE is in LOC_ANTEROOM.

[ KNIFE ]
[ role=portable ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=knife, knive ]
KNIFE is a thing.
The printed name of KNIFE is "knife".

[ FOOD ]
[ role=portable ]
[ initial_location=LOC_BUILDING ]
[ vocabulary=food, ratio ]
[ inventory=Tasty food ]
FOOD is a thing.
The printed name of FOOD is "tasty food".
The description of FOOD is "There is food here.".
FOOD is in LOC_BUILDING.

[ BOTTLE ]
[ role=portable ]
[ initial_location=LOC_BUILDING ]
[ vocabulary=bottl, jar ]
[ inventory=Small bottle ]
[ states=WATER_BOTTLE, EMPTY_BOTTLE, OIL_BOTTLE ]
[ changes=Your bottle is now full of water., The bottle of water is now empty., Your bottle is now full of oil. ]
BOTTLE is a thing.
The printed name of BOTTLE is "small bottle".
The description of BOTTLE is "There is a bottle of water here.".
BOTTLE is in LOC_BUILDING.

[ WATER ]
[ role=portable ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=water, h2o ]
[ inventory=Water in the bottle ]
WATER is a thing.
The printed name of WATER is "water in the bottle".

[ OIL ]
[ role=portable ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=oil ]
[ inventory=Oil in the bottle ]
OIL is a thing.
The printed name of OIL is "oil in the bottle".

[ AXE ]
[ role=portable ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=axe ]
[ inventory=Dwarf's axe ]
[ states=AXE_HERE, AXE_LOST ]
[ changes=The axe misses and lands near the bear where you can't get at it. ]
AXE is a thing.
The printed name of AXE is "dwarf's axe".
The description of AXE is "There is a little axe here.".

[ BATTERY ]
[ role=portable ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=batte ]
[ inventory=Batteries ]
[ states=FRESH_BATTERIES, DEAD_BATTERIES ]
BATTERY is a thing.
The printed name of BATTERY is "batteries".
BATTERY is plural-named.
The description of BATTERY is "There are fresh batteries here.".

[ RABBITFOOT ]
[ role=portable ]
[ initial_location=LOC_FOREST22 ]
[ vocabulary=appen, lepor ]
[ inventory=Leporine appendage ]
RABBITFOOT is a thing.
The printed name of RABBITFOOT is "leporine appendage".
The description of RABBITFOOT is "Your keen eye spots a severed leporine appendage lying on the ground.".
RABBITFOOT is in LOC_FOREST22.

[ Role: scenery ]
[ CLAM ]
[ role=scenery ]
[ initial_location=LOC_SHELLROOM ]
[ vocabulary=clam ]
[ inventory=Giant clam  >GRUNT!< ]
[ sounds=The clam is as tight-mouthed as a, er, clam. ]
CLAM is a scenery.
CLAM is fixed in place.
The printed name of CLAM is "giant clam  >GRUNT!<".
The description of CLAM is "There is an enormous clam here with its shell tightly closed.".
CLAM is in LOC_SHELLROOM.

[ OBJ_26 ]
[ role=scenery ]
[ initial_location=LOC_TOPSTALACTITE ]
[ vocabulary=stala ]
[ inventory=*stalactite ]
OBJ_26 is a scenery.
OBJ_26 is fixed in place.
The printed name of OBJ_26 is "stalactite".
OBJ_26 is in LOC_TOPSTALACTITE.

[ OBJ_27 ]
[ role=scenery ]
[ initial_location=LOC_WINDOW1 ]
[ alternate_locations=LOC_WINDOW2 ]
[ vocabulary=shado, figur, windo ]
[ inventory=*shadowy figure and/or window ]
OBJ_27 is a scenery.
OBJ_27 is fixed in place.
The printed name of OBJ_27 is "shadowy figure and/or window".
The description of OBJ_27 is "The shadowy figure seems to be trying to attract your attention.".
OBJ_27 is in LOC_WINDOW1.

[ OBJ_29 ]
[ role=scenery ]
[ initial_location=LOC_ORIENTAL ]
[ vocabulary=drawi ]
[ inventory=*cave drawings ]
OBJ_29 is a scenery.
OBJ_29 is fixed in place.
The printed name of OBJ_29 is "cave drawings".
OBJ_29 is in LOC_ORIENTAL.

[ BLOOD ]
[ role=scenery ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=blood ]
[ inventory=*blood ]
BLOOD is a scenery.
BLOOD is fixed in place.
The printed name of BLOOD is "blood".

[ Role: puzzle ]
[ GRATE ]
[ role=puzzle ]
[ initial_location=LOC_GRATE ]
[ alternate_locations=LOC_BELOWGRATE ]
[ vocabulary=grate ]
[ inventory=*grate ]
[ states=GRATE_CLOSED, GRATE_OPEN ]
[ changes=The grate is now locked., The grate is now unlocked. ]
GRATE is a thing.
GRATE is fixed in place.
The printed name of GRATE is "grate".
The description of GRATE is "The grate is locked.".
GRATE is in LOC_GRATE.

[ STEPS ]
[ role=puzzle ]
[ initial_location=LOC_PITTOP ]
[ alternate_locations=LOC_MISTHALL ]
[ vocabulary=steps ]
[ inventory=*steps ]
[ states=STEPS_DOWN, STEPS_UP ]
STEPS is a thing.
STEPS is fixed in place.
The printed name of STEPS is "steps".
The description of STEPS is "Rough stone steps lead down the pit.".
STEPS is in LOC_PITTOP.

[ DOOR ]
[ role=puzzle ]
[ initial_location=LOC_IMMENSE ]
[ vocabulary=door ]
[ inventory=*rusty door ]
[ states=the door object_RUSTED, the door object_UNRUSTED ]
[ changes=The hinges are quite thoroughly rusted now and won't budge., The oil has freed up the hinges so that the door will now move,\nalthough it requires some effort. ]
The door object is a thing.
the door object is fixed in place.
The printed name of the door object is "rusty door".
The description of the door object is "The way north is barred by a massive, rusty, iron door.".
the door object is in LOC_IMMENSE.

[ FISSURE ]
[ role=puzzle ]
[ initial_location=LOC_EASTBANK ]
[ alternate_locations=LOC_WESTBANK ]
[ vocabulary=fissu ]
[ inventory=*fissure ]
[ states=UNBRIDGED, BRIDGED ]
[ changes=The crystal bridge has vanished!, A crystal bridge now spans the fissure. ]
FISSURE is a thing.
FISSURE is fixed in place.
The printed name of FISSURE is "fissure".
The description of FISSURE is "A crystal bridge spans the fissure.".
FISSURE is in LOC_EASTBANK.

[ OBJ_13 ]
[ role=puzzle ]
[ initial_location=LOC_DARKROOM ]
[ vocabulary=table ]
[ inventory=*stone tablet ]
[ texts='Congratulations on bringing light into the dark-room!' ]
OBJ_13 is a thing.
OBJ_13 is fixed in place.
The printed name of OBJ_13 is "stone tablet".
The description of OBJ_13 is "A massive stone tablet embedded in the wall reads:\n'Congratulations on bringing light into the dark-room!'".
OBJ_13 is in LOC_DARKROOM.

[ MIRROR ]
[ role=puzzle ]
[ initial_location=LOC_MIRRORCANYON ]
[ vocabulary=mirro ]
[ inventory=*mirror ]
[ states=MIRROR_UNBROKEN, MIRROR_BROKEN ]
[ changes=You strike the mirror a resounding blow, whereupon it shatters into a\nmyriad tiny fragments. ]
MIRROR is a thing.
MIRROR is fixed in place.
The printed name of MIRROR is "mirror".
MIRROR is in LOC_MIRRORCANYON.

[ PLANT ]
[ role=puzzle ]
[ initial_location=LOC_WESTPIT ]
[ vocabulary=plant, beans ]
[ inventory=*plant ]
[ states=PLANT_THIRSTY, PLANT_BELLOWING, PLANT_GROWN ]
[ changes=You've over-watered the plant!  It's shriveling up!  And now . . ., The plant spurts into furious growth for a few seconds., The plant grows explosively, almost filling the bottom of the pit. ]
[ sounds=The plant continues to ask plaintively for water., The plant continues to demand water., The plant now maintains a contented silence. ]
PLANT is a thing.
PLANT is fixed in place.
The printed name of PLANT is "plant".
The description of PLANT is "There is a tiny little plant in the pit, murmuring 'water, water, ...'".
PLANT is in LOC_WESTPIT.

[ CHASM ]
[ role=puzzle ]
[ initial_location=LOC_SWCHASM ]
[ alternate_locations=LOC_NECHASM ]
[ vocabulary=chasm ]
[ inventory=*chasm ]
[ states=TROLL_BRIDGE, BRIDGE_WRECKED ]
[ changes=Just as you reach the other side, the bridge buckles beneath the\nweight of the bear, which was still following you around.  You\nscrabble desperately for support, but as the bridge collapses you\nstumble back and fall into the chasm. ]
CHASM is a thing.
CHASM is fixed in place.
The printed name of CHASM is "chasm".
The description of CHASM is "A rickety wooden bridge extends across the chasm, vanishing into the\nmist.  A notice posted on the bridge reads, 'Stop! Pay troll!'".
CHASM is in LOC_SWCHASM.

[ MESSAG ]
[ role=puzzle ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=messa ]
[ inventory=*message in second maze ]
[ texts='This is not the maze where the pirate leaves his treasure chest.' ]
MESSAG is a thing.
MESSAG is fixed in place.
The printed name of MESSAG is "message in second maze".
The description of MESSAG is "There is a message scrawled in the dust in a flowery script, reading:\n'This is not the maze where the pirate leaves his treasure chest.'".

[ VEND ]
[ role=puzzle ]
[ initial_location=LOC_DEADEND13 ]
[ vocabulary=machi, vendi ]
[ inventory=*vending machine ]
[ states=VEND_BLOCKS, VEND_UNBLOCKS ]
[ changes=The vending machine swings back to block the passage., As you strike the vending machine, it pivots backward along with a\nsection of wall, revealing a dark passage leading south. ]
[ texts='Drop coins here to receive fresh batteries.', 'Drop coins here to receive fresh batteries.' ]
VEND is a thing.
VEND is fixed in place.
The printed name of VEND is "vending machine".
The description of VEND is "There is a massive and somewhat battered vending machine here.  The\ninstructions on it read: 'Drop coins here to receive fresh batteries.'".
VEND is in LOC_DEADEND13.

[ URN ]
[ role=puzzle ]
[ initial_location=LOC_CLIFF ]
[ vocabulary=urn ]
[ inventory=*urn ]
[ states=URN_EMPTY, URN_DARK, URN_LIT ]
[ changes=The urn is empty and will not light., The urn is now dark., The urn is now lit. ]
URN is a thing.
URN is fixed in place.
The printed name of URN is "urn".
The description of URN is "A small urn is embedded in the rock.".
URN is in LOC_CLIFF.

[ CAVITY ]
[ role=puzzle ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=cavit ]
[ inventory=*cavity ]
[ states=CAVITY_FULL, CAVITY_EMPTY ]
CAVITY is a thing.
CAVITY is fixed in place.
The printed name of CAVITY is "cavity".
The description of CAVITY is "There is a small urn-shaped cavity in the rock.".

[ RESER ]
[ role=puzzle ]
[ initial_location=LOC_RESERVOIR ]
[ alternate_locations=LOC_RESNORTH ]
[ vocabulary=reser ]
[ inventory=*reservoir ]
[ states=WATERS_UNPARTED, WATERS_PARTED ]
[ changes=The waters crash together again., The waters have parted to form a narrow path across the reservoir. ]
RESER is a thing.
RESER is fixed in place.
The printed name of RESER is "reservoir".
The description of RESER is "The waters have parted to form a narrow path across the reservoir.".
RESER is in LOC_RESERVOIR.

[ OBJ_47 ]
[ role=puzzle ]
[ initial_location=LOC_DEBRIS ]
[ vocabulary=mud ]
[ inventory=*mud ]
[ texts='MAGIC WORD XYZZY' ]
OBJ_47 is a thing.
OBJ_47 is fixed in place.
The printed name of OBJ_47 is "mud".
OBJ_47 is in LOC_DEBRIS.

[ OBJ_48 ]
[ role=puzzle ]
[ initial_location=LOC_NUGGET ]
[ vocabulary=note ]
[ inventory=*note ]
[ texts='You won't get it up the steps' ]
OBJ_48 is a thing.
OBJ_48 is fixed in place.
The printed name of OBJ_48 is "note".
OBJ_48 is in LOC_NUGGET.

[ SIGN ]
[ role=puzzle ]
[ initial_location=LOC_ANTEROOM ]
[ vocabulary=sign ]
[ inventory=*sign ]
[ states=INGAME_SIGN, ENDGAME_SIGN ]
[ texts=Cave under construction beyond this point.\n           Proceed at own risk.\n       [Witt Construction Company], 'Treasure Vault.  Keys in main office.' ]
SIGN is a thing.
SIGN is fixed in place.
The printed name of SIGN is "sign".
SIGN is in LOC_ANTEROOM.

[ Role: infrastructure ]
[ PLANT2 ]
[ role=infrastructure ]
[ initial_location=LOC_WESTEND ]
[ alternate_locations=LOC_EASTEND ]
[ vocabulary=plant ]
[ inventory=*phony plant ]
PLANT2 is a thing.
PLANT2 is fixed in place.
The printed name of PLANT2 is "phony plant".
The description of PLANT2 is "The top of a 12-foot-tall beanstalk is poking out of the west pit.".
PLANT2 is in LOC_WESTEND.

[ OBJ_30 ]
[ role=infrastructure ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=pirat, genie, djinn ]
[ inventory=*pirate/genie ]
OBJ_30 is a thing.
OBJ_30 is fixed in place.
The printed name of OBJ_30 is "pirate/genie".

[ VOLCANO ]
[ role=infrastructure ]
[ initial_location=LOC_BREATHTAKING ]
[ vocabulary=volca, geyse ]
[ inventory=*volcano and/or geyser ]
VOLCANO is a thing.
VOLCANO is fixed in place.
The printed name of VOLCANO is "volcano and/or geyser".
VOLCANO is in LOC_BREATHTAKING.

[ OBJ_40 ]
[ role=infrastructure ]
[ initial_location=LOC_SOFTROOM ]
[ vocabulary=carpe, moss ]
[ inventory=*carpet and/or moss and/or curtains ]
OBJ_40 is a thing.
OBJ_40 is fixed in place.
The printed name of OBJ_40 is "carpet and/or moss and/or curtains".
OBJ_40 is in LOC_SOFTROOM.

[ Role: creature ]
[ SNAKE ]
[ role=creature ]
[ initial_location=LOC_KINGHALL ]
[ vocabulary=snake ]
[ inventory=*snake ]
[ states=SNAKE_BLOCKS, SNAKE_CHASED ]
[ sounds=The snake is hissing venomously. ]
SNAKE is a thing.
SNAKE is fixed in place.
The printed name of SNAKE is "snake".
The description of SNAKE is "A huge green fierce snake bars the way!".
SNAKE is in LOC_KINGHALL.

[ DWARF ]
[ role=creature ]
[ initial_location=LOC_NOWHERE ]
[ vocabulary=dwarf, dwarv ]
DWARF is a thing.
DWARF is fixed in place.
The printed name of DWARF is "dwarf".

[ DRAGON ]
[ role=creature ]
[ initial_location=LOC_SECRET4 ]
[ alternate_locations=LOC_SECRET6 ]
[ vocabulary=drago ]
[ inventory=*dragon ]
[ states=DRAGON_BARS, DRAGON_DEAD, DRAGON_BLOODLESS ]
[ changes=Congratulations!  You have just vanquished a dragon with your bare\nhands!  (Unbelievable, isn't it?), Your head buzzes strangely for a moment. ]
[ sounds=The dragon's ominous hissing does not bode well for you., The dragon is, not surprisingly, silent., The dragon is, not surprisingly, silent. ]
DRAGON is a thing.
DRAGON is fixed in place.
The printed name of DRAGON is "dragon".
The description of DRAGON is "A huge green fierce dragon bars the way!".
DRAGON is in LOC_SECRET4.

[ TROLL ]
[ role=creature ]
[ initial_location=LOC_SWCHASM ]
[ alternate_locations=LOC_NECHASM ]
[ vocabulary=troll ]
[ inventory=*troll ]
[ states=TROLL_UNPAID, TROLL_PAIDONCE, TROLL_GONE ]
[ changes=The bear lumbers toward the troll, who lets out a startled shriek and\nscurries away.  The bear soon gives up the pursuit and wanders back. ]
[ sounds=The troll sounds quite adamant in his demand for a treasure., The troll sounds quite adamant in his demand for a treasure. ]
TROLL is a thing.
TROLL is fixed in place.
The printed name of TROLL is "troll".
The description of TROLL is "A burly troll stands by the bridge and insists you throw him a\ntreasure before you may cross.".
TROLL is in LOC_SWCHASM.

[ TROLL2 ]
[ role=creature ]
[ initial_location=LOC_NOWHERE ]
[ alternate_locations=LOC_NOWHERE ]
[ vocabulary=troll ]
[ inventory=*phony troll ]
TROLL2 is a thing.
TROLL2 is fixed in place.
The printed name of TROLL2 is "phony troll".
The description of TROLL2 is "The troll is nowhere to be seen.".

[ BEAR ]
[ role=creature ]
[ initial_location=LOC_BARRENROOM ]
[ vocabulary=bear ]
[ states=UNTAMED_BEAR, SITTING_BEAR, CONTENTED_BEAR, BEAR_DEAD ]
[ changes=The bear eagerly wolfs down your food, after which he seems to calm\ndown considerably and even becomes rather friendly. ]
BEAR is a thing.
BEAR is fixed in place.
The printed name of BEAR is "bear".
The description of BEAR is "There is a ferocious cave bear eyeing you from the far end of the room!".
BEAR is in LOC_BARRENROOM.

[ OGRE ]
[ role=creature ]
[ initial_location=LOC_LARGE ]
[ vocabulary=ogre ]
[ inventory=*ogre ]
[ sounds=The ogre is apparently the strong, silent type. ]
OGRE is a thing.
OGRE is fixed in place.
The printed name of OGRE is "ogre".
The description of OGRE is "A formidable ogre bars the northern exit.".
OGRE is in LOC_LARGE.

[ Role: unknown ]
[ NO_OBJECT ]
[ role=unknown ]
[ vocabulary= ]
[ unsupported placeholder entry ]

[ Object identity table ]
Table of Open Adventure Object IDs
object-entry (thing)	object-id-entry (text)
NUGGET	"NUGGET"
OBJ_51	"OBJ_51"
OBJ_52	"OBJ_52"
OBJ_53	"OBJ_53"
COINS	"COINS"
CHEST	"CHEST"
EGGS	"EGGS"
TRIDENT	"TRIDENT"
VASE	"VASE"
EMERALD	"EMERALD"
PYRAMID	"PYRAMID"
PEARL	"PEARL"
RUG	"RUG"
OBJ_63	"OBJ_63"
CHAIN	"CHAIN"
RUBY	"RUBY"
JADE	"JADE"
AMBER	"AMBER"
SAPPH	"SAPPH"
OBJ_69	"OBJ_69"
KEYS	"KEYS"
LAMP	"LAMP"
CAGE	"CAGE"
ROD	"ROD"
ROD2	"ROD2"
BIRD	"BIRD"
PILLOW	"PILLOW"
OYSTER	"OYSTER"
MAGAZINE	"MAGAZINE"
KNIFE	"KNIFE"
FOOD	"FOOD"
BOTTLE	"BOTTLE"
WATER	"WATER"
OIL	"OIL"
AXE	"AXE"
BATTERY	"BATTERY"
RABBITFOOT	"RABBITFOOT"
CLAM	"CLAM"
OBJ_26	"OBJ_26"
OBJ_27	"OBJ_27"
OBJ_29	"OBJ_29"
BLOOD	"BLOOD"
GRATE	"GRATE"
STEPS	"STEPS"
the door object	"DOOR"
FISSURE	"FISSURE"
OBJ_13	"OBJ_13"
MIRROR	"MIRROR"
PLANT	"PLANT"
CHASM	"CHASM"
MESSAG	"MESSAG"
VEND	"VEND"
URN	"URN"
CAVITY	"CAVITY"
RESER	"RESER"
OBJ_47	"OBJ_47"
OBJ_48	"OBJ_48"
SIGN	"SIGN"
PLANT2	"PLANT2"
OBJ_30	"OBJ_30"
VOLCANO	"VOLCANO"
OBJ_40	"OBJ_40"
SNAKE	"SNAKE"
DWARF	"DWARF"
DRAGON	"DRAGON"
TROLL	"TROLL"
TROLL2	"TROLL2"
BEAR	"BEAR"
OGRE	"OGRE"

OpenAdventure Objects ends here.
