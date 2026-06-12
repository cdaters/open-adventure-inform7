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

