# Runtime Verification - Milestone 7E

Milestone 7E investigated and resolved `BUG-7D-001`, the Glulx runtime crash:

```text
Glulxe fatal error: Stack overflow in callstub.
```

## Reproduction

The crash reproduced with the Glulx artifact produced by:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./build.sh --compile
```

Before the fix, launching the story with `glulxe` failed during startup before
normal transcript comparison:

```bash
printf 'quit\ny\n' | glulxe OpenAdventure.inform/Build/OpenAdventure.ulx
```

## Root Cause

Temporary instrumentation of the generated Inform 6 startup rulebook isolated
the crash to scoring startup:

```text
Main__ -> STARTUP_RB/call_U112 -> When play begins/call_U983
-> scoring startup/call_U2001 -> initialize openadventure scoring subsystem/call_U2131
-> update openadventure treasure status/call_U2140
-> openadventure treasure item is discoverable now/call_U2135
-> item is carried by the player/call_U2039 -> call_U2039 ...
```

The source phrase in `OpenAdventure_Conditions.ni` recursively implemented the
same predicate it was defining:

```inform7
To decide whether (item - thing) is carried by the player:
	if item is carried by the player:
		decide yes;
	decide no.
```

Inform generated `call_U2039` as a self-call, and Glulxe exhausted the callstub
stack as soon as startup scoring checked whether the first treasure was carried.

## Fix

The phrase now checks the holder relation directly:

```inform7
To decide whether (item - thing) is carried by the player:
	if the holder of item is the player:
		decide yes;
	decide no.
```

Milestone 7E also fixed a separate startup blocker: the player had no initial
room declaration, so Inform placed the player in `LOC_NOWHERE`. The runtime
state now declares:

```inform7
The player is in LOC_START.
```

## Verification

Build:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./build.sh --compile
```

Result: passed. Artifact:

```text
OpenAdventure.inform/Build/OpenAdventure.ulx
```

Runtime smoke:

```bash
python3 -c 'import subprocess; subprocess.run(["glulxe","-ml","no","-width","120","-height","80","OpenAdventure.inform/Build/OpenAdventure.ulx"], input=b"quit\ny\n\n", stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=10)'
```

Result: passed. Startup reaches `You're in front of building.` and accepts the
quit command.

Smoke tests:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
```

Result: passed.

Transcript execution:

```bash
python3 tools/run_transcripts.py --execute
```

Result: executed without `Glulxe fatal error: Stack overflow in callstub`.

Current transcript outcome:

| Metric | Count |
|---|---:|
| Manifest cases | 15 |
| Cases blocked by `BUG-7D-001` | 0 |
| Cases reaching fragment comparison | 12 |
| Cases timing out | 3 |
| Cases passing all expected fragments | 0 |

The remaining failures are tracked as parity/content work in
`docs/transcript-results.md` and `docs/known-differences.md`.
