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

A room has a text called adventure-id.

A thing has a text called adventure-state.

Section 5 - Scoring scaffolding

The openadventure-score-delta is a number that varies.
The openadventure-score-delta is 0.

The openadventure-score-event-reason is a text that varies.
The openadventure-score-event-reason is "".

The openadventure-score-event-source is a text that varies.
The openadventure-score-event-source is "".

Section 8 - Dwarf runtime state

The openadventure-dwarves-travel-in-progress is a truth state that varies.
The openadventure-dwarves-travel-in-progress is false.

The openadventure-dwarf-activity-level is a number that varies.
The openadventure-dwarf-activity-level is 0.

The openadventure-dwarf-movement-pass is a truth state that varies.
The openadventure-dwarf-movement-pass is false.

The openadventure-nodwarves-mode is a truth state that varies.
The openadventure-nodwarves-mode is false.

The openadventure-dwarf-kill-count is a number that varies.
The openadventure-dwarf-kill-count is 0.

Table of Open Adventure Dwarf Actors
dwarf-index	dwarf-location	dwarf-prior-location	dwarf-seen	dwarf-alive
1	LOC_NOWHERE	LOC_NOWHERE	false	true
2	LOC_NOWHERE	LOC_NOWHERE	false	true
3	LOC_NOWHERE	LOC_NOWHERE	false	true
4	LOC_NOWHERE	LOC_NOWHERE	false	true
5	LOC_NOWHERE	LOC_NOWHERE	false	true
6	LOC_NOWHERE	LOC_NOWHERE	false	true

Section 9 - Pirate runtime state

The openadventure-pirate-chest-location is a room that varies.
The openadventure-pirate-chest-location is LOC_MAZEEND12.

The openadventure-pirate-message-location is a room that varies.
The openadventure-pirate-message-location is LOC_DEADEND13.

The openadventure-pirate-chest-placed is a truth state that varies.
The openadventure-pirate-chest-placed is false.

The openadventure-pirate-chest-found is a truth state that varies.
The openadventure-pirate-chest-found is false.

The openadventure-pirate-has-stolen is a truth state that varies.
The openadventure-pirate-has-stolen is false.

The openadventure-pirate-force-chest-ready is a truth state that varies.
The openadventure-pirate-force-chest-ready is false.

The openadventure-pirate-last-theft-count is a number that varies.
The openadventure-pirate-last-theft-count is 0.

Table of Open Adventure Pirate Treasures
pirate-treasure
NUGGET
OBJ_51
OBJ_52
OBJ_53
COINS
CHEST
EGGS
TRIDENT
VASE
EMERALD
PYRAMID
PEARL
RUG
OBJ_63
CHAIN
RUBY
JADE
AMBER
SAPPH
OBJ_69

Section 6 - Utility

This section contains ID normalization helpers and project bootstrapping.

To decide what text is the normalized adventure id from (token - text):
	let normalized-id be token;
	replace the text " " in normalized-id with "_";
	decide on normalized-id.

Section 7 - Runtime dispatch scratch state

The openadventure-runtime-check-result is a truth state that varies.
The openadventure-runtime-check-result is false.

To initialize framework IDs:
	now openadventure-framework-in-lookup is true;
	repeat with candidate-room running through the rooms:
		now adventure-id of candidate-room is the normalized adventure id from the printed name of candidate-room;
	repeat with candidate-thing running through the things:
		now adventure-id of candidate-thing is the normalized adventure id from the printed name of candidate-thing;
	now openadventure-framework-in-lookup is false.
