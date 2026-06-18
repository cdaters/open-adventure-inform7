# Open Adventure Inform 7 Edition

Open Adventure Inform 7 Edition is a release-candidate Inform 7 port of the
classic 430-point Adventure lineage. It builds a playable Glulx story file from
Open Adventure's source data and a set of hand-written Inform 7 runtime
modules.

## What Is This?

This repository contains:

- a playable Glulx version of Adventure;
- generated Inform 7 rooms, objects, travel rules, and vocabulary from
  `source/adventure.yaml`;
- hand-written Inform 7 systems for gameplay behavior such as travel, dwarves,
  pirate theft, scoring, reincarnation, cave closing, the endgame, and help;
- an Author Edition that opens as a normal Inform 7 project.

Open Adventure C remains the behavior reference. Graham Nelson's `Advent.inf`
and Chris Conley's Inform 7 port are used as historical and Inform-specific
references when they help explain a design choice.

## Why Does It Exist?

The project has two goals:

1. Preserve Adventure behavior in a modern, testable Inform 7 implementation.
2. Give Inform authors and contributors a readable project structure instead of
   one large generated source file.

Generated world data and hand-written gameplay code are kept separate so changes
can be reviewed clearly and verified against transcript tests.

## Current Status

Release status: **Glulx release candidate**.

Current verification status:

- Glulx build target passes with `OPENADVENTURE_INFORM_FORMAT=Inform6/32`.
- Smoke tests pass.
- Transcript verification passes 15/15 with `--timeout 180`.
- Upstream-backed solve, treasure-collection, and complete-endgame routes pass.
- Author Edition export and command-line release compilation succeed.

Z8 is experimental and is not a release target. The current generated game
exceeds practical Z-machine memory limits.

## How Do I Play It?

Build the Glulx story file:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./build.sh --compile
```

Run it with a Glulx interpreter such as `glulxe`:

```bash
glulxe OpenAdventure.inform/Build/OpenAdventure.ulx
```

Inside the game, type `HELP` for the interactive help menu. `ABOUT`, `INFO`,
`NEWS`, and `VERSION` are also available.

## How Do I Build It?

Requirements:

- Inform 7 10.1.2 command-line tools from Inform.app
- Inform 6 from the Inform distribution
- Python 3
- A Glulx interpreter such as `glulxe` or `cheapglulxe`

Generate source only:

```bash
./build.sh --generate-only
```

Build the release target:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./build.sh --compile
```

Expected artifact:

```text
OpenAdventure.inform/Build/OpenAdventure.ulx
```

## How Do I Test It?

Run smoke tests:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
```

Run the full transcript suite:

```bash
python3 tools/run_transcripts.py --execute --timeout 180
```

Run only the upstream-backed walkthrough cases:

```bash
python3 tools/run_transcripts.py --execute --mode upstream --timeout 180
```

Transcript output is written under `build/transcripts/`.

## Author Edition

The Author Edition is the IDE-friendly Inform 7 project generated from
canonical source:

```text
OpenAdventure-AuthorEdition.inform
```

Regenerate it from canonical source:

```bash
python3 tools/sync_author_edition.py --export
```

Export a separate local IDE workspace:

```bash
python3 tools/sync_author_edition.py --export \
  --destination ~/Documents/if/OpenAdventure-Inform7
```

Check whether it is current:

```bash
python3 tools/sync_author_edition.py --diff
```

Open `OpenAdventure-AuthorEdition.inform` in Inform 7 10.1.2 to browse and
compile the modular project. The default export is ignored local output; use
`--destination` for a separate IDE workspace. Durable edits should be made in
canonical source files, then exported again.

See `docs/repository-layout.md` and `docs/artifact-classification.md` for the
source/generated/workspace/release artifact split.

## How Do I Contribute?

Start here:

- `docs/getting-started.md`
- `docs/developer-workflow.md`
- `docs/author-workflow.md`
- `docs/contributing.md`

Use this source hierarchy when deciding where to edit:

- `source/adventure.yaml`: rooms, objects, travel data, vocabulary
- `source/ifid.txt`: canonical IFID
- `tools/generators/*.py`: generated Inform source structure
- `OpenAdventure_*.ni`: gameplay and presentation behavior
- `OpenAdventure.ni`: project metadata
- `generated/*.ni`: generated output, not durable source
- `OpenAdventure-AuthorEdition.*`: generated Author Edition output

Before proposing source or gameplay changes, run the smoke tests and the
relevant transcript tests. Include command results in the change description.

## Repository Map

```text
OpenAdventure.ni                      main Inform 7 source wrapper
OpenAdventure_*.ni                    hand-written runtime modules
source/adventure.yaml                 source world data
generated/                            generated Inform 7 world files
OpenAdventure.inform/                 command-line Inform project
OpenAdventure-AuthorEdition.inform/   generated local IDE project, ignored
OpenAdventure-AuthorEdition.materials/ generated local extensions/release output, ignored
tools/                                generators, build helpers, transcript runner
tests/smoke/                          smoke tests
tests/transcripts/                    transcript manifest and expectations
docs/                                 player, contributor, architecture, release docs
references/open-adventure-c/          authoritative C reference
references/nelson-inform6/            Inform 6 reference
references/conley-inform7/            Inform 7 reference
```

## Documentation

Useful entry points:

- `docs/current-state.md`
- `docs/repository-layout.md`
- `docs/artifact-classification.md`
- `docs/project-history.md`
- `docs/build-and-test.md`
- `docs/release-checklist.md`
- `docs/release-notes-rc1.md`
- `docs/known-differences.md`
- `docs/transcript-results.md`

Many milestone analysis reports are preserved for historical context. The
current status documents above supersede older "not ready" or "remaining
blocker" language in those reports.

## Acknowledgements

- Original Adventure: William Crowther and Don Woods
- Open Adventure: Eric S. Raymond and contributors
- Inform 6 lineage: Graham Nelson's `Advent.inf`
- Inform 7 lineage: Chris Conley's Inform 7 Adventure port
- Inform 7 implementation: Craig Daters and contributors

This repository is distributed under the BSD 2-Clause License. See `LICENSE`.
