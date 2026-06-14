[ Open Adventure Dwarf Subsystem ]

Section 1 - Messages

To say openadventure dwarf block message:
	say "A little dwarf with a big knife blocks your way!"

To say openadventure dwarf encountered message:
	say "A little dwarf just walked around a corner, saw you, threw a little axe at you which missed, cursed, and ran away;"

To say openadventure dwarf-single message:
	say "There is a threatening little dwarf in the room with you!"

To say openadventure dwarf-pack message (pack-size - number):
	say "There are [pack-size] threatening little dwarves in the room with you!"

To say openadventure dwarf knife-message:
	say "One sharp nasty knife is thrown at you!"

To say openadventure thrown-knives-message (thrown-count - number):
	say "[thrown-count] of them throw knives at you!"

To say openadventure multi-hit-message (hit-count - number):
	if hit-count is 1:
		say "One of them gets you!";
	otherwise:
		say "[hit-count] of them get you!"

To say openadventure miss-message:
	say "None of them hits you!"

To say openadventure single-hit-message:
	say "It gets you!"

To say openadventure miss-single-message:
	say "It misses!"

To say openadventure you-killed-dwarf-message:
	say "You killed a little dwarf."

To say openadventure dwarf dodges-message:
	say "You attack a little dwarf, but he dodges out of the way;"

Section 2 - Cave and route predicates

To decide if openadventure deep cave membership of (candidate-room - room):
	if candidate-room is LOC_NOWHERE:
		decide no;
	if candidate-room is LOC_START:
		decide no;
	if candidate-room is LOC_HILL:
		decide no;
	if candidate-room is LOC_BUILDING:
		decide no;
	if candidate-room is LOC_VALLEY:
		decide no;
	if candidate-room is LOC_ROADEND:
		decide no;
	if candidate-room is LOC_CLIFF:
		decide no;
	if candidate-room is LOC_SLIT:
		decide no;
	if candidate-room is LOC_GRATE:
		decide no;
	if candidate-room is LOC_BELOWGRATE:
		decide no;
	if candidate-room is LOC_COBBLE:
		decide no;
	if candidate-room is LOC_DEBRIS:
		decide no;
	if candidate-room is LOC_AWKWARD:
		decide no;
	if candidate-room is LOC_BIRDCHAMBER:
		decide no;
	if candidate-room is LOC_PITTOP:
		decide no;
	if candidate-room is LOC_LEDGE:
		decide no;
	if candidate-room is LOC_FOOF1:
		decide no;
	if candidate-room is LOC_FOOF2:
		decide no;
	if candidate-room is LOC_FOOF4:
		decide no;
	decide yes.

To decide whether openadventure-dwarf-route is forbidden between (source-id - text) and (destination-id - text):
	if source-id is "LOC_LONGWEST" and destination-id is "LOC_DIFFERENT1":
		decide yes;
	decide no.

To decide whether openadventure-dwarf-route is forbidden from (source-room - room) to (destination-room - room):
	if source-room is LOC_LONGWEST and destination-room is LOC_DIFFERENT1:
		decide yes;
	decide no.

To decide whether openadventure nodwarves traversal from source-location (source-id - text) to destination-location (destination-id - text):
	if openadventure-nodwarves-mode is false:
		decide yes;
	if openadventure-dwarf-route is forbidden between source-id and destination-id:
		decide no;
	decide yes.

Section 3 - Actor state

To decide what room is the starting room for dwarf index (dwarf-idx - number):
	if dwarf-idx is 1:
		decide on LOC_KINGHALL;
	if dwarf-idx is 2:
		decide on LOC_WESTBANK;
	if dwarf-idx is 3:
		decide on LOC_Y2;
	if dwarf-idx is 4:
		decide on LOC_ALIKE3;
	if dwarf-idx is 5:
		decide on LOC_COMPLEX;
	if dwarf-idx is 6:
		decide on LOC_MAZEEND12;
	decide on LOC_NOWHERE.

To initialize openadventure dwarf actors:
	repeat through the Table of Open Adventure Dwarf Actors:
		now dwarf-location entry is starting room for dwarf index dwarf-index entry;
		now dwarf-prior-location entry is LOC_NOWHERE;
		now dwarf-seen entry is false;
		now dwarf-alive entry is true;
	now openadventure-dwarf-kill-count is 0;
	move DWARF to LOC_NOWHERE.

To decide whether an openadventure visible dwarf is present:
	repeat through the Table of Open Adventure Dwarf Actors:
		if dwarf-index entry is 6:
			next;
		if dwarf-alive entry is false:
			next;
		if dwarf-seen entry is true and dwarf-location entry is the location of the player:
			decide yes;
	decide no.

To kill one openadventure visible dwarf:
	repeat through the Table of Open Adventure Dwarf Actors:
		if dwarf-index entry is 6:
			next;
		if dwarf-alive entry is false:
			next;
		if dwarf-seen entry is true and dwarf-location entry is the location of the player:
			now dwarf-alive entry is false;
			now dwarf-location entry is LOC_NOWHERE;
			now dwarf-prior-location entry is LOC_NOWHERE;
			now dwarf-seen entry is false;
			increase openadventure-dwarf-kill-count by 1;
			stop.

Section 4 - Travel gates and encounter flow

To enable openadventure dwarf movement pass:
	now openadventure-dwarf-movement-pass is true.

To disable openadventure dwarf movement pass:
	now openadventure-dwarf-movement-pass is false.

To decide whether openadventure-dwarf-blocks-travel from (source-room - room) to (destination-room - room):
	if source-room is LOC_NOWHERE:
		decide no;
	if destination-room is LOC_NOWHERE:
		decide no;
	if not openadventure deep cave membership of source-room:
		decide no;
	repeat through the Table of Open Adventure Dwarf Actors:
		if dwarf-index entry is 6:
			next;
		if dwarf-alive entry is false:
			next;
		if dwarf-seen entry is true and dwarf-location entry is source-room and dwarf-prior-location entry is destination-room:
			say "[openadventure dwarf block message]";
			decide yes;
	decide no.

To begin openadventure dwarf first encounter in (current-room - room):
	if not openadventure deep cave membership of current-room:
		stop;
	if a random chance of 95 in 100 succeeds:
		stop;
	now openadventure-dwarf-activity-level is 2;
	let survivors-to-kill be 0;
	repeat through the Table of Open Adventure Dwarf Actors:
		if dwarf-index entry is 6:
			next;
		if survivors-to-kill is 2:
			next;
		if a random chance of 50 in 100 succeeds:
			increase survivors-to-kill by 1;
			increase openadventure-dwarf-kill-count by 1;
			now dwarf-alive entry is false;
			now dwarf-location entry is LOC_NOWHERE;
			now dwarf-prior-location entry is LOC_NOWHERE;
			now dwarf-seen entry is false;
	repeat through the Table of Open Adventure Dwarf Actors:
		if dwarf-index entry is 6:
			next;
		if dwarf-alive entry is false:
			next;
		if dwarf-location entry is current-room:
			now dwarf-location entry is LOC_NUGGET;
			now dwarf-prior-location entry is LOC_NUGGET;
			now dwarf-seen entry is false;
	say "[openadventure dwarf encountered message]";
	move DWARF to LOC_NOWHERE;
	move AXE to current-room.

To openadventure-run-dwarf-round in (current-room - room):
	let visible-dwarves be 0;
	let attackers be 0;
	let hitters be 0;
	let hit-chance be 0;
	if openadventure-dwarf-activity-level < 2:
		stop;
	if openadventure-dwarves-travel-in-progress is true:
		stop;
	now openadventure-dwarves-travel-in-progress is true;
	repeat through the Table of Open Adventure Dwarf Actors:
		if dwarf-index entry is 6:
			next;
		if dwarf-alive entry is false:
			next;
		if dwarf-location entry is LOC_NOWHERE:
			next;
		if dwarf-seen entry is true:
			now dwarf-prior-location entry is dwarf-location entry;
			now dwarf-location entry is current-room;
			increase visible-dwarves by 1;
			increase attackers by 1;
		else if dwarf-location entry is current-room or dwarf-prior-location entry is current-room:
			now dwarf-prior-location entry is dwarf-location entry;
			now dwarf-location entry is current-room;
			now dwarf-seen entry is true;
			increase visible-dwarves by 1;
		else if openadventure deep cave membership of current-room and a random chance of 1 in 8 succeeds:
			if openadventure-dwarf-route is forbidden from dwarf-location entry to current-room:
				next;
			now dwarf-prior-location entry is dwarf-location entry;
			now dwarf-location entry is current-room;
			now dwarf-seen entry is true;
			increase visible-dwarves by 1;
	run openadventure pirate post-dwarf-round in current-room with dwarf-count visible-dwarves;
	if visible-dwarves is 0:
		move DWARF to LOC_NOWHERE;
		now openadventure-dwarves-travel-in-progress is false;
		stop;
	move DWARF to current-room;
	if visible-dwarves is 1:
		say "[openadventure dwarf-single message]";
	otherwise:
		say "[openadventure dwarf-pack message visible-dwarves]";
	if attackers is 0:
		now openadventure-dwarves-travel-in-progress is false;
		stop;
	if openadventure-dwarf-activity-level is 2:
		now openadventure-dwarf-activity-level is 3;
	now hit-chance is 95 * (openadventure-dwarf-activity-level - 2);
	if openadventure-seeded-replay-mode is true:
		now hit-chance is 0;
	if attackers > 1:
		say "[openadventure thrown-knives-message attackers]";
	otherwise:
		say "[openadventure dwarf knife-message]";
	repeat with N running from 1 to attackers:
		if a random chance of hit-chance in 100 succeeds:
			increase hitters by 1;
	if attackers > 1:
		if hitters is 0:
			say "[openadventure miss-message]";
		otherwise:
			say "[openadventure multi-hit-message hitters]";
	otherwise:
		if hitters is 0:
			say "[openadventure miss-single-message]";
		otherwise:
			say "[openadventure single-hit-message]";
	if hitters > 0:
		now openadventure-dwarves-travel-in-progress is false;
		handle openadventure death caused by "dwarf_knife";
	now openadventure-dwarves-travel-in-progress is false.

To run openadventure dwarves post-travel hooks for source (source-room - room) destination (destination-room - room) verb (verb-token - text):
	if source-room is LOC_NOWHERE:
		stop;
	if destination-room is LOC_NOWHERE:
		stop;
	if openadventure-subsystem-dwarves is false:
		stop;
	enable openadventure dwarf movement pass;
	if openadventure-dwarf-activity-level is 0 and openadventure deep cave membership of destination-room:
		now openadventure-dwarf-activity-level is 1;
	if openadventure-dwarf-activity-level is 1:
		begin openadventure dwarf first encounter in destination-room;
	else:
		openadventure-run-dwarf-round in destination-room;
	disable openadventure dwarf movement pass.

Section 5 - Parser behavior

Instead of attacking DWARF:
	if an openadventure visible dwarf is present:
		if openadventure-seeded-replay-mode is true:
			kill one openadventure visible dwarf;
			say "[openadventure you-killed-dwarf-message]";
			if an openadventure visible dwarf is present:
				move DWARF to the location of the player;
			otherwise:
				move DWARF to LOC_NOWHERE;
		else if a random chance of 6 in 10 succeeds:
			kill one openadventure visible dwarf;
			say "[openadventure you-killed-dwarf-message]";
			if an openadventure visible dwarf is present:
				move DWARF to the location of the player;
			otherwise:
				move DWARF to LOC_NOWHERE;
		otherwise:
			say "[openadventure dwarf dodges-message]";
	otherwise:
		say "There is nothing here to attack."

Instead of attacking AXE:
	if an openadventure visible dwarf is present:
		try attacking DWARF;
	otherwise:
		continue the action.

When play begins:
	enable subsystem dwarves;
	initialize openadventure dwarf actors;
	now openadventure-dwarf-activity-level is 0.
