# Open Adventure Inform 7

An Inform 7 10.1.2 implementation of Eric S. Raymond's Open Adventure.

This project aims to create a modern Inform 7 version of Open Adventure using the Open Adventure `adventure.yaml` file as the canonical world model and the Open Adventure C implementation as the canonical behavioral reference.

The resulting game is intended to compile under Inform 7 10.1.2 and target the Z-Machine Version 8 format for distribution through TerpVault and other Interactive Fiction archives.

---

## Project Goals

* Preserve Open Adventure gameplay and content.
* Use `adventure.yaml` as the authoritative source of world data.
* Generate world-model source automatically where practical.
* Maintain gameplay systems in hand-written Inform 7.
* Produce a clean, modern Inform 7 codebase.
* Build a playable `.z8` release.

---

## Canonical Sources

### Open Adventure

* William Crowther's original Adventure (1975–1976)
* Don Woods' expanded Adventure (1977)
* Eric S. Raymond's Open Adventure

### Reference Implementations

* Open Adventure (C)
* adventure.yaml
* Chris Conley's Inform 7 Adventure port
* Graham Nelson's Advent.inf

---

## Source Hierarchy

When multiple implementations disagree, the following precedence applies:

1. Open Adventure C implementation
2. adventure.yaml
3. Original Crowther/Woods Adventure behavior
4. Graham Nelson's Advent.inf
5. Chris Conley's Inform 7 Adventure port

Reference implementations may be consulted for implementation techniques and historical behavior but do not override Open Adventure.


---

## Repository Structure

```text
open-adventure-inform7/
├── OpenAdventure.ni
├── PROJECT.md
│
├── source/
│   └── adventure.yaml
│
├── references/
│   ├── open-adventure-c/
│   │   ├── adventure.c
│   │   ├── adv440.c
│   │   ├── travel.c
│   │   └── ...
│   │
│   ├── conley-inform7/
│   │   └── Adventure.ni
│   │
│   └── nelson-inform6/
│       └── Advent.inf
│
├── generated/
│   ├── Rooms.ni
│   ├── Travel.ni
│   ├── Objects.ni
│   ├── Vocabulary.ni
│   ├── Messages.ni
│   └── Hints.ni
│
├── tools/
│   ├── yaml2inform.py
│   └── generators/
│
└── docs/
```

---

## Generated vs Hand-Maintained Code

### Generated

These files are generated automatically from `adventure.yaml`:

* Rooms.ni
* Travel.ni
* Objects.ni
* Vocabulary.ni
* Messages.ni
* Hints.ni

Do not edit generated files manually.

### Hand-Maintained

Gameplay systems remain hand-written Inform 7:

* Dwarf AI
* Pirate behavior
* Troll behavior
* Dragon behavior
* Lamp and battery logic
* Scoring
* Cave-closing sequence
* Repository/endgame logic
* Parser enhancements

---

## Building Generated Sources

Generate Inform 7 source files from the YAML world model:

```bash
python3 tools/yaml2inform.py
```

Generated files will be written to:

```text
generated/
```

---

## Current Status

### Completed

* Repository initialization
* GitHub integration
* YAML parsing
* Room generation prototype
* Travel extraction prototype

### In Progress

* Travel translation
* Object generation
* Vocabulary generation

### Planned

* Full movement system
* Object placement
* Puzzle logic
* Dwarves
* Pirate
* Cave closing
* Endgame
* Z8 release

---

## License

This project is released under the BSD 2-Clause License.

Open Adventure is Copyright © Eric S. Raymond and contributors.

Original Adventure was created by William Crowther and expanded by Don Woods.

This repository contains an Inform 7 implementation and associated conversion tooling maintained by Craig Daters.

