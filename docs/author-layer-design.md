# Author Layer Design

Date: 2026-06-14

The Author Layer is the proposed home for future author-facing work that should
coexist with the parity-verified Open Adventure implementation without
rewriting generated world data or core runtime subsystems.

## Purpose

The Author Layer should hold work that is:

- player-facing;
- optional or presentation-oriented;
- easier to maintain as authored Inform text than generated data;
- separable from Open Adventure C parity behavior.

It should not hold generated rooms, generated travel rows, generated object
definitions, scoring tables, dwarf/pirate/endgame core behavior, or other
parity-critical systems.

## Candidate Scope

Good Author Layer candidates:

- HELP, ABOUT, INFO, NEWS, VERSION text refinements.
- menu systems.
- hints and hint presentation.
- optional walkthrough/help affordances.
- parser conveniences that do not change canonical behavior.
- player-experience copy polish.
- release/build/version text.
- optional tutorial or accessibility commands.
- future enhancements explicitly classified as non-parity behavior.

Poor Author Layer candidates:

- `source/adventure.yaml` world facts.
- generated room/object/travel/vocabulary output.
- core travel dispatch.
- hazard timing and random behavior.
- treasure and score bookkeeping.
- reincarnation, cave closing, and endgame state machines.
- transcript-specific replay guards.

## Proposed Repository Shape

Recommended future layout:

```text
author/
  README.md
  OpenAdventure_AuthorLayer.ni
  OpenAdventure_AuthorHelp.ni
  OpenAdventure_AuthorHints.ni
  OpenAdventure_AuthorPresentation.ni
```

The exact split should follow real complexity. Start with one file only when
there is actual Author Layer code to keep.

## Composition Order

The Author Layer should be composed after canonical runtime modules:

```text
generated rooms/objects/vocabulary/travel
OpenAdventure_State.ni
...
OpenAdventure_Information.ni
OpenAdventure_Runtime.ni
author/OpenAdventure_AuthorLayer.ni
```

Late composition lets author-facing rules override or extend presentation where
Inform rule ordering allows it, while keeping canonical runtime modules stable.

In the Milestone 10E Author Edition export, canonical modules are represented
as project-local extensions under:

```text
OpenAdventure-AuthorEdition.materials/Extensions/OpenAdventure/
```

Future Author Layer files should either remain canonical under `author/` and be
exported as additional project-local extensions, or be copied into a clearly
named Author Layer extension after `OpenAdventure Runtime`.

Any Author Layer rule that changes gameplay behavior must be documented and
covered by transcripts before release.

## Edit Boundaries

Author Layer files may:

- add out-of-world commands;
- add help/menu text;
- add parser aliases that dispatch into existing runtime behavior;
- add report/check rules for player-facing messages;
- add release metadata text.

Author Layer files may not:

- redefine generated rooms or objects;
- change generated travel tables directly;
- modify scoring totals or treasure classifications;
- alter random hazard mechanics;
- bypass transcript replay controls;
- depend on line positions in generated `story.ni` or exported extension files.

## Synchronization

`tools/sync_author_edition.py --export` should include Author Layer files once
they exist, preserving their module boundaries in the Author Edition.

`--diff` should report when the exported Author Edition is stale relative to:

- generated source;
- runtime modules;
- project metadata;
- Author Layer files.

`--import` should remain unsupported for the full exported source tree. A
future layer-only import can be considered if Author Layer files are stored
separately inside the IDE project or marked with stable sentinels.

## Review Policy

Every Author Layer change should state whether it is:

- parity-preserving presentation;
- parser convenience;
- optional help/hint behavior;
- intentional deviation;
- future enhancement.

Release-candidate changes should be limited to parity-preserving presentation
unless a discrepancy inventory explicitly approves otherwise.
