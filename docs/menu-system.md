# Menu System

Date: 2026-06-16

Milestone 11A replaces the command-list HELP screen with an interactive
menu-driven information system.

## Goals

- Preserve RC1 gameplay parity.
- Preserve existing HELP, ABOUT, INFO, NEWS, and VERSION content.
- Move bare HELP closer to Graham Nelson's `Advent.inf` menu experience.
- Adapt Emily Short's menu approach without importing the reference extensions
  unchanged.

## Reference Material

The implementation was informed by:

- `references/extensions/short/Basic Help Menu.i7x`
- `references/extensions/short/Menus.i7x`
- `references/extensions/short/Basic Screen Effects.i7x`
- `references/nelson-inform6/Advent.inf`

Emily Short's menu model provides the core pattern:

- menu options are table rows;
- a current selection is moved with keypresses;
- the status line shows the current menu context instead of room and score;
- RETURN or SPACE selects;
- Q or ESC leaves;
- selected topics display full-screen text and then return to the menu.

`Advent.inf` provides the target feel: HELP opens an information menu outside
the game proper, with instructions, history, and edition notes.

## Implementation

The canonical implementation lives in:

```text
OpenAdventure_Information.ni
```

The project does not include Basic Help Menu unchanged. Instead,
`OpenAdventure_Information.ni` contains an OpenAdventure-prefixed menu kernel:

- `Table of OpenAdventure Help Menu`
- `display openadventure help menu`
- `display openadventure help menu screen with selection ...`
- `displaying openadventure help topic ... requests menu exit`
- `redraw openadventure menu status line`
- OpenAdventure-prefixed key predicates for up, down, select, and quit

This avoids namespace coupling to a general extension while preserving the
useful table/key-loop structure.

## Presentation

While HELP is active, the normal game status line is suppressed. It does not
show the current room, score, or move count. Instead it shows the current menu
context:

- top level: `Open Adventure Help`
- instructions topic: `Instructions`
- historical topic: `History`
- Open Adventure topic: `Open Adventure`
- edition topic: `This Edition`
- credits topic: `Credits`
- version topic: `Version Info`

When the menu exits, the previous status-line text is restored before play
returns to the normal room view.

The top-level menu copy is intentionally terse:

```text
Use the arrow keys to move,
RETURN or SPACE to select,
Q or ESC to leave.
```

`N` and `P` remain supported for compatibility with the Emily Short and
`Advent.inf` style, but they are no longer foregrounded in the visible prompt.

## Menu Topics

Bare HELP opens the top-level menu:

- Instructions for Playing
- Historical Background
- Open Adventure
- About this Edition
- Credits
- Version Information

The existing topic commands remain available:

- `HELP INSTRUCTIONS`
- `HELP HISTORY`
- `HELP OPEN ADVENTURE`
- `HELP EDITION`
- `HELP CREDITS`
- `HELP VERSION`
- `ABOUT`
- `INFO`
- `NEWS`
- `VERSION`

Those commands continue to print their focused text directly. This preserves
transcript stability and keeps quick command-line access for players who do not
want to use the menu.

## Navigation

The menu supports the same practical controls as Emily Short's framework:

- `N`, `n`, down arrow: move down
- `P`, `p`, up arrow: move up
- RETURN or SPACE: select
- `Q`, `q`, ESC: leave

Inside a topic, RETURN or SPACE returns to the menu. `Q`, `q`, or ESC exits the
menu.

## Startup

Startup remains:

```text
Welcome to Adventure!

(Please type HELP for instructions and information.)
```

The attribution banner continues to identify:

- Crowther and Woods;
- Open Adventure by Eric S. Raymond and contributors;
- this Inform 7 implementation by Craig Daters and contributors;
- release and serial information.

## Transcript Handling

The startup transcript now sends `q` after `help` to exit the interactive menu
before continuing with direct information commands. The output still includes
the expected information fragments and the full manifest remains passing.

## Verification

Milestone 11A verification:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
python3 tools/run_transcripts.py --execute --timeout 180
python3 tools/sync_author_edition.py --export
```

The Author Edition is then compiled in project mode with Inform 7 10.1.2 to
verify that the exported module remains usable from the IDE-shaped project.
