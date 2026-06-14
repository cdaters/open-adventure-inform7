[ Open Adventure Dragon Subsystem ]

Section 1 - Parser Surface

Understand "strike [something]" as attacking.
Understand "slay [something]" as attacking.

Section 2 - Messages

To say openadventure dragon bare-hands query:
	say "With what?  Your bare hands?"

To say openadventure dragon nasty message:
	say "The dragon looks rather nasty.  You'd best not try to get by."

To say openadventure dragon scales message:
	say "The axe bounces harmlessly off the dragon's thick scales."

To say openadventure dragon bird burnt message:
	say "The little bird attacks the green dragon, and in an astounding flurry[line break]gets burnt to a cinder.  The ashes blow away."

To say openadventure dragon victory message:
	say "Congratulations!  You have just vanquished a dragon with your bare[line break]hands!  (Unbelievable, isn't it?)"

To say openadventure dragon already dead message:
	say "For crying out loud, the poor thing is already dead!"

To say openadventure dragon blood message:
	say "Your head buzzes strangely for a moment."

To say openadventure dragon rug blocked message:
	say "You can't be serious!"

To say openadventure dragon implacable message:
	say "The dragon is implacable."

Section 3 - State Helpers

To initialize openadventure dragon subsystem:
	enable subsystem dragon;
	now openadventure-dragon-last-event is "";
	now openadventure-dragon-room-transformed is false;
	now openadventure-dragon-blood-drunk is false;
	if adventure-state of DRAGON is "":
		now adventure-state of DRAGON is "DRAGON_BARS";
	if adventure-state of RUG is "":
		now adventure-state of RUG is "RUG_DRAGON";
	now DRAGON is fixed in place;
	now RUG is fixed in place;
	move BLOOD to LOC_NOWHERE.

To decide whether openadventure dragon is alive:
	if adventure-state of DRAGON is "DRAGON_BARS":
		decide yes;
	decide no.

To decide whether openadventure dragon is dead:
	if adventure-state of DRAGON is "DRAGON_DEAD":
		decide yes;
	if adventure-state of DRAGON is "DRAGON_BLOODLESS":
		decide yes;
	decide no.

To project openadventure living dragon into the current canyon side:
	if openadventure dragon is alive:
		if location is LOC_SECRET4 or location is LOC_SECRET6:
			move DRAGON to location;
			move RUG to location;
			now DRAGON is fixed in place;
			now RUG is fixed in place.

To transform openadventure dragon room:
	let source-room be the location of the player;
	now adventure-state of DRAGON is "DRAGON_DEAD";
	now adventure-state of RUG is "RUG_FLOOR";
	now RUG is portable;
	repeat with item running through things:
		if item is not the player:
			if item is in LOC_SECRET4 or item is in LOC_SECRET6:
				move item to LOC_SECRET5;
	move DRAGON to LOC_SECRET5;
	move RUG to LOC_SECRET5;
	move BLOOD to LOC_SECRET5;
	now openadventure-dragon-room-transformed is true;
	now openadventure-dragon-last-event is "dragon_killed";
	say "[openadventure dragon victory message][paragraph break]";
	move the player to LOC_SECRET5;
	if openadventure-framework-ready is true:
		run openadventure post-travel hooks for source source-room destination LOC_SECRET5 verb "ATTACK";
	otherwise:
		update openadventure treasure status;
	try looking.

Section 4 - Descriptions

Before looking when openadventure-subsystem-dragon is true:
	project openadventure living dragon into the current canyon side.

Rule for writing a paragraph about DRAGON:
	if openadventure dragon is alive:
		say "A huge green fierce dragon bars the way![paragraph break]";
	else if adventure-state of DRAGON is "DRAGON_DEAD":
		say "The blood-specked body of a huge green dead dragon lies to one side.[paragraph break]";
	else:
		say "The body of a huge green dead dragon is lying off to one side.[paragraph break]".

Rule for writing a paragraph about RUG:
	if openadventure dragon is alive:
		say "The dragon is sprawled out on a Persian rug!![paragraph break]";
	else if adventure-state of RUG is "RUG_FLOOR":
		say "There is a Persian rug spread out on the floor![paragraph break]";
	else:
		say "There is a Persian rug here, hovering in mid-air![paragraph break]".

Section 5 - Confrontation

Instead of attacking DRAGON:
	if openadventure dragon is alive:
		say "[openadventure dragon bare-hands query][paragraph break]";
		if the player consents:
			transform openadventure dragon room;
		otherwise:
			now openadventure-dragon-last-event is "dragon_spared";
			say "[openadventure dragon nasty message]";
	else:
		say "[openadventure dragon already dead message]".

Instead of throwing AXE at DRAGON:
	if openadventure dragon is alive:
		move AXE to the location of the player;
		now openadventure-dragon-last-event is "axe_bounced";
		say "[openadventure dragon scales message]";
	otherwise:
		say "[openadventure dragon already dead message]".

Instead of throwing BIRD at DRAGON:
	if openadventure dragon is alive:
		move BIRD to LOC_NOWHERE;
		now openadventure-dragon-last-event is "bird_burnt";
		say "[openadventure dragon bird burnt message]";
	otherwise:
		continue the action.

Instead of giving something to DRAGON:
	if openadventure dragon is alive:
		say "[openadventure dragon implacable message]";
	otherwise:
		say "[openadventure dragon already dead message]".

Instead of taking RUG when openadventure dragon is alive:
	say "[openadventure dragon rug blocked message]".

Instead of taking DRAGON:
	say "[openadventure dragon rug blocked message]".

Instead of taking BLOOD:
	say "There are only a few drops--not enough to carry."

Instead of drinking BLOOD:
	if openadventure dragon is dead:
		move BLOOD to LOC_NOWHERE;
		now adventure-state of DRAGON is "DRAGON_BLOODLESS";
		now openadventure-dragon-blood-drunk is true;
		now openadventure-dragon-last-event is "blood_drunk";
		say "[openadventure dragon blood message]";
	otherwise:
		say "There is nothing here to drink."

Section 6 - Runtime Hooks

To run openadventure dragon post-travel hooks for destination (target - room):
	if openadventure dragon is dead:
		now DRAGON is fixed in place;
		now RUG is portable;
	otherwise:
		project openadventure living dragon into the current canyon side;
	update openadventure treasure status.

When play begins:
	initialize openadventure dragon subsystem.
