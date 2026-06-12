# Open Adventure Inform 7

## Overview

This project aims to create a modern Inform 7 10.1.2 implementation of Eric S. Raymond's Open Adventure.

The resulting game should preserve Open Adventure gameplay and content while producing a maintainable Inform 7 codebase capable of compiling to Z-Machine version 8 for distribution through TerpVault and other interactive fiction archives.

---

## Canonical Sources

### Primary

These jointly define the authoritative behavior and world model.

- Open Adventure C is authoritative for gameplay behavior.
- adventure.yaml is authoritative for world data.

### Historical and Reference Sources

1. Original Crowther and Woods Adventure sources
2. Graham Nelson's Advent.inf
3. Chris Conley's Inform 7 Adventure port

---

## Source Hierarchy and Conflict Resolution

This project uses multiple historical and modern sources. These sources are not considered equal.

When behavior, data, parser vocabulary, scoring, travel rules, object behavior, or implementation details differ, the following precedence applies:

### Canonical Sources

1. Open Adventure C implementation
2. adventure.yaml

These define the authoritative behavior and world model for this project.

### Historical Sources

3. Original Crowther/Woods Adventure behavior

Historical Adventure behavior may be consulted to clarify intent where Open Adventure documentation is ambiguous.

### Reference Implementations

4. Graham Nelson's Advent.inf
5. Chris Conley's Inform 7 Adventure port

Reference implementations are valuable for:

* parser design
* Inform implementation techniques
* world-model organization
* historical comparison

However, they do not override Open Adventure when behavior differs.

### Conflict Resolution

When multiple sources disagree:

* Open Adventure C wins over all other sources.
* adventure.yaml wins over generated Inform source.
* Historical Adventure behavior may inform interpretation but does not override Open Adventure.
* Reference implementations are advisory only.

Examples:

* If Open Adventure C and Conley's Inform 7 port differ, Open Adventure C wins.
* If Advent.inf and adventure.yaml differ, adventure.yaml wins.
* If a generated file disagrees with adventure.yaml, the YAML is authoritative and the generator should be corrected.

### Repository Organization

The repository distinguishes between:

#### Canonical Inputs

```text
source/
    adventure.yaml
```

#### Reference Materials

```text
references/
    open-adventure-c/
    conley-inform7/
    nelson-inform6/
```

Reference materials exist to assist development and verification. They are not the authoritative source of game behavior.

---

## Design Philosophy

Open Adventure C is authoritative for gameplay behavior.

adventure.yaml is authoritative for world-model data.

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

## AI-Assisted Development

Codex and other AI tools may assist development.

AI-generated code, documentation, and analysis must:

- follow the Source Hierarchy and Conflict Resolution rules
- preserve Open Adventure gameplay
- respect the Parser Philosophy
- treat generated files as disposable artifacts
- update documentation alongside implementation changes when practical

Documentation and analysis are considered first-class project outputs.

---

## Current Status

### Completed

- Milestone 1A: Travel Analysis
- Milestone 1B: Object Analysis
- Milestone 1C: Vocabulary Analysis
- Milestone 2A: Travel Translation Architecture
- Milestone 2B: Direct Movement Generation

### In Progress

- Milestone 2C: Conditional / Random / Forced Travel

### Planned

- Object Placement Generation
- Parser Generation
- Puzzle Systems
- Dwarves
- Pirate
- Cave Closing
- Scoring
- Endgame

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

Progress:

- Direct movement map connections are now generated from direct `goto` rules in
  `tools/generators/travel.py`.
- `generated/Travel.ni` now contains `Room is direction of Room` statements for
  deterministic exits and metadata placeholders for all non-direct transitions.
- Conditional/forced/random/special/magic-word travel is still represented as
  generated placeholder comments pending Milestone 2C dispatch logic.

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
