Version 1 of OpenAdventure Plover by OpenAdventure begins here.

[ Exported from OpenAdventure_Plover.ni by tools/make_author_edition.py. ]

[ Open Adventure Plover Subsystem ]

Section 1 - Plover travel helper predicates

To decide whether oa-plover-tunnel-allows-passage (source-id - text):
	let carried-count be the number of things carried by the player;
	if carried-count is 0:
		decide yes;
	if carried-count is 1:
		if "EMERALD" is carried by the player:
			decide yes;
	decide no.

To say plover tunnel capacity message:
	say "Something you're carrying won't fit through the tunnel with you. [line break]You'd best take inventory and drop something.";

Section 2 - Plover special handlers

To oa-handle-plover-passage-special (source-id - text) with verb-token (verb-token - text):
	now openadventure-runtime-check-result is false;
	if oa-plover-tunnel-allows-passage source-id:
		now openadventure-runtime-check-result is true;
	else:
		say "[plover tunnel capacity message]";
		now openadventure-runtime-check-result is false;
	if source-id is "LOC_ALCOVE":
		oa-dispatch-openadventure-goto source-id to "LOC_PLOVER" with verb-token verb-token;
		if openadventure-runtime-check-result is true:
			now openadventure-runtime-check-result is true;
	if source-id is "LOC_PLOVER":
		oa-dispatch-openadventure-goto source-id to "LOC_ALCOVE" with verb-token verb-token;
	if openadventure-runtime-check-result is true:
		now openadventure-runtime-check-result is true;
	else:
		now openadventure-runtime-check-result is false.

To oa-handle-plover-emerald-drop-special (source-id - text) with verb-token (verb-token - text):
	now openadventure-runtime-check-result is false;
	let source-room be the room for adventure-id source-id;
	let plover-emerald be the object for adventure-id "EMERALD";
	let fallback-id be "";
	if source-room is LOC_NOWHERE:
		now openadventure-runtime-check-result is false;
	if plover-emerald is carried by the player:
		move plover-emerald to source-room;
	if source-id is "LOC_Y2":
		now fallback-id is "LOC_FOOF5";
	else if source-id is "LOC_PLOVER":
		now fallback-id is "LOC_FOOF6";
	else:
		now openadventure-runtime-check-result is false;
	if fallback-id is "":
		now openadventure-runtime-check-result is false;
	oa-dispatch-openadventure-goto source-id to fallback-id with verb-token verb-token;

OpenAdventure Plover ends here.
