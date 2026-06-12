[ Open Adventure Predicate Framework ]

Section 1 - Inventory predicates

To decide whether player carries object (id - text):
	let candidate be the object for adventure-id id;
	if candidate is nothing:
		decide no;
	if candidate is carried by the player:
		decide yes;
	decide no.

To decide whether player is with object (id - text):
	let candidate be the object for adventure-id id;
	if candidate is nothing:
		decide no;
	if candidate is carried by the player:
		decide yes;
	if candidate is in location:
		decide yes;
	decide no.

To decide whether openadventure object (id - text) has state (state-text - text):
	let candidate be the object for adventure-id id;
	if candidate is nothing:
		decide no;
	if adventure-state of candidate is state-text:
		decide yes;
	decide no.

Section 2 - Travel condition predicates

To decide whether condition (condition-kind - text) with arg1 (arg1 - text) and arg2 (arg2 - text) currently holds in source location (source-room - room):
	if condition-kind is "":
		decide yes;
	if condition-kind is "none":
		decide yes;
	else if condition-kind is "carry":
		decide whether player carries object arg1;
	else if condition-kind is "with":
		decide whether player is with object arg1;
	else if condition-kind is "not":
		if arg1 is "<none>" or arg2 is "<none>":
			decide yes;
		if openadventure object arg1 has state arg2:
			decide no;
		decide yes;
	else if condition-kind is "pct":
		let pct be the number understood by arg1;
		if a random chance of pct in 100 succeeds:
			decide yes;
		decide no;
	else if condition-kind is "nodwarves":
		[ nodwarves is true for player movement and false when dwarf-system checks explicitly
		  request exclusion. ]
		if openadventure-nodwarves-mode is true:
			decide no;
		decide yes;
	decide no.

Section 3 - ID resolution helpers

To decide what text is normalized token in verb list (text-value - text):
	decide on the normalized adventure id from text-value.

To decide what thing is the object for adventure-id (id - text):
	let normalized-id be the normalized adventure id from id;
	let candidate be a thing;
	repeat with candidate running through things:
		if adventure-id of candidate is normalized-id:
			decide on candidate;
		if the normalized adventure id from the printed name of candidate is normalized-id:
			decide on candidate;
	if there is a thing called id:
		decide on the thing called id;
	decide on nothing.

To decide what room is the room for adventure-id (id - text):
	let normalized-id be the normalized adventure id from id;
	let candidate be a room;
	repeat with candidate running through rooms:
		if adventure-id of candidate is normalized-id:
			decide on candidate;
		if the normalized adventure id from the printed name of candidate is normalized-id:
			decide on candidate;
	if there is a room called id:
		decide on the room called id;
	decide on LOC_NOWHERE.
