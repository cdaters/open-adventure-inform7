# Getting Started

This guide is for new contributors and curious players who want to build or
run Open Adventure Inform 7 Edition from the repository.

## What You Need

- Inform 7 10.1.2
- Python 3
- A Glulx interpreter such as `glulxe` or `cheapglulxe`
- A shell that can run the repository scripts

On macOS, the scripts look for Inform at:

```text
/Applications/Inform.app/Contents
```

See `docs/build-and-test.md` for environment variable overrides if Inform is
installed somewhere else.

## Build the Game

From the repository root:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./build.sh --compile
```

The build should create:

```text
OpenAdventure.inform/Build/OpenAdventure.ulx
```

## Play the Game

Run the story with a Glulx interpreter:

```bash
glulxe OpenAdventure.inform/Build/OpenAdventure.ulx
```

In the game, type:

```text
HELP
```

for the interactive help menu.

## Run Tests

Run smoke tests:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
```

Run the transcript suite:

```bash
python3 tools/run_transcripts.py --execute --timeout 180
```

The expected result is 15/15 passing transcript cases.

## Open the Author Edition

Regenerate the IDE-friendly project:

```bash
python3 tools/sync_author_edition.py --export
```

Then open:

```text
OpenAdventure-AuthorEdition.inform
```

in Inform 7 10.1.2.

## Where To Make Changes

- World data: `source/adventure.yaml`
- Generated Inform structure: `tools/generators/*.py`
- Gameplay and presentation behavior: `OpenAdventure_*.ni`
- Project metadata: `OpenAdventure.ni`
- Author Edition output: regenerate, do not hand-edit as durable source

More detail:

- `docs/repository-layout.md`
- `docs/artifact-classification.md`
- `docs/developer-workflow.md`
- `docs/author-workflow.md`
- `docs/contributing.md`
