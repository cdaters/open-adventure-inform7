Version 1 of OpenAdventure CaveClosing by OpenAdventure begins here.

[ Exported from OpenAdventure_CaveClosing.ni by tools/make_author_edition.py. ]

[ Open Adventure Cave Closing Subsystem ]

Section 1 - Messages

To say openadventure cave closing warning message:
	say "A sepulchral voice reverberating through the cave, says, [quotation mark]Cave closing[line break]soon.  All adventurers exit immediately through main office.[quotation mark]"

To say openadventure exit closed message:
	say "A mysterious recorded voice groans into life and announces:[line break]   [quotation mark]This exit is closed.  Please leave via main office.[quotation mark]"

To say openadventure cave closed message:
	say "The sepulchral voice intones, [quotation mark]The cave is now closed.[quotation mark]  As the echoes[line break]fade, there is a blinding flash of light (and a small puff of orange[line break]smoke). . . .    As your eyes refocus, you look around and find..."

Section 2 - State Helpers

To initialize openadventure cave closing subsystem:
	enable subsystem cave-closing;
	now openadventure-cave-clock1 is 30;
	now openadventure-cave-clock2 is 50;
	now openadventure-cave-panic-clock is 15;
	now openadventure-cave-closing-active is false;
	now openadventure-cave-closed-active is false;
	now openadventure-cave-panic-active is false;
	now openadventure-cave-closing-last-event is "";
	now openadventure-cave-last-clock-turn is -1;

To decide whether openadventure all treasures have been located:
	repeat through the Table of Open Adventure Treasure Scores:
		if treasure-found entry is false:
			decide no;
	decide yes.

To decide whether openadventure outside-room is (candidate-room - room):
	if candidate-room is LOC_START:
		decide yes;
	if candidate-room is LOC_HILL:
		decide yes;
	if candidate-room is LOC_BUILDING:
		decide yes;
	if candidate-room is LOC_VALLEY:
		decide yes;
	if candidate-room is LOC_ROADEND:
		decide yes;
	if candidate-room is LOC_CLIFF:
		decide yes;
	if candidate-room is LOC_SLIT:
		decide yes;
	if candidate-room is LOC_GRATE:
		decide yes;
	if candidate-room is LOC_FOOF2:
		decide yes;
	if candidate-room is LOC_FOOF4:
		decide yes;
	decide no.

To decide whether openadventure cave closing should tick in (current-room - room):
	if openadventure-cave-closed-active is true:
		decide no;
	if not openadventure all treasures have been located:
		decide no;
	if not openadventure deep cave membership of current-room:
		decide no;
	if current-room is LOC_Y2:
		decide no;
	decide yes.

Section 3 - Warning Phase

To start openadventure cave closing warning phase:
	if openadventure-cave-closing-active is true:
		stop;
	now adventure-state of GRATE is "GRATE_CLOSED";
	now adventure-state of FISSURE is "UNBRIDGED";
	repeat through the Table of Open Adventure Dwarf Actors:
		now dwarf-location entry is LOC_NOWHERE;
		now dwarf-prior-location entry is LOC_NOWHERE;
		now dwarf-seen entry is false;
		now dwarf-alive entry is false;
	move DWARF to LOC_NOWHERE;
	move TROLL to LOC_NOWHERE;
	move TROLL2 to LOC_SWCHASM;
	now adventure-state of TROLL is "TROLL_GONE";
	now adventure-state of CHASM is "TROLL_BRIDGE";
	if adventure-state of BEAR is not "BEAR_DEAD":
		move BEAR to LOC_NOWHERE;
	now adventure-state of CHAIN is "CHAIN_HEAP";
	now CHAIN is portable;
	now adventure-state of AXE is "AXE_HERE";
	now AXE is portable;
	now openadventure-bear-is-following is false;
	now openadventure-bear-guards-axe is false;
	now openadventure-cave-closing-active is true;
	now openadventure-cave-clock1 is -1;
	now openadventure-cave-closing-last-event is "warning";
	mark openadventure cave closing score reached;
	say "[openadventure cave closing warning message]".

To trigger openadventure cave closing panic:
	if openadventure-cave-panic-active is false:
		now openadventure-cave-clock2 is openadventure-cave-panic-clock;
	now openadventure-cave-panic-active is true;
	now openadventure-cave-closing-last-event is "panic".

Section 4 - Repository Transition

To dispose of openadventure carried items for cave closing:
	repeat with item running through things:
		if item is carried by the player:
			move item to LOC_NOWHERE.

To set up openadventure repository:
	move BOTTLE to LOC_NE;
	now adventure-state of BOTTLE is "EMPTY_BOTTLE";
	move PLANT to LOC_NE;
	now adventure-state of PLANT is "PLANT_THIRSTY";
	move OYSTER to LOC_NE;
	move LAMP to LOC_NE;
	now adventure-state of LAMP is "LAMP_DARK";
	move ROD to LOC_NE;
	move DWARF to LOC_NE;
	move GRATE to LOC_SW;
	move SIGN to LOC_SW;
	now adventure-state of SIGN is "ENDGAME_SIGN";
	move SNAKE to LOC_SW;
	now adventure-state of SNAKE is "SNAKE_CHASED";
	move BIRD to LOC_SW;
	now adventure-state of BIRD is "BIRD_CAGED";
	move CAGE to LOC_SW;
	move ROD2 to LOC_SW;
	move PILLOW to LOC_SW;
	move MIRROR to LOC_NE;
	now adventure-state of MIRROR is "MIRROR_UNBROKEN".

To close openadventure cave completely:
	if openadventure-cave-closed-active is true:
		stop;
	dispose of openadventure carried items for cave closing;
	set up openadventure repository;
	now openadventure-cave-closed-active is true;
	now openadventure-cave-closing-active is true;
	now openadventure-cave-closing-last-event is "closed";
	if openadventure-subsystem-endgame is true:
		initialize openadventure endgame repository;
	say "[openadventure cave closed message][paragraph break]";
	move the player to LOC_NE;
	if openadventure-framework-ready is true:
		run openadventure post-travel hooks for source LOC_NE destination LOC_NE verb "CAVE_CLOSED";
	otherwise:
		update openadventure treasure status;
	try looking.

Section 5 - Clock Runtime

To run openadventure cave closing clock for location (current-room - room):
	if openadventure-cave-last-clock-turn is turn count:
		stop;
	now openadventure-cave-last-clock-turn is turn count;
	if openadventure-cave-closed-active is true:
		stop;
	if openadventure-cave-closing-active is false:
		if openadventure cave closing should tick in current-room:
			decrease openadventure-cave-clock1 by 1;
			if openadventure-cave-clock1 <= 0:
				start openadventure cave closing warning phase;
		stop;
	decrease openadventure-cave-clock2 by 1;
	if openadventure-cave-clock2 <= 0:
		close openadventure cave completely.

To decide whether openadventure cave closing blocks travel from (source - room) to (target - room):
	if openadventure-cave-closing-active is false:
		decide no;
	if openadventure-cave-closed-active is true:
		decide no;
	if openadventure outside-room is target:
		say "[openadventure exit closed message]";
		trigger openadventure cave closing panic;
		decide yes;
	decide no.

To run openadventure cave closing post-travel hooks for destination (target - room):
	run openadventure cave closing clock for location target.

Before going to a room (called target-room) when openadventure-subsystem-cave-closing is true:
	if openadventure cave closing blocks travel from the location of the player to target-room:
		stop the action.

Every turn when openadventure-subsystem-cave-closing is true:
	run openadventure cave closing clock for location the location of the player.

When play begins:
	initialize openadventure cave closing subsystem.

OpenAdventure CaveClosing ends here.
