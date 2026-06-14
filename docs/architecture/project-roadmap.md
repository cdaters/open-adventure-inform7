# Architecture Roadmap

The release-facing roadmap is now `docs/project-roadmap.md`.

Architecture work after the Glulx RC line should focus on:

1. Keeping generated data and runtime behavior separated.
2. Expanding parser and transcript coverage without hard-coding individual
   transcript routes.
3. Preserving Open Adventure C as the behavioral authority.
4. Measuring before attempting any Z8 memory-reduction work.
5. Adding CI automation for generation, Glulx smoke tests, and transcript
   replay.

Subsystem architecture references remain in this directory:

- `runtime-framework.md`
- `travel-dispatch.md`
- `source-hierarchy.md`
- `plover-system.md`
- `troll-system.md`
- `dwarf-system.md`
- `pirate-system.md`
- `scoring-system.md`
- `reincarnation-system.md`
- `bear-system.md`
- `dragon-system.md`
- `cave-closing-system.md`
- `endgame-system.md`
- `information-system.md`
