# VM Target Analysis - Milestone 7C

## Decision Summary

Recommended primary release target: **Glulx**.

Recommended secondary target: **Z8 experimental only**.

The current Inform 7 implementation should not block release or parity work on
Z8. Z8 remains historically desirable, but the measured readable-memory overage
is too large for normal compiler switches or small source changes to solve.

Glulx is absolutely okay for this project. It produces a real runnable artifact
from the current source, avoids the Z-machine readable-memory ceiling, and lets
the project continue validating Open Adventure behavior without replacing large
parts of the implementation.

## Current Target Status

| Target | Status | Evidence |
| --- | --- | --- |
| Z8 | Blocked | `./build.sh --compile` fails at `inform6` with `110160` bytes readable memory used against a `65536` byte maximum. |
| Glulx | Operational | `OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./build.sh --compile` emits `OpenAdventure.inform/Build/OpenAdventure.ulx`, identified by `file` as Glulx game data. |
| Both | Not currently releasable | Glulx works, but Z8 cannot currently emit a story file. |

## Z8 Practicality

Classification: **unrealistic as the primary release target under the current
Inform 7 architecture**.

Z8 may be difficult but achievable only if the project accepts a major
optimization track. That track would need to replace or compact large generated
Inform 7 tables, reduce block-value text storage, and possibly bypass parts of
the Inform map/table/runtime machinery. Those changes carry real gameplay and
maintenance risk because they touch travel dispatch, parser-visible vocabulary,
and runtime state representation.

The minimum required recovery is `44624` bytes of readable memory. A safer goal
is about `48000` to `50000` bytes. The measured low-risk Inform option,
`Use memory economy.`, recovers only `1584` bytes. That leaves more than
`43000` bytes still to recover.

## Glulx Practicality

Classification: **correct release target**.

Glulx is a better match for the current implementation because:

- The corrected build pipeline already emits a valid Glulx artifact.
- It supports the generated data volume without the Z-machine readable-memory
  ceiling.
- It allows transcript and parity work to proceed against a runnable artifact.
- It preserves the current Inform 7 architecture and reduces implementation
  risk.
- It is a standard Inform target for larger modern works.

## Comparison

| Area | Z8 advantage | Glulx advantage |
| --- | --- | --- |
| Historical compatibility | Runs on classic Z-machine interpreters if it fits. | Less historically constrained, but still widely supported. |
| Artifact size discipline | Forces compact data representation. | Allows behavior work to continue without size-driven rewrites. |
| Current build status | Blocked by readable-memory overflow. | Builds successfully today. |
| Testing | Existing transcript runner expects a Z-code path. | Runner can be extended to Glulx interpreter execution. |
| Risk | High, because size work touches generated data and runtime internals. | Low, because current code already compiles and smoke tests pass under explicit Glulx target. |
| Player reach | Good for Z-machine-focused players if achieved. | Good for modern IF players and development workflows. |

## Z8 Optimization Roadmap

If Z8 remains desired, treat it as an experimental size-reduction program with
explicit byte budgets. Do not block gameplay parity on it.

Recommended order:

1. Keep Glulx as the primary release and CI validation target.
2. Add a non-gating Z8 memory report that captures readable-memory region sizes.
3. Apply `Use memory economy.` only after confirming behavior and transcript
   output remain acceptable. Expected recovery: `1584` bytes.
4. Redesign the generated travel non-direct table:
   - replace text columns with numeric enum IDs,
   - remove diagnostic strings from runtime data,
   - pack boolean and small enum columns,
   - consider direct generated dispatch code where it is clearer than tables.
   Expected recovery: `12000` to `22000` bytes.
5. Remove repeated empty/default text block values from generated data.
   Expected recovery: `5000` to `9000` bytes, overlapping with travel-table
   savings.
6. Compress remaining generated tables for treasure, dwarf, pirate, scoring,
   reincarnation, cave-closing, and endgame state where the byte savings justify
   the added complexity. Expected recovery: `2000` to `6000` bytes.
7. Evaluate whether Inform map storage can be avoided for generated travel.
   Expected recovery: up to about `4440` bytes, but high gameplay risk.
8. Consider parser vocabulary reductions only after parity transcripts exist.
   Expected recovery: `500` to `1500` bytes with high parity risk.
9. Avoid Inform template or compiler surgery unless the project explicitly
   decides that Z8 compatibility is worth the maintenance cost.

## Release Recommendation

Release primarily as Glulx.

Continue supporting Z8 experimentally only if the project wants a separate
memory-reduction milestone. Z8 should be reported as blocked by
`BUG-7A-002` until a measured optimization pass proves that the readable-memory
usage can drop below `65536` with meaningful headroom.

The practical target strategy is:

- **Primary**: Glulx, runnable and releaseable.
- **Secondary**: Z8, experimental memory-budget target.
- **Both targets**: desirable long term, but not currently realistic as a
  release requirement.

## Final Recommendation

The project should formally move the runnable artifact and parity verification
path to Glulx, then keep Z8 as an optional optimization objective. This avoids
spending major engineering effort on VM constraints before the transcript
framework has finished proving gameplay behavior.
