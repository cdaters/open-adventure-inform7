# Endgame Completion Analysis - Milestone 8H

Historical note: this report predates final full-walkthrough parity. The
remaining release blockers listed below were resolved by Milestone 8I.

Date: 2026-06-14

## Objective

Milestone 8H targeted the remaining walkthrough divergences affecting
`solve-path`, `treasure-collection`, and `complete-endgame`, with Open
Adventure C as the authoritative behavior source.

## Sources Compared

- `references/open-adventure-c/tests/win430.log`
- `references/open-adventure-c/tests/endgame428.log`
- `build/transcripts/solve-path.out`
- `build/transcripts/treasure-collection.out`
- `build/transcripts/complete-endgame.out`
- Runtime implementation in `OpenAdventure_Runtime.ni`,
  `OpenAdventure_Bear.ni`, and the cave-closing/endgame subsystems.

## Corrections Applied

8H corrected the following shared route blockers:

- Added the reservoir magic spelling `H'CFL`/`HCFL`.
- Added clam/oyster opening behavior and pearl relocation to the cul-de-sac.
- Routed direct `NE`, `SW`, `OVER`, `ACROSS`, and `CROSS` troll-bridge commands
  through the troll bridge subsystem.
- Kept troll payment state compatible with Open Adventure C's paid-once bridge
  sequence.
- Corrected `release bear` so a following bear can be released at the troll
  bridge instead of being treated only as a chain operation.
- Added `FEE`/`FIE`/`FOE`/`FOO` egg restoration.
- Added closed-cave rod vocabulary for `ROD2`.

## Transcript Status

| Transcript | 8G status | 8H status | First remaining divergence |
|---|---|---|---|
| `complete-endgame` | Failing repository/blast fragments. | Passing. | None in the current expectation set. |
| `solve-path` | Failing final score/rank fragments. | Failing final score/rank fragments, but now reaches game end at 409/430. | Late cave-closing and repository rod choreography. |
| `treasure-collection` | Failing treasure/all-treasure fragments. | Failing treasure/all-treasure fragments. | Late treasure expectation and route synchronization, shared with `solve-path`. |

## State Comparison

Expected `complete-endgame` state:

- Inventory reaches the repository route with the lamp available.
- Closure moves the player to the northeast repository room.
- `ROD2` is available in the repository.
- The player can take `ROD2`, move to the southwest repository room, return,
  drop `ROD2`, move back southwest, and `blast`.
- Blast produces the victory outcome and 430/430 score.

Observed `complete-endgame` state after 8H:

- Matches the expected state for the current transcript expectation set.
- Output includes the cave-closing voice, repository room, successful blast,
  430/430 score, and world-champion rank.

Expected `solve-path` late state from `win430.log`:

- The cave-closing clock should align so the repository transition happens
  before the scripted repository rod choreography.
- The script should take `ROD2`, move between repository sides, drop `ROD2`,
  and blast from the correct side.
- Final score should be 430/430 with world-champion rank.

Observed `solve-path` late state after 8H:

- The route reaches cave closure and game end.
- Closure happens after the scripted `take rod` point in the replay.
- `take rod` fails before closure because `ROD2` is not visible yet.
- The final `blast` produces the splatter outcome.
- Final score is 409/430.

Expected `treasure-collection` state:

- The route should show the expected emerald, pyramid, spices, and
  all-treasures fragments.
- The treasure route should remain synchronized through cave closing and final
  scoring.

Observed `treasure-collection` state after 8H:

- The route shares the late synchronization problem seen in `solve-path`.
- Several treasure description/all-treasure fragments remain absent from the
  captured output.

## Verification

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
```

Passed.

```bash
python3 tools/run_transcripts.py --execute --mode upstream
```

Failed by timeout at the default 60-second interpreter timeout.

```bash
python3 tools/run_transcripts.py --execute --mode upstream --timeout 180
```

Completed with `complete-endgame` passing and `solve-path` /
`treasure-collection` failing expected fragments.

```bash
python3 tools/run_transcripts.py --execute --timeout 180
```

Completed with 13 passing cases and 2 failing cases.

## Remaining Release Blockers

- `solve-path` does not yet reach the Open Adventure C 430-point victory
  outcome.
- `treasure-collection` still misses treasure/all-treasure expected fragments.
- The exact upstream command without an explicit timeout still times out at 60
  seconds.

## Recommendation

The next parity milestone should focus on the late `win430.log` cave-closing
clock and repository rod route. The repository and successful blast mechanics
are no longer the primary blocker, because `complete-endgame` now proves that
path can complete successfully.

Release classification after 8H: **Not Ready**.
