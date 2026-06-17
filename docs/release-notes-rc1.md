# Release Notes - RC1

Date: 2026-06-17

RC1 is the first release-candidate package for Open Adventure in Inform 7.

## Release Classification

**Release candidate for Glulx**

This release candidate targets Glulx only. Z8 remains experimental and is not a
release artifact for RC1.

## Highlights

- Generated Inform 7 world model from `source/adventure.yaml`.
- Hand-written runtime subsystems for travel, hazards, scoring, cave closing,
  and endgame behavior.
- Player-facing startup, HELP, ABOUT, INFO, NEWS, credits, and version system.
- Interactive HELP menu with concise status titles and full page headings.
- Original historical background text for the help system.
- Author Edition export for Inform 7 IDE browsing and compilation.
- Verbose movement reporting parity for repeated-description regions.
- Complete Glulx smoke verification.
- Transcript parity verification for 15/15 suites.
- Passing upstream-backed full solve, treasure-collection, and endgame routes.

## Build Artifact

Expected RC1 artifact:

```text
OpenAdventure.inform/Build/OpenAdventure.ulx
```

Build command:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./build.sh --compile
```

## Verification

Milestone 9A verification was run with:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
python3 tools/run_transcripts.py --execute --timeout 180
```

Result:

- Smoke tests pass.
- Full transcript manifest passes 15/15.
- Upstream-backed manifest cases pass as part of the full run.
- Author Edition release translation and Inform 6 Glulx compilation pass.

## Known Limitations

- Z8 is not a release target because the generated game exceeds practical
  readable-memory limits.
- The transcript suite verifies major known routes, not every parser phrasing a
  player may try.
- Exact random behavior is controlled for transcript replay but should continue
  to receive manual playtest attention.
- No screenshots, cover art, or Blorb packaging are included in RC1.

## Recommended Package Contents

RC1 package:

- `OpenAdventure.ulx`
- `README.md`
- `LICENSE`
- `docs/release-notes-rc1.md`
- `docs/known-differences.md`
- `docs/build-and-test.md`
- `docs/transcript-results.md`

Beta package:

- RC1 package contents.
- Artifact checksums.
- Tester instructions.
- Updated known-differences report after external play.
- Optional transcript logs from external validation.

1.0 package:

- Versioned Glulx artifact.
- Final release notes.
- Checksums.
- README, license, build/test docs, known differences.
- Optional Blorb and visual assets if produced.

## Acknowledgements

- William Crowther and Don Woods for Adventure.
- Eric S. Raymond and Open Adventure contributors for the authoritative
  open-source C edition.
- Graham Nelson for `Advent.inf`.
- Chris Conley for the Inform 7 Adventure reference.
- Craig Daters and contributors for this Inform 7 implementation.
