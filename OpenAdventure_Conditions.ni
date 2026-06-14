[ Open Adventure Predicate Framework ]

Section 1 - Inventory predicates

To decide whether (item - thing) is carried by the player:
	if the holder of item is the player:
		decide yes;
	decide no.

To decide whether (id - text) is carried by the player:
	let normalized-id be the normalized adventure id from id;
	repeat with candidate running through things:
		if adventure-id of candidate is normalized-id:
			if candidate is carried by the player:
				decide yes;
			decide no;
		if the normalized adventure id from the printed name of candidate is normalized-id:
			if candidate is carried by the player:
				decide yes;
			decide no;
	decide no.

To decide whether (item - thing) is with the player:
	if item is carried by the player:
		decide yes;
	if item is in the location of the player:
		decide yes;
	decide no.

To decide whether (id - text) is with the player:
	let normalized-id be the normalized adventure id from id;
	repeat with candidate running through things:
		if adventure-id of candidate is normalized-id:
			if candidate is carried by the player:
				decide yes;
			if candidate is in the location of the player:
				decide yes;
			decide no;
		if the normalized adventure id from the printed name of candidate is normalized-id:
			if candidate is carried by the player:
				decide yes;
			if candidate is in the location of the player:
				decide yes;
			decide no;
	decide no.

To decide whether (id - text) has state (state-text - text):
	let normalized-id be the normalized adventure id from id;
	repeat with candidate running through things:
		if adventure-id of candidate is normalized-id:
			if adventure-state of candidate is state-text:
				decide yes;
			decide no;
		if the normalized adventure id from the printed name of candidate is normalized-id:
			if adventure-state of candidate is state-text:
				decide yes;
			decide no;
	decide no.

Section 2 - Travel condition predicates

To decide whether condition (condition-kind - text) with arg1 (arg1 - text) and arg2 (arg2 - text) chance (chance - number) holds in source location (source-room - room):
	if condition-kind is "":
		decide yes;
	if condition-kind is "none":
		decide yes;
	if condition-kind is "unsupported":
		decide no;
	else if condition-kind is "carry":
		if arg1 is carried by the player:
			decide yes;
		decide no;
	else if condition-kind is "with":
		if arg1 is with the player:
			decide yes;
		decide no;
	else if condition-kind is "not":
		if arg1 is "<none>" or arg2 is "<none>":
			decide yes;
		if arg1 has state arg2:
			decide no;
		decide yes;
	else if condition-kind is "pct":
		if a random chance of chance in 100 succeeds:
			decide yes;
		decide no;
	else if condition-kind is "nodwarves":
		[ nodwarves is a route-exclusion marker for dwarf movement. Player travel
		  normally treats the condition as satisfied. ]
		if openadventure-nodwarves-mode is true:
			if openadventure nodwarves traversal from source-location openadventure-active-source-loc to destination-location openadventure-active-travel-result:
				decide yes;
			decide no;
		decide yes;
	decide no.

Section 3 - ID resolution helpers

To decide what text is normalized token in verb list (text-value - text):
	decide on the normalized adventure id from text-value.

To decide what thing is the object for adventure-id (id - text):
	let normalized-id be the normalized adventure id from id;
	repeat with candidate running through things:
		if adventure-id of candidate is normalized-id:
			decide on candidate;
		if the normalized adventure id from the printed name of candidate is normalized-id:
			decide on candidate;
	decide on nothing.

To decide what room is the room for adventure-id (id - text):
	let normalized-id be the normalized adventure id from id;
	repeat with candidate running through rooms:
		if the OpenAdventure canonical room id of candidate is normalized-id:
			decide on candidate;
		if adventure-id of candidate is normalized-id:
			decide on candidate;
		if the normalized adventure id from the printed name of candidate is normalized-id:
			decide on candidate;
	decide on LOC_NOWHERE.
