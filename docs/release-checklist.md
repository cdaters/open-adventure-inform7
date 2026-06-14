# Release Checklist

Use this checklist for RC1 and later releases.

## Preflight

- Confirm the working tree contains only intended changes.
- Confirm `OpenAdventure_Information.ni` has the intended version label.
- Confirm README, release notes, known differences, and build/test docs are
  current.
- Confirm the release target is Glulx.
- Confirm Z8 is described as experimental unless memory work has changed.

## Build

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./build.sh --compile
```

Expected artifact:

```text
OpenAdventure.inform/Build/OpenAdventure.ulx
```

Artifact check:

```bash
file OpenAdventure.inform/Build/OpenAdventure.ulx
```

The artifact should be a Glulx story file.

## Verification

Run:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
python3 tools/run_transcripts.py --execute --mode upstream --timeout 90
python3 tools/run_transcripts.py --execute --timeout 90
```

Expected:

- Smoke tests pass.
- Upstream transcript subset passes.
- Full transcript manifest passes 15/15.
- No VM crashes.
- No transcript timeouts with the 90-second timeout.

## RC1 Package Contents

- `OpenAdventure.ulx`
- `README.md`
- `LICENSE`
- `docs/release-notes-rc1.md`
- `docs/known-differences.md`
- `docs/build-and-test.md`
- `docs/transcript-results.md`

## Beta Package Contents

- RC1 package contents.
- Checksums.
- Tester instructions.
- Updated known-differences report.
- External playtest notes or transcript summaries.

## 1.0 Package Contents

- Versioned `OpenAdventure.ulx`.
- Final release notes.
- Checksums.
- README, license, build/test docs, known differences.
- Optional Blorb and visual assets if produced.

## Tagging

Before tagging:

- Re-run the verification commands from a clean checkout or clean worktree.
- Record command results in the release notes.
- Generate artifact checksums.
- Confirm package contents match this checklist.

Suggested tag:

```text
rc1
```
