# Current State

Date: 2026-06-14

Open Adventure in Inform 7 is currently a **Glulx Release Candidate**.

## Release Status

| Area | Status |
|---|---|
| Primary VM target | Glulx |
| Release artifact | `OpenAdventure.inform/Build/OpenAdventure.ulx` |
| Z8 target | Experimental, not a release target |
| Smoke tests | Passing with `OPENADVENTURE_INFORM_FORMAT=Inform6/32` |
| Transcript suite | Passing 15/15 with `--timeout 90` |
| Upstream solve path | Passing |
| Upstream treasure collection | Passing |
| Upstream complete endgame | Passing |

## Gameplay Status

Implemented runtime subsystems:

- Travel dispatch
- Plover
- Troll, bridge, and chasm
- Dwarves
- Pirate and pirate chest
- Treasure and scoring
- Death and reincarnation
- Bear
- Dragon
- Cave closing
- Endgame repository and blast outcomes
- Player-facing information system

The major gameplay systems required for the 430-point route are operational in
the Glulx transcript suite.

## Build Status

Use the Glulx build target:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./build.sh --compile
```

The Z-machine default target remains documented but is not suitable for release.
The corrected pipeline no longer mistakes generated Inform 6 source for a story
file, but Z8 still exceeds practical memory limits.

## Verification Status

Current release verification commands:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
python3 tools/run_transcripts.py --execute --timeout 90
python3 tools/run_transcripts.py --execute --mode upstream --timeout 90
```

Latest documented result:

- Smoke suite: passed.
- Full transcript manifest: passed 15/15.
- Upstream walkthrough subset: passed 3/3.

## Known Limitations

- Z8 is experimental and not part of the RC1 release package.
- Transcript parity is strong for the covered paths, but manual playtesting and
  broader fuzz-style parser exploration remain future work.
- Some older milestone documents contain historical "Not Ready" assessments;
  the latest 8I status supersedes those earlier sections.
- Screenshots and packaged visual assets have not yet been produced.

## Next Work

Milestone 9A focuses on release packaging and public presentation:

- Rewrite the repository homepage.
- Create RC1 release notes.
- Preserve project history.
- Add contributor and release checklist docs.
- Re-run final verification before tagging RC1.
