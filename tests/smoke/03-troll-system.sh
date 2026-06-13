#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

log() {
  echo "[smoke] $1"
}

require_line() {
  local pattern="$1"
  local file="$2"
  if ! rg -q "$pattern" "$file"; then
    echo "[smoke] missing pattern '$pattern' in $file" >&2
    exit 1
  fi
}

if [ ! -d "$ROOT_DIR/generated" ]; then
  echo "[smoke] generated output directory missing: $ROOT_DIR/generated" >&2
  exit 1
fi

require_line '"LOC_SWCHASM" "special" "special" "3" "OVER"' "$ROOT_DIR/generated/Travel.ni"
require_line '"LOC_NECHASM" "special" "special" "3" "OVER"' "$ROOT_DIR/generated/Travel.ni"
require_line 'if special-id is "3"' "$ROOT_DIR/OpenAdventure_Runtime.ni"
require_line 'oa-handle-troll-bridge-special' "$ROOT_DIR/OpenAdventure_Runtime.ni"
require_line 'To oa-handle-troll-bridge-special' "$ROOT_DIR/OpenAdventure_Troll.ni"
require_line 'adventure-state of TROLL' "$ROOT_DIR/OpenAdventure_Troll.ni"
require_line 'openadventure-handle-troll-bridge-bear-collapse' "$ROOT_DIR/OpenAdventure_Troll.ni"
require_line 'LOC_SWCHASM' "$ROOT_DIR/OpenAdventure_Troll.ni"
require_line 'subsystem troll' "$ROOT_DIR/OpenAdventure_Troll.ni"

log "resolved troll bridge travel wiring"
echo "[smoke] resolved troll bridge travel wiring passed"
