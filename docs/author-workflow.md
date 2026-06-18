# Author Workflow

Date: 2026-06-17

This guide is for Inform authors who want to inspect, compile, or improve the
Author Edition.

For the full source/generated/workspace classification, see:

- `docs/repository-layout.md`
- `docs/artifact-classification.md`

## The Short Version

The repository is the source of truth. The Author Edition is generated from it.

Use this workflow:

```bash
python3 tools/sync_author_edition.py --export
```

Open:

```text
OpenAdventure-AuthorEdition.inform
```

in Inform 7 10.1.2.

Make durable changes in the repository source files, not in generated Author
Edition files. Export again, then run tests.

## What the Author Edition Is

The Author Edition is an IDE-friendly Inform project. It contains:

```text
OpenAdventure-AuthorEdition.inform/Source/story.ni
OpenAdventure-AuthorEdition.inform/Settings.plist
OpenAdventure-AuthorEdition.materials/Extensions/OpenAdventure/*.i7x
```

`story.ni` is a small include spine. The real content is split into
project-local extensions so Inform 7 can open and compile the project normally.

You can also export a separate local workspace outside the repository:

```bash
python3 tools/sync_author_edition.py --export \
  --destination ~/Documents/if/OpenAdventure-Inform7
```

That creates:

```text
~/Documents/if/OpenAdventure-Inform7/OpenAdventure-AuthorEdition.inform
~/Documents/if/OpenAdventure-Inform7/OpenAdventure-AuthorEdition.materials
```

Use this when you want an IDE workspace that can accumulate local Inform build
and index files without adding noise to the repository.

## What To Edit

Durable source files:

- `source/adventure.yaml`: rooms, objects, travel, vocabulary
- `source/ifid.txt`: canonical IFID used by Author Edition export
- `tools/generators/*.py`: generated Inform structure
- `OpenAdventure.ni`: project title and metadata
- `OpenAdventure_*.ni`: runtime behavior, presentation, help, scoring, systems

Generated files:

- `generated/*.ni`
- `OpenAdventure.inform/Source/OpenAdventure.generated.ni`
- `OpenAdventure-AuthorEdition.inform/Source/story.ni`
- `OpenAdventure-AuthorEdition.materials/Extensions/OpenAdventure/*.i7x`

Generated files may be useful to inspect in the IDE, but they should not be
the durable source for a change.

## Open in Inform 7

1. Export:

   ```bash
   python3 tools/sync_author_edition.py --export
   ```

2. Open:

   ```text
   OpenAdventure-AuthorEdition.inform
   ```

3. Confirm the project is set to Glulx. If needed, choose:

   ```text
   Glulx (large and multimedia projects: most capable)
   ```

4. Press Go.

For an external workspace, use `--destination` and open the generated
`.inform` project inside that directory.

## Make Changes

Use the source routing table:

| Change | Edit |
|---|---|
| room text, object data, travel data | `source/adventure.yaml` |
| generator output shape | `tools/generators/*.py` |
| gameplay behavior | `OpenAdventure_*.ni` |
| help, menus, ABOUT, INFO, VERSION | `OpenAdventure_Information.ni` |
| project metadata | `OpenAdventure.ni` |
| generated Author Edition file | move the change back to canonical source |

After editing canonical source, export again:

```bash
python3 tools/sync_author_edition.py --export
```

## Test Changes

For source changes:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
```

For behavior or output changes:

```bash
python3 tools/run_transcripts.py --execute --timeout 180
```

Check the Author Edition export:

```bash
python3 tools/sync_author_edition.py --diff
```

If you exported to an external workspace, compare that workspace with:

```bash
python3 tools/sync_author_edition.py --diff \
  --destination ~/Documents/if/OpenAdventure-Inform7
```

## Why Import Is Unsupported

The exported Author Edition combines generated data, transformed generated
data, and runtime modules. Importing the whole IDE project back into canonical
source would make it easy to overwrite generated data or lose runtime changes.

For now, move durable IDE discoveries back to the correct source file by hand,
export again, and test.
