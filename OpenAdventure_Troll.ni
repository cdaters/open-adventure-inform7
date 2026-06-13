[ Open Adventure Troll / Bridge Subsystem ]

Section 1 - Troll and chasm state defaults

To decide what room is openadventure troll-bridge destination from (source-room - room):
	if source-room is LOC_SWCHASM:
		decide on LOC_NECHASM;
	if source-room is LOC_NECHASM:
		decide on LOC_SWCHASM;
	decide on LOC_NOWHERE.

To say openadventure troll bridge paid-once block message:
	say "The troll steps out from beneath the bridge and blocks your way.";

To say openadventure troll bridge bear-collapse message:
	say "Just as you reach the other side, the bridge buckles beneath the weight of the bear, which was still following you around. You scrabble desperately for support, but as the bridge collapses you stumble back and fall into the chasm.";

When play begins:
	enable subsystem troll;
	if adventure-state of CHASM is "":
		now adventure-state of CHASM is "TROLL_BRIDGE";
	if adventure-state of TROLL is "":
		now adventure-state of TROLL is "TROLL_UNPAID";
	if adventure-state of BEAR is "":
		now adventure-state of BEAR is "UNTAMED_BEAR";

Section 2 - Troll bridge travel integration

To oa-handle-troll-bridge-special (source-id - text) with verb-token (verb-token - text):
	now openadventure-runtime-check-result is false;
	let source-room be the room for adventure-id source-id;
	let destination-room be openadventure troll-bridge destination from source-room;
	if source-room is LOC_NOWHERE:
		now openadventure-runtime-check-result is false;
		stop;
	if destination-room is LOC_NOWHERE:
		now openadventure-runtime-check-result is false;
		stop;
	if adventure-state of TROLL is "TROLL_PAIDONCE":
		say "[openadventure troll bridge paid-once block message]";
		now adventure-state of TROLL is "TROLL_UNPAID";
		now openadventure-runtime-check-result is true;
		stop;
	if adventure-state of TROLL is "TROLL_UNPAID":
		now adventure-state of TROLL is "TROLL_PAIDONCE";
	let destination-id be adventure-id of destination-room;
	oa-dispatch-openadventure-goto source-id to destination-id with verb-token verb-token;
	if openadventure-runtime-check-result is false:
		now openadventure-runtime-check-result is false;
		stop;
	if BEAR is carried by the player, openadventure-handle-troll-bridge-bear-collapse destination-room.

To openadventure-handle-troll-bridge-bear-collapse (destination-room - room):
	now adventure-state of CHASM is "BRIDGE_WRECKED";
	now adventure-state of TROLL is "TROLL_GONE";
	move BEAR to destination-room;
	now BEAR is fixed in place;
	now adventure-state of BEAR is "BEAR_DEAD";
	say "[openadventure troll bridge bear-collapse message]";
	now openadventure-runtime-check-result is true;
	stop.
