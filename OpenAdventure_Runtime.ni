[ Open Adventure Runtime Framework ]

Section 1 - Framework lifecycle

The openadventure-subsystem-registration-locked is a truth state that varies.
The openadventure-subsystem-registration-locked is false.

To set up OpenAdventure runtime framework:
	if openadventure-subsystem-registration-locked is false:
		initialize framework IDs;
		now openadventure-framework-ready is true;
		now openadventure-subsystem-registration-locked is true.

When play begins:
	set up OpenAdventure runtime framework.

Section 2 - Event hooks

To decide whether openadventure pre-travel hooks allow source (source - room) destination (target - room) verb (verb-token - text):
	decide yes.

To run openadventure post-travel hooks for source (source - room) destination (target - room) verb (verb-token - text):
	nothing.

To run openadventure inventory hooks for carried object (item - thing):
	nothing.

To run openadventure inventory hooks for dropped object (item - thing):
	nothing.

To run openadventure scoring hooks for delta (delta - number) reason (reason - text):
	now openadventure-score-delta is delta;
	now openadventure-score-event-reason is reason;
	now openadventure-score-event-source is "openadventure_runtime".

To run openadventure command hooks for action-verb (action-verb - text):
	nothing.

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

To decide whether generated travel row (rule-id - number) from source-id (source-id - text) to destination-id (dest-id - text) using verb-set (verb-list - text) and condition-kind (condition-kind - text) arg1 (arg1 - text) arg2 (arg2 - text) and travel-category (travel-category - text) random-chance (random-chance - number) is-magic-word (is-magic-word - truth state) for verb token (verb-token - text) can be selected:
	let source-room be the room for adventure-id source-id;
	let target-room be the room for adventure-id dest-id;
	if travel-category is "goto_forced":
		if verb-token is not "":
			decide no;
	else:
		if verb-token is "":
			decide no;
		if openadventure movement token (verb-token) appears in token list (verb-list) is false:
			decide no;
	if travel-category is "goto_magic_word":
		if is-magic-word is false:
			decide no;
	if openadventure-framework-ready is false:
		set up OpenAdventure runtime framework;
	if source-room is LOC_NOWHERE:
		decide no;
	if travel-category is "goto_random":
		if openadventure random-travel chance random-chance allows dispatch is false:
			decide no;
	else:
		if condition condition-kind with arg1 arg1 and arg2 arg2 currently holds in source-room is false:
			decide no;
	if openadventure-subsystem-dwarves is true:
		if subsystem dwarves currently handles this travel from source-room to target-room with verb-token is true:
			decide no;
	if openadventure-subsystem-pirate is true:
		if subsystem pirate currently handles this travel from source-room to target-room with verb-token is true:
			decide no;
	if openadventure-subsystem-dragon is true:
		if subsystem dragon currently handles this travel from source-room to target-room with verb-token is true:
			decide no;
	if openadventure-subsystem-troll is true:
		if subsystem troll currently handles this travel from source-room to target-room with verb-token is true:
			decide no;
	if openadventure-subsystem-bear is true:
		if subsystem bear currently handles this travel from source-room to target-room with verb-token is true:
			decide no;
	now openadventure-current-travel-rule-id is rule-id;
	now openadventure-active-source-loc is source-id;
	now openadventure-active-verb-token is verb-token;
	now openadventure-active-travel-result is dest-id;
	decide yes.

To decide whether openadventure runtime is idle:
	if openadventure-framework-ready is true and openadventure-subsystem-registration-locked is true:
		decide yes;
	decide no.

To decide whether a movement token (verb-token - text) appears in token list (verb-list - text):
	let normalized-token be the normalized adventure id from verb-token;
	let normalized-verb-list be the normalized adventure id from verb-list;
	if normalized-verb-list is "<forced>":
		if normalized-token is "":
			decide yes;
		decide no;
	if normalized-token is normalized-verb-list:
		decide yes;
	if normalized-token is "":
		decide no;
	let token-index be 1;
	while token-index <= number of words in normalized-verb-list:
		if word number token-index in normalized-verb-list is normalized-token:
			decide yes;
		increment token-index;
	decide no.

To decide whether openadventure forced travel can be executed from source-id (source-id - text):
	let source-room be the room for adventure-id source-id;
	let handled be false;
	if openadventure-framework-has-pending-travel is true:
		decide no;
	if source-room is LOC_NOWHERE:
		decide no;
	now openadventure-framework-has-pending-travel is true;
	repeat through the Table of Generated Travel Non-Direct Rules:
		if handled is false:
			if source-loc entry is source-id:
				if forced entry is true:
					if openadventure travel row rule-id entry from source-id entry to target entry using verb-set verb entry and condition-kind entry and arg1 entry and arg2 entry and travel-category entry random-chance entry is-magic-word entry for verb token "" can be selected:
						now handled is true;
						if openadventure execute generated travel entry is true:
							now handled is true;
						else:
							now handled is false;
	if handled is false:
		now openadventure-framework-has-pending-travel is false;
		decide no;
	now openadventure-framework-has-pending-travel is false;
	decide yes.

To decide whether openadventure execute generated travel entry:
	if travel-category entry is "goto":
		decide whether openadventure execute generated goto action-kind entry with destination target entry from source-loc entry and token (openadventure-active-verb-token) succeeds;
	if travel-category entry is "goto_non_direct":
		decide whether openadventure execute generated goto action-kind entry with destination target entry from source-loc entry and token (openadventure-active-verb-token) succeeds;
	if travel-category entry is "goto_conditional":
		decide whether openadventure execute generated goto action-kind entry with destination target entry from source-loc entry and token (openadventure-active-verb-token) succeeds;
	if travel-category entry is "goto_forced":
		decide whether openadventure execute generated goto action-kind entry with destination target entry from source-loc entry and token (openadventure-active-verb-token) succeeds;
	if travel-category entry is "goto_random":
		decide whether openadventure execute generated goto action-kind entry with destination target entry from source-loc entry and token (openadventure-active-verb-token) succeeds;
	if travel-category entry is "goto_magic_word":
		decide whether openadventure execute generated goto action-kind entry with destination target entry from source-loc entry and token (openadventure-active-verb-token) succeeds;
	if travel-category entry is "speak":
		openadventure emit travel message target entry;
		decide yes;
	if travel-category entry is "speak_conditional":
		openadventure emit travel message target entry;
		decide yes;
	if travel-category entry is "special":
		decide whether openadventure execute generated special target entry from source-loc entry and token (openadventure-active-verb-token);
	if travel-category entry is "special_conditional":
		decide whether openadventure execute generated special target entry from source-loc entry and token (openadventure-active-verb-token);
	decide no.

To decide whether openadventure execute generated goto action-kind (action-kind - text) with destination (destination-id - text) from source-id (source-id - text) and token (verb-token - text) succeeds:
	let source-room be the room for adventure-id source-id;
	let destination-room be the room for adventure-id destination-id;
	let can-move be whether openadventure pre-travel hooks allow source source-room destination destination-room verb verb-token;
	if can-move is false:
		now openadventure-framework-has-pending-travel is false;
		decide no;
	if destination-room is LOC_NOWHERE:
		now openadventure-framework-has-pending-travel is false;
		decide yes;
	move the player to destination-room;
	now openadventure-framework-has-pending-travel is false;
	run openadventure post-travel hooks for source source-room destination destination-room verb verb-token;
	if openadventure forced travel can be executed from source-id (adventure-id of destination-room) is true:
		decide yes;
	decide yes.

To openadventure emit travel message (message-id - text):
	if message-id is "NO_MESSAGE":
		stop;
	if message-id is "<none>":
		stop;
	say "[message-id]";

To decide whether openadventure execute generated special (special-id - text) from source-id (source-id - text) and token (verb-token - text):
	let parsed-special be the number understood by special-id;
	let source-room be the room for adventure-id source-id;
	if parsed-special is 1:
		say "Special movement case 1 is not yet implemented (plover passage capacity gating).";
		decide no;
	if parsed-special is 2:
		say "Special movement case 2 is not yet implemented (plover/emerald forced retry logic).";
		decide no;
	if parsed-special is 3:
		say "Special movement case 3 is not yet implemented (troll bridge/chasm behavior).";
		decide no;
	decide no.

To decide whether openadventure non-direct travel from source-id (source-id - text) with verb token (verb-token - text):
	let handled be false;
	let source-room be the room for adventure-id source-id;
	if openadventure-framework-has-pending-travel is true:
		decide no;
	if source-room is LOC_NOWHERE:
		decide no;
	now openadventure-framework-has-pending-travel is true;
	repeat through the Table of Generated Travel Non-Direct Rules:
		if handled is false:
			if source-loc entry is source-id:
				if forced entry is false:
					if openadventure travel row rule-id entry from source-id entry to target entry using verb-set verb entry and condition-kind entry and arg1 entry and arg2 entry and travel-category entry random-chance entry is-magic-word entry for verb token verb-token can be selected:
						now handled is true;
						if openadventure execute generated travel entry is false:
							now handled is false;
	if handled is false:
		now openadventure-framework-has-pending-travel is false;
		decide no;
	now openadventure-framework-has-pending-travel is false;
	decide yes.

To print OpenAdventure runtime state:
	say "Runtime ready: [if openadventure-framework-ready is true]yes[otherwise]no[end if]; ";
	say "rule [openadventure-current-travel-rule-id], source [openadventure-active-source-loc].".
