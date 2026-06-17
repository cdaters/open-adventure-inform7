# Documentation Review

Date: 2026-06-17

Milestone 12A reviewed the project documentation for current release status,
contributor usability, and stale roadmap language.

## Changes Made

- Rewrote `README.md` around the questions new readers ask first:
  what the project is, why it exists, how to play, how to build, how to test,
  and how to contribute.
- Reworked `PROJECT.md` into a current status summary instead of a long
  milestone table.
- Added `docs/getting-started.md` as the shortest path from checkout to a
  playable Glulx build.
- Added `docs/developer-workflow.md` covering clone, generation, build, test,
  Author Edition export, Author Edition release compilation, and release steps.
- Rewrote `docs/author-workflow.md` for Inform authors who want to open the
  Author Edition, make durable changes, export, and test.
- Updated release and verification docs to use the current `--timeout 180`
  transcript command.
- Updated Author Edition docs to reflect command-line release compilation and
  current export/diff workflow.
- Updated project history with RC1, Author Edition, menu integration, release
  packaging validation, `Release.blurb` IFID handling, and verbose reporting
  parity.

## Stale Content Removed or Reframed

- Removed completed documentation and Author Edition work from the active RC1
  roadmap.
- Removed obsolete "manual GUI confirmation" blocker language from current
  status docs.
- Replaced current-facing 90-second transcript commands with 180-second
  commands.
- Marked older milestone reports with historical notes where they contain
  superseded "Not Ready", "release blocker", or "remaining blocker" language.
- Clarified that old milestone reports are preserved as history, while
  `docs/current-state.md`, `docs/release-readiness.md`, and
  `docs/transcript-results.md` are the current status sources.

## Remaining Recommendations

- Add CI for generation, Glulx build, smoke tests, transcript replay, and
  Author Edition export/diff.
- Add release-package checksums once RC1 packaging is cut.
- Consider a short tester guide for beta playtesters after RC1.
- Add screenshots or cover art only if the release package needs them.
- Keep Z8 documentation as an experimental track unless a separate
  memory-reduction milestone is approved.
