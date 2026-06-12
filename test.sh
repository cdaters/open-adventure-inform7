#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GENERATED_FILES=(
  "$ROOT_DIR/generated/Rooms.ni"
  "$ROOT_DIR/generated/Objects.ni"
  "$ROOT_DIR/generated/Vocabulary.ni"
  "$ROOT_DIR/generated/Travel.ni"
)
PROJECT_DIR="${OPENADVENTURE_INFORM_PROJECT:-$ROOT_DIR/OpenAdventure.inform}"
STRICT_COMPILE="${OPENADVENTURE_TEST_STRICT_COMPILE:-0}"
DO_INTEST="${OPENADVENTURE_TEST_INTEST:-0}"

status=0

log() {
  echo "[test] $1"
}

fail() {
  echo "[test] $1" >&2
  status=1
}

# 1) Build path with source generation
if ! bash "$ROOT_DIR/build.sh" --generate-only; then
  fail "source generation failed"
  exit 1
fi

for f in "${GENERATED_FILES[@]}"; do
  if [ ! -f "$f" ]; then
    fail "expected generated file missing: $f"
  fi
done

log "generation check passed"

# 2) Compile/build if project/binaries are available
inform_available=0
if command -v inform7 >/dev/null 2>&1 || command -v inform >/dev/null 2>&1 || [ -x /Applications/Inform.app/Contents/MacOS/Inform ] || [ -x /Applications/Inform.app/Contents/MacOS/ni ]; then
  inform_available=1
fi

if [ -d "$PROJECT_DIR" ] && [ "$inform_available" -eq 1 ]; then
  if bash "$ROOT_DIR/build.sh" --compile --project "$PROJECT_DIR"; then
    log "compile step passed"
  else
    fail "compile step failed"
  fi

  artifact=""
  artifact="$(find "$PROJECT_DIR/Build" -type f \( -name '*.z8' -o -name '*.z5' -o -name '*.ulx' \) 2>/dev/null | head -n 1 || true)"
  if [ -z "$artifact" ] && [ -n "${OPENADVENTURE_BUILD_ARTIFACT:-}" ] && [ -f "${OPENADVENTURE_BUILD_ARTIFACT}" ]; then
    artifact="${OPENADVENTURE_BUILD_ARTIFACT}"
  fi

  if [ -z "$artifact" ]; then
    fail "build artifact not found after compile"
  else
    log "artifact produced: $artifact"
  fi
else
  if [ "$STRICT_COMPILE" -eq 1 ]; then
    fail "compile not possible: Inform project or compiler unavailable (set OPENADVENTURE_INFORM_PROJECT and compiler in PATH)"
  else
    log "compile step skipped (project/compiler not configured yet)"
  fi
fi

# 3) Run smoke test framework scripts if present.
smoke_dir="$ROOT_DIR/tests/smoke"
if [ -d "$smoke_dir" ]; then
  for smoke in "$smoke_dir"/*.sh; do
    [ -f "$smoke" ] || continue
    if [ -x "$smoke" ]; then
      if ! bash "$smoke"; then
        fail "smoke test failed: $smoke"
      fi
    else
      log "skipping non-executable smoke file: $smoke"
    fi
  done
fi

# 4) Optional intest execution hook.
if [ "$DO_INTEST" -eq 1 ]; then
  if [ -x "$ROOT_DIR/intest" ] || command -v intest >/dev/null 2>&1; then
    if ! "$ROOT_DIR/tests/smoke/run-intest.sh"; then
      fail "intest smoke suite failed"
    fi
  else
    fail "intest requested but command not available"
  fi
fi

if [ "$status" -ne 0 ]; then
  exit 1
fi

log "smoke test pipeline completed"
