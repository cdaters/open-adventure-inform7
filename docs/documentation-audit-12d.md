# Documentation Audit 12D

Date: 2026-06-17

Milestone 12D reviewed documentation after Author Edition decoupling. The audit
assumed a fresh clone with no `OpenAdventure-AuthorEdition.inform/` or
`OpenAdventure-AuthorEdition.materials/` directories.

## Stale Content Found

- Several workflow documents still used the older Inform 6 library path
  `Resources/Library/6.11`.
- `docs/current-state.md` still described the Author Edition as a Milestone 10A
  prototype instead of the current generated-on-demand workspace.
- `docs/author-edition-migration.md` still treated committing Author Edition
  artifacts as a future decision.
- Release steps were split across README, developer workflow, build/test docs,
  and checklist docs, but there was no standalone release workflow.
- There was no single fresh-clone workflow that started from no Author Edition
  workspace.

## Updates Made

- Added `docs/fresh-clone-workflow.md`.
- Added `docs/release-workflow.md`.
- Updated README with release artifact locations and links to the new workflow
  docs.
- Updated `PROJECT.md` and `docs/current-state.md` to describe the Author
  Edition as ignored generated output.
- Updated `docs/project-history.md` with Milestones 12B through 12D.
- Updated `docs/author-edition-migration.md` to close the generated workspace
  version-control question.
- Updated Author Edition compile commands to use
  `Resources/Internal/Inform6/Library`.
- Confirmed `.gitignore` matches the documented workflow for build output,
  generated Author Edition workspaces, story files, Blorb files, and `dist/`.

## Verification Notes

The documented workflow gates were checked during the 12D pass:

```bash
python3 tools/sync_author_edition.py --export
python3 tools/sync_author_edition.py --diff
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
python3 tools/run_transcripts.py --execute --timeout 180
```

Results:

- Current checkout Author Edition export passed.
- Current checkout Author Edition diff passed.
- Fresh clone started with no Author Edition workspace directories.
- Fresh clone `--diff` passed without a default Author Edition export.
- Fresh clone external Author Edition export passed.
- Fresh clone `OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh` passed.
- Fresh clone external Author Edition translation, Inform 6 Glulx compilation,
  and cBlorb packaging passed.
- The story built by the fresh clone passed the 15-case transcript suite.

Documentation validation:

```bash
git diff --check
```

and local Markdown link validation against README, PROJECT, and `docs/` passed.

## Remaining Recommendations

- Add CI for generation, Glulx build, smoke tests, transcript replay, and
  Author Edition export/diff.
- Add an automated release packaging script only after the manual RC1 workflow
  has been used once.
- Add checksums to the final release package.
- Keep Z8 documented as experimental unless a dedicated memory-reduction
  milestone changes the VM target.
