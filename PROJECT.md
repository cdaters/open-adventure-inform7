# Open Adventure Inform 7

## Overview

This project aims to create a modern Inform 7 10.1.2 implementation of Eric S. Raymond's Open Adventure.

The resulting game should preserve Open Adventure gameplay and content while producing a maintainable Inform 7 codebase capable of compiling to Z-Machine version 8 for distribution through TerpVault and other interactive fiction archives.

---

## Canonical Sources

### Primary

1. Open Adventure C source
2. adventure.yaml

### Reference

1. Chris Conley's Inform 7 Adventure port
2. Graham Nelson's Advent.inf
3. Original Crowther and Woods Adventure sources

---

## Design Philosophy

The YAML file is the authoritative world model.

Generated code should be regenerated rather than edited manually.

Gameplay systems should remain hand-maintained Inform 7 source.

---

## Parser Philosophy

The goal is to preserve Open Adventure gameplay and vocabulary while taking advantage of modern Inform 7 parser capabilities.

### Preserve

The following should remain valid wherever they are valid in Open Adventure:

* motion words
* object vocabulary
* magic words
* directional abbreviations
* classic Adventure shorthand

Examples:

ROAD
BUILDING
FOREST
STREAM
XYZZY
PLUGH

### Extend

Modern natural-language equivalents should be supported when practical.

Examples:

GO WEST
FOLLOW THE STREAM
TAKE THE LAMP
LOOK AT THE BIRD
OPEN THE GRATE WITH THE KEYS

### Do Not Change

Parser improvements must not alter:

* puzzle solutions
* scoring
* game progression
* object behavior
* travel logic
* endgame behavior

Parser modernization should improve usability without changing gameplay.

---

## Generated Files

generated/Rooms.ni
generated/Travel.ni
generated/Objects.ni
generated/Vocabulary.ni
generated/Messages.ni
generated/Hints.ni

These files are automatically generated from adventure.yaml.

DO NOT EDIT THESE FILES MANUALLY.

---

## Hand-Maintained Files

OpenAdventure.ni

Contains:

* Dwarf logic
* Pirate logic
* Dragon logic
* Troll logic
* Cave closing sequence
* Lamp and battery system
* Scoring
* Repository and endgame
* Special parser behavior

---

## Milestone 1

Generate:

* Rooms
* Travel
* Objects
* Vocabulary

Result:

World model compiles in Inform 7.

Milestone-1 travel status:

* Travel extraction and generation are implemented with action-type classification
  (`goto`, `speak`, `special`) and metadata tags (`conditional`, `random`,
  `forced`) in `generated/Travel.ni`.
* Gameplay behavior wiring for these travel rules is still not implemented.
* Object analysis and generation are implemented with role taxonomy in
  `tools/generators/objects.py` and `generated/Objects.ni`.
* `docs/object-analysis.md` tracks per-object role, location, state, inventory,
  and vocabulary data for Milestone 1B review.
* Vocabulary analysis is implemented in
  `tools/generators/vocabulary.py` with generated output in
  `generated/Vocabulary.ni`.
* `docs/vocabulary-analysis.md` tracks motion/action/object counts, magic words,
  abbreviations, overlaps, parser irregularities, and parser-handling strategy.

---

## Milestone 2

Implement movement system.

Result:

Player can traverse the entire cave.

---

## Milestone 3

Implement objects and puzzles.

Result:

Major treasures and puzzle chains function.

---

## Milestone 4

Implement game systems.

* Dwarves
* Pirate
* Dragon
* Troll
* Cave closing

Result:

Game becomes completable.

---

## Milestone 5

Scoring and endgame.

Result:

Open Adventure fully playable.

---

## Milestone 6

TerpVault packaging.

Result:

Release-quality .z8 build.
