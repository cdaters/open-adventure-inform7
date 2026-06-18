# Fresh Clone Workflow

Date: 2026-06-17

This workflow starts from a checkout with no generated Author Edition
workspace. It is the baseline contributor path after Author Edition
decoupling.

## Requirements

- Inform 7 10.1.2 command-line tools from Inform.app
- Inform 6 from the Inform distribution
- Python 3
- A Glulx interpreter such as `glulxe` or `cheapglulxe`
- Git

The documented macOS paths assume:

```text
/Applications/Inform.app/Contents
```

Use the environment variables in `docs/build-and-test.md` if Inform is
installed elsewhere.

## Clone

```bash
git clone <repository-url>
cd open-adventure-inform7
```

A fresh clone is expected not to contain:

```text
OpenAdventure-AuthorEdition.inform/
OpenAdventure-AuthorEdition.materials/
```

Those directories are generated on demand and ignored by Git.

## Build the Playable Game

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./build.sh --compile
```

Expected output:

```text
OpenAdventure.inform/Build/OpenAdventure.ulx
```

Run it with:

```bash
glulxe OpenAdventure.inform/Build/OpenAdventure.ulx
```

## Export the Author Edition

Default local export:

```bash
python3 tools/sync_author_edition.py --export
```

External IDE workspace export:

```bash
python3 tools/sync_author_edition.py --export \
  --destination ~/Documents/if/OpenAdventure-Inform7
```

The external command creates:

```text
~/Documents/if/OpenAdventure-Inform7/OpenAdventure-AuthorEdition.inform/
~/Documents/if/OpenAdventure-Inform7/OpenAdventure-AuthorEdition.materials/
```

Check generated output:

```bash
python3 tools/sync_author_edition.py --diff
```

`--diff` works even before the default Author Edition export exists. In that
case it generates a temporary export for comparison.

## Compile the Author Edition

Translate:

```bash
/Applications/Inform.app/Contents/MacOS/ni \
  -at /Applications/Inform.app/Contents/Resources \
  -project OpenAdventure-AuthorEdition.inform \
  -release -format=Inform6/32
```

Compile the Inform 6 intermediate to the path expected by `Release.blurb`:

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

Expected package output:

```text
OpenAdventure-AuthorEdition.materials/Release/Adventure.gblorb
```

## Test

Smoke tests:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
```

Transcript validation:

```bash
python3 tools/run_transcripts.py --execute --timeout 180
```

Expected result:

```text
15/15 transcript cases pass.
```

## What Should Remain Untracked

After the workflow, generated local output should remain ignored:

```text
OpenAdventure.inform/Build/
OpenAdventure-AuthorEdition.inform/
OpenAdventure-AuthorEdition.materials/
build/
dist/
*.ulx
*.gblorb
```

Canonical source remains in `source/`, `OpenAdventure*.ni`, `tools/`, `tests/`,
and `docs/`.
