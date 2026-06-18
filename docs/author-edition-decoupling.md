# Author Edition Decoupling

Date: 2026-06-17

Milestone 12C removes the remaining requirement that generated Author Edition
artifacts already exist in the repository checkout.

## Old Architecture

The repository previously tracked:

```text
OpenAdventure-AuthorEdition.inform/
OpenAdventure-AuthorEdition.materials/
```

Those files served three purposes:

- gave Inform authors an IDE project immediately after checkout;
- provided generated extension modules for command-line Author Edition compile
  verification;
- preserved `uuid.txt`, which supplied the IFID used in generated
  `Release.blurb`.

That made the workflow easy to inspect, but it also meant the repository had a
second generated project tree under version control. A fresh clone without
those tracked files exposed two hidden dependencies:

- the IFID lived in generated output instead of canonical source;
- release packaging expected `Build/output.ulx`, while the documented compile
  command wrote a differently named story file.

## New Architecture

Canonical source now includes:

```text
source/ifid.txt
```

The Author Edition exporter reads that file and writes:

```text
OpenAdventure-AuthorEdition.inform/uuid.txt
```

The Author Edition itself is generated on demand:

```bash
python3 tools/sync_author_edition.py --export
```

or into an external workspace:

```bash
python3 tools/sync_author_edition.py --export \
  --destination ~/Documents/if/OpenAdventure-Inform7
```

Default `--diff` no longer requires a checked-in Author Edition tree. If the
default export is absent, it generates a temporary Author Edition and compares
that export against the expected output. `--diff --destination <dir>` still
checks a concrete workspace when one is supplied.

Author Edition release compilation now writes the story file expected by
`Release.blurb` and `cBlorb`:

```bash
/Applications/Inform.app/Contents/MacOS/inform6 \
  -E2w~S~DG +/Applications/Inform.app/Contents/Resources/Internal/Inform6/Library \
  OpenAdventure-AuthorEdition.inform/Build/auto.inf \
  OpenAdventure-AuthorEdition.inform/Build/output.ulx
```

Packaging then runs:

```bash
/Applications/Inform.app/Contents/MacOS/cBlorb \
  -project OpenAdventure-AuthorEdition.inform
```

## Migration Rationale

The generated Author Edition is still important, but it no longer needs to be
tracked:

- canonical source is complete without it;
- export is deterministic from repository source;
- `uuid.txt` is regenerated from `source/ifid.txt`;
- release packaging can be run from a fresh generated workspace;
- default `--diff` works on a fresh clone.

This keeps the repository smaller and makes the source/generated boundary
clearer for contributors.

## Migration Outcome

After verification, remove from version control:

```text
OpenAdventure-AuthorEdition.inform/
OpenAdventure-AuthorEdition.materials/
```

The directories remain ignored so local exports, IDE indexes, build products,
and release packages do not appear as untracked repository changes.

Fresh-clone verification must prove that a checkout can:

1. export the Author Edition into any destination;
2. translate it with Inform 7;
3. compile it with Inform 6 to `Build/output.ulx`;
4. package it with `cBlorb`;
5. run smoke tests;
6. pass transcript verification.
