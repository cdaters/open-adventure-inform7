# Release Readiness

Date: 2026-06-17

## Recommendation

**Release candidate for Glulx**.

The project has passed the release-candidate parity bar for the Glulx target.
Z8 remains experimental and is not part of the RC1 release package.

## Readiness Summary

| Area | Status | Notes |
|---|---|---|
| Glulx artifact | Ready for RC packaging | `OpenAdventure.ulx` builds and validates. |
| Z8 artifact | Not release-ready | Memory limits still block practical Z8 output. |
| Smoke tests | Passing | `OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh` passes. |
| Transcript framework | Passing | Full manifest passes with `--timeout 180`. |
| Transcript pass rate | 15/15 | No current release-blocking transcript failures. |
| Full solve path | Passing | Reaches 430/430 and final rank output. |
| Treasure collection | Passing | Current C-backed fragments pass. |
| Complete endgame | Passing | Repository and victory blast route passes. |
| Documentation | Updated for RC1 | Contributor, Author Edition, release, and workflow docs are current. |
| Author Edition | Ready for RC packaging | Export and command-line release compilation succeed. |

## Verification Evidence

```bash
OPENADVENTURE_INFORM_FORMAT=Inform6/32 ./test.sh
```

Result: passed.

```bash
python3 tools/run_transcripts.py --execute --timeout 180
```

Result: passed, 15/15.

## Remaining Release Work

RC1 packaging work:

- Include RC1 release notes.
- Include known differences and transcript verification evidence.
- Keep in-game version, credits, ABOUT, INFO, NEWS, and HELP presentation under manual playtest review.
- Package the Glulx artifact and supporting docs.

Non-blocking future work:

- Z8 memory-reduction analysis and optimization if Z-machine release remains a
  goal.
- Broader manual playtesting beyond current transcript routes.
- CI automation for build, smoke, and transcript verification.
- Optional Blorb and visual asset packaging.

## Classification

Release classification: **Release candidate** for Glulx.

The project should not be classified as a Z8 release candidate.
