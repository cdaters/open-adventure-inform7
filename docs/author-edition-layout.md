# Author Edition Layout

Date: 2026-06-17

Milestone 10E modularizes the Author Edition while preserving the canonical
RC1 build and transcript workflow.

## Summary

The Author Edition now uses a lightweight project entry point:

```text
OpenAdventure-AuthorEdition.inform/Source/story.ni
```

`story.ni` contains only:

- project title and metadata copied from `OpenAdventure.ni`;
- release settings such as `Use scoring`;
- an ordered include spine for Open Adventure modules.

The actual modules are exported as project-local Inform extensions:

```text
OpenAdventure-AuthorEdition.materials/
└── Extensions/
    └── OpenAdventure/
        ├── OpenAdventure Rooms.i7x
        ├── OpenAdventure Objects.i7x
        ├── OpenAdventure Vocabulary.i7x
        ├── OpenAdventure Travel.i7x
        ├── OpenAdventure State.i7x
        ├── OpenAdventure Conditions.i7x
        ├── OpenAdventure Plover.i7x
        ├── OpenAdventure Troll.i7x
        ├── OpenAdventure Bear.i7x
        ├── OpenAdventure Dwarves.i7x
        ├── OpenAdventure Pirate.i7x
        ├── OpenAdventure Scoring.i7x
        ├── OpenAdventure Reincarnation.i7x
        ├── OpenAdventure Dragon.i7x
        ├── OpenAdventure CaveClosing.i7x
        ├── OpenAdventure Endgame.i7x
        ├── OpenAdventure Information.i7x
        └── OpenAdventure Runtime.i7x
```

This keeps subsystem boundaries visible without making `story.ni` a
monolithic generated file.

## Include Strategy

Inform 7 10.1.2 does not accept quoted local source includes such as:

```inform7
Include "Rooms.ni".
```

The compiler reports those lines as ordinary source text rather than include
directives. The compatible strategy is therefore project-local extensions:

```inform7
Include OpenAdventure Rooms by OpenAdventure.
Include OpenAdventure Objects by OpenAdventure.
...
Include OpenAdventure Runtime by OpenAdventure.
```

The `.i7x` files live in the sibling materials package because that is where
Inform looks for project-local extensions:

```text
OpenAdventure-AuthorEdition.materials/Extensions/OpenAdventure/
```

## Canonical Source

The exported Author Edition files are not canonical source. Durable edits
remain in:

- `source/adventure.yaml`
- `tools/generators/*.py`
- `OpenAdventure.ni`
- `OpenAdventure_*.ni`
- future managed Author Layer files

Generated Author Edition modules should be treated as navigable IDE output.
Durable changes made while inspecting them should be moved back to canonical
source and then re-exported.

## Synchronization

Export:

```bash
python3 tools/sync_author_edition.py --export
```

Export to a separate local workspace:

```bash
python3 tools/sync_author_edition.py --export \
  --destination ~/Documents/if/OpenAdventure-Inform7
```

When `--destination` names a directory, the generated project and sibling
materials package are written inside it. When it names a `.inform` path, that
path is used as the project bundle.

Diff:

```bash
python3 tools/sync_author_edition.py --diff
```

Use the same `--destination` value with `--diff` to check an external
workspace export.

`--diff` compares:

- `Source/story.ni`;
- `Settings.plist`;
- every exported project-local extension module.

Full import remains intentionally unsupported. The layout is modular for
navigation and compilation, not a fragile bidirectional sync system.

## Verification

Milestone 10E verification:

```bash
/Applications/Inform.app/Contents/MacOS/ni \
  -at /Applications/Inform.app/Contents/Resources \
  -project OpenAdventure-AuthorEdition.inform \
  -release -format=Inform6/32

/Applications/Inform.app/Contents/MacOS/inform6 \
  -E2w~S~DG +/Applications/Inform.app/Contents/Resources/Internal/Inform6/Library \
  OpenAdventure-AuthorEdition.inform/Build/auto.inf \
  OpenAdventure-AuthorEdition.inform/Build/output.ulx

OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
python3 tools/run_transcripts.py --execute --timeout 180
```

Results:

- Author Edition Inform translation succeeded.
- Author Edition Glulx compilation succeeded.
- Smoke tests passed.
- Transcript execution passed 15/15.
