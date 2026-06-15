Version 1 of OpenAdventure Pirate by OpenAdventure begins here.

[ Exported from OpenAdventure_Pirate.ni by tools/make_author_edition.py. ]

[ Open Adventure Pirate Subsystem ]

Section 1 - Messages

The initial appearance of CHEST is "The pirate's treasure chest is here!"

To say openadventure pirate rustles message:
	say "There are faint rustling noises from the darkness behind you."

To say openadventure pirate pounces message:
	say "Out from the shadows behind you pounces a bearded pirate!  [quotation mark]Har, har,[quotation mark] he chortles, [quotation mark]I'll just take all this booty and hide it away with me chest deep in the maze![quotation mark]  He snatches your treasure and vanishes into the gloom."

To say openadventure pirate spotted message:
	say "There are faint rustling noises from the darkness behind you.  As you turn toward them, the beam of your lamp falls across a bearded pirate.  He is carrying a large chest.  [quotation mark]Shiver me timbers![quotation mark] he cries, [quotation mark]I've been spotted!  I'd best hie meself off to the maze to hide me chest![quotation mark] With that, he vanishes into the gloom."

Section 2 - Room and treasure predicates

To decide whether openadventure pirate forbidden room is (candidate-room - room):
	if candidate-room is LOC_MAZEEND1:
		decide yes;
	if candidate-room is LOC_MAZEEND2:
		decide yes;
	if candidate-room is LOC_MAZEEND3:
		decide yes;
	if candidate-room is LOC_MAZEEND4:
		decide yes;
	if candidate-room is LOC_MAZEEND5:
		decide yes;
	if candidate-room is LOC_MAZEEND6:
		decide yes;
	if candidate-room is LOC_MAZEEND9:
		decide yes;
	if candidate-room is LOC_MAZEEND10:
		decide yes;
	if candidate-room is LOC_MAZEEND11:
		decide yes;
	if candidate-room is LOC_NECHASM:
		decide yes;
	if candidate-room is LOC_CORRIDOR:
		decide yes;
	if candidate-room is LOC_FORK:
		decide yes;
	if candidate-room is LOC_WARMWALLS:
		decide yes;
	if candidate-room is LOC_BREATHTAKING:
		decide yes;
	if candidate-room is LOC_BOULDERS2:
		decide yes;
	if candidate-room is LOC_LIMESTONE:
		decide yes;
	if candidate-room is LOC_BARRENFRONT:
		decide yes;
	if candidate-room is LOC_BARRENROOM:
		decide yes;
	decide no.

To decide whether openadventure-pirate ignores pyramid in (current-room - room):
	if current-room is LOC_DARKROOM:
		decide yes;
	if current-room is LOC_PLOVER:
		decide yes;
	decide no.

To decide whether openadventure-pirate treasure (item - thing) is protected in (current-room - room):
	if item is PYRAMID and openadventure-pirate ignores pyramid in current-room:
		decide yes;
	decide no.

To decide whether openadventure-pirate treasure is nearby (item - thing) in (current-room - room):
	if openadventure-pirate treasure item is protected in current-room:
		decide no;
	if item is carried by the player:
		decide yes;
	if item is in current-room:
		decide yes;
	decide no.

To decide whether openadventure-pirate treasure is carried (item - thing) in (current-room - room):
	if openadventure-pirate treasure item is protected in current-room:
		decide no;
	if item is carried by the player:
		decide yes;
	decide no.

Section 3 - State transitions

To initialize openadventure pirate subsystem:
	enable subsystem pirate;
	now openadventure-pirate-chest-location is LOC_MAZEEND12;
	now openadventure-pirate-message-location is LOC_DEADEND13;
	now openadventure-pirate-chest-placed is false;
	now openadventure-pirate-chest-found is false;
	now openadventure-pirate-has-stolen is false;
	now openadventure-pirate-force-chest-ready is false;
	now openadventure-pirate-last-theft-count is 0;
	now adventure-state of CHEST is "PIRATE_CHEST_HIDDEN";
	move CHEST to LOC_NOWHERE;
	move MESSAG to LOC_NOWHERE;
	repeat through the Table of Open Adventure Dwarf Actors:
		if dwarf-index entry is 6:
			now dwarf-location entry is openadventure-pirate-chest-location;
			now dwarf-prior-location entry is openadventure-pirate-chest-location;
			now dwarf-seen entry is false;
			now dwarf-alive entry is true.

To place openadventure pirate chest:
	move CHEST to openadventure-pirate-chest-location;
	move MESSAG to openadventure-pirate-message-location;
	now openadventure-pirate-chest-placed is true;
	now adventure-state of CHEST is "PIRATE_CHEST_PLACED";
	repeat through the Table of Open Adventure Dwarf Actors:
		if dwarf-index entry is 6:
			now dwarf-location entry is openadventure-pirate-chest-location;
			now dwarf-prior-location entry is openadventure-pirate-chest-location;
			now dwarf-seen entry is false.

To mark openadventure pirate chest found if appropriate in (current-room - room):
	if current-room is openadventure-pirate-chest-location and CHEST is in openadventure-pirate-chest-location:
		now openadventure-pirate-chest-found is true;
		now adventure-state of CHEST is "PIRATE_CHEST_FOUND";
		mark openadventure treasure CHEST as found for reason "pirate_chest_found".

To steal openadventure pirate booty in (current-room - room):
	now openadventure-pirate-last-theft-count is 0;
	repeat through the Table of Open Adventure Pirate Treasures:
		let loot be pirate-treasure entry;
		if loot is CHEST:
			next;
		if openadventure-pirate treasure loot is protected in current-room:
			next;
		if loot is carried by the player:
			mark openadventure treasure loot as found for reason "pirate_theft";
			move loot to openadventure-pirate-chest-location;
			increase openadventure-pirate-last-theft-count by 1;
		else if loot is in current-room:
			mark openadventure treasure loot as found for reason "pirate_theft";
			move loot to openadventure-pirate-chest-location;
			increase openadventure-pirate-last-theft-count by 1;
	if openadventure-pirate-last-theft-count > 0:
		now openadventure-pirate-has-stolen is true.

To decide whether openadventure upstream replay pirate pounce room is (current-room - room):
	if current-room is LOC_ALIKE2:
		decide yes;
	decide no.

To run openadventure upstream replay pirate hooks in (current-room - room):
	mark openadventure pirate chest found if appropriate in current-room;
	if openadventure-upstream-replay-mode is false:
		stop;
	if openadventure-pirate-chest-placed is true:
		stop;
	if not openadventure upstream replay pirate pounce room is current-room:
		stop;
	if openadventure-dwarf-activity-level < 2:
		now openadventure-dwarf-activity-level is 2;
	if not openadventure pirate is eligible in current-room:
		stop;
	let carried-treasures be 0;
	repeat through the Table of Open Adventure Pirate Treasures:
		let loot be pirate-treasure entry;
		if loot is CHEST:
			next;
		if openadventure-pirate treasure is carried loot in current-room:
			increase carried-treasures by 1;
	if carried-treasures > 0:
		place openadventure pirate chest;
		say "[openadventure pirate pounces message]";
		steal openadventure pirate booty in current-room.

Section 4 - Encounter resolution

To decide whether openadventure pirate is eligible in (current-room - room):
	if openadventure-subsystem-pirate is false:
		decide no;
	if openadventure-dwarf-activity-level < 2:
		decide no;
	if current-room is LOC_NOWHERE:
		decide no;
	if not openadventure deep cave membership of current-room:
		decide no;
	if openadventure pirate forbidden room is current-room:
		decide no;
	if current-room is openadventure-pirate-chest-location:
		decide no;
	if openadventure-pirate-chest-found is true:
		decide no;
	decide yes.

To decide whether openadventure pirate should appear in (current-room - room):
	if not openadventure pirate is eligible in current-room:
		decide no;
	repeat through the Table of Open Adventure Dwarf Actors:
		if dwarf-index entry is 6:
			if dwarf-alive entry is false:
				decide no;
			if dwarf-seen entry is true:
				decide yes;
			if dwarf-location entry is current-room:
				decide yes;
			if dwarf-prior-location entry is current-room:
				decide yes;
	if a random chance of 1 in 8 succeeds:
		decide yes;
	decide no.

To run openadventure pirate post-dwarf-round in (current-room - room) with dwarf-count (visible-dwarves - number):
	mark openadventure pirate chest found if appropriate in current-room;
	if not openadventure pirate should appear in current-room:
		stop;
	let nearby-treasures be 0;
	let carried-treasures be 0;
	repeat through the Table of Open Adventure Pirate Treasures:
		let loot be pirate-treasure entry;
		if loot is CHEST:
			next;
		if openadventure-pirate treasure is nearby loot in current-room:
			increase nearby-treasures by 1;
		if openadventure-pirate treasure is carried loot in current-room:
			increase carried-treasures by 1;
	repeat through the Table of Open Adventure Dwarf Actors:
		if dwarf-index entry is 6:
			now dwarf-prior-location entry is dwarf-location entry;
			now dwarf-location entry is current-room;
			now dwarf-seen entry is true;
	if nearby-treasures is 0 and openadventure-pirate-force-chest-ready is true and openadventure-pirate-chest-placed is false:
		say "[openadventure pirate spotted message]";
		place openadventure pirate chest;
		stop;
	if carried-treasures > 0:
		place openadventure pirate chest;
		say "[openadventure pirate pounces message]";
		steal openadventure pirate booty in current-room;
		stop;
	if a random chance of 20 in 100 succeeds:
		say "[openadventure pirate rustles message]".

When play begins:
	initialize openadventure pirate subsystem.

OpenAdventure Pirate ends here.
