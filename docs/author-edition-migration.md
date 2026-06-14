# Author Edition Migration

Date: 2026-06-14

## Recommended Workflow

Use the Author Edition as a generated IDE project.

Durable source remains:

- `source/adventure.yaml`
- `tools/yaml2inform.py`
- `tools/generators/*.py`
- `OpenAdventure.ni`
- `OpenAdventure_*.ni`

Generated author project:

```text
OpenAdventure-AuthorEdition.inform/
```

## Regenerating the Author Edition

Run:

```bash
python3 tools/make_author_edition.py
```

This regenerates `generated/*.ni` and writes:

```text
OpenAdventure-AuthorEdition.inform/Source/story.ni
OpenAdventure-AuthorEdition.inform/Settings.plist
```

To reuse existing generated files without rerunning the YAML generator:

```bash
python3 tools/make_author_edition.py --no-generate
```

## Opening in Inform 7

Open:

```text
OpenAdventure-AuthorEdition.inform
```

Expected IDE behavior:

- Source pane opens `Source/story.ni`.
- Project settings select Glulx.
- Pressing Go compiles through Inform 7 10.1.2.

If the IDE does not honor the project setting on a local installation, open
Settings and choose:

```text
Glulx (large and multimedia projects: most capable)
```

## Editing Guidance

Do not make durable changes directly in:

```text
OpenAdventure-AuthorEdition.inform/Source/story.ni
```

That file is regenerated.

Instead:

- Edit `source/adventure.yaml` for world data.
- Edit `tools/generators/*.py` for generated source structure.
- Edit `OpenAdventure_*.ni` for gameplay behavior.
- Edit `OpenAdventure.ni` for project-level source text.

Then regenerate the Author Edition.

## Migration Path

Recommended migration stages:

1. Keep RC1 build/test workflow unchanged.
2. Generate Author Edition on demand for IDE authoring.
3. Add CI or smoke coverage that verifies `tools/make_author_edition.py`.
4. If future authors need more IDE ergonomics, split generated `story.ni` into
   Inform extensions or chaptered source files while preserving the generator as
   the source of truth.
5. Revisit whether Author Edition artifacts should be committed after several
   development cycles.

## What Not To Migrate Yet

Do not convert the RC1 source hierarchy into a hand-authored monolithic
`story.ni` yet.

Reasons:

- It would risk divergence from Open Adventure C and `source/adventure.yaml`.
- It would weaken transcript parity reproducibility.
- It would make generated world updates harder to review.
- It would force a large architecture change after RC1 parity has stabilized.

## Long-Term Recommendation

Maintain both workflows:

- Generator-driven RC workflow for release verification.
- Regenerated Author Edition for IDE authoring and future presentation work.

This gives Inform authors a practical editing surface while keeping the current
parity-tested architecture intact.
