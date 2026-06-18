# Open Adventure Inform 7 Edition Project Status

This project reconstructs Open Adventure in Inform 7 with generated world data
and hand-written runtime systems.

Source of truth:

1. Open Adventure C is authoritative for gameplay behavior.
2. `source/adventure.yaml` is authoritative for generated world data.
3. `source/ifid.txt` is authoritative for release identity.
4. Generated Inform files are build artifacts.
5. `OpenAdventure_*.ni` files implement runtime behavior.

## Current Status

Release classification: **Glulx release candidate**.

Current measured state:

- Glulx build target passes compile and smoke verification.
- Transcript execution passes 15/15 suites with `--timeout 180`.
- Complete solve, treasure collection, and endgame transcript routes pass.
- Author Edition export and command-line release compilation succeed.
- Author Edition workspace files are generated on demand and are not tracked.
- Z8 remains experimental and is not a release target because of memory limits.

Primary release artifact:

```text
OpenAdventure.inform/Build/OpenAdventure.ulx
```

## Milestone Progress

Completed work:

- Source data extraction and generated Inform world model.
- Runtime framework, travel dispatch, and condition handling.
- Plover, troll, dwarf, pirate, scoring, reincarnation, bear, dragon, cave
  closing, and endgame systems.
- Information system with startup text, HELP, ABOUT, INFO, NEWS, credits, and
  version behavior.
- Transcript framework and Glulx artifact validation.
- Full transcript parity for the 15-case manifest.
- Release packaging documentation and RC1 release notes.
- Author Edition export with modular project-local extensions.
- Player-facing parser and presentation polish.
- Interactive help menu integration and historical background content.
- Author Edition `Release.blurb` IFID normalization.
- Verbose movement reporting parity for repeated-description regions.
- Repository layout and artifact classification documentation.
- Author Edition decoupling from tracked generated workspace files.
- Fresh-clone and release workflow documentation.

The detailed milestone history is preserved in `docs/project-history.md`.

## Build and Test Commands

Build the Glulx target:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./build.sh --compile
```

Run smoke tests:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
```

Run transcript verification:

```bash
python3 tools/run_transcripts.py --execute --timeout 180
```

Run upstream walkthrough verification:

```bash
python3 tools/run_transcripts.py --execute --mode upstream --timeout 180
```

## Author Edition

The Author Edition is generated for Inform 7 IDE use:

```text
OpenAdventure-AuthorEdition.inform
```

Regenerate it with:

```bash
python3 tools/sync_author_edition.py --export
```

Check whether it matches canonical source:

```bash
python3 tools/sync_author_edition.py --diff
```

The Author Edition emits `Source/story.ni`, Glulx project settings, and
project-local extensions under:

```text
OpenAdventure-AuthorEdition.materials/Extensions/OpenAdventure/
```

These files are generated output. Durable edits should be made in
`source/adventure.yaml`, `tools/generators/*.py`, `OpenAdventure.ni`, or
`OpenAdventure_*.ni`, then exported again.

## Repository Layout

Source, generated output, Author Edition workspace files, release artifacts, and
legacy/reference material are classified in:

- `docs/repository-layout.md`
- `docs/artifact-classification.md`
- `docs/fresh-clone-workflow.md`
- `docs/release-workflow.md`

The Author Edition is generated on demand and no longer needs to be tracked in
the repository. A disposable external IDE workspace can be generated with:

```bash
python3 tools/sync_author_edition.py --export \
  --destination ~/Documents/if/OpenAdventure-Inform7
```

## Release Packaging

RC1 should ship as a Glulx release containing:

- `OpenAdventure.ulx`
- `README.md`
- `LICENSE`
- `docs/release-notes-rc1.md`
- `docs/known-differences.md`
- `docs/build-and-test.md`
- `docs/transcript-results.md`

Compiled story files should be staged locally under ignored `dist/` when
needed and published through GitHub Releases rather than committed.

The full repository remains the contributor package.

## Current Next Work

Release-preparation work:

- Re-run final verification from a clean checkout before tagging.
- Package the Glulx artifact with release notes and verification evidence.
- Tag RC1 with build and transcript evidence.

Future work:

- Broader external playtesting.
- CI automation for generation, Glulx build, smoke tests, and transcripts.
- Optional Blorb, screenshots, cover art, and checksums for later packages.
- Z8 memory optimization only if a separate Z-machine goal is approved.

Roadmap details are in `docs/project-roadmap.md`.
