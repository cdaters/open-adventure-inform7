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

Preferred command:

```bash
python3 tools/sync_author_edition.py --export
```

Compatibility command:

```bash
python3 tools/make_author_edition.py
```

This regenerates `generated/*.ni` and writes:

```text
OpenAdventure-AuthorEdition.inform/Source/story.ni
OpenAdventure-AuthorEdition.inform/Settings.plist
OpenAdventure-AuthorEdition.materials/Extensions/OpenAdventure/*.i7x
```

To reuse existing generated files without rerunning the YAML generator:

```bash
python3 tools/sync_author_edition.py --export --no-generate
```

To check whether the Author Edition is stale:

```bash
python3 tools/sync_author_edition.py --diff
```

## Opening in Inform 7

Open:

```text
OpenAdventure-AuthorEdition.inform
```

Expected IDE behavior:

- Source pane opens `Source/story.ni`.
- Project settings select Glulx.
- Pressing Go compiles through Inform 7 10.1.2 using the project-local
  extension modules in `OpenAdventure-AuthorEdition.materials`.

If the IDE does not honor the project setting on a local installation, open
Settings and choose:

```text
Glulx (large and multimedia projects: most capable)
```

## Editing Guidance

Do not make durable changes directly in:

```text
OpenAdventure-AuthorEdition.inform/Source/story.ni
OpenAdventure-AuthorEdition.materials/Extensions/OpenAdventure/*.i7x
```

Those files are regenerated.

Instead:

- Edit `source/adventure.yaml` for world data.
- Edit `tools/generators/*.py` for generated source structure.
- Edit `OpenAdventure_*.ni` for gameplay behavior.
- Edit `OpenAdventure.ni` for project-level source text.
- Edit the future Author Layer for presentation, help, menus, hints, and
  parser polish that is not generated world data.

Then regenerate the Author Edition.

## Migration Path

Recommended migration stages:

1. Keep RC1 build/test workflow unchanged.
2. Generate Author Edition on demand for IDE authoring.
3. Add CI or smoke coverage that verifies `tools/make_author_edition.py`.
4. Add a managed Author Layer for menus, hints, help text, parser polish, and
   other author-owned presentation work.
5. Keep the Milestone 10E modular extension layout as the default Author
   Edition structure.
6. Revisit whether Author Edition artifacts should be committed after several
   development cycles.

## What Not To Migrate Yet

Do not convert the RC1 source hierarchy into a hand-authored monolithic
`story.ni` yet.

Reasons:

- It would risk divergence from Open Adventure C and `source/adventure.yaml`.
- It would weaken transcript parity reproducibility.
- It would make generated world updates harder to review.
- It would force a large architecture change after RC1 parity has stabilized.

Milestone 10E also showed that quoted local source includes such as
`Include "Rooms.ni".` do not compile in Inform 7 10.1.2. Use project-local
extensions for modular Author Edition source files.

## Long-Term Recommendation

Maintain both workflows:

- Generator-driven RC workflow for release verification.
- Regenerated Author Edition for IDE authoring.
- Managed Author Layer for future presentation work.

This gives Inform authors a practical editing surface while keeping the current
parity-tested architecture intact.

Do not implement full-file bidirectional synchronization. Import should be
considered only for explicitly marked Author Layer files or regions.
