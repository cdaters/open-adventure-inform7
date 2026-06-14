# Transcript Results - Milestone 8A

Date: 2026-06-13

## Objective

Re-run transcript validation after repairing the parser bridge and transcript
harness issues identified in Milestone 7F.

## Environment

- Primary playable target: Glulx (`Inform6/32`)
- Artifact: `OpenAdventure.inform/Build/OpenAdventure.ulx`
- Interpreter: `glulxe`
- Transcript runner: `tools/run_transcripts.py`

## Harness Changes

Milestone 8A updated `tools/run_transcripts.py` to:

- strip blank lines and Open Adventure C comment lines beginning with `#`;
- skip the initial C-style startup response (`n`/`no`) while preserving later
  yes/no answers;
- run Glulxe with `-ml no`;
- remove ANSI control sequences, backspace-overwrite artifacts, long status-line
  fill runs, and excess blank lines before fragment comparison;
- support `--mode local` and `--mode upstream` so focused and full C-derived
  logs can be measured separately.

The Inform runtime now implements a transcript-only `seed [number]` command
using Inform's random-number generator seed phrase.

## Parser/Travel Changes Verified

Milestone 8A corrected the generated travel dispatch path:

- room ids are now initialized from canonical generated room ids rather than
  player-facing printed names;
- room lookup checks generated canonical ids before printed names;
- generated travel verb-list matching now scans each token instead of
  normalizing the whole list into a single underscore-separated word;
- non-direct travel commands are bridged from one-word parser input to
  `openadventure non-direct travel`;
- forced travel out of generated `LOC_FOOF*` rooms now dispatches ordinary
  forced `goto` rows;
- `plugh` now reaches `LOC_FOOF3` and then `LOC_Y2`, and returns through
  `LOC_FOOF4` to the building.

Focused `travel` output now shows `east` reaching the building and `plugh`
reaching Y2. The remaining `travel` failure is an expected-fragment mismatch:
the fixture expects `You're in Y2.`, while the generated game text says
`You're at "Y2".`

## Commands Run

Default compile:

```bash
./build.sh --compile
```

Result: failed at the known Z8 size limit after successful Inform 7
translation.

```text
Fatal error: The story file exceeds version-8 limit (512K) by 7760 bytes
```

Default test:

```bash
./test.sh
```

Result: failed because it invokes the default Z8 compile. The generation check
and smoke checks ran; the compile step failed on the same Z8 memory limit.

Glulx test:

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
```

Result: passed. The build produced a valid Glulx story and all smoke checks
completed.

Local transcripts:

```bash
python3 tools/run_transcripts.py --execute --mode local --timeout 12
```

Result: 12 launched, 0 passed, 6 fragment mismatches, 6 timeouts.

Upstream transcripts:

```bash
python3 tools/run_transcripts.py --execute --mode upstream --timeout 12
```

Result: 3 launched, 0 passed, 3 timeouts.

## Case Results

| ID | Mode | Result | Current classification |
|---|---|---|---|
| `startup` | local | failed fragments | Capture/expectation issue: HELP output exists but the captured menu still loses later entries such as `About this Edition`. |
| `travel` | local | failed fragments | Parser fixed; expected fragment is stale for Y2 wording. |
| `plover` | local | timeout | Progresses through `east`, `seed`, `plugh`, and `plover`; then dwarf/reincarnation prompt interrupts the scripted route. |
| `troll` | local | timeout | Progresses into cave; later dwarf death/reincarnation prompt interrupts route before troll fragments. |
| `dwarves` | local | timeout | Dwarf encounter occurs, but route/prompt handling is not transcript-stable. |
| `pirate` | local | timeout | Progresses farther than 7F; route still does not reach stable pirate/chest fragments before timeout. |
| `scoring` | local | failed fragments | Score text is visible, but `OK`/deposit route remains incomplete. |
| `reincarnation` | local | failed fragments | Route still does not reach the expected death/reincarnation flow. |
| `bear` | local | timeout | Route progresses into cave but is not stable to bear interaction. |
| `dragon` | local | failed fragments | Route does not reach dragon confrontation. |
| `cave-closing` | local | timeout | Short local route still does not exercise closure behavior. |
| `endgame` | local | failed fragments | Version output exists, but expected `Version Information` heading is not emitted/captured. |
| `solve-path` | upstream | timeout | Full Open Adventure C log is not yet replay-stable. |
| `treasure-collection` | upstream | timeout | Same command log as solve path; not replay-stable. |
| `complete-endgame` | upstream | timeout | Full endgame log is not yet replay-stable. |

## Metrics

| Metric | Count |
|---|---:|
| Manifest cases | 15 |
| Cases launched in split runs | 15 |
| Cases passed | 0 |
| Cases failed | 15 |
| Fragment mismatches | 6 |
| Timeouts | 9 |
| Cases blocked by `BUG-7D-001` stack overflow | 0 |
| Cases blocked by initial parser travel failure | 0 |

## Remaining Release Blockers

- `BUG-8A-001`: lamp command parser/action integration is incomplete; `on`
  remains unrecognized in transcript output, blocking many cave routes.
- `TFRAME-8A-001`: long upstream replay still times out and needs stronger
  prompt/end-of-game handling.
- `TEXP-8A-001`: focused expected fragments still contain stale or unreachable
  text after the parser fix.
- Dwarf/reincarnation random paths interrupt focused subsystem transcripts even
  with `seed`, so deterministic replay is not yet parity-clean.
- `BUG-7A-002`: default Z8 compile remains over the version-8 size limit.

## Release Recommendation

Not Ready.

Milestone 8A resolved the highest-value parser bridge failures and improved the
transcript harness enough to expose deeper gameplay discrepancies. Release
candidate status should wait until the Glulx transcript suite has a meaningful
pass rate and the remaining release blockers are either fixed or explicitly
accepted.
