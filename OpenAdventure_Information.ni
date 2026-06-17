[ Open Adventure Information Subsystem ]

Section 1 - Edition Constants

To say openadventure version:
	say "Candidate [release number]"

To say openadventure serial:
	say "260616"

To say openadventure implementation version:
	say "Release [openadventure version] / Glulx build"

To say openadventure repository url:
	say "https://github.com/cdaters/open-adventure-inform7"

To say openadventure upstream url:
	say "http://www.catb.org/esr/open-adventure/"

Section 2 - Lifecycle

To initialize openadventure information subsystem:
	enable subsystem information;
	now openadventure-information-startup-presented is false;
	now openadventure-information-last-section is "".

To display openadventure startup presentation:
	if openadventure-information-startup-presented is true:
		stop;
	now openadventure-information-startup-presented is true;
	say "[line break]Welcome to Adventure![line break]";
	say "(Please type HELP for instructions and information.)[paragraph break]";
	say "[bold type]Adventure[roman type][line break]The original cave adventure game.[paragraph break]";
	say "Created by Will Crowther (1976). Expanded by Don Woods (1977).[line break]";
	say "Based on 'Open Adventure' by Eric S. Raymond and contributors.[line break]";
	say "Implemented in Inform 7 by Craig Daters and contributors.[paragraph break]";
	say "Release [openadventure version] / Serial number [openadventure serial] / Inform 7 v10.1.2[paragraph break]".

Section 3 - Menu and Sections

The openadventure-menu-title is a text that varies. The openadventure-menu-title is "Open Adventure Help".
The openadventure-menu-status-title is a text that varies. The openadventure-menu-status-title is "Open Adventure Help".

To clear the openadventure menu screen:
	(- VM_ClearScreen(2); -).

To draw the openadventure status line:
	(- DrawStatusLine(); -).

To redraw openadventure menu status line:
	now the left hand status line is openadventure-menu-status-title;
	now the right hand status line is "";
	draw the openadventure status line.

To decide what number is the openadventure menu key:
	(- VM_KeyChar() -).

To decide whether openadventure menu key (keycode - number) is down:
	if keycode is 78 or keycode is 110 or keycode is 130 or keycode is -5:
		decide yes;
	decide no.

To decide whether openadventure menu key (keycode - number) is up:
	if keycode is 80 or keycode is 112 or keycode is 129 or keycode is -4:
		decide yes;
	decide no.

To decide whether openadventure menu key (keycode - number) is select:
	if keycode is 13 or keycode is 31 or keycode is 32 or keycode is -6:
		decide yes;
	decide no.

To decide whether openadventure menu key (keycode - number) is quit:
	if keycode is 27 or keycode is 81 or keycode is 113 or keycode is -8:
		decide yes;
	decide no.

Table of OpenAdventure Help Menu
menu-title (text)	menu-topic (text)	menu-status-title (text)
"Instructions for Playing"	"instructions"	"Instructions"
"Historical Background"	"history"	"History"
"Open Adventure"	"open-adventure"	"Open Adventure"
"About this Edition"	"edition"	"This Edition"
"Credits"	"credits"	"Credits"
"Version Information"	"version"	"Version Info"

To display openadventure help menu:
	now openadventure-information-last-section is "menu";
	let saved-left-status be the left hand status line;
	let saved-right-status be the right hand status line;
	let selected-row be 1;
	let menu-open be true;
	while menu-open is true:
		now openadventure-menu-status-title is "Open Adventure Help";
		redraw openadventure menu status line;
		clear the openadventure menu screen;
		display openadventure help menu screen with selection selected-row;
		let keycode be the openadventure menu key;
		if openadventure menu key keycode is quit:
			now menu-open is false;
		otherwise if openadventure menu key keycode is down:
			if selected-row is less than the number of filled rows in the Table of OpenAdventure Help Menu:
				increase selected-row by 1;
		otherwise if openadventure menu key keycode is up:
			if selected-row is greater than 1:
				decrease selected-row by 1;
		otherwise if openadventure menu key keycode is select:
			choose row selected-row in the Table of OpenAdventure Help Menu;
			if displaying openadventure help topic menu-topic entry with status title menu-status-title entry requests menu exit:
				now menu-open is false;
	now the left hand status line is saved-left-status;
	now the right hand status line is saved-right-status;
	draw the openadventure status line;
	clear the openadventure menu screen;
	try looking.

To display openadventure help menu screen with selection (selected-row - number):
	say "[bold type]Open Adventure Help[roman type][paragraph break]";
	say "Use the arrow keys to move,[line break]";
	say "RETURN or SPACE to select,[line break]";
	say "Q or ESC to leave.[paragraph break]";
	let row-number be 1;
	repeat through the Table of OpenAdventure Help Menu:
		if row-number is selected-row:
			say " > ";
		otherwise:
			say "   ";
		say "[menu-title entry][line break]";
		increase row-number by 1.

To decide whether displaying openadventure help topic (topic - text) with status title (topic-title - text) requests menu exit:
	now openadventure-menu-status-title is topic-title;
	redraw openadventure menu status line;
	clear the openadventure menu screen;
	say "[bold type][topic-title][roman type][paragraph break]";
	display openadventure information topic topic;
	say "[paragraph break]Press SPACE or RETURN to return to the menu, or Q or ESC to leave.";
	while 1 is 1:
		let keycode be the openadventure menu key;
		if openadventure menu key keycode is quit:
			decide yes;
		if openadventure menu key keycode is select:
			decide no.

To display openadventure information topic (topic - text):
	if topic is "instructions":
		display openadventure instructions;
		stop;
	if topic is "history":
		display openadventure historical background;
		stop;
	if topic is "open-adventure":
		display openadventure open adventure information;
		stop;
	if topic is "edition":
		display openadventure edition information;
		stop;
	if topic is "credits":
		display openadventure credits;
		stop;
	if topic is "version":
		display openadventure version information;
		stop.

To display openadventure instructions:
	now openadventure-information-last-section is "instructions";
	say "I know of places, actions, and things.  Most of my vocabulary describes places and is used to move you there.  To move, try words like FOREST, BUILDING, DOWNSTREAM, ENTER, EAST, WEST, NORTH, SOUTH, UP, and DOWN.[paragraph break]";
	say "I know about a few special objects, like a black rod hidden in the cave.  These objects can be manipulated with action words.  Usually you will need to give both an action and an object, but sometimes I can infer the object from the verb alone.[paragraph break]";
	say "Some commands have short forms: I for INVENTORY, L for LOOK, and common compass abbreviations such as N, S, E, W, U, and D.  Cave passages turn often, so leaving one place to the north does not guarantee entering the next from the south.[paragraph break]";
	say "If you want to end your adventure early, type QUIT.  To see how well you are doing, type SCORE.  To get full credit for a treasure, leave it safely in the building; partial credit is awarded for finding it.[paragraph break]";
	say "Good luck!"

To display openadventure historical background:
	now openadventure-information-last-section is "history";
	say "Adventure began with William Crowther's cave exploration program, written after his work in the Mammoth Cave region and with caving language and geography at its heart.  Don Woods later found the program, contacted Crowther, and expanded it into the puzzle-rich game that became a landmark of interactive fiction.[paragraph break]";
	say "Graham Nelson's Advent.inf preserved this history with a long historical preface about Mammoth Cave, Stephen Bishop, Crowther's caving background, and Woods's expansion.  This edition keeps that spirit: the game is not only a fantasy cave, but also a descendant of real caving, early network culture, and the first widely shared adventure-game tradition."

To display openadventure open adventure information:
	now openadventure-information-last-section is "open-adventure";
	say "Open Adventure is Eric S. Raymond's author-approved open-source release of Crowther and Woods Adventure 2.5.  It preserves the 430-point game line while correcting bugs, maintaining reproducible tests, and documenting the game's history.[paragraph break]";
	say "This Inform 7 project treats the Open Adventure C implementation and its adventure.yaml world data as authoritative for gameplay behavior.  Upstream Open Adventure resources are available at [openadventure upstream url]."

To display openadventure edition information:
	now openadventure-information-last-section is "edition";
	say "This is Open Adventure in Inform 7, an Inform 7 10.1.2 reconstruction built from generated world data plus hand-written runtime subsystems for travel, scoring, hazards, cave closing, and endgame behavior.[paragraph break]";
	say "The implementation is maintained by Craig Daters and contributors.  The project repository is [openadventure repository url]."

To display openadventure credits:
	now openadventure-information-last-section is "credits";
	say "Original Adventure: William Crowther and Don Woods.[line break]";
	say "Open Adventure: Eric S. Raymond and contributors.[line break]";
	say "Inform 7 implementation: Craig Daters and contributors.[line break]";
	say "Inform lineage and reference material: Graham Nelson's Advent.inf and Chris Conley's Inform 7 Adventure port.[paragraph break]";
	say "This repository is distributed under the BSD 2-Clause License.  The Open Adventure reference distribution is also BSD 2-Clause licensed; its documentation includes CC-BY-4.0 material."

To display openadventure version information:
	now openadventure-information-last-section is "version";
	say "There is a puff of orange smoke; within it, fiery runes spell out:[paragraph break]";
	say "Open Adventure in Inform 7 - [openadventure implementation version][line break]";
	say "Story release: [release number][line break]";
	say "Build serial: development source build[line break]";
	say "Inform 7: 10.1.2 target source[line break]";
	say "Repository: [openadventure repository url][line break]";
	say "Open Adventure upstream: [openadventure upstream url]"

To display openadventure info:
	now openadventure-information-last-section is "info";
	say "For a summary of Open Adventure changes, type NEWS.  If you want to end your adventure early, type QUIT.  To suspend or resume an adventure, use the interpreter's SAVE and RESTORE support where available.  To see how well you are doing, type SCORE.[paragraph break]";
	say "To get full credit for a treasure, you must leave it safely in the building, though you get partial credit just for locating it.  You lose points for getting killed.  There are also points based on how much of the cave you have managed to explore.[paragraph break]";
	say "If you think you have found all the treasures, keep exploring for a while.  If nothing interesting happens, you have not found them all yet.  If something interesting does happen, it means you are getting a bonus and have an opportunity to collect more points in the Master's section."

To display openadventure news:
	now openadventure-information-last-section is "news";
	say "Open Adventure is an author-approved open-source release of Version 2.5.  Version 2.5 is essentially the Version II cave and hazard set, with a 430-point top score, more hints for obscure puzzles, bug fixes, and cosmetic corrections.[paragraph break]";
	say "The upstream Open Adventure news stream currently identifies release 1.21, dated 2026-03-22, as code hardening with ChatGPT 5.2, cppcheck, pylint, and spellchecking.[paragraph break]";
	say "This Inform 7 edition is a separate reconstruction.  Current implementation status is [openadventure implementation version]."

Section 4 - Commands

Oahelping is an action out of world applying to nothing.
Understand "help" as oahelping.

Carry out oahelping:
	display openadventure help menu.

Oainstructing is an action out of world applying to nothing.
Understand "instructions" as oainstructing.
Understand "instruction" as oainstructing.
Understand "help instructions" as oainstructing.
Understand "help instruction" as oainstructing.
Understand "help playing" as oainstructing.
Understand "help play" as oainstructing.

Carry out oainstructing:
	display openadventure instructions.

Oahistorying is an action out of world applying to nothing.
Understand "history" as oahistorying.
Understand "historical background" as oahistorying.
Understand "help history" as oahistorying.
Understand "help historical background" as oahistorying.

Carry out oahistorying:
	display openadventure historical background.

Oaopening is an action out of world applying to nothing.
Understand "open adventure" as oaopening.
Understand "help open adventure" as oaopening.
Understand "help open" as oaopening.

Carry out oaopening:
	display openadventure open adventure information.

Oaabouting is an action out of world applying to nothing.
Understand "about" as oaabouting.
Understand "about edition" as oaabouting.
Understand "help about" as oaabouting.
Understand "help edition" as oaabouting.
Understand "help about this edition" as oaabouting.

Carry out oaabouting:
	display openadventure edition information.

Oacrediting is an action out of world applying to nothing.
Understand "credits" as oacrediting.
Understand "credit" as oacrediting.
Understand "help credits" as oacrediting.
Understand "help credit" as oacrediting.

Carry out oacrediting:
	display openadventure credits.

Oaversioning is an action out of world applying to nothing.
Understand the command "version" as something new.
Understand "version" as oaversioning.
Understand "versi" as oaversioning.
Understand "help version" as oaversioning.
Understand "help version information" as oaversioning.

Carry out oaversioning:
	display openadventure version information.

Oainfoing is an action out of world applying to nothing.
Understand "info" as oainfoing.
Understand "infor" as oainfoing.

Carry out oainfoing:
	display openadventure info.

Oanewsing is an action out of world applying to nothing.
Understand "news" as oanewsing.

Carry out oanewsing:
	display openadventure news.

After reading a command when openadventure-subsystem-information is true:
	let T be text;
	let T be the player's command;
	replace the regular expression "^\s*\?" in T with "help";
	change the text of the player's command to T.

When play begins:
	initialize openadventure information subsystem;
	display openadventure startup presentation.
