# Parity Report - Milestone 8A

Date: 2026-06-13

## Summary

Milestone 8A reduced the parser and transcript-harness blockers identified in
Milestone 7F, but the project is not ready for Release Candidate status.

The Glulx artifact builds and the smoke pipeline passes when explicitly targeting
`Inform6/32`. The default Z8 command still fails on the known readable-memory
limit. Transcript execution is operational in split local/upstream modes, but
the current pass rate is 0/15.

## Resolved or Reduced Issues

| ID | Status | Notes |
|---|---|---|
| `BUG-7F-001` | reduced/resolved for generated one-word travel | Motion/location commands now route through generated non-direct travel when the current room has a matching generated token. `east` reaches the building; `south`, `north`, and similar generated route words dispatch through the runtime. |
| `BUG-7F-002` | reduced/resolved for `plugh`/generated magic rows | Magic words now route through generated travel. `plugh` reaches `LOC_FOOF3`, forced-travels to Y2, and returns through `LOC_FOOF4` to the building. |
| `TFRAME-7F-001` | resolved | Transcript command streams now skip Open Adventure C comment lines beginning with `#`. |
| `TFRAME-7F-002` | partially resolved | The runner skips only the initial C-style startup `n`/`no`, and the Inform runtime accepts `seed [number]`. Dwarf/pirate deterministic replay still needs parity validation. |
| `TFRAME-7F-003` | partially reduced | Output normalization now strips ANSI controls, backspaces, long status-line fill runs, and excess blank lines. Glulxe screen capture still loses some logical menu/headline text. |

## Technical Corrections

- `tools/generators/rooms.py` emits `OpenAdventure canonical room id` from
  `source/adventure.yaml`.
- `OpenAdventure_State.ni` initializes room `adventure-id` values from canonical
  generated ids instead of printed names.
- `OpenAdventure_Conditions.ni` resolves rooms by canonical generated id before
  falling back to stored ids or printed names.
- `OpenAdventure_Runtime.ni` now bridges recognized one-word parser commands to
  generated travel dispatch and processes forced travel out of `LOC_FOOF*`
  rooms.
- `tools/run_transcripts.py` sanitizes command streams, normalizes more Glulxe
  terminal artifacts, and supports `--mode local` / `--mode upstream`.

## Verification Results

| Command | Result |
|---|---|
| `./build.sh --compile` | Failed: default Z8 target exceeds version-8 memory by 7760 bytes. Inform 7 translation succeeded. |
| `./test.sh` | Failed: default Z8 compile failed; smoke checks still ran. |
| `OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh` | Passed: valid Glulx artifact and all smoke checks passed. |
| `python3 tools/run_transcripts.py --execute --mode local --timeout 12` | Failed: 12 launched, 0 passed, 6 fragment mismatches, 6 timeouts. |
| `python3 tools/run_transcripts.py --execute --mode upstream --timeout 12` | Failed: 3 launched, 0 passed, 3 timeouts. |

## Current Transcript Metrics

| Metric | Count |
|---|---:|
| Manifest cases | 15 |
| Cases launched | 15 |
| Passing cases | 0 |
| Failing cases | 15 |
| Fragment mismatches | 6 |
| Timeouts | 9 |
| Stack-overflow crashes | 0 |
| Immediate generated-travel parser failures | 0 |

Detailed results are in `docs/transcript-results.md`.

## Remaining Discrepancy Categories

Release blockers:

- `BUG-8A-001`: lamp command parser/action integration is incomplete; `on`
  remains unrecognized, preventing stable cave routes.
- Dwarf/reincarnation prompts interrupt multiple focused subsystem transcripts
  after travel now reaches dwarf territory.
- Upstream full replay still times out and is not yet a reliable parity oracle.
- Default Z8 build remains blocked by `BUG-7A-002`.

Parity issues:

- Dwarf/pirate deterministic encounter ordering still needs comparison against
  Open Adventure C after seed support.
- Object/action command surfaces remain incomplete for full solve replay.
- Score/deposit/endgame transcript parity remains unproven.

Transcript issues:

- Some local expected fragments are stale or unreachable after parser repair.
- Glulxe capture still drops or overwrites portions of HELP/version output.
- Full C logs need stronger prompt/end-of-game handling.

Intentional deviations:

- Milestone 6B startup/help/about/version presentation remains intentionally
  edition-specific.

Enhancements:

- Z8 can remain an experimental optimization track; Glulx remains the practical
  release target.

## Release Recommendation

**Not Ready** for Release Candidate.

The project is closer to parity validation because generated travel and magic
words are no longer the first blocker. However, no transcript case currently
passes, long replays are not stable, and required gameplay command surfaces
still block the solve path. The next milestone should focus on lamp/action
parser integration, deterministic random replay validation, and transcript
fixture alignment.
