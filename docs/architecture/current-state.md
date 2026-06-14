# Architecture Current State

This architecture snapshot is superseded for release status by
`docs/current-state.md`.

The architecture status is:

- Generated world data comes from `source/adventure.yaml`.
- `tools/yaml2inform.py` and `tools/generators/` emit generated Inform files.
- `OpenAdventure_*.ni` modules implement runtime gameplay systems.
- Glulx is the release VM target.
- Z8 remains experimental because of memory limits.
- All major runtime subsystems required by the transcript suite are
  implemented.

For subsystem details, see the individual `docs/architecture/*-system.md`
documents.

For release state, build status, and verification status, see:

- `docs/current-state.md`
- `docs/project-roadmap.md`
- `docs/build-status.md`
- `docs/parity-report.md`
- `docs/transcript-results.md`
