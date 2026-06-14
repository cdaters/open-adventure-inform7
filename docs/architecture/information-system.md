# Information System

Milestone 6B adds a player-facing information subsystem for startup text, help, credits, about text, Open Adventure information, news, and version display.

## Source Review

Graham Nelson's `Advent.inf` provides the presentation model:

- startup text: `Welcome to Adventure!` followed by a prompt to type `HELP`.
- a menu-style help system with instructions, history, authenticity, and postgame notes.
- player-oriented prose that explains the parser without leaving the historical frame of Adventure.

Open Adventure C provides current concepts and authoritative command topics:

- `HELP`: parser and movement instructions.
- `INFO`: score, treasures, quitting, save/resume, hints, and cave-closing guidance.
- `NEWS`: Open Adventure release notes and 430-point Version 2.5 identity.
- `ACT_VERSION`: orange-smoke version display.

Chris Conley's Inform 7 port provides useful Inform-specific command patterns:

- `HELP` as an out-of-world command.
- `ABOUT` as a command about the Inform 7 implementation.
- command rewriting for bare `?`.

## Design

The subsystem is implemented in `OpenAdventure_Information.ni` and keeps information commands out of world so they do not consume gameplay turns.

`HELP` prints a menu:

- Instructions for Playing
- Historical Background
- Open Adventure
- About this Edition
- Credits
- Version Information

Each section can be opened directly with a command such as `HELP INSTRUCTIONS`, `HELP HISTORY`, `HELP OPEN ADVENTURE`, `HELP EDITION`, `HELP CREDITS`, or `HELP VERSION`.

Classic concepts are preserved:

- `ABOUT` prints information about this Inform 7 edition.
- `INFO` prints Open Adventure gameplay and scoring information.
- `NEWS` prints Open Adventure version/news information and identifies this edition separately.
- `VERSION` and `VERSI` print the orange-smoke version display.
- `?` is normalized to `HELP` after command reading.

## Startup Presentation

When play begins, the subsystem prints:

```text
Welcome to Adventure!

(Please type HELP for instructions and information.)
```

This follows Nelson's startup flow while avoiding Open Adventure C's startup yes/no instruction prompt.

## Attribution and Licensing

The credits section records:

- Original Adventure by William Crowther and Don Woods.
- Open Adventure by Eric S. Raymond and contributors.
- Inform 7 implementation by Craig Daters and contributors.
- Nelson and Conley reference implementations.
- BSD 2-Clause licensing for this repository and the Open Adventure reference distribution.
- CC-BY-4.0 documentation in the Open Adventure reference distribution.

## Version Information

Version display includes:

- `Release Candidate 1 Glulx build`.
- Inform story release number.
- development source build status.
- Inform 7 10.1.2 target source.
- project repository URL: `https://github.com/cdaters/open-adventure-inform7`.
- Open Adventure upstream URL: `http://www.catb.org/esr/open-adventure/`.

## Integration

Integration points:

- `OpenAdventure.ni`: includes `OpenAdventure_Information.ni`.
- `build.sh`: composes the module into `OpenAdventure.inform/Source/OpenAdventure.generated.ni`.
- `OpenAdventure_State.ni`: adds information subsystem state and last-section tracking.
- `OpenAdventure_Runtime.ni`: adds subsystem registration.
- `tests/smoke/12-information-system.sh`: verifies command, startup, attribution, and version scaffolding.

The subsystem does not alter travel dispatch, scoring, cave closing, or endgame behavior.
