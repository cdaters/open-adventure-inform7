#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

log() {
  echo "[smoke] $1"
}

require_line() {
  local pattern="$1"
  local file="$2"
  if ! rg -qF "$pattern" "$file"; then
    echo "[smoke] missing pattern '$pattern' in $file" >&2
    exit 1
  fi
}

require_line 'startup	startup' "$ROOT_DIR/tests/transcripts/manifest.tsv"
require_line 'plover	plover' "$ROOT_DIR/tests/transcripts/manifest.tsv"
require_line 'troll	troll' "$ROOT_DIR/tests/transcripts/manifest.tsv"
require_line 'dwarves	dwarves' "$ROOT_DIR/tests/transcripts/manifest.tsv"
require_line 'pirate	pirate' "$ROOT_DIR/tests/transcripts/manifest.tsv"
require_line 'scoring	scoring' "$ROOT_DIR/tests/transcripts/manifest.tsv"
require_line 'reincarnation	reincarnation' "$ROOT_DIR/tests/transcripts/manifest.tsv"
require_line 'bear	bear' "$ROOT_DIR/tests/transcripts/manifest.tsv"
require_line 'dragon	dragon' "$ROOT_DIR/tests/transcripts/manifest.tsv"
require_line 'cave-closing	cave-closing' "$ROOT_DIR/tests/transcripts/manifest.tsv"
require_line 'endgame	endgame' "$ROOT_DIR/tests/transcripts/manifest.tsv"
require_line 'solve-path	full-walkthrough' "$ROOT_DIR/tests/transcripts/manifest.tsv"
require_line 'treasure-collection	treasure-collection' "$ROOT_DIR/tests/transcripts/manifest.tsv"
require_line 'complete-endgame	complete-endgame' "$ROOT_DIR/tests/transcripts/manifest.tsv"

python3 "$ROOT_DIR/tools/run_transcripts.py" --dry-run >/tmp/openadventure-transcript-dry-run
require_line 'validated 15 transcript cases' /tmp/openadventure-transcript-dry-run

log "transcript framework smoke checks passed"
