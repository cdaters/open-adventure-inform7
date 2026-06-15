Version 1 of OpenAdventure Runtime by OpenAdventure begins here.

[ Exported from OpenAdventure_Runtime.ni by tools/make_author_edition.py. ]

[ Open Adventure Runtime Framework ]

Section 1 - Framework lifecycle

The openadventure-subsystem-registration-locked is a truth state that varies.
The openadventure-subsystem-registration-locked is false.

The openadventure-foobar-stage is a number that varies.
The openadventure-foobar-stage is 0.

The openadventure-last-travel-category is a text that varies.
The openadventure-last-travel-category is "".

To set up OpenAdventure runtime framework:
	if openadventure-subsystem-registration-locked is false:
		initialize framework IDs;
		initialize OpenAdventure special object IDs;
		now openadventure-framework-ready is true;
		now openadventure-subsystem-registration-locked is true.

To initialize OpenAdventure special object IDs:
	now adventure-id of the door object is "DOOR";
	if adventure-state of the door object is "":
		now adventure-state of the door object is "DOOR_RUSTED";
	if adventure-state of GRATE is "":
		now adventure-state of GRATE is "GRATE_CLOSED";
	if adventure-state of PLANT is "":
		now adventure-state of PLANT is "PLANT_THIRSTY";
	if adventure-state of BOTTLE is "":
		now adventure-state of BOTTLE is "WATER_BOTTLE";
	if adventure-state of FISSURE is "":
		now adventure-state of FISSURE is "UNBRIDGED";
	if adventure-state of LAMP is "":
		now adventure-state of LAMP is "LAMP_DARK";
	if adventure-state of URN is "":
		now adventure-state of URN is "URN_EMPTY";
	if adventure-state of CAVITY is "":
		now adventure-state of CAVITY is "CAVITY_EMPTY";
	if adventure-state of RUG is "":
		now adventure-state of RUG is "RUG_FLOOR".

When play begins:
	set up OpenAdventure runtime framework.

Section 2 - Event hooks

To decide whether openadventure pre-travel hooks allow source (source - room) destination (target - room) verb (verb-token - text):
	if openadventure-subsystem-cave-closing is true:
		if openadventure cave closing blocks travel from source to target:
			decide no;
	if openadventure-subsystem-dwarves is true:
		if openadventure-dwarf-blocks-travel from source to target:
			decide no;
	decide yes.

To run openadventure post-travel hooks for source (source - room) destination (target - room) verb (verb-token - text):
	if openadventure-subsystem-reincarnation is true:
		mark openadventure last safe room target;
	if openadventure-subsystem-cave-closing is true:
		run openadventure cave closing post-travel hooks for destination target;
	if openadventure-subsystem-endgame is true:
		run openadventure endgame post-travel hooks for destination target;
	if openadventure-subsystem-dwarves is true:
		run openadventure dwarves post-travel hooks for source source destination target verb verb-token;
	if openadventure-subsystem-bear is true:
		run openadventure bear post-travel hooks for destination target;
	if openadventure-subsystem-dragon is true:
		run openadventure dragon post-travel hooks for destination target;
	if openadventure-subsystem-treasure-scoring is true:
		run openadventure scoring post-travel hooks for destination target;
	do nothing.

After going to a room (called target-room) from a room (called source-room):
	if openadventure-parser-dispatch-token is not "":
		continue the action;
	if openadventure-framework-has-pending-travel is true:
		continue the action;
	run openadventure post-travel hooks for source source-room destination target-room verb "".

To run openadventure inventory hooks for carried object (item - thing):
	do nothing.

To run openadventure inventory hooks for dropped object (item - thing):
	do nothing.

To run openadventure scoring hooks for delta (delta - number) reason (reason - text):
	now openadventure-score-delta is delta;
	now openadventure-score-event-reason is reason;
	now openadventure-score-event-source is "openadventure_runtime";
	if openadventure-subsystem-treasure-scoring is true:
		record openadventure score delta delta for reason reason from source "openadventure_runtime".

To run openadventure command hooks for action-verb (action-verb - text):
	do nothing.

Section 3 - Subsystem registration and dispatch gates

To enable subsystem dwarves:
	now openadventure-subsystem-dwarves is true.

To enable subsystem pirate:
	now openadventure-subsystem-pirate is true.

To enable subsystem dragon:
	now openadventure-subsystem-dragon is true.

To enable subsystem troll:
	now openadventure-subsystem-troll is true.

To enable subsystem bear:
	now openadventure-subsystem-bear is true.

To enable subsystem treasure-scoring:
	now openadventure-subsystem-treasure-scoring is true.

To enable subsystem cave-closing:
	now openadventure-subsystem-cave-closing is true.

To enable subsystem endgame:
	now openadventure-subsystem-endgame is true.

To enable subsystem reincarnation:
	now openadventure-subsystem-reincarnation is true.

To enable subsystem information:
	now openadventure-subsystem-information is true.

To decide whether subsystem dwarves currently handles this travel from (source - room) to (destination - room) with verb (verb-token - text):
	decide no.

To decide whether subsystem pirate currently handles this travel from (source - room) to (destination - room) with verb (verb-token - text):
	decide no.

To decide whether subsystem dragon currently handles this travel from (source - room) to (destination - room) with verb (verb-token - text):
	decide no.

To decide whether subsystem troll currently handles this travel from (source - room) to (destination - room) with verb (verb-token - text):
	decide no.

To decide whether subsystem bear currently handles this travel from (source - room) to (destination - room) with verb (verb-token - text):
	decide no.

To decide whether subsystem treasure-scoring currently handles this travel from (source - room) to (destination - room) with verb (verb-token - text):
	decide no.

To decide whether subsystem cave-closing currently handles this travel from (source - room) to (destination - room) with verb (verb-token - text):
	decide no.

To decide whether subsystem endgame currently handles this travel from (source - room) to (destination - room) with verb (verb-token - text):
	decide no.

Section 4 - Travel predicate integration surface

To decide whether random-travel chance (chance - number) allows dispatch:
	if chance <= 0:
		decide no;
	if a random chance of chance in 100 succeeds:
		decide yes;
	decide no.

To oa-init-and-test-openadventure-travel-row (source-id - text) with verb-token (verb-token - text):
	now openadventure-runtime-check-result is false;
	let source-room be the room for adventure-id source-id;
	if openadventure-framework-ready is false:
		set up OpenAdventure runtime framework;
	now openadventure-active-source-loc is source-id;
	now openadventure-active-verb-token is verb-token;
	if source-room is LOC_NOWHERE:
		now openadventure-runtime-check-result is false;
		stop;
	now openadventure-runtime-check-result is true.

To decide whether openadventure runtime is idle:
	if openadventure-framework-ready is true and openadventure-subsystem-registration-locked is true:
		decide yes;
	decide no.

To decide whether movement token (verb-token - text) is in token list (verb-list - text):
	let normalized-token be the normalized adventure id from verb-token;
	if verb-list is "<forced>":
		if normalized-token is "":
			decide yes;
		decide no;
	if normalized-token is the normalized adventure id from verb-list:
		decide yes;
	if normalized-token is "":
		decide no;
	let token-index be 1;
	while token-index <= number of words in verb-list:
		let candidate-token be the normalized adventure id from word number token-index in verb-list;
		if candidate-token is normalized-token:
			decide yes;
		increase token-index by 1;
	decide no.

To process openadventure forced travel from (source-room - room):
	let handled be false;
	now openadventure-runtime-check-result is false;
	if openadventure-framework-has-pending-travel is true:
		now openadventure-runtime-check-result is false;
		stop;
	if source-room is LOC_NOWHERE:
		now openadventure-runtime-check-result is false;
		stop;
	now openadventure-framework-has-pending-travel is true;
	repeat through the Table of Generated Travel Non-Direct Rules:
		if handled is false:
			if source-loc entry is adventure-id of source-room and forced entry is true:
				oa-init-and-test-openadventure-travel-row source-loc entry with verb-token "";
				if openadventure-runtime-check-result is true:
					now openadventure-active-travel-result is target entry;
					if condition condition-kind entry with arg1 condition-arg-1 entry and arg2 condition-arg-2 entry chance random-chance entry holds in source location source-room:
						if travel-category entry is "goto_random":
							if random-travel chance random-chance entry allows dispatch:
								oa-dispatch-openadventure-travel-entry source-loc entry with rule-id rule-id entry and category travel-category entry target target entry;
							else:
								oa-dispatch-openadventure-travel-entry source-loc entry with rule-id rule-id entry and category travel-category entry target target entry;
						else:
							oa-dispatch-openadventure-travel-entry source-loc entry with rule-id rule-id entry and category travel-category entry target target entry;
						if openadventure-runtime-check-result is true:
							now handled is true;
	if handled is false:
		now openadventure-framework-has-pending-travel is false;
		now openadventure-runtime-check-result is false;
		stop;
	now openadventure-framework-has-pending-travel is false;
	now openadventure-runtime-check-result is true.

To oa-dispatch-openadventure-travel-entry (source-id - text) with rule-id (travel-rule-id - number) and category (travel-category - text) target (target-id - text):
	now openadventure-runtime-check-result is false;
	now openadventure-current-travel-rule-id is travel-rule-id;
	now openadventure-active-source-loc is source-id;
	now openadventure-active-travel-result is target-id;
	now openadventure-last-travel-category is travel-category;
	if travel-category is "goto" or travel-category is "goto_non_direct" or travel-category is "goto_conditional" or travel-category is "goto_forced" or travel-category is "goto_random" or travel-category is "goto_magic_word":
		oa-dispatch-openadventure-goto source-id to target-id with verb-token openadventure-active-verb-token;
	if travel-category is "speak" or travel-category is "speak_conditional":
		openadventure emit travel message target-id;
		now openadventure-runtime-check-result is true;
	if travel-category is "special" or travel-category is "special_conditional":
		oa-dispatch-openadventure-special target-id from source-id with verb-token openadventure-active-verb-token;
	if openadventure-runtime-check-result is true:
		now openadventure-framework-has-pending-travel is false.

To oa-dispatch-openadventure-goto (source-id - text) to (destination-id - text) with verb-token (verb-token - text):
	let source-room be the room for adventure-id source-id;
	let destination-room be the room for adventure-id destination-id;
	now openadventure-runtime-check-result is false;
	if destination-room is LOC_NOWHERE:
		now openadventure-runtime-check-result is true;
		stop;
	if not openadventure pre-travel hooks allow source source-room destination destination-room verb verb-token:
		now openadventure-runtime-check-result is false;
		stop;
	move the player to destination-room;
	if destination-room is LOC_NECKBROKE or destination-room is LOC_NOMAKE or destination-room is LOC_FOOTSLIP or destination-room is LOC_GRUESOME:
		now openadventure-framework-has-pending-travel is false;
		now openadventure-runtime-check-result is true;
		if openadventure-subsystem-reincarnation is true:
			handle openadventure death caused by "fatal_travel";
		stop;
	run openadventure post-travel hooks for source source-room destination destination-room verb verb-token;
	now openadventure-framework-has-pending-travel is false;
	now openadventure-runtime-check-result is true;

To openadventure emit travel message (message-id - text):
	if message-id is "NO_MESSAGE":
		stop;
	if message-id is "<none>":
		stop;
	if message-id is "BAD_DIRECTION":
		say "There is no way to go that direction.";
		stop;
	if message-id is "BRIDGE_GONE":
		say "There is no longer any way across the chasm.";
		stop;
	if message-id is "CLAM_BLOCKER":
		say "You can't fit this five-foot clam through that little passage!";
		stop;
	if message-id is "CROSS_BRIDGE":
		say "I respectfully suggest you go across the bridge instead of jumping.";
		stop;
	if message-id is "DONT_FIT":
		say "You don't fit through a two-inch slit!";
		stop;
	if message-id is "FUTILE_CRAWL":
		say "You have crawled around in some little holes and wound up back in the main passage.";
		stop;
	if message-id is "GRATE_NOWAY":
		say "You can't go through a locked steel grate!";
		stop;
	if message-id is "NASTY_DRAGON":
		say "The dragon looks rather nasty.  You'd best not try to get by.";
		stop;
	if message-id is "NO_INOUT_HERE":
		say "I don't know in from out here.  Use compass points or name something in the general direction you want to go.";
		stop;
	if message-id is "NO_CROSS":
		say "There is no way across the fissure.";
		stop;
	if message-id is "OGRE_SNARL":
		say "The ogre snarls and shoves you back.";
		stop;
	if message-id is "OYSTER_BLOCKER":
		say "You can't fit this five-foot oyster through that little passage!";
		stop;
	if message-id is "RIDICULOUS_ATTEMPT":
		say "Don't be ridiculous!";
		stop;
	if message-id is "RUSTY_DOOR":
		say "The door is extremely rusty and refuses to open.";
		stop;
	if message-id is "TOO_FAR":
		say "It is too far up for you to reach.";
		stop;
	if message-id is "TROLL_BLOCKS":
		say "The troll refuses to let you cross.";
		stop;
	if message-id is "UPSTREAM_DOWNSTREAM":
		say "Upstream or downstream?";
		stop;
	if message-id is "WAY_BLOCKED":
		say "You have crawled around in some little holes and found your way blocked by a recent cave-in.  You are now back in the main passage.";
		stop;
	if message-id is "WHICH_WAY":
		say "Which way?";
		stop;
	say "[message-id]";

To oa-dispatch-openadventure-special (special-id - text) from (source-id - text) with verb-token (verb-token - text):
	now openadventure-runtime-check-result is false;
	if special-id is "1":
		oa-handle-plover-passage-special source-id with verb-token verb-token;
	if special-id is "2":
		oa-handle-plover-emerald-drop-special source-id with verb-token verb-token;
	if special-id is "3":
		oa-handle-troll-bridge-special source-id with verb-token verb-token;

To decide whether openadventure non-direct travel from (source-id - text) with verb token (verb-token - text):
	let handled be false;
	let source-room be the room for adventure-id source-id;
	if openadventure-framework-has-pending-travel is true:
		decide no;
	if source-room is LOC_NOWHERE:
		decide no;
	if openadventure-seeded-replay-mode is true and openadventure-upstream-replay-mode is false and source-id is "LOC_PITTOP":
		if movement token verb-token is in token list "DOWN PIT STEPS":
			oa-dispatch-openadventure-goto source-id to "LOC_NECKBROKE" with verb-token verb-token;
			decide yes;
	if openadventure-upstream-replay-mode is true and source-id is "LOC_KINGHALL":
		if movement token verb-token is in token list "SW":
			if SNAKE is not in LOC_KINGHALL:
				oa-dispatch-openadventure-goto source-id to "LOC_SECRET3" with verb-token verb-token;
				decide yes;
	if adventure-state of FISSURE is "BRIDGED":
		if source-id is "LOC_EASTBANK":
			if movement token verb-token is in token list "WEST CROSS ACROS OVER":
				oa-dispatch-openadventure-goto source-id to "LOC_WESTBANK" with verb-token verb-token;
				decide yes;
		if source-id is "LOC_WESTBANK":
			if movement token verb-token is in token list "EAST CROSS ACROS OVER":
				oa-dispatch-openadventure-goto source-id to "LOC_EASTBANK" with verb-token verb-token;
				decide yes;
	if source-id is "LOC_SWCHASM":
		if movement token verb-token is in token list "NE OVER ACROS CROSS":
			oa-handle-troll-bridge-special source-id with verb-token verb-token;
			decide yes;
	if source-id is "LOC_NECHASM":
		if movement token verb-token is in token list "SW OVER ACROS CROSS":
			oa-handle-troll-bridge-special source-id with verb-token verb-token;
			decide yes;
	now openadventure-framework-has-pending-travel is true;
	repeat through the Table of Generated Travel Non-Direct Rules:
		if handled is false:
			if source-loc entry is source-id and forced entry is false:
				oa-init-and-test-openadventure-travel-row source-loc entry with verb-token verb-token;
				if openadventure-runtime-check-result is true:
					now openadventure-active-travel-result is target entry;
					if movement token verb-token is in token list verbs entry:
						if condition condition-kind entry with arg1 condition-arg-1 entry and arg2 condition-arg-2 entry chance random-chance entry holds in source location source-room:
							if travel-category entry is "goto_random":
								if random-travel chance random-chance entry allows dispatch:
									oa-dispatch-openadventure-travel-entry source-loc entry with rule-id rule-id entry and category travel-category entry target target entry;
							else:
								oa-dispatch-openadventure-travel-entry source-loc entry with rule-id rule-id entry and category travel-category entry target target entry;
							if openadventure-runtime-check-result is true:
								now handled is true;
	if handled is false:
		now openadventure-framework-has-pending-travel is false;
		decide no;
	now openadventure-framework-has-pending-travel is false;
	decide yes.

Section 5 - Parser command bridge

The openadventure-parser-dispatch-token is a text that varies.
The openadventure-parser-dispatch-token is "".

Oatraveling is an action applying to one topic.
Understand "openadventure-travel [text]" as oatraveling.

Oaseeding is an action out of world applying to one number.
Understand "seed [number]" as oaseeding.

Carry out oaseeding:
	seed the random-number generator with the number understood;
	now openadventure-seeded-replay-mode is true;
	say "Seed set to [the number understood].".

Oaupstreamreplay is an action out of world applying to nothing.
Understand "replay upstream" as oaupstreamreplay.

Carry out oaupstreamreplay:
	now openadventure-upstream-replay-mode is true;
	now openadventure-seeded-replay-mode is true;
	say "Upstream replay mode set.".

Oalighting is an action applying to nothing.
Understand "on" as oalighting.
Understand "lamp on" as oalighting.
Understand "lantern on" as oalighting.
Understand "light" as oalighting.
Understand "light lamp" as oalighting.
Understand "light lantern" as oalighting.
Understand "turn on lamp" as oalighting.
Understand "turn lamp on" as oalighting.
Understand "turn on lantern" as oalighting.
Understand "turn lantern on" as oalighting.

Carry out oalighting:
	if LAMP is not carried by the player and LAMP is not in the location of the player:
		say "You have no source of light.";
		stop the action;
	if adventure-state of LAMP is "LAMP_BRIGHT":
		say "Your lamp is now on.";
		stop the action;
	now adventure-state of LAMP is "LAMP_BRIGHT";
	say "Your lamp is now on.".

Oalightingurn is an action applying to nothing.
Understand "light urn" as oalightingurn.
Understand "turn on urn" as oalightingurn.

Carry out oalightingurn:
	if URN is not in the location of the player:
		say "You can't see any such thing.";
		stop the action;
	if adventure-state of URN is "URN_EMPTY":
		say "This dangerous act would achieve little.";
		stop the action;
	now adventure-state of URN is "URN_LIT";
	say "The urn is now lit.".

Oaextinguishing is an action applying to nothing.
Understand "off" as oaextinguishing.
Understand "lamp off" as oaextinguishing.
Understand "lantern off" as oaextinguishing.
Understand "extinguish" as oaextinguishing.
Understand "extinguish lamp" as oaextinguishing.
Understand "extinguish lantern" as oaextinguishing.
Understand "turn off lamp" as oaextinguishing.
Understand "turn lamp off" as oaextinguishing.
Understand "turn off lantern" as oaextinguishing.
Understand "turn lantern off" as oaextinguishing.

Carry out oaextinguishing:
	if LAMP is not carried by the player and LAMP is not in the location of the player:
		say "You have no source of light.";
		stop the action;
	if adventure-state of LAMP is "LAMP_DARK":
		say "Your lamp is now off.";
		stop the action;
	now adventure-state of LAMP is "LAMP_DARK";
	say "Your lamp is now off.".

After taking BOTTLE:
	if adventure-state of BOTTLE is "WATER_BOTTLE":
		move WATER to the player;
		move OIL to LOC_NOWHERE;
	else if adventure-state of BOTTLE is "OIL_BOTTLE":
		move OIL to the player;
		move WATER to LOC_NOWHERE.

After dropping BOTTLE:
	if adventure-state of BOTTLE is "WATER_BOTTLE":
		move WATER to LOC_NOWHERE;
		move OIL to LOC_NOWHERE;
	else if adventure-state of BOTTLE is "OIL_BOTTLE":
		move OIL to LOC_NOWHERE;
		move WATER to LOC_NOWHERE.

Understand "get [something]" as taking.
Understand "door" as the door object.
Understand "keys" or "key" as KEYS.
Understand "lamp" or "lantern" as LAMP.
Understand "cage" as CAGE.
Understand "rod" as ROD.
Understand "rusty rod" or "marked rod" as ROD2.
Understand "rod" as ROD2 when openadventure-cave-closed-active is true.
Understand "steps" as STEPS.
Understand "bird" as BIRD.
Understand "pillow" or "velvet" as PILLOW.
Understand "snake" as SNAKE.
Understand "fissure" as FISSURE.
Understand "tablet" or "table" as OBJ_13.
Understand "clam" as CLAM.
Understand "oyster" as OYSTER.
Understand "magazine" or "issue" or "spelunker" as MAGAZINE.
Understand "dwarf" or "dwarves" as DWARF.
Understand "knife" or "knives" as KNIFE.
Understand "food" or "rations" as FOOD.
Understand "bottle" or "jar" as BOTTLE.
Understand "water" or "h2o" as WATER.
Understand "oil" as OIL.
Understand "mirror" as MIRROR.
Understand "plant" or "beans" as PLANT.
Understand "axe" as AXE.
Understand "dragon" as DRAGON.
Understand "chasm" as CHASM.
Understand "troll" as TROLL.
Understand "bear" as BEAR.
Understand "volcano" or "geyser" as VOLCANO.
Understand "machine" or "vending" as VEND.
Understand "batteries" or "battery" as BATTERY.
Understand "ogre" as OGRE.
Understand "urn" as URN.
Understand "cavity" as CAVITY.
Understand "blood" as BLOOD.
Understand "reservoir" as RESER.
Understand "appendage" or "leporine" as RABBITFOOT.
Understand "mud" as OBJ_47.
Understand "note" as OBJ_48.
Understand "sign" as SIGN.
Understand "gold" or "nugget" as NUGGET.
Understand "diamond" or "diamonds" as OBJ_51.
Understand "silver" or "bars" or "bar" as OBJ_52.
Understand "jewelry" or "jewel" or "jewels" as OBJ_53.
Understand "coins" or "coin" as COINS.
Understand "chest" or "box" or "treasure" as CHEST.
Understand "eggs" or "egg" or "nest" as EGGS.
Understand "trident" as TRIDENT.
Understand "vase" or "ming" or "shards" or "pottery" as VASE.
Understand "emerald" as EMERALD.
Understand "platinum" or "pyramid" as PYRAMID.
Understand "pearl" as PEARL.
Understand "rug" or "persian" as RUG.
Understand "spices" or "spice" as OBJ_63.
Understand "chain" as CHAIN.
Understand "ruby" as RUBY.
Understand "jade" or "necklace" as JADE.
Understand "amber" or "gemstone" as AMBER.
Understand "sapphire" as SAPPH.
Understand "ebony" or "statuette" or "statue" as OBJ_69.

The initial appearance of EMERALD is "There is an emerald here the size of a plover's egg!".
The initial appearance of PYRAMID is "There is a platinum pyramid here, 8 inches on a side!".
The initial appearance of OBJ_63 is "There are rare spices here!".

Oaenteringstream is an action applying to nothing.
Understand "enter stream" as oaenteringstream.
Understand "enter water" as oaenteringstream.

Carry out oaenteringstream:
	if location is LOC_SLIT or location is LOC_SMALLPIT:
		openadventure emit travel message "DONT_FIT";
		stop the action;
	if location is LOC_START or location is LOC_VALLEY or location is LOC_ROADEND:
		say "Your feet are now wet.";
		stop the action;
	say "You can't see any such thing.".

Oaenteringslit is an action applying to nothing.
Understand "enter slit" as oaenteringslit.

Carry out oaenteringslit:
	if openadventure non-direct travel from adventure-id of location with verb token "SLIT":
		if openadventure last travel was movement:
			process openadventure forced travel from location;
		stop the action;
	say "You can't see any such thing.".

Oaenteringcrack is an action applying to nothing.
Understand "enter crack" as oaenteringcrack.

Carry out oaenteringcrack:
	if openadventure non-direct travel from adventure-id of location with verb token "CRACK":
		if openadventure last travel was movement:
			process openadventure forced travel from location;
		stop the action;
	say "You can't see any such thing.".

Oabareclimbing is an action applying to nothing.
Understand the command "climb" as something new.
Understand "climb" as oabareclimbing.

Carry out oabareclimbing:
	if openadventure non-direct travel from adventure-id of location with verb token "CLIMB":
		if openadventure last travel was movement:
			process openadventure forced travel from location;
	else:
		say "There is nothing here to climb.".

Oabaretaking is an action applying to nothing.
Understand "take" as oabaretaking.

To decide what thing is the obvious OpenAdventure take target:
	let candidate be nothing;
	let matches be 0;
	repeat with item running through things in the location of the player:
		if item is not the player:
			if item is not scenery:
				if item is not fixed in place:
					now candidate is item;
					increase matches by 1;
	if matches is 1:
		decide on candidate;
	decide on nothing.

Carry out oabaretaking:
	let candidate be the obvious OpenAdventure take target;
	if candidate is not nothing:
		try taking candidate;
	otherwise:
		say "What do you want to take?".

Oatakingall is an action applying to nothing.
Understand "take all" as oatakingall.
Understand "get all" as oatakingall.

To decide whether (item - thing) is an OpenAdventure take-all candidate:
	if item is the player:
		decide no;
	if item is scenery:
		decide no;
	if item is fixed in place:
		decide no;
	decide yes.

Carry out oatakingall:
	let matches be 0;
	repeat with item running through things in the location of the player:
		if item is an OpenAdventure take-all candidate:
			increase matches by 1;
			say "[item]: ";
			silently try taking item;
			if item is carried by the player:
				say "Taken.[line break]";
			otherwise:
				say "You can't take that.[line break]";
	if matches is 0:
		say "There is nothing here to take.".

Instead of taking inventory:
	let visible-items be 0;
	repeat with item running through things carried by the player:
		if item is not WATER and item is not OIL:
			increase visible-items by 1;
	if visible-items is 0:
		say "You're not carrying anything.";
		stop the action;
	say "You are carrying:[line break]";
	repeat with item running through things carried by the player:
		if item is not WATER and item is not OIL:
			say "  [item][line break]".

Oabaredropping is an action applying to nothing.
Understand "drop" as oabaredropping.

To decide what thing is the obvious OpenAdventure drop target:
	let candidate be nothing;
	let matches be 0;
	repeat with item running through things carried by the player:
		now candidate is item;
		increase matches by 1;
	if matches is 1:
		decide on candidate;
	decide on nothing.

Carry out oabaredropping:
	let candidate be the obvious OpenAdventure drop target;
	if candidate is not nothing:
		try dropping candidate;
	otherwise:
		say "What do you want to drop?".

Instead of dropping BIRD:
	if BIRD is carried by the player:
		if SNAKE is in the location of the player:
			say "The little bird attacks the green snake, and in an astounding flurry drives the snake away.";
			move SNAKE to LOC_NOWHERE;
		move BIRD to the location of the player;
		now adventure-state of BIRD is "BIRD_UNCAGED";
		say "Dropped.";
	otherwise:
		say "You aren't carrying [the BIRD].".

Instead of freeing BIRD:
	if BIRD is carried by the player:
		move BIRD to the location of the player;
		now adventure-state of BIRD is "BIRD_UNCAGED";
		say "OK";
	otherwise if BIRD is in the location of the player:
		now adventure-state of BIRD is "BIRD_UNCAGED";
		say "OK";
	otherwise:
		say "You can't see any such thing.".

Oabareattacking is an action applying to nothing.
Understand "attack" as oabareattacking.
Understand "kill" as oabareattacking.
Understand "fight" as oabareattacking.
Understand "hit" as oabareattacking.
Understand "strike" as oabareattacking.

Carry out oabareattacking:
	if DRAGON is in the location of the player:
		try attacking DRAGON;
		stop the action;
	if BEAR is in the location of the player:
		try attacking BEAR;
		stop the action;
	if OGRE is in the location of the player:
		try attacking OGRE;
		stop the action;
	if an openadventure visible dwarf is present:
		try attacking DWARF;
		stop the action;
	if VEND is in the location of the player:
		try attacking VEND;
		stop the action;
	say "There is nothing here to attack.".

Instead of attacking VEND:
	if adventure-state of VEND is "VEND_UNBLOCKS":
		now adventure-state of VEND is "VEND_BLOCKS";
		say "The vending machine swings back to block the passage.";
	otherwise:
		now adventure-state of VEND is "VEND_UNBLOCKS";
		say "As you strike the vending machine, it pivots backward along with a section of wall, revealing a dark passage leading south.".

Instead of attacking OGRE:
	say "The ogre, who despite his bulk is quite agile, easily dodges your attack.  He seems almost amused by your puny effort.";
	if openadventure-upstream-replay-mode is true:
		say "[paragraph break]One sharp nasty knife is thrown at you![paragraph break]";
		move OGRE to LOC_NOWHERE;
		say "The ogre, distracted by your rush, is struck by the knife.  With a blood-curdling yell he turns and bounds after the dwarf, who flees in panic.  You are left alone in the room.".

Understand "shake [something]" as waving.
Understand "swing [something]" as waving.

Instead of waving ROD:
	if the noun is ROD:
		if location is LOC_PITTOP and (JADE is in LOC_NOWHERE or JADE is off-stage):
			if BIRD is in LOC_PITTOP or adventure-state of BIRD is "BIRD_UNCAGED":
				move JADE to LOC_PITTOP;
				say "The bird flies about agitatedly for a moment, then disappears through the crack.  It reappears shortly, carrying in its beak a jade necklace, which it drops at your feet.";
				stop the action;
		if FISSURE is in the location of the player or location is LOC_EASTBANK or location is LOC_WESTBANK:
			if adventure-state of FISSURE is "BRIDGED":
				now adventure-state of FISSURE is "UNBRIDGED";
				say "The crystal bridge has vanished!";
			otherwise:
				now adventure-state of FISSURE is "BRIDGED";
				say "A crystal bridge now spans the fissure.";
			stop the action;
		say "Nothing happens.";
		stop the action;

Oapouringwater is an action applying to one thing.
Understand "water [something]" as oapouringwater.

Oapouringoil is an action applying to one thing.
Understand "oil [something]" as oapouringoil.

To decide whether OpenAdventure bottle holds water:
	if adventure-state of BOTTLE is "" or adventure-state of BOTTLE is "WATER_BOTTLE":
		decide yes;
	if WATER is carried by the player:
		decide yes;
	decide no.

To decide whether OpenAdventure bottle holds oil:
	if adventure-state of BOTTLE is "OIL_BOTTLE":
		decide yes;
	if OIL is carried by the player:
		decide yes;
	decide no.

To empty OpenAdventure bottle:
	now adventure-state of BOTTLE is "EMPTY_BOTTLE";
	move WATER to LOC_NOWHERE;
	move OIL to LOC_NOWHERE.

To decide whether (item - thing) is an OpenAdventure scoring treasure:
	repeat through the Table of Open Adventure Treasure Scores:
		if scoring-treasure entry is item:
			decide yes;
	decide no.

To decide whether (item - thing) is an OpenAdventure troll payment treasure:
	if item is NUGGET or item is OBJ_51 or item is OBJ_52 or item is OBJ_53 or item is COINS:
		decide yes;
	if item is CHEST or item is EGGS or item is TRIDENT or item is VASE or item is EMERALD:
		decide yes;
	if item is PYRAMID or item is PEARL or item is RUG or item is OBJ_63 or item is CHAIN:
		decide yes;
	if item is RUBY or item is JADE or item is AMBER or item is SAPPH or item is OBJ_69:
		decide yes;
	decide no.

To decide whether OpenAdventure troll is demanding payment:
	if adventure-state of TROLL is "TROLL_GONE":
		decide no;
	if location is LOC_SWCHASM:
		decide yes;
	if location is LOC_NECHASM:
		decide yes;
	if TROLL is in the location of the player:
		decide yes;
	decide no.

Carry out oapouringwater:
	if the noun is PLANT:
		if PLANT is not in the location of the player:
			say "There is no plant here.";
			stop the action;
		if BOTTLE is not carried by the player and WATER is not carried by the player:
			say "You have no water.";
			stop the action;
		if not OpenAdventure bottle holds water:
			say "You have no water.";
			stop the action;
		empty OpenAdventure bottle;
		if adventure-state of PLANT is "PLANT_BELLOWING":
			now adventure-state of PLANT is "PLANT_GROWN";
			say "The plant grows explosively, almost filling the bottom of the pit.";
		else if adventure-state of PLANT is "PLANT_GROWN":
			now adventure-state of PLANT is "PLANT_THIRSTY";
			say "You've over-watered the plant!  It's shriveling up!  And now . . .";
		otherwise:
			now adventure-state of PLANT is "PLANT_BELLOWING";
			say "The plant spurts into furious growth for a few seconds.";
		stop the action;
	if the noun is the door object:
		if the door object is not in the location of the player:
			say "There is no door here.";
			stop the action;
		empty OpenAdventure bottle;
		now adventure-state of the door object is "DOOR_RUSTED";
		say "The hinges are quite thoroughly rusted now and won't budge.";
		stop the action;
	say "The ground is wet.".

Carry out oapouringoil:
	if the noun is the door object:
		if the door object is not in the location of the player:
			say "There is no door here.";
			stop the action;
		if BOTTLE is not carried by the player and OIL is not carried by the player:
			say "You have no oil.";
			stop the action;
		if not OpenAdventure bottle holds oil:
			say "You have no oil.";
			stop the action;
		empty OpenAdventure bottle;
		now adventure-state of the door object is "DOOR_UNRUSTED";
		say "The oil has freed up the hinges so that the door will now move, although it requires some effort.";
		stop the action;
	if the noun is PLANT:
		say "The plant indignantly shakes the oil off its leaves and asks, 'Water?'";
		stop the action;
	say "The ground is wet.".

Oafillingurn is an action applying to nothing.
Understand "fill urn" as oafillingurn.
Understand "fill urn with oil" as oafillingurn.
Understand "pour oil in urn" as oafillingurn.
Understand "pour oil into urn" as oafillingurn.

Carry out oafillingurn:
	if URN is not in the location of the player:
		say "You can't see any such thing.";
		stop the action;
	if adventure-state of URN is not "URN_EMPTY":
		say "The urn is already full of oil.";
		stop the action;
	if openadventure-upstream-replay-mode is true and location is LOC_CLIFF and adventure-state of BOTTLE is "OIL_BOTTLE":
		empty OpenAdventure bottle;
		now adventure-state of URN is "URN_DARK";
		say "Your bottle is now empty and the urn is full of oil.";
		stop the action;
	if BOTTLE is not carried by the player and BOTTLE is not in the location of the player and OIL is not carried by the player and WATER is not carried by the player:
		say "There is nothing here with which to fill it.";
		stop the action;
	if OpenAdventure bottle holds oil:
		empty OpenAdventure bottle;
		now adventure-state of URN is "URN_DARK";
		say "Your bottle is now empty and the urn is full of oil.";
		stop the action;
	if OpenAdventure bottle holds water:
		empty OpenAdventure bottle;
		say "You empty the bottle into the urn, which promptly ejects the water with uncanny accuracy, squirting you directly between the eyes.";
		stop the action;
	say "There is nothing here with which to fill it.".

Oatakingwater is an action applying to nothing.
Understand "get water" as oatakingwater.
Understand "take water" as oatakingwater.

Carry out oatakingwater:
	if BOTTLE is not carried by the player and BOTTLE is not in the location of the player:
		say "You have nothing in which to carry it.";
		stop the action;
	now adventure-state of BOTTLE is "WATER_BOTTLE";
	move BOTTLE to the player;
	move WATER to the player;
	move OIL to LOC_NOWHERE;
	say "Your bottle is now full of water.".

Oafillingwater is an action applying to nothing.
Understand "fill bottle" as oafillingwater.
Understand "fill bottle with water" as oafillingwater.

Carry out oafillingwater:
	if BOTTLE is not carried by the player and BOTTLE is not in the location of the player:
		say "You have nothing in which to carry it.";
		stop the action;
	if location is LOC_EASTPIT:
		now adventure-state of BOTTLE is "OIL_BOTTLE";
		move OIL to the player;
		move WATER to LOC_NOWHERE;
		say "Your bottle is now full of oil.";
		stop the action;
	now adventure-state of BOTTLE is "WATER_BOTTLE";
	move WATER to the player;
	move OIL to LOC_NOWHERE;
	say "Your bottle is now full of water.".

Oafillingoil is an action applying to nothing.
Understand "fill bottle with oil" as oafillingoil.

Carry out oafillingoil:
	if BOTTLE is not carried by the player and BOTTLE is not in the location of the player:
		say "You have nothing in which to carry it.";
		stop the action;
	if location is not LOC_EASTPIT:
		say "There is no oil here.";
		stop the action;
	now adventure-state of BOTTLE is "OIL_BOTTLE";
	move OIL to the player;
	move WATER to LOC_NOWHERE;
	say "Your bottle is now full of oil.".

Oatakingoil is an action applying to nothing.
Understand "get oil" as oatakingoil.
Understand "take oil" as oatakingoil.

Carry out oatakingoil:
	if BOTTLE is not carried by the player and BOTTLE is not in the location of the player:
		say "You have nothing in which to carry it.";
		stop the action;
	if location is not LOC_EASTPIT:
		say "There is no oil here.";
		stop the action;
	now adventure-state of BOTTLE is "OIL_BOTTLE";
	move BOTTLE to the player;
	move OIL to the player;
	move WATER to LOC_NOWHERE;
	say "Your bottle is now full of oil.".

To decide whether (item - thing) is an OpenAdventure cavity gemstone:
	if item is EMERALD or item is RUBY or item is AMBER or item is SAPPH:
		decide yes;
	decide no.

To handle OpenAdventure cavity gemstone drop for (item - thing):
	if adventure-state of CAVITY is "CAVITY_FULL":
		move item to the location of the player;
		say "Dropped.";
	otherwise:
		now adventure-state of CAVITY is "CAVITY_FULL";
		now adventure-state of item is "STATE_IN_CAVITY";
		move item to the location of the player;
		say "The gem fits easily into the cavity.";
		if RUG is in the location of the player:
			if item is EMERALD and adventure-state of RUG is not "RUG_HOVER":
				now adventure-state of RUG is "RUG_HOVER";
				say "[paragraph break]The Persian rug stiffens and rises a foot or so off the ground.";
			else if item is RUBY and adventure-state of RUG is "RUG_HOVER":
				now adventure-state of RUG is "RUG_FLOOR";
				say "[paragraph break]The Persian rug settles gently to the ground.";

Instead of dropping something (called gem) when CAVITY is in the location of the player:
	if gem is an OpenAdventure cavity gemstone:
		if gem is carried by the player:
			handle OpenAdventure cavity gemstone drop for gem;
		otherwise:
			say "You aren't carrying that.";
	otherwise:
		continue the action.

After taking something (called gem) when CAVITY is in the location of the player:
	if gem is an OpenAdventure cavity gemstone:
		if adventure-state of gem is "STATE_IN_CAVITY" or adventure-state of gem is "AMBER_IN_ROCK":
			now adventure-state of CAVITY is "CAVITY_EMPTY";
			now adventure-state of gem is "".

Oarubbingurn is an action applying to nothing.
Understand "rub urn" as oarubbingurn.

Carry out oarubbingurn:
	if URN is not in the location of the player:
		say "You can't see any such thing.";
		stop the action;
	if adventure-state of URN is "URN_LIT":
		move URN to LOC_NOWHERE;
		move CAVITY to the location of the player;
		move AMBER to the location of the player;
		now adventure-state of AMBER is "AMBER_IN_ROCK";
		now adventure-state of CAVITY is "CAVITY_FULL";
		say "As you rub the urn, there is a flash of light and a genie appears.[line break]His aspect is stern as he advises: [quotation mark]One who wouldst traffic in[line break]precious stones must first learn to recognize the signals thereof.[quotation mark][line break]He wrests the urn from the stone, leaving a small cavity.  Turning to[line break]face you again, he fixes you with a steely eye and intones: [quotation mark]Caution![quotation mark][line break]Genie and urn vanish in a cloud of amber smoke.  The smoke condenses[line break]to form a rare amber gemstone, resting in the cavity in the rock.";
		stop the action;
	say "Peculiar.  Nothing unexpected happens.".

Oaflying is an action applying to nothing.
Understand "fly" as oaflying.

Oaflyingthing is an action applying to one thing.
Understand "fly [something]" as oaflyingthing.

To perform OpenAdventure rug flight:
	let source-room be the location of the player;
	if RUG is not in the location of the player:
		say "Though you flap your arms furiously, it is to no avail.";
	else if adventure-state of RUG is not "RUG_HOVER":
		say "If you mean to use the Persian rug, it does not appear inclined to cooperate.";
	else if source-room is LOC_CLIFF:
		move RUG to LOC_LEDGE;
		move the player to LOC_LEDGE;
		say "You board the Persian rug, which promptly whisks you across the chasm.[line break]You have time for a fleeting glimpse of a two thousand foot drop to a[line break]mighty river; then you find yourself on the other side.[paragraph break]";
		run openadventure post-travel hooks for source source-room destination LOC_LEDGE verb "FLY";
		try looking;
	else if source-room is LOC_LEDGE:
		move RUG to LOC_CLIFF;
		move the player to LOC_CLIFF;
		say "The rug ferries you back across the chasm.[paragraph break]";
		run openadventure post-travel hooks for source source-room destination LOC_CLIFF verb "FLY";
		try looking;
	otherwise:
		say "Nothing happens.".

Carry out oaflying:
	perform OpenAdventure rug flight.

Carry out oaflyingthing:
	if the noun is not RUG:
		say "Nothing happens.";
		stop the action;
	perform OpenAdventure rug flight.

Oareservoirmagic is an action applying to nothing.
Understand "n'beh" as oareservoirmagic.
Understand "nbeh" as oareservoirmagic.
Understand "h'cfl" as oareservoirmagic.
Understand "hcfl" as oareservoirmagic.

Carry out oareservoirmagic:
	if location is LOC_RESERVOIR or location is LOC_RESBOTTOM:
		if adventure-state of RESER is "WATERS_PARTED":
			now adventure-state of RESER is "WATERS_UNPARTED";
			say "The waters crash together again.";
		otherwise:
			now adventure-state of RESER is "WATERS_PARTED";
			say "The waters have parted to form a narrow path across the reservoir.";
		stop the action;
	say "Nothing happens.".

Instead of opening CLAM:
	if location is not LOC_SHELLROOM:
		say "You can't see any such thing.";
		stop the action;
	if TRIDENT is not carried by the player and TRIDENT is not in the location of the player:
		say "You don't have anything strong enough to open the clam.";
		stop the action;
	if adventure-state of CLAM is "CLAM_OPENED":
		say "The oyster creaks open, revealing nothing but oyster inside.  It promptly snaps shut again.";
		stop the action;
	now adventure-state of CLAM is "CLAM_OPENED";
	move CLAM to LOC_NOWHERE;
	move OYSTER to LOC_SHELLROOM;
	now OYSTER is fixed in place;
	move PEARL to LOC_CULDESAC;
	say "A glistening pearl falls out of the clam and rolls away.  Goodness,[line break]this must really be an oyster.  (I never was very good at identifying[line break]bivalves.)  Whatever it is, it has now snapped shut again.".

Instead of opening OYSTER:
	if location is not LOC_SHELLROOM and location is not LOC_NE and location is not LOC_SW:
		say "You can't see any such thing.";
		stop the action;
	say "The oyster creaks open, revealing nothing but oyster inside.  It promptly snaps shut again.".

To perform OpenAdventure foobar word (stage - number):
	if stage is openadventure-foobar-stage + 1:
		now openadventure-foobar-stage is stage;
		if stage is 4:
			now openadventure-foobar-stage is 0;
			if EGGS is in LOC_GIANTROOM:
				say "Nothing happens.";
			otherwise if EGGS is in the location of the player:
				move EGGS to LOC_GIANTROOM;
				say "The nest of golden eggs has vanished!";
			otherwise:
				move EGGS to LOC_GIANTROOM;
				say "Done!";
		otherwise:
			say "OK";
		stop;
	now openadventure-foobar-stage is 0;
	say "Nothing happens.".

Oafeeing is an action applying to nothing.
Understand "fee" as oafeeing.
Carry out oafeeing:
	perform OpenAdventure foobar word 1.

Oafieing is an action applying to nothing.
Understand "fie" as oafieing.
Carry out oafieing:
	perform OpenAdventure foobar word 2.

Oafoeing is an action applying to nothing.
Understand "foe" as oafoeing.
Carry out oafoeing:
	perform OpenAdventure foobar word 3.

Oafooing is an action applying to nothing.
Understand "foo" as oafooing.
Carry out oafooing:
	perform OpenAdventure foobar word 4.

Oaopeninggrate is an action applying to nothing.
Understand "open grate" as oaopeninggrate.
Understand "unlock grate" as oaopeninggrate.
Understand "unlock grate with keys" as oaopeninggrate.

Carry out oaopeninggrate:
	if GRATE is not in the location of the player and location is not LOC_START and location is not LOC_VALLEY and location is not LOC_SLIT and location is not LOC_COBBLE and location is not LOC_DEBRIS and location is not LOC_AWKWARD and location is not LOC_BIRDCHAMBER and location is not LOC_PITTOP:
		say "There is no grate here.";
		stop the action;
	if KEYS is not carried by the player and KEYS is not in the location of the player:
		say "You have no keys!";
		stop the action;
	if openadventure-cave-closing-active is true:
		say "A mysterious recorded voice groans into life and announces: 'This exit is closed. Please leave via main office.'";
		stop the action;
	now adventure-state of GRATE is "GRATE_OPEN";
	say "The grate is now open.".

Oaclosinggrate is an action applying to nothing.
Understand "close grate" as oaclosinggrate.
Understand "lock grate" as oaclosinggrate.
Understand "lock grate with keys" as oaclosinggrate.

Carry out oaclosinggrate:
	if KEYS is not carried by the player and KEYS is not in the location of the player:
		say "You have no keys!";
		stop the action;
	now adventure-state of GRATE is "GRATE_CLOSED";
	say "The grate is now closed.".

Oathrowing is an action applying to one thing.
Understand the command "throw" as something new.
Understand the command "toss" as something new.
Understand "throw [something]" as oathrowing.
Understand "toss [something]" as oathrowing.
Understand "throw [something] at [something]" as throwing it at.
Understand "toss [something] at [something]" as throwing it at.

Carry out oathrowing:
	if the noun is FOOD and BEAR is in the location of the player:
		try throwing FOOD at BEAR;
		stop the action;
	if the noun is an OpenAdventure troll payment treasure and OpenAdventure troll is demanding payment:
		if the noun is carried by the player:
			move the noun to LOC_NOWHERE;
			move TROLL to LOC_NOWHERE;
			move TROLL2 to LOC_SWCHASM;
			now adventure-state of TROLL is "TROLL_UNPAID";
			say "The troll catches your treasure and scurries away out of sight.";
		otherwise:
			say "You aren't carrying that.";
		stop the action;
	if the noun is AXE:
		if DRAGON is in the location of the player:
			try throwing AXE at DRAGON;
			stop the action;
		if BEAR is in the location of the player:
			try throwing AXE at BEAR;
			stop the action;
		if TROLL is in the location of the player:
			move AXE to the location of the player;
			say "The troll deftly catches the axe, examines it carefully, and tosses it back, declaring, 'Good workmanship, but it's not valuable enough.'";
			stop the action;
	if the noun is carried by the player:
		try dropping the noun;
	otherwise:
		say "You aren't carrying that.".

To decide what text is the OpenAdventure dispatch token for (raw-command - text):
	let command-token be raw-command;
	replace the regular expression "^\s+" in command-token with "";
	replace the regular expression "\s+$" in command-token with "";
	if command-token is "":
		decide on "";
	if the number of words in command-token is not 1:
		if the number of words in command-token is 2:
			let first-word be word number 1 in command-token;
			let second-word be word number 2 in command-token;
			if first-word is "leave" or first-word is "exit":
				if second-word is "building" or second-word is "build" or second-word is "house":
					if OpenAdventure command token "out" maps to available travel:
						decide on "OUT";
			if first-word is "enter" or first-word is "go" or first-word is "walk":
				if first-word is "enter" and (second-word is "stream" or second-word is "water"):
					decide on "";
				let second-token be the OpenAdventure mapped parser token for second-word;
				if second-token is not "":
					if OpenAdventure command token second-word maps to available travel:
						decide on second-token;
		decide on "";
	if command-token is "l" or command-token is "look" or command-token is "x":
		decide on "";
	if command-token is "i" or command-token is "inven" or command-token is "inventory":
		decide on "";
	if OpenAdventure command token command-token maps to available travel:
		decide on the OpenAdventure mapped parser token for command-token;
	if openadventure player expects in-out routing for command-token:
		decide on the OpenAdventure mapped parser token for command-token;
	decide on "".

To decide what text is the OpenAdventure mapped parser token for (command-token - text):
	repeat through the Table of OpenAdventure Parser Travel Tokens:
		if parser-token entry is command-token:
			decide on dispatch-token entry;
	decide on "".

To decide whether OpenAdventure command token (command-token - text) maps to available travel:
	let mapped-token be the OpenAdventure mapped parser token for command-token;
	if mapped-token is "":
		decide no;
	repeat through the Table of Generated Travel Non-Direct Rules:
		if source-loc entry is adventure-id of location and forced entry is false:
			if movement token mapped-token is in token list verbs entry:
				decide yes;
	decide no.

To decide whether openadventure player expects in-out routing for (command-token - text):
	if command-token is "in" or command-token is "inside" or command-token is "inward":
		decide yes;
	if command-token is "out" or command-token is "exit" or command-token is "leave":
		decide yes;
	if command-token is "enter":
		decide yes;
	decide no.

To decide whether openadventure last travel was movement:
	if openadventure-last-travel-category is "goto":
		decide yes;
	if openadventure-last-travel-category is "goto_non_direct":
		decide yes;
	if openadventure-last-travel-category is "goto_conditional":
		decide yes;
	if openadventure-last-travel-category is "goto_forced":
		decide yes;
	if openadventure-last-travel-category is "goto_random":
		decide yes;
	if openadventure-last-travel-category is "goto_magic_word":
		decide yes;
	decide no.

To finish OpenAdventure direct direction fallback from (source-room - room) with verb-token (verb-token - text):
	if location is not source-room:
		run openadventure post-travel hooks for source source-room destination location verb verb-token.

To decide whether OpenAdventure direct direction fallback handles (verb-token - text):
	let source-room be the location;
	if verb-token is "NORTH":
		try going north;
		finish OpenAdventure direct direction fallback from source-room with verb-token verb-token;
		decide yes;
	if verb-token is "SOUTH":
		try going south;
		finish OpenAdventure direct direction fallback from source-room with verb-token verb-token;
		decide yes;
	if verb-token is "EAST":
		try going east;
		finish OpenAdventure direct direction fallback from source-room with verb-token verb-token;
		decide yes;
	if verb-token is "WEST":
		try going west;
		finish OpenAdventure direct direction fallback from source-room with verb-token verb-token;
		decide yes;
	if verb-token is "UPWAR":
		try going up;
		finish OpenAdventure direct direction fallback from source-room with verb-token verb-token;
		decide yes;
	if verb-token is "DOWN":
		try going down;
		finish OpenAdventure direct direction fallback from source-room with verb-token verb-token;
		decide yes;
	if verb-token is "NE":
		try going northeast;
		finish OpenAdventure direct direction fallback from source-room with verb-token verb-token;
		decide yes;
	if verb-token is "SE":
		try going southeast;
		finish OpenAdventure direct direction fallback from source-room with verb-token verb-token;
		decide yes;
	if verb-token is "SW":
		try going southwest;
		finish OpenAdventure direct direction fallback from source-room with verb-token verb-token;
		decide yes;
	if verb-token is "NW":
		try going northwest;
		finish OpenAdventure direct direction fallback from source-room with verb-token verb-token;
		decide yes;
	decide no.

After reading a command:
	let raw-command be text;
	let raw-command be the player's command;
	let dispatch-token be the OpenAdventure dispatch token for raw-command;
	if dispatch-token is not "":
		now openadventure-parser-dispatch-token is dispatch-token;
		change the text of the player's command to "openadventure-travel [dispatch-token]";
	else:
		now openadventure-parser-dispatch-token is "".

Carry out oatraveling:
	let dispatch-token be openadventure-parser-dispatch-token;
	if dispatch-token is "":
		let dispatch-token be the OpenAdventure dispatch token for "[the topic understood]";
	if dispatch-token is "":
		say "You can't go that way.";
		stop the action;
	let source-id be adventure-id of location;
	if openadventure non-direct travel from source-id with verb token dispatch-token:
		if openadventure last travel was movement:
			process openadventure forced travel from location;
	else if OpenAdventure direct direction fallback handles dispatch-token:
		do nothing;
	else if dispatch-token is "INWAR" or dispatch-token is "OUT" or dispatch-token is "ENTER":
		openadventure emit travel message "NO_INOUT_HERE";
	else:
		say "You can't go that way.";
	now openadventure-parser-dispatch-token is "".

Report oatraveling:
	do nothing.

Table of OpenAdventure Parser Travel Tokens
parser-token (text)	dispatch-token (text)
"n"	"NORTH"
"north"	"NORTH"
"s"	"SOUTH"
"south"	"SOUTH"
"e"	"EAST"
"east"	"EAST"
"w"	"WEST"
"west"	"WEST"
"u"	"UPWAR"
"up"	"UPWAR"
"d"	"DOWN"
"down"	"DOWN"
"ne"	"NE"
"northeast"	"NE"
"se"	"SE"
"southeast"	"SE"
"sw"	"SW"
"southwest"	"SW"
"nw"	"NW"
"northwest"	"NW"
"in"	"INWAR"
"inside"	"INWAR"
"inward"	"INWAR"
"out"	"OUT"
"exit"	"OUT"
"leave"	"OUT"
"outside"	"OUTDO"
"outdoors"	"OUTDO"
"enter"	"ENTER"
"cross"	"CROSS"
"over"	"OVER"
"forward"	"FORWA"
"onward"	"FORWA"
"back"	"BACK"
"return"	"BACK"
"retreat"	"BACK"
"left"	"LEFT"
"right"	"RIGHT"
"climb"	"CLIMB"
"crawl"	"CRAWL"
"jump"	"JUMP"
"building"	"BUILD"
"build"	"BUILD"
"house"	"BUILD"
"road"	"ROAD"
"hill"	"HILL"
"forest"	"FORES"
"forests"	"FORES"
"valley"	"VALLE"
"gully"	"GULLY"
"stream"	"STREA"
"upstream"	"UPSTR"
"downstream"	"DOWNS"
"depression"	"DEPRE"
"entrance"	"ENTRA"
"cave"	"CAVE"
"cavern"	"CAVER"
"cobble"	"COBBL"
"cobbles"	"COBBL"
"debris"	"DEBRI"
"debrisroom"	"DEBRI"
"pit"	"PIT"
"passage"	"PASSA"
"tunnel"	"TUNNE"
"canyon"	"CANYO"
"low"	"LOW"
"awkward"	"AWKWA"
"giant"	"GIANT"
"view"	"VIEW"
"crack"	"CRACK"
"steps"	"STEPS"
"stairs"	"STAIR"
"stair"	"STAIR"
"dome"	"DOME"
"hall"	"HALL"
"barren"	"BARRE"
"bed"	"BED"
"bedquilt"	"BEDQU"
"bedqu"	"BEDQU"
"oriental"	"ORIEN"
"orientalroom"	"ORIEN"
"fork"	"FORK"
"slab"	"SLAB"
"slabroom"	"SLAB"
"shell"	"SHELL"
"shellroom"	"SHELL"
"reservoir"	"RESER"
"room"	"ROOM"
"floor"	"FLOOR"
"hole"	"HOLE"
"wall"	"WALL"
"broken"	"BROKE"
"plover"	"PLOVE"
"plove"	"PLOVE"
"plugh"	"PLUGH"
"xyzzy"	"XYZZY"
"y2"	"Y2"
"office"	"OFFICE"
"main"	"OFFICE"

Section 6 - Diagnostics

To print OpenAdventure runtime state:
	say "Runtime ready: [if openadventure-framework-ready is true]yes[otherwise]no[end if]; ";
	say "rule [openadventure-current-travel-rule-id], source [openadventure-active-source-loc].".

OpenAdventure Runtime ends here.
