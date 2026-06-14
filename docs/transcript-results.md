# Transcript Results - Milestones 7D-7E

Date: 2026-06-13

## Objective

Execute the transcript suites against the Glulx artifact selected as the
practical release target in Milestone 7C, then resolve the Milestone 7D runtime
startup crash and rerun the suite.

## Environment

- Build target: `Inform6/32`
- Artifact: `OpenAdventure.inform/Build/OpenAdventure.ulx`
- Interpreter: `glulxe`
- Transcript runner: `tools/run_transcripts.py`

`glulxe` was installed locally through Homebrew during this milestone because
the bundled Inform `glulxe-client` requires a CocoaGlk display hub and is not a
terminal transcript runner.

## Commands Run

Compile Glulx:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./build.sh --compile
```

Result: passed.

Validate transcript manifest:

```bash
python3 tools/run_transcripts.py --dry-run
```

Result:

```text
validated 15 transcript cases from tests/transcripts/manifest.tsv
```

Execute transcripts:

```bash
python3 tools/run_transcripts.py --execute
```

Result after Milestone 7E fix: failed on parity/content checks, not on VM
startup.

The prior fatal error is resolved:

```text
Glulxe fatal error: Stack overflow in callstub.
```

No current case reports that runtime failure.

## Case Results

| ID | Area | Result | Notes |
|---|---|---|---|
| `startup` | startup | failed | Executed; missing `About this Edition` fragment |
| `travel` | travel | failed | Executed; missing building and Y2 fragments |
| `plover` | plover | failed | Executed; missing plover room, emerald, and `OK` fragments |
| `troll` | troll | failed | Executed; missing troll bridge/treasure fragments |
| `dwarves` | dwarves | failed | Executed; missing dwarf/knife/kill fragments |
| `pirate` | pirate | failed | Executed; missing pirate/chest/maze fragments |
| `scoring` | scoring | failed | Executed; missing score and `OK` fragments |
| `reincarnation` | reincarnation | failed | Executed; missing death/reincarnation fragments |
| `bear` | bear | failed | Executed; missing bear food/following fragments |
| `dragon` | dragon | failed | Executed; missing dragon confrontation fragments |
| `cave-closing` | cave-closing | failed | Executed; missing chamber/Hall of Mists/`OK` fragments |
| `endgame` | endgame | failed | Executed; missing `Version Information` fragment |
| `solve-path` | full walkthrough | failed | Interpreter timed out after 20s |
| `treasure-collection` | treasure collection | failed | Interpreter timed out after 20s |
| `complete-endgame` | complete endgame | failed | Interpreter timed out after 20s |

Summary:

| Metric | Count |
|---|---:|
| Manifest cases | 15 |
| Cases launched | 15 |
| Cases passed | 0 |
| Cases failed | 15 |
| Cases blocked by same runtime failure | 0 |
| Cases reaching fragment comparison | 12 |
| Cases timing out | 3 |

Outputs were written to:

```text
build/transcripts/*.out
```

## Runtime Investigation

The Milestone 7D failure was not the old Z8 artifact bug:

- the runner selected `OpenAdventure.ulx`;
- the artifact header is `Glul`;
- `file` identifies the artifact as Glulx game data;
- `glulxe` successfully runs a tiny independently compiled Inform 7 Glulx
  smoke story.

Temporary diagnostic builds were tried:

- increasing the Glulx stack size from `65536` to `262144`;
- forcing the player start room to `LOC_START`;
- disabling the Open Adventure startup presentation;
- replacing the status-line construction rule with `do nothing`.

None of those temporary checks removed the crash. Milestone 7E then traced the
generated startup rulebook and found the exact recursive call chain:

```text
Main__ -> STARTUP_RB/call_U112 -> When play begins/call_U983
-> scoring startup/call_U2001 -> initialize openadventure scoring subsystem/call_U2131
-> update openadventure treasure status/call_U2140
-> openadventure treasure item is discoverable now/call_U2135
-> item is carried by the player/call_U2039 -> call_U2039 ...
```

Root cause:

```inform7
To decide whether (item - thing) is carried by the player:
	if item is carried by the player:
		decide yes;
	decide no.
```

Because this phrase shadowed the intended inventory predicate, the generated
Inform 6 routine `call_U2039` called itself until Glulxe reported a callstub
stack overflow.

Fix:

```inform7
To decide whether (item - thing) is carried by the player:
	if the holder of item is the player:
		decide yes;
	decide no.
```

Milestone 7E also added the missing initial player placement:

```inform7
The player is in LOC_START.
```

## Comparison Against Open Adventure

Expected documented startup behavior:

```text
Welcome to Adventure!

(Please type HELP for instructions and information.)
```

Milestone 7D actual runtime behavior:

```text
Glulxe fatal error: Stack overflow in callstub.
```

Milestone 7E actual runtime behavior:

```text
Welcome to Adventure!

(Please type HELP for instructions and information.)
You're in front of building.
```

Gameplay behavior can now be compared, but the current fragment results show
remaining parser/travel/puzzle parity gaps.

## Categorized Differences

| ID | Category | Area | Difference | Severity |
|---|---|---|---|---|
| `BUG-7D-001` | bug | Glulx runtime | Corrected in Milestone 7E: recursive inventory predicate caused `Stack overflow in callstub`. | resolved |
| `BUG-7A-002` | bug | Z8 build | Z8 target still exceeds readable-memory limits. | Z8-only blocker |
| `PARITY-001` through `PARITY-007` | parity issue | gameplay | Existing gameplay parity issues are now runtime-observable but not resolved. | open |
| `PARITY-008` | parity issue | transcript suite | 12 focused transcript cases execute but fail expected-fragment checks; 3 upstream long-path cases time out. | open |
| `INTENT-001` through `INTENT-004` | intentional deviation | information system | Startup/help/version presentation intentionally differs from Open Adventure C where Milestone 6B required edition-specific presentation. | accepted |

## Required Parity Fixes

1. Resolve focused startup/travel/parser mismatches that prevent expected
   fragments from appearing.
2. Triage subsystem transcript failures now that they execute.
3. Investigate upstream long-path timeouts separately from focused local cases.

## Optional Parity Fixes

1. Add deterministic random seeding for dwarf and pirate tests.
2. Expand expected fragments into fuller normalized expected transcripts.
3. Add a focused Glulx startup/travel execution smoke mode.
4. Continue Z8 size work as a separate experimental track.

## Release Blockers

`BUG-7D-001` no longer blocks release. The current Glulx artifact is compiled
and playable, but not transcript-parity clean.

`BUG-7A-002` blocks only a Z8 release. It should not block a Glulx release once
the Glulx runtime parity failures are fixed or explicitly accepted.
