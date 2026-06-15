# Author Workflow

Date: 2026-06-14

Milestone 10D defines the long-term workflow for maintaining Open Adventure as
both a parity-verified port and a practical Inform 7 author project.

## Recommendation

Use a **canonical repository plus managed Author Layer**.

The repository remains canonical. The Author Edition remains an IDE-friendly
export generated from canonical source plus optional author-owned layer files.
Do not build a full bidirectional round-trip system for composed `story.ni`.

## Canonical Source

These files are durable source:

- `source/adventure.yaml`: canonical world-model data.
- `tools/yaml2inform.py` and `tools/generators/*.py`: canonical generation
  logic.
- `OpenAdventure.ni`: project-level Inform source and metadata.
- `OpenAdventure_*.ni`: canonical runtime implementation modules.
- Future Author Layer files, if added under a dedicated author-owned location.

These files are generated artifacts:

- `generated/*.ni`
- `OpenAdventure.inform/Source/OpenAdventure.generated.ni`
- `OpenAdventure-AuthorEdition.inform/Source/story.ni`
- `OpenAdventure-AuthorEdition.materials/Extensions/OpenAdventure/*.i7x`

Authors should not make durable edits directly in generated files.

## Architecture Options

### Option A: Export-Only Author Edition

The original `tools/make_author_edition.py` model exported a complete
monolithic `story.ni` for IDE use. Milestone 10E keeps the export-only
principle but changes the shape to a lightweight `story.ni` plus project-local
extension modules.

Benefits:

- Simple and reproducible.
- Preserves RC1 parity workflow.
- No import ambiguity.

Costs:

- Edits made in the IDE project are disposable unless manually moved back.
- No structured place exists for future author-only enhancements.

### Option B: Full Bidirectional Synchronization

This would try to import edits from the composed Author Edition back into the
canonical repository.

Benefits:

- Attractive in theory for IDE-first authors.

Costs:

- Fragile because `story.ni` is a concatenation of generated data, transformed
  generated data, and runtime modules.
- High risk of generated-content edits diverging from `adventure.yaml`.
- Hard to distinguish intentional author edits from regenerated output churn.
- Difficult to review safely.

This option is not recommended.

### Option C: Canonical Repository Plus Managed Author Layer

The repository keeps its existing canonical sources, exports modular
project-local extensions for IDE use, and adds a clearly bounded author-owned
layer for future presentation and extension work.

Benefits:

- Preserves parity workflow and source hierarchy.
- Gives authors a stable place for menus, hints, parser polish, and
  presentation experiments.
- Allows export and diff tooling without pretending the whole composed story is
  safely importable.
- Keeps generated content disposable.

Costs:

- Authors must move durable edits into canonical files or Author Layer files.
- The IDE project is still regenerated rather than edited as the source of
  truth.

This is the preferred architecture.

## Workflow

Export the Author Edition:

```bash
python3 tools/sync_author_edition.py --export
```

Compare the current Author Edition against canonical source:

```bash
python3 tools/sync_author_edition.py --diff
```

Reuse existing generated files when the YAML generator should not run:

```bash
python3 tools/sync_author_edition.py --diff --no-generate
python3 tools/sync_author_edition.py --export --no-generate
```

`--diff` exits with status `0` when the Author Edition matches canonical source
and `1` when it differs.

Full-file import is intentionally unsupported:

```bash
python3 tools/sync_author_edition.py --import
```

The command explains why import is unsafe for the exported Author Edition
source tree.

Milestone 10E changed what `--diff` compares. It now checks the lightweight
entry point, project settings, and every exported module under:

```text
OpenAdventure-AuthorEdition.materials/Extensions/OpenAdventure/
```

The exported modules preserve subsystem boundaries for navigation, but they are
still regenerated artifacts.

## Editing Rules

Use this routing:

| Change Type | Edit Here |
|---|---|
| room, object, travel, vocabulary data | `source/adventure.yaml` |
| generated Inform structure | `tools/generators/*.py` |
| generated-source composition | `build.sh`, `tools/make_author_edition.py`, `tools/sync_author_edition.py` |
| gameplay parity behavior | `OpenAdventure_*.ni` |
| project title and source metadata | `OpenAdventure.ni` |
| future author-only presentation work | Author Layer |
| Author Edition IDE output | inspect in IDE; move durable edits back to canonical source; regenerate |

## Verification

After source or Author Layer changes:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
python3 tools/run_transcripts.py --execute --timeout 180
python3 tools/sync_author_edition.py --diff
```

If `--diff` reports differences, run:

```bash
python3 tools/sync_author_edition.py --export
```

Then rerun `--diff`.

## Import Policy

Do not import the exported Author Edition source tree back into the repository.

Future import may be reasonable only for explicitly marked Author Layer regions
or separate author-owned source files. Such import should be:

- layer-specific;
- diff-first;
- reviewable;
- unable to alter generated world data;
- unable to overwrite runtime parity modules without explicit human action.

Until that exists, author changes made in the IDE should be manually moved into
their canonical files and verified with the normal release gates.
