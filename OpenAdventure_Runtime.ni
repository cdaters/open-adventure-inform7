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

To decide whether generated travel row (rule-id - number) from source-id (source-id - text) to destination-id (dest-id - text) using verb-set (verb-list - text) and condition-kind (condition-kind - text) arg1 (arg1 - text) arg2 (arg2 - text) for verb token (verb-token - text) can be selected:
	let source-room be the room for adventure-id source-id;
	let target-room be the room for adventure-id dest-id;
	if openadventure-framework-ready is false:
		set up OpenAdventure runtime framework;
	if source-room is LOC_NOWHERE:
		decide no;
	if target-room is LOC_NOWHERE:
		decide no;
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

To print OpenAdventure runtime state:
	say "Runtime ready: [if openadventure-framework-ready is true]yes[otherwise]no[end if]; ";
	say "rule [openadventure-current-travel-rule-id], source [openadventure-active-source-loc].".
