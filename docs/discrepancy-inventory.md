# Transcript Discrepancy Inventory - Milestone 7F

Date: 2026-06-13

## Scope

Milestone 7F analyzes the transcript failures reported after Milestone 7E. It
does not implement fixes. The authoritative behavior source is Open Adventure
C, with Graham Nelson's `Advent.inf` and Chris Conley's `Adventure.ni` used as
secondary Inform-family references.

## Current Transcript Result

Command:

```bash
python3 tools/run_transcripts.py --execute
```

Current result:

| Metric | Count |
|---|---:|
| Manifest cases | 15 |
| Cases passing | 0 |
| Focused cases reaching fragment comparison | 12 |
| Upstream long-path cases timing out | 3 |
| Cases blocked by `BUG-7D-001` stack overflow | 0 |

## Root Cause Summary

### `BUG-7F-001` - Generated Travel Parser Dispatch

Category: `BUG`

Priority: Critical

Area: parser/travel

Expected behavior: Open Adventure C accepts motion words such as `in`, `east`,
`building`, `south`, `down`, `bedquilt`, and location-like words through the
travel table. For example, Open Adventure C `tall.chk` moves from `LOC_START`
to `LOC_BUILDING` and then into the cave.

Actual behavior: current Glulx output shows `east` and `in` at `LOC_START`
failing with `You can't go that way`; `building`, `build`, `forest`, and
similar location words are not recognized as verbs. The generated travel table
contains the needed rows, for example `LOC_START -> LOC_BUILDING` with verbs
`ENTER BUILD INWAR EAST`, but the parser does not route these commands to
`openadventure non-direct travel`.

Source of expectation: `references/open-adventure-c/tests/tall.chk`,
`source/adventure.yaml`, generated `Table of Generated Travel Non-Direct Rules`.

Source of actual behavior: `build/transcripts/travel.out`, runtime probes,
`OpenAdventure_Runtime.ni`.

Impact: most downstream transcript cases diverge before reaching their target
subsystem.

### `BUG-7F-002` - Magic Word Parser Dispatch

Category: `BUG`

Priority: Critical

Area: parser/travel

Expected behavior: Open Adventure C, Nelson, and Conley all implement `xyzzy`
and `plugh` as command words. Nelson declares `Verb 'xyzzy'` and `Verb 'plugh'`;
Conley defines `xyzzy` and `plugh` relations; Open Adventure C has generated
magic-word vocabulary and regression logs that use these commands.

Actual behavior: current Glulx output reports `xyzzy` and `plugh` as
unrecognized verbs, even though generated travel rows for `goto_magic_word`
exist.

Source of expectation: `references/open-adventure-c/tests/win430.log`,
`references/nelson-inform6/Advent.inf`, `references/conley-inform7/Adventure.ni`.

Source of actual behavior: `build/transcripts/plover.out`,
`build/transcripts/solve-path.out`, runtime probes.

Impact: cave access, Plover/Y2 routing, solve path, treasure route, and endgame
route cannot progress.

### `TFRAME-7F-001` - Command Fixture Comment Handling

Category: `TRANSCRIPT ISSUE`

Priority: High

Area: transcript framework

Expected behavior: Open Adventure C ignores script input lines beginning with
`#` in `misc.c`; its `.log` files include comments and SPDX metadata that are
not gameplay commands.

Actual behavior: `tools/run_transcripts.py` passes command files directly to
Glulxe. Comment lines in local focused fixtures and upstream C logs are sent to
the game and produce `That's not a verb I recognise.`

Source of expectation: `references/open-adventure-c/misc.c`, `tests/README`,
Open Adventure C `.log` files.

Source of actual behavior: `build/transcripts/cave-closing.out`,
`build/transcripts/endgame.out`, `build/transcripts/solve-path.out`,
`build/transcripts/complete-endgame.out`.

Impact: imported upstream logs cannot be evaluated as parity transcripts until
the runner filters comments or produces sanitized command streams.

### `TFRAME-7F-002` - C Regression Commands and Startup Adaptation

Category: `TRANSCRIPT ISSUE`

Priority: High

Area: transcript framework/startup/randomness

Expected behavior: Open Adventure C asks an initial yes/no instructions
question and supports the regression-only `seed` command. The C `seed` action
sets deterministic randomness and does not consume a normal turn.

Actual behavior: Milestone 6B intentionally replaced the C startup question
with a Nelson-style welcome prompt. As a result, the leading `n` in C logs is
treated as movement. The Inform implementation also does not implement `seed`,
so command logs with `seed N` diverge immediately and random dwarf/pirate paths
cannot be made deterministic.

Source of expectation: `references/open-adventure-c/main.c`,
`references/open-adventure-c/actions.c`, `references/open-adventure-c/NEWS.adoc`.

Source of actual behavior: all subsystem transcript outputs except `startup`
and `travel`.

Impact: all C-derived routes need either runner adaptation or a controlled
Inform seed/test command before random encounter transcripts are meaningful.

### `TFRAME-7F-003` - Glulxe Terminal Capture Normalization

Category: `TRANSCRIPT ISSUE`

Priority: Medium

Area: transcript framework

Expected behavior: transcript comparison should see the logical text stream.

Actual behavior: the captured Glulxe output contains status-line content,
character echo/backspace artifacts, and overwritten text. The startup HELP menu
source prints `About this Edition`, but the captured transcript only preserves
the first two menu entries. Score output also appears partially overwritten,
for example `turns.have garnered`.

Source of expectation: `OpenAdventure_Information.ni`,
`OpenAdventure_Scoring.ni`.

Source of actual behavior: `build/transcripts/startup.out`,
`build/transcripts/scoring.out`.

Impact: some fragment failures may be false negatives until the runner uses a
line-oriented interpreter mode, a better Glk capture strategy, or stronger
normalization.

### `TEXP-7F-001` - Focused Fixture Routes Are Too Short

Category: `TRANSCRIPT ISSUE`

Priority: High

Area: transcript expectations

Expected behavior: an expected-fragment file should match states reachable by
its command script.

Actual behavior: several local focused scripts are short smoke paths but expect
fragments from much deeper Open Adventure C regression paths. Examples:
`cave-closing.txt` only attempts a short cave entry but expects Hall of Mists
and chamber fragments; `troll.txt`, `bear.txt`, and `dragon.txt` expect
late-cave encounters after abbreviated routes that currently never reach those
rooms.

Source of expectation: `tests/transcripts/expected/*.fragments`,
Open Adventure C `.chk` files.

Source of actual behavior: `tests/transcripts/suites/*.txt`,
`build/transcripts/*.out`.

Impact: after parser/travel is fixed, these scripts still need route alignment
or expectation reduction.

### `BUG-7F-003` - Score Command Reporting

Category: `BUG`

Priority: Medium

Area: scoring/terminal text

Expected behavior: Open Adventure C prints `You have garnered ... out of a
possible ... points, using ... turns.` for score requests.

Actual behavior: current output includes Inform's standard `You have so far
scored ...` text and a partially captured custom `have garnered ...` string.
This may be a rule-order issue, a terminal-capture issue, or both.

Source of expectation: `references/open-adventure-c/score.c`,
`references/open-adventure-c/dungeon.c`, `turnpenalties.chk`.

Source of actual behavior: `build/transcripts/scoring.out`,
`OpenAdventure_Scoring.ni`.

Impact: score transcript comparison remains unreliable even for simple score
commands.

## Per-Case Inventory

| Case | Missing fragments | Primary classification | Root cause | Priority |
|---|---|---|---|---|
| `startup` | `About this Edition` | `TRANSCRIPT ISSUE` | HELP source prints the entry, but Glulxe capture loses later menu lines; may also need a targeted `help edition` expectation. | Medium |
| `travel` | building, Y2 | `BUG` | Non-direct travel tokens are not routed from parser actions to generated travel dispatch. Y2 is also not reachable from this short route without magic/travel support. | Critical |
| `plover` | Plover room, emerald, `OK` | `BUG` + `TRANSCRIPT ISSUE` | Leading `no`/`seed` diverge, `east`/`plugh` fail, and magic/Plover routing is not wired. | Critical |
| `troll` | troll appearance/blocking/treasure | `BUG` + `TRANSCRIPT ISSUE` | Route diverges at startup/travel/magic before troll bridge. Fixture is shorter than the C reference route. | High |
| `dwarves` | dwarf, knife, kill | `BUG` + `TRANSCRIPT ISSUE` | Route diverges before dwarf territory; deterministic seed unsupported. | High |
| `pirate` | pirate theft/chest/maze | `BUG` + `TRANSCRIPT ISSUE` | Route diverges before pirate-eligible rooms; deterministic seed unsupported. | High |
| `scoring` | `You have garnered`, `OK` | `BUG` + `TRANSCRIPT ISSUE` | Score output still shows standard Inform text/overwritten custom text; treasure route does not reach the nugget. | High |
| `reincarnation` | death/reincarnation/orange smoke | `BUG` + `TRANSCRIPT ISSUE` | Route never reaches pit; `jump` at start produces a harmless jump. | High |
| `bear` | bear, feeding, following | `BUG` + `TRANSCRIPT ISSUE` | Route diverges before bear area; fixture expects deep-route behavior. | High |
| `dragon` | dragon confrontation/death | `BUG` + `TRANSCRIPT ISSUE` | Route diverges before dragon area; fixture expects deep-route behavior. | High |
| `cave-closing` | chamber, Hall of Mists, `OK` | `TRANSCRIPT ISSUE` + `BUG` | Fixture includes a comment line sent as input and does not attempt a closure route; travel still fails. | High |
| `endgame` | `Version Information` | `TRANSCRIPT ISSUE` | Comment line is sent as input; version output exists but does not include this heading as captured. This is likely an expectation/capture issue, not endgame behavior. | Low |
| `solve-path` | 430 score/ranking/victory | `TRANSCRIPT ISSUE` + `BUG` | Raw upstream log comments and initial `n` are fed to Inform; `seed`, magic words, and travel dispatch fail; route times out. | Critical |
| `treasure-collection` | emerald, pyramid, spices, all-treasures message | `TRANSCRIPT ISSUE` + `BUG` | Same as `solve-path`; route never reaches treasure collection. | Critical |
| `complete-endgame` | closure voice, repository room, explosion | `TRANSCRIPT ISSUE` + `BUG` | Raw upstream log comments and seed/travel/magic divergence prevent endgame route. | Critical |

## Priority Order

Critical:

1. Wire generated motion/location/magic vocabulary to runtime travel dispatch.
2. Sanitize transcript command streams so C comments and Milestone 6B startup
   differences do not become gameplay commands.

High:

1. Add deterministic transcript support for Open Adventure C `seed` behavior or
   a runner-level substitute.
2. Replace abbreviated focused routes with reachable fixture routes after
   travel/magic dispatch works.
3. Re-run focused subsystem cases before judging subsystem implementation parity.

Medium:

1. Fix or replace Glulxe terminal capture so expected fragments are matched
   against logical text rather than screen-control artifacts.
2. Recheck score command output after capture normalization.

Low:

1. Align information-system headings and expected fragments where Milestone 6B
   intentionally diverges from Open Adventure C.

## Recommended Next Milestone

Recommended next milestone: **Milestone 7G - Parser and Transcript Harness
Correction**.

Scope:

1. Implement parser routing for generated motion/location/magic words into
   `openadventure non-direct travel`.
2. Add explicit `xyzzy`, `plugh`, and `plover` command handling consistent with
   Open Adventure C and the generated travel table.
3. Add transcript command sanitization for comments, initial C instruction
   responses, and deterministic seed handling.
4. Improve Glulxe output capture or switch to a more transcript-friendly Glulx
   runner.
5. Rebuild focused transcript routes once the parser can actually follow C
   movement commands.

This milestone has the highest leverage because almost every current gameplay
discrepancy is downstream of parser/travel or transcript-harness divergence.
