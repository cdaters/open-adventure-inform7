Version 1 of OpenAdventure Scoring by OpenAdventure begins here.

[ Exported from OpenAdventure_Scoring.ni by tools/make_author_edition.py. ]

[ Open Adventure Treasure and Scoring Subsystem ]

The maximum score is 430.

The notify score changes rule is not listed in the turn sequence rulebook.

Section 1 - Score Bookkeeping

To reset openadventure treasure score table:
	repeat through the Table of Open Adventure Treasure Scores:
		now treasure-found entry is false;
		now treasure-deposited entry is false;
	now openadventure-treasures-found-count is 0;
	now openadventure-treasures-deposited-count is 0.

To note openadventure score event delta (delta - number) reason (reason - text) source (source - text):
	now openadventure-score-delta is delta;
	now openadventure-score-event-reason is reason;
	now openadventure-score-event-source is source.

To record openadventure score delta (delta - number) for reason (reason - text) from source (source - text):
	increase openadventure-score-manual-adjustment by delta;
	note openadventure score event delta delta reason reason source source;
	update openadventure score total.

To initialize openadventure scoring subsystem:
	enable subsystem treasure-scoring;
	now openadventure-score-maximum is 430;
	now openadventure-score-total is 0;
	now openadventure-score-manual-adjustment is 0;
	now openadventure-death-count is 0;
	now openadventure-deep-cave-score-earned is false;
	now openadventure-cave-closing-score-earned is false;
	now openadventure-cave-closed-score-earned is false;
	now openadventure-endgame-bonus-score is 0;
	now openadventure-quit-bonus-earned is false;
	reset openadventure treasure score table;
	update openadventure treasure status;
	update openadventure score total.

Section 2 - Treasure Classification and State

To decide whether openadventure treasure table includes (item - thing):
	repeat through the Table of Open Adventure Treasure Scores:
		if scoring-treasure entry is item:
			decide yes;
	decide no.

To decide whether openadventure treasure (item - thing) has been found:
	repeat through the Table of Open Adventure Treasure Scores:
		if scoring-treasure entry is item:
			if treasure-found entry is true:
				decide yes;
			decide no;
	decide no.

To decide whether openadventure treasure (item - thing) has been deposited:
	repeat through the Table of Open Adventure Treasure Scores:
		if scoring-treasure entry is item:
			if treasure-deposited entry is true:
				decide yes;
			decide no;
	decide no.

To decide whether openadventure treasure (item - thing) is discoverable now:
	if item is carried by the player:
		decide yes;
	if item is in the location of the player:
		decide yes;
	decide no.

To decide whether openadventure treasure (item - thing) is safely deposited:
	if item is in LOC_BUILDING:
		decide yes;
	decide no.

To mark openadventure treasure (item - thing) as found for reason (reason - text):
	repeat through the Table of Open Adventure Treasure Scores:
		if scoring-treasure entry is item:
			if treasure-found entry is false:
				now treasure-found entry is true;
				increase openadventure-treasures-found-count by 1;
				if item is CHEST:
					now openadventure-pirate-chest-found is true;
					now adventure-state of CHEST is "PIRATE_CHEST_FOUND";
				note openadventure score event delta discovery-points entry reason reason source "openadventure_scoring";
				update openadventure pirate chest readiness;
				update openadventure score total;
			stop.

To mark openadventure treasure (item - thing) as deposited for reason (reason - text):
	repeat through the Table of Open Adventure Treasure Scores:
		if scoring-treasure entry is item:
			if treasure-deposited entry is false:
				now treasure-deposited entry is true;
				increase openadventure-treasures-deposited-count by 1;
				note openadventure score event delta deposit-points entry reason reason source "openadventure_scoring";
				update openadventure score total;
			stop.

To update openadventure pirate chest readiness:
	let unfound-non-chest-treasures be 0;
	repeat through the Table of Open Adventure Treasure Scores:
		if scoring-treasure entry is CHEST:
			next;
		if treasure-found entry is false:
			increase unfound-non-chest-treasures by 1;
	if unfound-non-chest-treasures is 0 and openadventure-pirate-chest-found is false and openadventure-pirate-chest-placed is false:
		now openadventure-pirate-force-chest-ready is true.

To update openadventure treasure status:
	if openadventure-subsystem-treasure-scoring is false:
		stop;
	repeat through the Table of Open Adventure Treasure Scores:
		let item be scoring-treasure entry;
		if openadventure treasure item is discoverable now:
			mark openadventure treasure item as found for reason "treasure_discovered";
		if treasure-found entry is true and openadventure treasure item is safely deposited:
			mark openadventure treasure item as deposited for reason "treasure_deposited";
	update openadventure pirate chest readiness;
	update openadventure score total.

Section 3 - Score Computation

To update openadventure score total:
	let running-score be 0;
	repeat through the Table of Open Adventure Treasure Scores:
		if treasure-found entry is true:
			increase running-score by discovery-points entry;
		if treasure-deposited entry is true:
			increase running-score by deposit-points entry;
	increase running-score by (3 - openadventure-death-count) * 10;
	if openadventure-quit-bonus-earned is true:
		increase running-score by 4;
	if openadventure-deep-cave-score-earned is true:
		increase running-score by 25;
	if openadventure-cave-closing-score-earned is true:
		increase running-score by 25;
	if openadventure-cave-closed-score-earned is true:
		increase running-score by openadventure-endgame-bonus-score;
	if MAGAZINE is in LOC_WITTSEND:
		increase running-score by 1;
	increase running-score by 2;
	increase running-score by openadventure-score-manual-adjustment;
	now openadventure-score-total is running-score;
	now score is openadventure-score-total.

To record openadventure death penalty:
	if openadventure-death-count < 3:
		increase openadventure-death-count by 1;
		note openadventure score event delta -10 reason "death_penalty" source "openadventure_scoring";
	update openadventure score total.

To mark openadventure deep cave score reached:
	if openadventure-deep-cave-score-earned is false:
		now openadventure-deep-cave-score-earned is true;
		note openadventure score event delta 25 reason "deep_cave" source "openadventure_scoring";
		update openadventure score total.

To mark openadventure cave closing score reached:
	if openadventure-cave-closing-score-earned is false:
		now openadventure-cave-closing-score-earned is true;
		note openadventure score event delta 25 reason "cave_closing" source "openadventure_scoring";
		update openadventure score total.

To mark openadventure cave closed bonus (bonus - number):
	if openadventure-cave-closed-score-earned is false:
		now openadventure-cave-closed-score-earned is true;
		now openadventure-endgame-bonus-score is bonus;
		note openadventure score event delta bonus reason "cave_closed_bonus" source "openadventure_scoring";
		update openadventure score total.

To mark openadventure quit bonus earned:
	if openadventure-quit-bonus-earned is false:
		now openadventure-quit-bonus-earned is true;
		note openadventure score event delta 4 reason "not_quitting" source "openadventure_scoring";
		update openadventure score total.

Section 4 - Runtime Hooks

To run openadventure scoring post-travel hooks for destination (target - room):
	if openadventure deep cave membership of target:
		mark openadventure deep cave score reached;
	update openadventure treasure status.

Every turn when openadventure-subsystem-treasure-scoring is true:
	update openadventure treasure status.

After looking when openadventure-subsystem-treasure-scoring is true:
	update openadventure treasure status.

Carry out requesting the score:
	update openadventure treasure status;
	update openadventure score total.

Report requesting the score:
	say "You have garnered [openadventure-score-total] out of a possible [openadventure-score-maximum] points, using [turn count] turn[if turn count is not 1]s[end if]." instead.

Section 5 - Ranking Hooks

To say openadventure ranking for score (points - number):
	if points <= 45:
		say "You are obviously a rank amateur.  Better luck next time.";
	else if points <= 120:
		say "Your score qualifies you as a novice class adventurer.";
	else if points <= 170:
		say "You have achieved the rating: [quotation mark]Experienced Adventurer[quotation mark].";
	else if points <= 250:
		say "You may now consider yourself a [quotation mark]Seasoned Adventurer[quotation mark].";
	else if points <= 320:
		say "You have reached [quotation mark]Junior Master[quotation mark] status.";
	else if points <= 375:
		say "Your score puts you in Master Adventurer Class C.";
	else if points <= 410:
		say "Your score puts you in Master Adventurer Class B.";
	else if points <= 426:
		say "Your score puts you in Master Adventurer Class A.";
	else if points <= 429:
		say "All of Adventuredom gives tribute to you, Adventurer Grandmaster!";
	otherwise:
		say "Adventuredom stands in awe -- you have now joined the ranks of the W O R L D   C H A M P I O N   A D V E N T U R E R S !"

When play begins:
	initialize openadventure scoring subsystem.

OpenAdventure Scoring ends here.
