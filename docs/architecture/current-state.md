# Current State Snapshot (Milestone 2C)

This is the repository state after Milestone 2C as currently checked in.

## 1) What currently works

- Canonical input and parsing:
  - `source/adventure.yaml` is successfully loaded by `tools/yaml2inform.py`.
  - Generator pipeline runs end-to-end for all wired outputs.
- World-model generation:
  - `generated/Rooms.ni`: room declarations and descriptive text for all locations.
  - `generated/Objects.ni`: object declarations by role with vocabulary/state metadata.
  - `generated/Vocabulary.ni`: normalized token inventory for motions/actions/objects.
  - `generated/Travel.ni`: direct map edges plus non-direct travel dispatch metadata table.
- Travel system architecture:
  - Direct exits are emitted as Inform 7 room links.
  - Remaining travel rules are converted into a structured non-direct table with
    source/action/category/condition metadata.
  - Unresolved special systems are explicitly marked for later handwritten logic.
- Documentation and analysis:
  - `docs/object-analysis.md`, `docs/vocabulary-analysis.md`, and `docs/travel-analysis.md` track source-wide taxonomy.
  - `docs/architecture/{world-model.md,travel-translation.md,movement-generation.md,non-direct-travel.md,source-hierarchy.md}` document design and conversion boundaries.

## 2) What is generated

Current generator outputs from `python3 tools/yaml2inform.py` (and the files that the script writes today):

- `generated/Rooms.ni`
- `generated/Objects.ni`
- `generated/Vocabulary.ni`
- `generated/Travel.ni`

All four are regenerated from `source/adventure.yaml` and should not be edited manually.

Not currently wired from the generator:

- `generated/Messages.ni`
- `generated/Hints.ni`

These are referenced as canonical targets in docs but are not produced by the current `tools/generators/*` set.

## 3) What remains unresolved

- Travel behavior is not fully playable yet.
  - `special` travel rules still require handwritten Inform 7 movement handling.
  - One `nodwarves` condition still requires dwarf-system predicate support.
- No runtime travel dispatcher exists yet (table is generated, not executed).
- Parser-generation work is incomplete:
  - No generated `Go`/motion dispatch wiring is connected to Inform action handling yet.
  - Message-only commands, token collisions, and parser modernizations are documented but not implemented.
- Object systems are only structurally generated:
  - Creature behavior, puzzle logic, and custom interaction mechanics still need parser/system-level support.
- Source files present:
  - `OpenAdventure.ni` remains the hand-maintained gameplay entry point, but special-travel/dwarves/puzzle integration is still pending.

## 4) Current travel generation statistics

- Locations in world model: **185**
- Total travel rules: **623**
- Direct map rules emitted: **337**
- Locations with direct map links: **106**
- Non-direct rule rows emitted: **286** (in `Table of Generated Travel Non-Direct Rules`)
- Resolved-by-generation count: **616**
- Unresolved rules: **7**
- Unresolved rule IDs: **110, 138, 190, 193, 194, 216, 226**
- Travel category split in non-direct table:
  - `goto_conditional`: **22**
  - `goto_forced`: **23**
  - `goto_magic_word`: **4**
  - `goto_non_direct`: **192**
  - `goto_random`: **5**
  - `speak`: **15**
  - `speak_conditional`: **19**
  - `special`: **4**
  - `special_conditional`: **2**

## 5) Current object generation statistics

From `generated/Objects.ni` role summary:

- Total objects: **70**
- unknown: **1**
- treasure: **20**
- portable: **17**
- scenery: **5**
- puzzle: **16**
- infrastructure: **4**
- creature: **7**

Notes:

- **46** objects are structurally generated and likely fully represented by generated object
  declarations plus metadata.
- **23** objects need custom Inform behavior in downstream gameplay/parser layers (creatures + puzzle objects).

## 6) Current vocabulary generation statistics

From `generated/Vocabulary.ni` summary:

- total unique tokens: **321**
- motion words: **105**
- action words: **119**
- object words: **100**
- magic words: **9**
- abbreviations: **22**
- historical shortcuts: **18**
- parser-relevant action metadata:
  - noaction actions: **16**
  - action words with `oldstyle=false`: **3**
  - motion entries with `oldstyle=false`: **1**

## 7) Architecture completed so far

- Source authority model is documented:
  - `adventure.yaml` = world model.
  - `open-adventure-c` = behavior reference.
- Travel architecture is split across three layers:
  1. structure extraction (`adventure.yaml`),
  2. generator translation (`tools/generators/travel.py`),
  3. hand-maintained runtime execution (`OpenAdventure.ni`, not yet implemented for all cases).
- Non-direct travel dispatch table now provides a structured intermediate representation
  suitable for future generated rulebooks.
- Parser-vocabulary compatibility framework is analyzed, with token collision and
  modern-equivalent mapping identified.

## 8) Planned next milestones

1. **Milestone 2D (Travel Runtime Wiring)**
   - Implement generated non-direct travel dispatcher in Inform 7 using `Table of Generated Travel Non-Direct Rules`.
   - Support `goto` conditionals/forced/random/magic-word at runtime.
2. **Parser Generation/Integration**
   - Route movement words to travel categories and preserve message-only and abbreviation behavior.
3. **Special and Dwarf-dependent Travel**
   - Implement `dest_special` handling and `nodwarves` predicate in `OpenAdventure.ni`.
4. **Object behavior pass**
- Replace generated placeholders with creature/puzzle-specific mechanics and state transitions.
5. **Messages and Hints**
   - Either add generator support and integrate in parser/travel/object flows.

## 9) Risks and unknowns

- **Gameplay semantics risk:** premature direct-map emission can still regress old movement semantics if parser or condition context is mis-modeled.
- **Divergence risk:** the current generated travel table includes all unresolved entries; moving them to handwritten logic introduces potential source-of-truth mismatch risk unless always checked against C behavior.
- **Incomplete generator scope:** message/hint generation is not currently wired despite being listed as planned canonical outputs.
- **Complex token collisions:** `conti`, `reser`, `steps` and other overlaps require context-sensitive parsing.
- **Special travel behavior unknowns:** special travel semantics (`dest_special` values) are non-trivial and must stay behavior-accurate.

## 10) Recommendations for next development session

- Implement runtime consumption of `generated/Travel.ni` next, with a strict rule order and same unresolved-marking behavior.
- Keep all parser/walkability changes behind tests/checkpoints that preserve counts and unresolved-rule IDs.
- Add a small acceptance checklist per milestone:
  - travel categories exercised,
  - unresolved-handwritten count unchanged,
  - existing special-case IDs still deferred until dedicated implementation is in place.
- Validate every new change against Open Adventure C before gameplay behavior changes.

