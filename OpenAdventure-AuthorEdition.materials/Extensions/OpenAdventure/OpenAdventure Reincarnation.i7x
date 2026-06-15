Version 1 of OpenAdventure Reincarnation by OpenAdventure begins here.

[ Exported from OpenAdventure_Reincarnation.ni by tools/make_author_edition.py. ]

[ Open Adventure Death and Reincarnation Subsystem ]

Section 1 - Messages

To say openadventure death closing message:
	say "It looks as though you're dead.  Well, seeing as how it's so close to closing time anyway, I think we'll just call it a day."

To say openadventure obituary query for death number (death-number - number):
	if death-number is 1:
		say "Oh dear, you seem to have gotten yourself killed.  I might be able to[line break]help you out, but I've never really done this before.  Do you want me[line break]to try to reincarnate you?";
	else if death-number is 2:
		say "You clumsy oaf, you've done it again!  I don't know how long I can[line break]keep this up.  Do you want me to try reincarnating you again?";
	otherwise:
		say "Now you've really done it!  I'm out of orange smoke!  You don't expect[line break]me to do a decent reincarnation without any orange smoke, do you?"

To say openadventure obituary yes response for death number (death-number - number):
	if death-number is 1:
		say "All right.  But don't blame me if something goes wr......[line break]                    --- POOF!! ---[line break]You are engulfed in a cloud of orange smoke.  Coughing and gasping,[line break]you emerge from the smoke and find....";
	else if death-number is 2:
		say "Okay, now where did I put my orange smoke?....  >POOF!<[line break]Everything disappears in a dense cloud of orange smoke.";
	otherwise:
		say "Okay, if you're so smart, do it yourself!  I'm leaving!"

Section 2 - Lifecycle

To initialize openadventure reincarnation subsystem:
	enable subsystem reincarnation;
	now openadventure-reincarnation-limit is 3;
	now openadventure-last-safe-room is LOC_START;
	now openadventure-death-location is LOC_NOWHERE;
	now openadventure-last-death-cause is "";
	now openadventure-reincarnation-in-progress is false;
	now openadventure-reincarnation-last-result is "";
	now openadventure-cave-closing-active is false.

To mark openadventure last safe room (candidate-room - room):
	if candidate-room is not LOC_NOWHERE:
		now openadventure-last-safe-room is candidate-room.

Section 3 - Inventory Disposition

To decide what room is openadventure reincarnation drop room:
	if openadventure-death-location is not LOC_NOWHERE:
		decide on openadventure-death-location;
	if openadventure-last-safe-room is not LOC_NOWHERE:
		decide on openadventure-last-safe-room;
	decide on LOC_BUILDING.

To dispose of openadventure carried items after death:
	let drop-room be openadventure reincarnation drop room;
	move WATER to LOC_NOWHERE;
	move OIL to LOC_NOWHERE;
	repeat with item running through things:
		if item is carried by the player:
			if item is LAMP:
				move item to LOC_START;
				now adventure-state of LAMP is "LAMP_DARK";
			otherwise:
				move item to drop-room.

Section 4 - Death Flow

To resurrect openadventure player:
	dispose of openadventure carried items after death;
	move DWARF to LOC_NOWHERE;
	now openadventure-dwarves-travel-in-progress is false;
	now openadventure-reincarnation-last-result is "reincarnated";
	now openadventure-reincarnation-in-progress is false;
	mark openadventure last safe room LOC_BUILDING;
	move the player to LOC_BUILDING;
	update openadventure treasure status.

To end openadventure game after death:
	now openadventure-reincarnation-last-result is "ended";
	now openadventure-reincarnation-in-progress is false;
	update openadventure score total;
	end the story saying "You are dead."

To handle openadventure death caused by (cause - text):
	if openadventure-reincarnation-in-progress is true:
		stop;
	now openadventure-reincarnation-in-progress is true;
	now openadventure-last-death-cause is cause;
	now openadventure-death-location is the location of the player;
	if openadventure-death-location is LOC_NOWHERE:
		now openadventure-death-location is openadventure-last-safe-room;
	let death-number be openadventure-death-count + 1;
	record openadventure death penalty;
	if openadventure-cave-closing-active is true:
		say "[openadventure death closing message]";
		end openadventure game after death;
		stop;
	say "[openadventure obituary query for death number death-number][paragraph break]";
	if the player consents:
		say "[openadventure obituary yes response for death number death-number][paragraph break]";
		if death-number >= openadventure-reincarnation-limit:
			end openadventure game after death;
		otherwise:
			resurrect openadventure player;
	otherwise:
		say "OK[paragraph break]";
		end openadventure game after death.

When play begins:
	initialize openadventure reincarnation subsystem.

OpenAdventure Reincarnation ends here.
