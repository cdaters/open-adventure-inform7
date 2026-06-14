# Testing Environment

Date: 2026-06-14

## Local Toolchain

The local development environment uses the macOS Inform.app bundle:

- `/Applications/Inform.app/Contents/MacOS/Inform`
- `/Applications/Inform.app/Contents/MacOS/ni`
- `/Applications/Inform.app/Contents/MacOS/inform6`
- `/Applications/Inform.app/Contents/MacOS/cBlorb`
- `/Applications/Inform.app/Contents/MacOS/intest`
- `/Applications/Inform.app/Contents/MacOS/glulxe-client`

The repository scripts search standard locations and can be configured with
environment variable overrides documented in `docs/build-and-test.md`.

## Release Verification

Use Glulx for release verification:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
python3 tools/run_transcripts.py --execute --mode upstream --timeout 90
python3 tools/run_transcripts.py --execute --timeout 90
```

Current expected result:

- Smoke suite passes.
- Upstream transcript subset passes.
- Full transcript manifest passes 15/15.

## Transcript Framework

The transcript runner is:

```text
tools/run_transcripts.py
```

The manifest is:

```text
tests/transcripts/manifest.tsv
```

Transcript outputs are written to:

```text
build/transcripts/
```

The runner supports deterministic replay helpers used by the current transcript
suite. A 90-second timeout is recommended for full upstream-style routes.

## Interpreters

Glulx is the release VM target. Use `glulxe`, `cheapglulxe`, or the Inform.app
Glulx client to run `OpenAdventure.ulx`.

`dfrotz` may be installed locally for Z-machine experiments, but Z8 is not part
of the current release verification path.
