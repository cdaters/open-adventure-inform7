# Developer Workflow

This document describes the normal repository workflow for contributors.

For a full map of source, generated output, author workspace files, release
artifacts, and legacy/reference material, see:

- `docs/repository-layout.md`
- `docs/artifact-classification.md`

## Clone

Clone the repository and enter it:

```bash
git clone <repository-url>
cd open-adventure-inform7
```

Install the local requirements listed in `docs/getting-started.md`.

## Generate Inform Source

Generated files come from `source/adventure.yaml`:

```bash
./build.sh --generate-only
```

This rewrites:

```text
generated/Rooms.ni
generated/Objects.ni
generated/Vocabulary.ni
generated/Travel.ni
OpenAdventure.inform/Source/OpenAdventure.generated.ni
```

The composed Inform project source is also rewritten during compile:

```text
OpenAdventure.inform/Source/OpenAdventure.generated.ni
```

These generated files are tracked for review and reproducibility, but they are
not durable source. Edit the YAML, generator code, or runtime modules instead.

The canonical IFID for Author Edition export and release packaging is
`source/ifid.txt`.

## Build

Build the Glulx release target:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./build.sh --compile
```

Expected artifact:

```text
OpenAdventure.inform/Build/OpenAdventure.ulx
```

## Test

Run smoke tests:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
```

Run the full transcript suite:

```bash
python3 tools/run_transcripts.py --execute --timeout 180
```

Run only upstream-backed walkthrough cases:

```bash
python3 tools/run_transcripts.py --execute --mode upstream --timeout 180
```

Use transcript output under `build/transcripts/` when diagnosing failures.

## Export the Author Edition

Export the IDE-friendly project:

```bash
python3 tools/sync_author_edition.py --export
```

Check whether the export is current:

```bash
python3 tools/sync_author_edition.py --diff
```

If the default generated workspace is absent, `--diff` uses a temporary export
so the command still works on a fresh clone. Use `--destination <dir>` with
`--diff` to check a specific exported workspace.

The export writes:

```text
OpenAdventure-AuthorEdition.inform/Source/story.ni
OpenAdventure-AuthorEdition.inform/Settings.plist
OpenAdventure-AuthorEdition.materials/Extensions/OpenAdventure/*.i7x
```

To export a disposable IDE workspace outside the repository:

```bash
python3 tools/sync_author_edition.py --export \
  --destination ~/Documents/if/OpenAdventure-Inform7
```

That writes `OpenAdventure-AuthorEdition.inform` and
`OpenAdventure-AuthorEdition.materials` inside the destination directory.
Durable changes still belong in canonical repository source, followed by a new
export.

## Verify the Author Edition

Translate the Author Edition project:

```bash
/Applications/Inform.app/Contents/MacOS/ni \
  -at /Applications/Inform.app/Contents/Resources \
  -project OpenAdventure-AuthorEdition.inform \
  -release -format=Inform6/32
```

Compile the generated Inform 6 output:

```bash
/Applications/Inform.app/Contents/MacOS/inform6 \
  -E2w~S~DG +/Applications/Inform.app/Contents/Resources/Internal/Inform6/Library \
  OpenAdventure-AuthorEdition.inform/Build/auto.inf \
  OpenAdventure-AuthorEdition.inform/Build/output.ulx
```

Package the Author Edition release:

```bash
/Applications/Inform.app/Contents/MacOS/cBlorb \
  -project OpenAdventure-AuthorEdition.inform
```

## Release Workflow

Before tagging a release candidate:

1. Confirm the working tree contains only intended changes.
2. Build the Glulx artifact.
3. Run smoke tests.
4. Run the full transcript suite.
5. Export and verify the Author Edition.
6. Confirm `OpenAdventure-AuthorEdition.inform/Release.blurb` has the IFID on
   one line.
7. Stage `OpenAdventure.ulx`, `README.md`, `LICENSE`, release notes, known
   differences, build/test docs, and transcript results in local `dist/`.
8. Record command results and artifact checksums.
9. Publish compiled artifacts through GitHub Releases.
10. Tag the release.

See `docs/release-workflow.md` and `docs/release-checklist.md` for release
steps.
