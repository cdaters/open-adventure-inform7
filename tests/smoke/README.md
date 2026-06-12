# Smoke Tests

This directory contains executable smoke tests used by `test.sh`.

Current checks:

- generation smoke scripts may verify required artifacts and compile artifacts
- additional checks can be added as `.sh` files and they will be discovered automatically

Convention:

- Keep scripts small and deterministic.
- Print concise status and return non-zero on failure.
- Place shared input/output expectations under `tests/transcripts` and `tests/expected`.
