# Artifact Classification

Date: 2026-06-17

Milestone 12B classifies repository files by purpose so contributors can tell
what to edit, what to regenerate, and what to ignore.

## Classification Terms

| Class | Meaning |
|---|---|
| Canonical Source | Durable source or documentation edited by contributors. |
| Generated Artifact | Reproducible output from canonical source. May be tracked when useful for review or build reproducibility. |
| Author Workspace | Inform 7 IDE project files exported from canonical source. |
| Release Artifact | Compiled story files, Blorb packages, archives, and release staging output. |
| Legacy Artifact | Historical/reference material or older workflow residue kept for research or compatibility. |

## Top-Level Inventory

| Item | Class | Version control | Notes |
|---|---|---|---|
| `.git/` | Legacy Artifact | Local only | Git metadata, not part of the project content. |
| `.gitignore` | Canonical Source | Track | Defines ignored build, IDE, and release byproducts. |
| `.DS_Store` | Generated Artifact | Ignore | macOS metadata. Remove locally when convenient. |
| `LICENSE` | Canonical Source | Track | Repository license. |
| `README.md` | Canonical Source | Track | Public project entry point. |
| `PROJECT.md` | Canonical Source | Track | Current status summary. |
| `OpenAdventure.ni` | Canonical Source | Track | Main source wrapper and metadata. |
| `OpenAdventure_*.ni` | Canonical Source | Track | Hand-written runtime, gameplay, and presentation modules. |
| `source/` | Canonical Source | Track | `source/adventure.yaml` is source world data; `source/ifid.txt` is the canonical IFID. |
| `tools/` | Canonical Source | Track | Generators, build helpers, Author Edition export, transcript runner. Python caches are ignored. |
| `tests/` | Canonical Source | Track | Smoke tests and transcript fixtures. |
| `docs/` | Canonical Source | Track | Current docs plus historical milestone reports. |
| `generated/` | Generated Artifact | Track | Generated world files. Tracked to review generator output and support reproducible composition. |
| `OpenAdventure.inform/` | Generated Artifact | Track selected files | Command-line Inform build target. Source file is generated and tracked; `Build/` and `Index/` are ignored. |
| `OpenAdventure.materials/` | Legacy Artifact | Do not track unless repurposed | Empty local materials directory from older/current Inform conventions. Not required by current workflows. |
| `OpenAdventure-AuthorEdition.inform/` | Author Workspace | Ignore | Generated IDE project shell. Export on demand; do not track. |
| `OpenAdventure-AuthorEdition.materials/` | Author Workspace | Ignore | Generated project-local extensions and release output. Export/package on demand; do not track. |
| `build/` | Generated Artifact | Ignore | Build logs and transcript output. |
| `build.sh` | Canonical Source | Track | Generates and composes source, builds Glulx, optionally packages. |
| `test.sh` | Canonical Source | Track | Smoke-test entry point. |
| `references/` | Legacy Artifact | Track | Historical/reference implementations, imported test data, and upstream artifacts used for parity research. |

## Inform Project Bundles

### `OpenAdventure.inform`

Why it exists:

- command-line Inform project used by `build.sh`;
- hosts the composed source file consumed by `ni`;
- receives local Inform build and index output.

Current status:

- still required for build, smoke tests, transcript execution, and release
  artifact production;
- should remain in version control with only stable scaffolding and generated
  source tracked.

Track:

- `OpenAdventure.inform/Source/.gitkeep`
- `OpenAdventure.inform/Source/OpenAdventure.generated.ni`
- `OpenAdventure.inform/Materials/.gitkeep`

Ignore:

- `OpenAdventure.inform/Build/`
- `OpenAdventure.inform/Index/`
- `Metadata.iFiction`, `Release.blurb`, `manifest.plist`

### `OpenAdventure.materials`

Why it exists:

- legacy or local Inform materials placeholder.

Current status:

- not required by the current command-line build or Author Edition export;
- not currently tracked.

Recommendation:

- leave untracked and unused;
- do not add durable source here unless a future workflow explicitly adopts it.

### `OpenAdventure-AuthorEdition.inform`

Why it exists:

- generated Inform 7 IDE project shell;
- lets authors open and compile a modular project.

Current status:

- still required as a generated workspace for Author Edition verification;
- no longer required under version control.

Generated contents:

- `Source/story.ni`
- `Settings.plist`
- `uuid.txt`
- `Materials/.gitkeep`

`uuid.txt` is generated from canonical `source/ifid.txt`.

Ignore:

- the whole generated `OpenAdventure-AuthorEdition.inform/` workspace;
- `Build/`
- `Index/`
- `Metadata.iFiction`
- `Release.blurb`
- `manifest.plist`

### `OpenAdventure-AuthorEdition.materials`

Why it exists:

- sibling materials package where Inform 7 finds project-local extensions;
- contains generated modular `.i7x` files for the Author Edition.

Current status:

- still required for IDE and command-line Author Edition compilation;
- no longer required under version control.

Generated contents:

- `Extensions/OpenAdventure/*.i7x`
- `Release/source.txt`
- `.gitkeep`

Ignore:

- the whole generated `OpenAdventure-AuthorEdition.materials/` workspace;
- future compiled story files or packaged release output.

## Generated Output Policy

Generated files are not automatically removed from version control. Track them
when they serve one of these purposes:

- reviewing changes from `source/adventure.yaml` or generator code;
- making the command-line Inform project buildable from a checkout;
- keeping command-line build composition reviewable.

Do not make durable edits directly in generated files. Move the change to
canonical source and regenerate.

## Release Artifact Policy

Preferred release location:

1. GitHub Releases for published `OpenAdventure.ulx`, future
   `Adventure.gblorb`, archives, and checksums.
2. Local ignored `dist/` for staging packages before upload.
3. `docs/` for release notes, known differences, verification results, and
   packaging instructions.

Do not commit compiled story files such as:

- `*.ulx`
- `*.gblorb`
- `*.zblorb`
- `*.z8`

## Cleanup Recommendations

Milestone 12C removed the tracked Author Edition workspace after moving its
stable IFID into `source/ifid.txt` and making fresh-clone export, diff,
compile, and packaging workflows independent of checked-in Author Edition
artifacts.

Recommended hygiene:

- keep `generated/` and
  `OpenAdventure.inform/Source/OpenAdventure.generated.ni` tracked for
  reproducibility;
- keep `Build/`, `Index/`, `build/`, `dist/`, compiled story files, Python
  caches, `.DS_Store`, and generated Author Edition workspaces ignored;
- use `python3 tools/sync_author_edition.py --export --destination <dir>` for a
  disposable external IDE workspace;
- publish release binaries through GitHub Releases rather than committing them.

See `docs/fresh-clone-workflow.md` and `docs/release-workflow.md` for the
current end-to-end workflows.
