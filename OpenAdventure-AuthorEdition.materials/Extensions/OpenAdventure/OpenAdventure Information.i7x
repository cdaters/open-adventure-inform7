Version 1 of OpenAdventure Information by OpenAdventure begins here.

[ Exported from OpenAdventure_Information.ni by tools/make_author_edition.py. ]

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
	say "Adventure did not begin on a computer. Its roots lie deep beneath central Kentucky in Mammoth Cave, one of the largest cave systems on Earth. Long before it inspired a game, the cave was mined, explored, mapped, and argued over by generations of guides, tourists, entrepreneurs, and explorers. The strange vocabulary of Adventure, with its domes, crawls, pits, passages, and underground rivers, comes directly from this real-world environment.[paragraph break]";
	say "One of the most important figures in Mammoth Cave's history was Stephen Bishop, an enslaved guide and explorer who worked there during the nineteenth century. Bishop explored and mapped vast sections of the cave, named many of its most famous landmarks, and became renowned for his knowledge of the underground world. Features such as the River Styx and the Giant Dome trace their names and traditions back to his work. His remarkable 1842 map remained influential for decades, and many regard him as one of the greatest cave explorers in American history.[paragraph break]";
	say "Throughout the nineteenth and early twentieth centuries, Mammoth Cave grew into a major tourist attraction. Rival cave owners competed fiercely for visitors, and by the 1920s the region had entered the so-called 'Kentucky Cave Wars,' a period of aggressive promotion, legal disputes, forged advertisements, and fierce competition between neighboring cave systems. At the same time, explorers continued searching for connections between Mammoth Cave and the surrounding Flint Ridge cave networks.[paragraph break]";
	say "In 1972, Patricia Crowther made a breakthrough by discovering a hidden connection that finally linked major sections of the Mammoth and Flint Ridge systems. The resulting cave network became the longest known cave system in the world. Decades later, explorers discovered that Crowther's route corresponded to passages already present on Stephen Bishop's nineteenth-century map, providing a remarkable link between two generations of cave exploration.[paragraph break]";
	say "Adventure itself began in 1976 when cave explorer and programmer Will Crowther created a small FORTRAN game inspired by his experiences in Mammoth Cave. Crowther later explained that the project emerged during a difficult period of his life. After a divorce, he missed spending time with his children and wanted to create something they could enjoy together. He was also an active cave explorer and had recently been involved in the emerging hobby of Dungeons & Dragons.[paragraph break]";
	say "Crowther described his goal this way:[paragraph break]";
	say "'I had been involved in a non-computer role-playing game called Dungeons and Dragons at the time, and also I had been actively exploring in caves -- Mammoth Cave in Kentucky in particular. Suddenly, I got involved in a divorce, and that left me a bit pulled apart in various ways. In particular I was missing my kids. Also the caving had stopped, because that had become awkward, so I decided I would fool around and write a program that was a re-creation in fantasy of my caving, and also would be a game for the kids.'[paragraph break]";
	say "He also wanted the game to be approachable to people who were not programmers. Rather than requiring special commands, players could interact using ordinary language. This decision helped establish one of the defining characteristics of interactive fiction: the parser.[paragraph break]";
	say "Crowther's original game emphasized exploration more than puzzle solving. Many familiar locations, geological details, and cave terms came directly from Mammoth Cave itself. The world was relatively small, the treasure hunt was limited, and formal scoring had not yet become central to the experience.[paragraph break]";
	say "The next major step came when Don Woods discovered Crowther's program and contacted him for permission to expand it. Woods added treasures, scoring, magic words, dwarves, the troll bridge, and many of the puzzles that players now associate with Adventure. His expanded version spread rapidly through universities and computer centers and became one of the most influential computer games ever created.[paragraph break]";
	say "Adventure inspired an entire genre. Zork, Infocom, TADS, Inform, and countless other interactive fiction systems all trace part of their lineage back to Crowther and Woods. Even modern parser-based games still inherit concepts that first became popular through Adventure.[paragraph break]";
	say "Open Adventure, maintained by Eric S. Raymond and contributors with the approval of the original authors, preserves the classic 430-point Adventure 2.5 lineage as open source software. It serves as both a playable game and a historical preservation effort, backed by extensive documentation and testing.[paragraph break]";
	say "This Inform 7 edition follows Open Adventure as its behavioral authority while presenting the game through Inform's world model and authoring tools. It is one more link in a chain that stretches from Mammoth Cave, to Stephen Bishop, to Will Crowther and Don Woods, to Open Adventure, and finally to the version you are playing today."

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

OpenAdventure Information ends here.
