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
	if openadventure-subsystem-dwarves is true:
		run openadventure dwarves post-travel hooks for source source destination target verb verb-token;
	if openadventure-subsystem-bear is true:
		run openadventure bear post-travel hooks for destination target;
	if openadventure-subsystem-dragon is true:
		run openadventure dragon post-travel hooks for destination target;
	if openadventure-subsystem-treasure-scoring is true:
		run openadventure scoring post-travel hooks for destination target;
	do nothing.

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
		increase token-index by 1;
	decide no.

To process openadventure forced travel from source-room (source-room - room):
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
	run openadventure post-travel hooks for source source-room destination destination-room verb verb-token;
	now openadventure-framework-has-pending-travel is false;
	now openadventure-runtime-check-result is true;

To openadventure emit travel message (message-id - text):
	if message-id is "NO_MESSAGE":
		stop;
	if message-id is "<none>":
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

To print OpenAdventure runtime state:
	say "Runtime ready: [if openadventure-framework-ready is true]yes[otherwise]no[end if]; ";
	say "rule [openadventure-current-travel-rule-id], source [openadventure-active-source-loc].".
