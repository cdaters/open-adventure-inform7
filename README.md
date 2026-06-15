# Open Adventure in Inform 7

Open Adventure in Inform 7 is a Glulx-targeted reconstruction of the
Crowther and Woods 430-point Adventure, built from the Open Adventure data set
and implemented with Inform 7 runtime subsystems.

The project keeps generated world content separate from hand-written gameplay
logic. Rooms, objects, travel rows, and vocabulary are generated from
`source/adventure.yaml`; behavior such as travel dispatch, dwarves, pirate
theft, scoring, reincarnation, cave closing, and the repository endgame lives in
the `OpenAdventure_*.ni` runtime modules.

## Status

Current release status: **Release Candidate for Glulx**.

As of 2026-06-14:

- Glulx compile and smoke tests pass with `OPENADVENTURE_INFORM_FORMAT=Inform6/32`.
- The transcript framework passes 15/15 suites with a 180-second timeout.
- The upstream-backed solve path, treasure-collection path, and complete
  endgame path all pass.
- Z-machine Z8 remains experimental and is not the release target because the
  generated Inform 6 output exceeds practical readable-memory limits.

See:

- `docs/current-state.md`
- `docs/release-readiness.md`
- `docs/parity-report.md`
- `docs/transcript-results.md`
- `docs/known-differences.md`

## Historical Lineage

Adventure began with William Crowther's cave exploration program and Don
Woods's later fantasy expansion. Open Adventure, maintained by Eric S. Raymond
and contributors, is the author-approved open-source release of Adventure 2.5
and is the behavioral authority for this project.

This repository also studies two major Inform predecessors:

- Graham Nelson's `Advent.inf`
- Chris Conley's Inform 7 Adventure port

Open Adventure C remains authoritative when behavior differs.

## Screenshots and Assets

No release screenshots are currently committed. The repository includes
upstream reference assets under `references/open-adventure-c/`, including the
Open Adventure SVG and lamp image, but the RC1 package is defined around the
playable Glulx story file, source, documentation, and transcript evidence.

## Build

Requirements:

- Inform 7 10.1.2 command-line tools from Inform.app
- Inform 6 compiler available through the Inform distribution
- Python 3
- A Glulx interpreter such as `glulxe` or `cheapglulxe`

Build the release target:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./build.sh --compile
```

The expected Glulx artifact is:

```text
OpenAdventure.inform/Build/OpenAdventure.ulx
```

Generate source only:

```bash
./build.sh --generate-only
```

Run the story:

```bash
glulxe OpenAdventure.inform/Build/OpenAdventure.ulx
```

## Inform 7 Author Edition

The release build remains generator-driven, but the repository also provides an
IDE-friendly prototype project:

```text
OpenAdventure-AuthorEdition.inform
```

Regenerate it with:

```bash
python3 tools/sync_author_edition.py --export
```

The Author Edition writes a lightweight Inform project entry point at
`OpenAdventure-AuthorEdition.inform/Source/story.ni`, a project
`Settings.plist` selecting Glulx for Inform 7 10.1.2, and modular
project-local extensions under
`OpenAdventure-AuthorEdition.materials/Extensions/OpenAdventure/`. It is
intended for opening in the Inform IDE and pressing Go, while preserving the
RC1 source hierarchy and transcript-tested command-line workflow.

Check whether the generated Author Edition is stale with:

```bash
python3 tools/sync_author_edition.py --diff
```

See:

- `docs/author-edition-design.md`
- `docs/author-edition-migration.md`
- `docs/author-edition-layout.md`

## Test

Run the Glulx smoke suite:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
```

Run all transcript suites:

```bash
python3 tools/run_transcripts.py --execute --timeout 180
```

Run only the upstream-backed walkthrough suites:

```bash
python3 tools/run_transcripts.py --execute --mode upstream --timeout 180
```

The transcript framework executes scripted routes and checks expected output
fragments for startup, travel, plover, troll, dwarves, pirate, scoring,
reincarnation, bear, dragon, cave closing, endgame, full solve, treasure
collection, and complete endgame coverage.

## Release Target

Primary target: **Glulx** (`.ulx`).

Glulx is the release target because the generated game and runtime fit the VM
comfortably and current parity verification passes there.

Z8 status: **experimental, non-release**. The corrected build pipeline can run
the Inform 6 stage, but the Z-machine target exceeds readable-memory limits.
The project keeps Z8 analysis documented for future optimization work, but RC1
should not ship as a Z-machine story.

See:

- `docs/vm-target-analysis.md`
- `docs/memory-analysis.md`
- `docs/build-status.md`

## Repository Structure

```text
OpenAdventure.ni                      main Inform 7 source wrapper
OpenAdventure_*.ni                    hand-written runtime subsystems
source/adventure.yaml                 source world data
generated/                            generated Inform 7 world files
OpenAdventure.inform/                 Inform project bundle and build output
OpenAdventure-AuthorEdition.inform/   generated IDE-friendly Inform project
OpenAdventure-AuthorEdition.materials/ generated Author Edition extension modules
tools/yaml2inform.py                  source generator entry point
tools/sync_author_edition.py          Author Edition export/diff tool
tools/make_author_edition.py          compatibility Author Edition exporter
tools/run_transcripts.py              transcript replay and verification
tests/smoke/                          smoke test scripts
tests/transcripts/                    transcript suite manifest
docs/                                 architecture, verification, release docs
references/open-adventure-c/          authoritative C reference
references/conley-inform7/            Inform 7 reference implementation
references/nelson-inform6/            Inform 6 reference implementation
```

Generated files should be regenerated through `./build.sh --generate-only` or
`./build.sh --compile`. Do not hand-edit generated Inform files unless the
generator contract itself is being changed.

## Documentation

Release and contributor entry points:

- `docs/release-notes-rc1.md`
- `docs/project-history.md`
- `docs/contributing.md`
- `docs/release-checklist.md`
- `docs/project-roadmap.md`

Architecture references:

- `docs/architecture/runtime-framework.md`
- `docs/architecture/travel-dispatch.md`
- `docs/architecture/source-hierarchy.md`
- `docs/architecture/*-system.md`

Verification references:

- `docs/build-and-test.md`
- `docs/testing-environment.md`
- `docs/parity-report.md`
- `docs/transcript-results.md`
- `docs/walkthrough.md`

## Acknowledgements

- Original Adventure: William Crowther and Don Woods
- Open Adventure: Eric S. Raymond and contributors
- Inform 6 lineage: Graham Nelson's `Advent.inf`
- Inform 7 lineage: Chris Conley's Inform 7 Adventure port
- Inform 7 implementation: Craig Daters and contributors

This repository is distributed under the BSD 2-Clause License. See `LICENSE`.
