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
menu-title (text)	menu-topic (text)	menu-status-title (text)	menu-page-title (text)
"Instructions for Playing"	"instructions"	"Instructions"	"Instructions for Playing"
"Historical Background"	"history"	"History"	"Historical Background"
"Open Adventure"	"open-adventure"	"Open Adventure"	"Open Adventure"
"About This Edition"	"edition"	"This Edition"	"About This Edition"
"Credits"	"credits"	"Credits"	"Credits"
"Version Information"	"version"	"Version Info"	"Version Information"

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
			if displaying openadventure help topic menu-topic entry with status title menu-status-title entry and page title menu-page-title entry requests menu exit:
				now menu-open is false;
	now the left hand status line is saved-left-status;
	now the right hand status line is saved-right-status;
	draw the openadventure status line;
	clear the openadventure menu screen;
	try looking.

To display openadventure help menu screen with selection (selected-row - number):
	say "[bold type]Open Adventure Help[roman type][paragraph break]";
	say "Use arrows to move, RETURN or SPACE to select, Q or ESC to leave.[paragraph break]";
	let row-number be 1;
	repeat through the Table of OpenAdventure Help Menu:
		if row-number is selected-row:
			say " > ";
		otherwise:
			say "   ";
		say "[menu-title entry][line break]";
		increase row-number by 1.

To decide whether displaying openadventure help topic (topic - text) with status title (topic-title - text) and page title (page-title - text) requests menu exit:
	now openadventure-menu-status-title is topic-title;
	redraw openadventure menu status line;
	clear the openadventure menu screen;
	say "[bold type][page-title][roman type][paragraph break]";
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
	say "I know about places, actions, and things.  Many words name places or directions and will move you if a route is available.  Try FOREST, BUILDING, DOWNSTREAM, ENTER, EAST, WEST, NORTH, SOUTH, UP, and DOWN.[paragraph break]";
	say "I also know about objects, including a few unusual ones hidden in the cave.  To do something with an object, give an action and usually the object's name.  Sometimes the action alone is enough for me to infer what you mean.[paragraph break]";
	say "Useful short forms include I for INVENTORY, L for LOOK, and compass abbreviations such as N, S, E, W, U, and D.  Cave passages twist, so leaving one place to the north does not promise that the way back is south.[paragraph break]";
	say "If you want to end your adventure early, type QUIT.  To see how well you are doing, type SCORE.  To get full credit for a treasure, leave it safely in the building; you receive partial credit for finding it.[paragraph break]";
	say "Good luck!"

To display openadventure historical background:
	now openadventure-information-last-section is "history";
	say "Adventure's cave has roots in a real place.  Mammoth Cave in Kentucky was mined, toured, mapped, fought over, and explored for generations before it entered computer history.  Its mixture of commercial showmanship, dangerous passages, underground rivers, and grand room names helped shape the language of American caving.[paragraph break]";
	say "One of Mammoth Cave's great early figures was Stephen Bishop, an enslaved guide whose memory, daring, and mapmaking transformed what visitors understood of the cave.  Later explorers pushed beyond the tourist routes into the Flint Ridge and Bedquilt regions, tracing difficult passages and proving that the Mammoth Cave system was far larger than any show-cave entrance suggested.[paragraph break]";
	say "Will Crowther knew that world firsthand as a caver and programmer.  In 1976 he wrote a small FORTRAN cave exploration for his children, blending remembered underground geography with a friendly typed-command interface.  It was not yet the full treasure hunt familiar today, but its rooms, crawls, fissures, streambeds, and vocabulary carried the authority of lived caving experience.[paragraph break]";
	say "Don Woods found Crowther's program on a networked computer at Stanford, contacted him, and expanded the work.  Woods added treasures, score, magic words, dwarves, the troll bridge, and much of the puzzle structure that made Adventure travel by tape, account, and word of mouth.  The result helped define the text adventure: a landscape to explore, a parser to negotiate with, and a world that answered in prose.[paragraph break]";
	say "Open Adventure, maintained by Eric S. Raymond and contributors with the original authors' approval, preserves the 430-point Adventure 2.5 line as open source and backs it with tests and documentation.  This Inform 7 edition follows Open Adventure as its behavioral authority while presenting the game through Inform's world model, keeping the path visible from Mammoth Cave to Adventure, from Adventure to Open Adventure, and from Open Adventure to this edition."

To display openadventure open adventure information:
	now openadventure-information-last-section is "open-adventure";
	say "Open Adventure is Eric S. Raymond's author-approved open-source release of Crowther and Woods Adventure 2.5.  It preserves the 430-point game line, maintains reproducible tests, corrects long-standing bugs, and documents the game's lineage.[paragraph break]";
	say "This Inform 7 project treats the Open Adventure C implementation and its adventure.yaml world data as authoritative for gameplay behavior.  Upstream Open Adventure resources are available at [openadventure upstream url]."

To display openadventure edition information:
	now openadventure-information-last-section is "edition";
	say "This is Open Adventure in Inform 7, an Inform 7 10.1.2 reconstruction of the Open Adventure 430-point game line.  Generated world data supplies the rooms, objects, vocabulary, and travel rows; hand-written runtime subsystems handle travel, scoring, hazards, cave closing, and endgame behavior.[paragraph break]";
	say "The implementation is maintained by Craig Daters and contributors.  The project repository is [openadventure repository url]."

To display openadventure credits:
	now openadventure-information-last-section is "credits";
	say "Original Adventure: William Crowther and Don Woods.[line break]";
	say "Open Adventure: Eric S. Raymond and contributors.[line break]";
	say "Inform 7 implementation: Craig Daters and contributors.[line break]";
	say "Inform lineage and reference material: Graham Nelson's Advent.inf and Chris Conley's Inform 7 Adventure port.[paragraph break]";
	say "Historical background is informed by the Adventure lineage preserved in those references and by the Open Adventure distribution.[paragraph break]";
	say "This repository is distributed under the BSD 2-Clause License.  The Open Adventure reference distribution is also BSD 2-Clause licensed; its documentation includes CC-BY-4.0 material."

To display openadventure version information:
	now openadventure-information-last-section is "version";
	say "There is a puff of orange smoke; within it, fiery runes spell out:[paragraph break]";
	say "Open Adventure Inform 7 Edition - [openadventure implementation version][line break]";
	say "Story release: [release number][line break]";
	say "Build serial: development source build[line break]";
	say "Inform 7: 10.1.2 target source[line break]";
	say "Repository: [openadventure repository url][line break]";
	say "Open Adventure upstream: [openadventure upstream url]"

To display openadventure info:
	now openadventure-information-last-section is "info";
	say "For a summary of Open Adventure changes, type NEWS.  If you want to end your adventure early, type QUIT.  To suspend or resume an adventure, use the interpreter's SAVE and RESTORE support where available.  To see how well you are doing, type SCORE.[paragraph break]";
	say "To get full credit for a treasure, leave it safely in the building.  You receive partial credit for locating treasure, lose points for getting killed, and gain points for exploring more of the cave.[paragraph break]";
	say "If you think you have found every treasure, keep exploring for a while.  If nothing interesting happens, something is still missing.  If something interesting does happen, you have reached a bonus opportunity in the Master's section."

To display openadventure news:
	now openadventure-information-last-section is "news";
	say "Open Adventure is an author-approved open-source release of Version 2.5.  Version 2.5 is essentially the Version II cave and hazard set, with a 430-point top score, additional hints for obscure puzzles, bug fixes, and cosmetic corrections.[paragraph break]";
	say "The bundled Open Adventure news file identifies release 1.21, dated 2026-03-22, as code hardening with ChatGPT 5.2, cppcheck, pylint, and spellchecking.[paragraph break]";
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
