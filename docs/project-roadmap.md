# Project Roadmap

Date: 2026-06-14

The project has reached Glulx Release Candidate readiness. The remaining work is
packaging, external validation, and optional post-RC optimization.

## RC1

Goal: publish a source-and-Glulx release candidate that a new player or
contributor can understand and verify.

Required:

- Finish release-facing README and project docs.
- Update in-game version text to identify the RC line.
- Build `OpenAdventure.ulx` with `OPENADVENTURE_INFORM_FORMAT=Inform6/32`.
- Run smoke tests.
- Run full transcript verification with `--timeout 90`.
- Include release notes, known differences, and verification evidence.
- Tag the release after final verification.

RC1 package contents:

- `OpenAdventure.ulx`
- `README.md`
- `LICENSE`
- `docs/release-notes-rc1.md`
- `docs/known-differences.md`
- `docs/build-and-test.md`
- `docs/transcript-results.md`

## Beta

Goal: broaden confidence beyond the scripted transcript suite.

Recommended:

- Collect external playtest transcripts.
- Add any missed transcript cases discovered during manual play.
- Add CI coverage for Glulx build and smoke tests.
- Decide whether package distribution should include a Blorb.
- Refresh known differences after playtest feedback.

Beta package contents:

- Everything in RC1.
- Checksums for release artifacts.
- A concise tester guide.
- Curated known-differences and feedback instructions.

## 1.0

Goal: publish a stable Glulx release.

Recommended:

- Require a clean build/test/transcript run from a fresh checkout.
- Include final release notes and checksums.
- Confirm license and attribution presentation in-game and in docs.
- Decide whether screenshots or cover assets are needed.
- Keep Z8 explicitly out of scope unless memory work succeeds before 1.0.

1.0 package contents:

- Versioned `OpenAdventure.ulx`.
- Release notes and checksums.
- README, license, known differences, build/test docs.
- Optional Blorb and visual assets if produced.

## Post-1.0

Potential future tracks:

- Z8 memory-reduction experiment.
- CI-hosted transcript verification.
- Broader parser parity tests.
- More exhaustive randomized movement and hazard replay.
- Packaged interpreter recommendations for non-technical players.

## Z8 Roadmap

Z8 remains experimental. Pursue only if the project explicitly accepts the
optimization cost.

Potential work:

- Reduce generated vocabulary and table footprint.
- Compress generated descriptions and travel metadata.
- Evaluate Inform memory-economy settings.
- Measure generated content, runtime code, and library contributions after each
  optimization.

Glulx remains the primary release target unless Z8 memory analysis changes.
