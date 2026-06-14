# Project History

Open Adventure in Inform 7 is a reconstruction of the 430-point Adventure line
with Open Adventure C as the behavioral authority.

## Historical Lineage

Adventure began as William Crowther's cave exploration program and was expanded
by Don Woods into the landmark text adventure. Eric S. Raymond's Open Adventure
is the author-approved open-source release of Adventure 2.5 and provides the
reference implementation and regression material used by this project.

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
