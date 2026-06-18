# Release Workflow

Date: 2026-06-17

This workflow describes how to prepare a Glulx release candidate from a clean
checkout. The release package is built from canonical source and generated
artifacts; compiled story files are not committed.

## Preflight

Confirm:

- the working tree contains only intended changes;
- `OpenAdventure.ni` and `OpenAdventure_Information.ni` have the intended
  release text;
- `source/ifid.txt` contains the intended release IFID;
- README, release notes, known differences, and build/test docs are current;
- the release target is Glulx.

## Build

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./build.sh --compile
```

Expected playable artifact:

```text
OpenAdventure.inform/Build/OpenAdventure.ulx
```

Validate the file type:

```bash
file OpenAdventure.inform/Build/OpenAdventure.ulx
```

## Test

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
python3 tools/run_transcripts.py --execute --mode upstream --timeout 180
python3 tools/run_transcripts.py --execute --timeout 180
```

Expected result:

- smoke tests pass;
- upstream transcript subset passes 3/3;
- full transcript manifest passes 15/15;
- no interpreter timeouts or VM crashes occur.

## Export and Verify the Author Edition

```bash
python3 tools/sync_author_edition.py --export
python3 tools/sync_author_edition.py --diff
```

Translate:

```bash
/Applications/Inform.app/Contents/MacOS/ni \
  -at /Applications/Inform.app/Contents/Resources \
  -project OpenAdventure-AuthorEdition.inform \
  -release -format=Inform6/32
```

Compile:

```bash
/Applications/Inform.app/Contents/MacOS/inform6 \
  -E2w~S~DG +/Applications/Inform.app/Contents/Resources/Internal/Inform6/Library \
  OpenAdventure-AuthorEdition.inform/Build/auto.inf \
  OpenAdventure-AuthorEdition.inform/Build/output.ulx
```

Package:

```bash
/Applications/Inform.app/Contents/MacOS/cBlorb \
  -project OpenAdventure-AuthorEdition.inform
```

Confirm:

- `OpenAdventure-AuthorEdition.inform/Release.blurb` contains the IFID on one
  line;
- `OpenAdventure-AuthorEdition.materials/Release/Adventure.gblorb` exists;
- the generated Author Edition directories remain ignored local output.

## Stage Release Files

Use ignored `dist/` for local staging:

```bash
mkdir -p dist/rc1
cp OpenAdventure.inform/Build/OpenAdventure.ulx dist/rc1/
cp README.md LICENSE dist/rc1/
cp docs/release-notes-rc1.md docs/known-differences.md dist/rc1/
cp docs/build-and-test.md docs/transcript-results.md dist/rc1/
```

Generate checksums:

```bash
shasum -a 256 dist/rc1/* > dist/rc1/SHA256SUMS
```

`dist/` is ignored. Do not commit staged binaries or archives.

## Publish

Publish compiled artifacts, checksums, and release notes through GitHub
Releases. The repository itself remains the source package for contributors.

Before tagging:

1. Re-run the verification commands from a clean checkout or clean worktree.
2. Record command results and checksums.
3. Confirm package contents match `docs/release-checklist.md`.
4. Tag the release candidate.
