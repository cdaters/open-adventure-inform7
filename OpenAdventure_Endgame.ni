[ Open Adventure Endgame Subsystem ]

Section 1 - Messages

To say openadventure requires dynamite message:
	say "Blasting requires dynamite."

To say openadventure endgame victory message:
	say "There is a loud explosion, and a twenty-foot hole appears in the far[line break]wall, burying the dwarves in the rubble.  You march through the hole[line break]and find yourself in the main office, where a cheering band of[line break]friendly elves carry the conquering adventurer off into the sunset."

To say openadventure endgame defeat message:
	say "There is a loud explosion, and a twenty-foot hole appears in the far[line break]wall, burying the snakes in the rubble.  A river of molten lava pours[line break]in through the hole, destroying everything in its path, including you!"

To say openadventure endgame splatter message:
	say "There is a loud explosion, and you are suddenly splashed across the[line break]walls of the room."

To say openadventure dwarves awaken message:
	say "The resulting ruckus has awakened the dwarves.  There are now several[line break]threatening little dwarves in the room with you!  Most of them throw[line break]knives at you!  All of them get you!"

To say openadventure prod dwarf message:
	say "You prod the nearest dwarf, who wakes up grumpily, takes one look at[line break]you, curses, and grabs for his axe."

To say openadventure mirror shatter message:
	say "You strike the mirror a resounding blow, whereupon it shatters into a[line break]myriad tiny fragments."

Section 2 - State Helpers

To initialize openadventure endgame subsystem:
	enable subsystem endgame;
	now openadventure-endgame-complete is false;
	now openadventure-endgame-last-outcome is "";
	now openadventure-endgame-final-bonus is 0;
	now openadventure-repository-ready is false.

To initialize openadventure endgame repository:
	now openadventure-repository-ready is true;
	now openadventure-endgame-last-outcome is "repository_ready".

To decide whether openadventure repository-room is (candidate-room - room):
	if candidate-room is LOC_NE:
		decide yes;
	if candidate-room is LOC_SW:
		decide yes;
	decide no.

To decide whether openadventure rusty-mark rod is available:
	if ROD2 is carried by the player:
		decide yes;
	if ROD2 is in LOC_NE:
		decide yes;
	if ROD2 is in LOC_SW:
		decide yes;
	if ROD2 is in the location of the player:
		decide yes;
	decide no.

To decide whether openadventure rusty-mark rod is here:
	if ROD2 is carried by the player:
		decide yes;
	if ROD2 is in the location of the player:
		decide yes;
	decide no.

Section 3 - Final Scoring and Termination

To complete openadventure endgame with outcome (outcome - text) bonus (bonus - number):
	if openadventure-endgame-complete is true:
		stop;
	now openadventure-endgame-complete is true;
	now openadventure-endgame-last-outcome is outcome;
	now openadventure-endgame-final-bonus is bonus;
	if openadventure-subsystem-treasure-scoring is true:
		mark openadventure cave closed bonus bonus;
		mark openadventure quit bonus earned;
		update openadventure score total;
		say "[paragraph break]You scored [openadventure-score-total] out of a possible [openadventure-score-maximum], using [turn count] turn[if turn count is not 1]s[end if].[paragraph break]";
		say "[openadventure ranking for score openadventure-score-total][paragraph break]";
	if outcome is "victory":
		end the story finally saying "The End.";
	otherwise:
		end the story saying "The End."

To awaken openadventure endgame dwarves:
	if openadventure-cave-closed-active is false:
		stop;
	say "[openadventure dwarves awaken message]";
	complete openadventure endgame with outcome "dwarves_awakened" bonus 10.

Section 4 - Blast Action

Blasting is an action applying to nothing.

Understand "blast" as blasting.
Understand "deton" as blasting.
Understand "detonate" as blasting.
Understand "ignite" as blasting.
Understand "blowu" as blasting.
Understand "blowup" as blasting.
Understand "blow up" as blasting.

Detonating is an action applying to one thing.

Understand "blast [something]" as detonating.
Understand "deton [something]" as detonating.
Understand "detonate [something]" as detonating.
Understand "ignite [something]" as detonating.
Understand "blowu [something]" as detonating.
Understand "blowup [something]" as detonating.
Understand "blow up [something]" as detonating.

Carry out blasting:
	if openadventure-cave-closed-active is false:
		say "[openadventure requires dynamite message]";
		stop;
	unless openadventure rusty-mark rod is available:
		say "[openadventure requires dynamite message]";
		stop;
	if openadventure rusty-mark rod is here:
		say "[openadventure endgame splatter message]";
		complete openadventure endgame with outcome "splatter" bonus 25;
		stop;
	if the location of the player is LOC_NE:
		say "[openadventure endgame defeat message]";
		complete openadventure endgame with outcome "defeat" bonus 30;
		stop;
	say "[openadventure endgame victory message]";
	complete openadventure endgame with outcome "victory" bonus 45.

Carry out detonating:
	try blasting.

Section 5 - Repository Disturbance

Understand "break [something]" as attacking.
Understand "shatter [something]" as attacking.
Understand "smash [something]" as attacking.
Understand "wake [something]" as waking.
Understand "wake up [something]" as waking.

Instead of attacking MIRROR when openadventure-cave-closed-active is true:
	now adventure-state of MIRROR is "MIRROR_BROKEN";
	say "[openadventure mirror shatter message][paragraph break]";
	awaken openadventure endgame dwarves.

Instead of attacking DWARF when openadventure-cave-closed-active is true:
	awaken openadventure endgame dwarves.

Instead of waking DWARF when openadventure-cave-closed-active is true:
	say "[openadventure prod dwarf message][paragraph break]";
	awaken openadventure endgame dwarves.

Section 6 - Runtime Hooks

To run openadventure endgame post-travel hooks for destination (target - room):
	if openadventure-cave-closed-active is true:
		if openadventure repository-room is target:
			now openadventure-repository-ready is true.

When play begins:
	initialize openadventure endgame subsystem.
