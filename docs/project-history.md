# Project History

Open Adventure in Inform 7 is a reconstruction of the 430-point Adventure line
with Open Adventure C as the behavioral authority.

## Historical Lineage

Adventure began in the meeting point between real cave exploration and early
networked computing.  Mammoth Cave's history, Stephen Bishop's mapping, and
later exploration of the Flint Ridge and Bedquilt regions supplied much of the
language and atmosphere that Will Crowther drew on for his 1976 cave program.

Don Woods found Crowther's program, contacted him, and expanded it into the
treasure-scored, puzzle-rich Adventure that became a landmark of interactive
fiction.  Eric S. Raymond's Open Adventure is the author-approved open-source
release of Adventure 2.5 and provides the reference implementation and
regression material used by this project.

The resulting project lineage is:

```text
Adventure
-> Open Adventure
-> Open Adventure Inform 7 Edition
```

This repository also draws on two Inform lineage references:

- Graham Nelson's `Advent.inf`
- Chris Conley's Inform 7 Adventure port

When references disagree, Open Adventure C is authoritative.

## Major Milestones

Early milestones established the generated world model:

- Extracted and normalized `source/adventure.yaml`.
- Generated Inform 7 rooms, objects, vocabulary, and travel rows.
- Classified unresolved travel and gameplay-specific behavior.

Runtime milestones added dedicated gameplay systems:

- Travel dispatch and condition handling.
- Plover and troll travel behavior.
- Dwarves and pirate behavior.
- Treasure tracking and scoring.
- Reincarnation and death penalties.
- Bear and dragon puzzles.
- Cave closing and repository transition.
- Endgame blast outcomes and ranking.
- Player-facing information commands.
- Menu-driven HELP presentation adapted from Emily Short's menu model and
  Graham Nelson's `Advent.inf` experience.
- Help content refinement with compact menu status titles, full topic page
  headings, and an original historical overview.

Verification milestones corrected the build and parity process:

- Fixed the build pipeline so story artifacts are real VM files.
- Selected Glulx as the release target after VM memory analysis.
- Built transcript replay for smoke, subsystem, solve, treasure, and endgame
  routes.
- Removed runtime recursion crashes.
- Drove transcript parity from failing startup through 15/15 passing suites.

## Architectural Decisions

The project uses a source hierarchy:

1. Open Adventure C controls behavior.
2. `source/adventure.yaml` controls generated world data.
3. `tools/yaml2inform.py` and generator modules emit Inform source.
4. Runtime subsystems implement behavior that should not be baked into
   generated data.

This separation allows generated content to remain reproducible while gameplay
logic stays reviewable in named subsystem files.

## VM Target Decision

The corrected build chain can target both Z-machine and Glulx in principle, but
Z8 is not currently practical. Memory analysis showed the generated game and
Inform runtime exceed Z8 readable-memory limits without substantial reduction
work.

Glulx is the release target because:

- The project compiles there.
- The smoke suite passes there.
- Transcript parity passes there.
- It avoids distorting the architecture solely to fit Z8.

Z8 remains an experimental optimization track.

## Parity Verification History

Transcript verification evolved through several stages:

- Manifest and dry-run framework.
- Runnable Glulx artifact execution.
- Startup crash correction.
- Parser and motion vocabulary correction.
- Lamp, dwarf, reincarnation, and route replay correction.
- Treasure route and repository synchronization.
- Full solve and treasure route final parity.

By Milestone 8I, the full transcript manifest passed 15/15, including the
upstream-backed solve path, treasure-collection path, and complete endgame path.

## Release-Candidate Work

Milestone 9A established the Glulx release-candidate package plan:

- Glulx selected as the release target.
- Z8 kept as an experimental memory-reduction track.
- Release notes, known differences, build/test docs, and transcript results
  prepared as package evidence.

Milestones 10A through 10E added the Author Edition:

- `OpenAdventure-AuthorEdition.inform` generated as an Inform 7 IDE project.
- Runtime and generated source exported as project-local extensions.
- `tools/sync_author_edition.py --export` and `--diff` made export repeatable.
- Command-line Author Edition release compilation verified.

Milestone 11 refined player-facing presentation:

- Startup, parser refusals, inventory, object names, and failed movement text
  were polished.
- HELP became an interactive menu with concise status-line titles and full
  topic headings.
- Historical Background was rewritten as original overview text.
- Author Edition `Release.blurb` generation was fixed so IFID values stay on
  one line.
- Verbose movement reporting was restored for repeated-description regions
  such as the forest and maze.

Milestone 12A refreshed contributor documentation so new readers can understand
the project, build it, export the Author Edition, run tests, and prepare a
release without reading the full milestone history first.

Milestones 12B through 12D clarified repository hygiene after the Author
Edition became fully generated output:

- Classified canonical source, generated files, author workspaces, release
  artifacts, and legacy/reference material.
- Moved the IFID into canonical `source/ifid.txt`.
- Made `tools/sync_author_edition.py --diff` work in a fresh clone without a
  checked-in Author Edition tree.
- Removed tracked `OpenAdventure-AuthorEdition.inform/` and
  `OpenAdventure-AuthorEdition.materials/` artifacts.
- Added fresh-clone and release workflow documentation.
