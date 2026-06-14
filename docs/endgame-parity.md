# Endgame Parity - Milestone 8F

Date: 2026-06-14

## Objective

Reduce the remaining full-walkthrough divergences in treasure collection,
pirate chest synchronization, cave closing, repository behavior, and endgame
completion.

## Implementation Summary

- Added upstream replay pirate pounce handling for the all-alike maze chest
  route.
- Ran pirate replay hooks from direct post-travel movement so generated map
  directions can still trigger subsystem behavior.
- Implemented urn oil filling, urn lighting, urn rubbing, amber/cavity reveal,
  gemstone cavity drops, rug hover/settle behavior, and rug flight.
- Synchronized bottle water/oil proxy state on bottle take/drop/fill.
- Added the `N'BEH` reservoir magic word for upstream replay progression.
- Updated the focused cave-closing fixture after direct post-travel hooks made
  dwarf activation visible.

## Verification

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
```

Result: passed. Inform 7 translation, Inform 6 compilation, Glulx artifact
validation, and all smoke checks passed.

```bash
python3 tools/run_transcripts.py --execute
```

Result: 12/15 transcript cases passed. The suite completed with no timeouts,
VM crashes, or fatal runtime errors.

Failing cases:

- `solve-path`
- `treasure-collection`
- `complete-endgame`

## Current Divergence

The first remaining `solve-path` and `treasure-collection` divergence is the
first cliff urn sequence. Open Adventure C expects the carried bottle of oil to
fill the urn, after which the player lights and rubs it to create the amber and
cavity. The current replay still reports that there is nothing with which to
fill the urn at that point.

The `N'BEH` reservoir route now works later in the transcript, proving that 8F
did advance a later shared blocker. Repository and blast output are still not
reached.

## Release Assessment

Classification: **Not Ready**.

The focused gameplay suite is stable, but the project is not Beta Candidate or
Release Candidate until at least one complete solve/endgame route reaches final
score, all-treasure, and repository/blast outcomes or the remaining differences
are explicitly accepted.
