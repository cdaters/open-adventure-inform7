# Parity Report - Milestones 7D-7F

Milestone 7D moved transcript execution from the blocked Z8 artifact path to
the Glulx artifact path recommended in Milestone 7C. Milestone 7E resolved the
runtime stack-overflow crash that prevented startup and allowed the transcript
suite to reach normal output comparison. Milestone 7F classified the resulting
transcript failures by root cause and priority.

## Sources Reviewed

- `docs/known-differences.md`
- `docs/memory-analysis.md`
- `docs/vm-target-analysis.md`
- `docs/build-status.md`
- `tools/run_transcripts.py`
- `tests/transcripts/manifest.tsv`
- `tests/transcripts/suites/*.txt`
- `tests/transcripts/expected/*.fragments`
- Open Adventure C regression references listed by the transcript manifest
- `docs/discrepancy-inventory.md`

## Framework Status

`tools/run_transcripts.py` now supports both story formats:

- Z-code:
  - detects story headers with version bytes `1` through `8`;
  - runs `dfrotz`, `frotz`, or `bocfel` with the existing terminal transcript
    arguments.
- Glulx:
  - detects the `Glul` story header;
  - runs `glulxe` or `cheapglulxe`;
  - defaults to `OpenAdventure.inform/Build/OpenAdventure.ulx` when present.

The runner also normalizes terminal escape sequences before matching expected
fragments, detects fatal interpreter output even when the interpreter exits
with status `0`, appends a final newline for interpreters that pause after quit
confirmation, and enforces a per-case timeout so blocked transcripts are
reported cleanly.

Dry-run validation passes:

```bash
python3 tools/run_transcripts.py --dry-run
```

Result:

```text
validated 15 transcript cases from tests/transcripts/manifest.tsv
```

## Transcript Suite Inventory

| ID | Area | Command Source | Reference |
|---|---|---|---|
| `startup` | startup/help/about/info/news/version | local focused transcript | `specials.log` |
| `travel` | basic movement | local focused transcript | `tall.log` |
| `plover` | plover room and emerald flow | local focused transcript | `plover.log` |
| `troll` | troll bridge/eggs flow | local focused transcript | `troll_returns.log` |
| `dwarves` | dwarf encounter/action surface | local focused transcript | `dwarf.log` |
| `pirate` | pirate theft/chest surface | local focused transcript | `pirate_carry.log` |
| `scoring` | score command and treasure deposit surface | local focused transcript | `turnpenalties.log` |
| `reincarnation` | death and resurrection surface | local focused transcript | `reincarnate.log` |
| `bear` | bear feeding/chain/following surface | local focused transcript | `axebear.log` |
| `dragon` | dragon confrontation surface | local focused transcript | `dragon_secret5.log` |
| `cave-closing` | cave-closing command surface | local focused transcript | `panic.log` |
| `endgame` | endgame command surface | local focused transcript | `endgame428.log` |
| `solve-path` | full 430-point solve | upstream command log | `win430.chk` |
| `treasure-collection` | full treasure collection | upstream command log | `win430.chk` |
| `complete-endgame` | full endgame route | upstream command log | `endgame428.chk` |

## Verification Commands

Glulx build:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./build.sh --compile
```

Result: passed. Produced:

```text
OpenAdventure.inform/Build/OpenAdventure.ulx
```

Artifact check:

```bash
file OpenAdventure.inform/Build/OpenAdventure.ulx
```

Result:

```text
Glulx game data (Version 3.1.0) Compiled by Inform
```

Transcript execution:

```bash
python3 tools/run_transcripts.py --execute
```

Result: executed all 15 cases without the former Glulx fatal stack-overflow
crash. The 12 focused local cases reached output comparison and failed on
missing expected fragments; the 3 upstream long-path cases timed out after the
runner timeout.

Milestone 7E runtime smoke:

```bash
python3 -c 'import subprocess; subprocess.run(["glulxe","-ml","no","-width","120","-height","80","OpenAdventure.inform/Build/OpenAdventure.ulx"], input=b"quit\ny\n\n", timeout=10)'
```

Result: passed. Startup reached `You're in front of building.` and accepted
`quit`.

## Execution Results

| Category | Count | Status |
|---|---:|---|
| Manifest cases | 15 | Loaded and validated |
| Executed cases | 15 | Interpreter launched the Glulx artifact |
| Passing cases | 0 | Expected fragments still need parity work |
| Failing cases | 15 | 12 fragment mismatches, 3 upstream timeouts |
| Major gameplay paths validated | 0 | Execution unblocked, parity not yet achieved |

The detailed execution summary is in `docs/transcript-results.md`.

## Comparison Status

Transcript execution is operational at the framework level: the runner can
select a Glulx story, launch a CLI Glulx interpreter, capture output, normalize
that output, enforce timeouts, and report per-case results.

Runtime parity is now partially observable. The story starts, prints the
Milestone 6B startup presentation, and accepts commands. Remaining failures are
ordinary parity/content/harness failures rather than VM startup failures.

Milestone 7F found that the failures are not all implementation bugs:

- Critical implementation bug: generated motion/location/magic vocabulary is
  not routed from the Inform parser to the generated travel table, so commands
  such as `in`, `east`, `building`, `xyzzy`, and `plugh` fail before gameplay
  systems can be reached.
- High-priority transcript-framework issue: Open Adventure C command logs use
  comments, an initial yes/no startup response, and the regression-only `seed`
  command. The current runner feeds these lines directly to Glulxe.
- Medium-priority transcript-framework issue: Glulxe terminal capture contains
  screen-control, status-line, character-echo, and overwrite artifacts that can
  hide otherwise printed text.
- Expectation issue: several focused local fixtures use abbreviated routes but
  expect fragments from deep Open Adventure C regression paths.

## Discrepancy Inventory

The current discrepancy inventory is maintained in `docs/known-differences.md`.
The detailed case-by-case analysis for current transcript failures is in
`docs/discrepancy-inventory.md`.

Milestone 7E resolves:

- `BUG-7D-001`: the Glulx artifact no longer fails immediately under `glulxe`
  with `Stack overflow in callstub`.

Root cause:

```text
Main__ -> STARTUP_RB/call_U112 -> When play begins/call_U983
-> scoring startup/call_U2001 -> initialize openadventure scoring subsystem/call_U2131
-> update openadventure treasure status/call_U2140
-> openadventure treasure item is discoverable now/call_U2135
-> item is carried by the player/call_U2039 -> call_U2039 ...
```

The phrase in `OpenAdventure_Conditions.ni` recursively implemented
`(item - thing) is carried by the player` in terms of itself. It now checks
`the holder of item is the player`.

Existing known issues remain relevant:

- `BUG-7A-002`: default Z8 target cannot emit a story file because readable
  memory exceeds the Z-machine limit.
- `BUG-7F-001`: generated non-direct travel vocabulary is not routed through
  runtime travel dispatch.
- `BUG-7F-002`: generated magic-word travel rows are not reachable through
  parser commands.
- `TFRAME-7F-001` through `TFRAME-7F-003`: transcript framework issues prevent
  reliable replay and fragment comparison.
- `INTENT-001` through `INTENT-004`: information-system presentation differences
  remain intentional.

## Release Recommendation

Do not release the current artifact yet.

Required before release:

1. Wire generated motion/location/magic vocabulary into the runtime travel
   dispatcher.
2. Sanitize/adapt transcript command streams for comments, C startup prompts,
   and `seed`.
3. Improve transcript output capture or normalization.
4. Rebuild focused transcript routes so expected fragments are reachable.
5. Re-run all 15 transcript cases and then classify remaining subsystem-level
   differences.

Optional before release:

1. Continue Z8 size-reduction work as an experimental target.
2. Expand transcript fixtures from fragment checks into fuller normalized
   transcript comparisons.
3. Add deterministic randomness controls for dwarf and pirate parity.

Release blockers:

- Parser/travel dispatch blockers identified as `BUG-7F-001` and
  `BUG-7F-002`.
- Transcript harness blockers identified as `TFRAME-7F-001` and
  `TFRAME-7F-002`.
- `BUG-7A-002`: blocks Z8 only; not a Glulx release blocker if Glulx is the
  chosen primary target.

Recommended next milestone:

- **Milestone 7G - Parser and Transcript Harness Correction**, covering travel
  parser routing, magic-word command handling, command-stream sanitization,
  deterministic seed handling, and transcript-friendly Glulx capture.
