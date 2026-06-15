Version 1 of OpenAdventure Information by OpenAdventure begins here.

[ Exported from OpenAdventure_Information.ni by tools/make_author_edition.py. ]

[ Open Adventure Information Subsystem ]

Section 1 - Edition Constants

To say openadventure implementation version:
	say "Release Candidate 1 Glulx build"

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
	say "[line break]Welcome to Adventure![paragraph break](Please type HELP for instructions and information.)[paragraph break]".

Section 3 - Menu and Sections

To display openadventure help menu:
	now openadventure-information-last-section is "menu";
	say "There is information provided on the following:[paragraph break]";
	say "     Instructions for Playing[line break]";
	say "     Historical Background[line break]";
	say "     Open Adventure[line break]";
	say "     About this Edition[line break]";
	say "     Credits[line break]";
	say "     Version Information[paragraph break]";
	say "Type HELP INSTRUCTIONS, HELP HISTORY, HELP OPEN ADVENTURE, HELP EDITION, HELP CREDITS, or HELP VERSION.  ABOUT, INFO, NEWS, and VERSION are also available."

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

OpenAdventure Information ends here.
