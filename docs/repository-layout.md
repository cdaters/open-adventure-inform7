# Repository Layout

Date: 2026-06-17

This repository has two supported working views:

- the canonical repository, used for source changes, builds, tests, and
  release verification;
- the Author Edition workspace, generated for Inform 7 IDE use.

The Author Edition is useful for browsing and compiling the project in Inform,
but the repository source remains authoritative.

## Canonical Repository

Use this tree for durable source changes:

```text
source/                         source world data from Open Adventure
source/ifid.txt                  canonical IFID used by Author Edition export
generated/                      generated Inform world files, tracked for review
OpenAdventure.ni                main source wrapper and project metadata
OpenAdventure_*.ni              hand-written runtime and presentation modules
tools/                          generators, Author Edition export, transcripts
tests/                          smoke tests and transcript fixtures
docs/                           current docs and historical milestone reports
references/                     imported historical/reference implementations
OpenAdventure.inform/           command-line Inform build target
```

The normal build path is:

```text
source/adventure.yaml
  -> tools/yaml2inform.py
  -> generated/*.ni
  -> build.sh source composition
  -> OpenAdventure.inform/Source/OpenAdventure.generated.ni
  -> OpenAdventure.inform/Build/OpenAdventure.ulx
```

`generated/*.ni` and
`OpenAdventure.inform/Source/OpenAdventure.generated.ni` are generated files.
They are tracked because they make generated changes reviewable and make the
Inform build target reproducible, but they are not durable editing targets.

## Author Edition Workspace

The Author Edition is generated on demand. It is no longer required to exist in
the repository checkout.

Regenerate it with:

```bash
python3 tools/sync_author_edition.py --export
```

For a separate local IDE workspace, export to a destination directory:

```bash
python3 tools/sync_author_edition.py --export \
  --destination ~/Documents/if/OpenAdventure-Inform7
```

When `--destination` names a directory, the exporter writes:

```text
~/Documents/if/OpenAdventure-Inform7/
  OpenAdventure-AuthorEdition.inform/
  OpenAdventure-AuthorEdition.materials/
```

When `--destination` or `--project` names a path ending in `.inform`, that path
is used as the project bundle and the sibling `.materials` package is derived
from it.

The default command still writes an ignored local workspace at the repository
root:

```text
OpenAdventure-AuthorEdition.inform/
OpenAdventure-AuthorEdition.materials/
```

Those directories are generated output. They should not be committed.

`python3 tools/sync_author_edition.py --diff` works without those directories:
when the default export is absent, it checks a temporary generated export.

Durable changes discovered while working in the IDE should be moved back to:

- `source/adventure.yaml`
- `tools/generators/*.py`
- `OpenAdventure.ni`
- `OpenAdventure_*.ni`

Then export again.

## Build Output

Build output is local and ignored:

```text
OpenAdventure.inform/Build/
OpenAdventure.inform/Index/
OpenAdventure-AuthorEdition.inform/Build/
OpenAdventure-AuthorEdition.inform/Index/
OpenAdventure-AuthorEdition.materials/Release/
build/
```

The primary release build artifact is:

```text
OpenAdventure.inform/Build/OpenAdventure.ulx
```

This file should be produced by the release build, not committed to the
repository.

## Release Output

Preferred release distribution:

- publish `OpenAdventure.ulx` and any future `Adventure.gblorb` through GitHub
  Releases;
- use local `dist/` only as an ignored staging directory;
- keep release notes, build instructions, known differences, and verification
  evidence in `docs/`.

The repository should not track compiled story files or packaged release
archives unless a future release policy explicitly creates a small, documented
exception.

## Legacy and Reference Material

`references/` contains imported source, transcripts, and build outputs from
older or related Adventure implementations. These files are not built as part
of the Inform 7 edition, but they remain useful for parity research and project
history.

`OpenAdventure.materials/` may appear as an empty local directory from older
Inform workflows. It is not required by the current build or Author Edition
export path and should not be used for durable source.
