# Parity Report

Date: 2026-06-17

## Summary

Open Adventure in Inform 7 currently meets the Glulx release-candidate parity
bar defined by the transcript suite.

Latest measured status:

- Full transcript manifest: 15/15 passing.
- Upstream solve path: passing.
- Upstream treasure-collection path: passing.
- Upstream complete-endgame path: passing.
- Runtime crashes: none in the latest run.
- Transcript timeouts: none with `--timeout 180`.

## Verification Commands

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
python3 tools/run_transcripts.py --execute --mode upstream --timeout 180
python3 tools/run_transcripts.py --execute --timeout 180
```

## Transcript Metrics

| Metric | Latest |
|---|---:|
| Manifest cases | 15 |
| Passing cases | 15 |
| Failing cases | 0 |
| VM/runtime crashes | 0 |
| Timeouts with `--timeout 180` | 0 |

## Passing Suites

| ID | Coverage |
|---|---|
| `startup` | Startup presentation and initial command surface |
| `travel` | Basic movement and magic-word routing |
| `plover` | Plover passage behavior |
| `troll` | Troll bridge behavior |
| `dwarves` | Dwarf activation and attack route |
| `pirate` | Pirate theft and chest route |
| `scoring` | Score command and bookkeeping |
| `reincarnation` | Death and resurrection flow |
| `bear` | Food, chain, following, and troll interaction |
| `dragon` | Dragon confrontation and transformation |
| `cave-closing` | Cave-closing warning and repository transition coverage |
| `endgame` | Focused repository/endgame behavior |
| `solve-path` | Upstream 430-point walkthrough |
| `treasure-collection` | Upstream all-treasure route fragments |
| `complete-endgame` | Upstream endgame route |

## Remaining Differences

No Glulx transcript release blockers are currently known.

Remaining non-blocking differences are tracked in `docs/known-differences.md`,
including Z8 memory status, broader parser phrase coverage, hint parity,
save/resume parity, and exact random-hazard equivalence beyond deterministic
transcript replay.

## Release Recommendation

**Release candidate for Glulx**.

Z8 remains experimental and should not be included as an RC1 release artifact.
