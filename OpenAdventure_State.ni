[ Open Adventure Runtime State ]

Section 1 - Core runtime state

The openadventure-framework-ready is a truth state that varies.
The openadventure-framework-ready is false.

The openadventure-turn-counter is a number that varies.
The openadventure-turn-counter is 0.

The openadventure-tick-counter is a number that varies.
The openadventure-tick-counter is 0.

The openadventure-current-travel-rule-id is a number that varies.
The openadventure-current-travel-rule-id is 0.

The openadventure-active-source-loc is a text that varies.
The openadventure-active-source-loc is "".

The openadventure-active-verb-token is a text that varies.
The openadventure-active-verb-token is "".

The openadventure-active-travel-result is a text that varies.
The openadventure-active-travel-result is "".

Section 2 - Gameplay flags and global booleans

The openadventure-framework-has-pending-travel is a truth state that varies.
The openadventure-framework-has-pending-travel is false.

The openadventure-framework-in-lookup is a truth state that varies.
The openadventure-framework-in-lookup is false.

The openadventure-dwarves-movement-guard-enabled is a truth state that varies.
The openadventure-dwarves-movement-guard-enabled is false.

The openadventure-nodwarves-mode is a truth state that varies.
The openadventure-nodwarves-mode is false.

The openadventure-subsystem-loading is a truth state that varies.
The openadventure-subsystem-loading is false.

Section 3 - Gameplay-subsystem feature flags

The openadventure-subsystem-dwarves is a truth state that varies.
The openadventure-subsystem-dwarves is false.

The openadventure-subsystem-pirate is a truth state that varies.
The openadventure-subsystem-pirate is false.

The openadventure-subsystem-dragon is a truth state that varies.
The openadventure-subsystem-dragon is false.

The openadventure-subsystem-troll is a truth state that varies.
The openadventure-subsystem-troll is false.

The openadventure-subsystem-bear is a truth state that varies.
The openadventure-subsystem-bear is false.

The openadventure-subsystem-treasure-scoring is a truth state that varies.
The openadventure-subsystem-treasure-scoring is false.

The openadventure-subsystem-cave-closing is a truth state that varies.
The openadventure-subsystem-cave-closing is false.

The openadventure-subsystem-endgame is a truth state that varies.
The openadventure-subsystem-endgame is false.

Section 4 - Data binding for IDs and per-object state

A thing has a text called adventure-id.
The adventure-id of every thing is "".

A room has a text called adventure-id.
The adventure-id of every room is "".

A thing has a text called adventure-state.
The adventure-state of every thing is "".

Section 5 - Scoring scaffolding

The openadventure-score-delta is a number that varies.
The openadventure-score-delta is 0.

The openadventure-score-event-reason is a text that varies.
The openadventure-score-event-reason is "".

The openadventure-score-event-source is a text that varies.
The openadventure-score-event-source is "".

Section 6 - Utility: ID normalization and bootstrapping

To decide what text is the normalized adventure id from (token - text):
	let normalized-id be token;
	replace the text " " in normalized-id with "_";
	replace the text "[" in normalized-id with "";
	replace the text "]" in normalized-id with "";
	replace the text """" in normalized-id with "";
	replace the text "'" in normalized-id with "";
	decide on normalized-id.

To initialize framework IDs:
	now openadventure-framework-in-lookup is true;
	let candidate-room be a room;
	let candidate-thing be a thing;
	repeat with candidate-room running through rooms:
		now adventure-id of candidate-room is the normalized adventure id from the printed name of candidate-room;
	repeat with candidate-thing running through things:
		now adventure-id of candidate-thing is the normalized adventure id from the printed name of candidate-thing;
	now openadventure-framework-in-lookup is false.
