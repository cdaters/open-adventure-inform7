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

require_line 'Include "OpenAdventure_Scoring.ni"' "$ROOT_DIR/OpenAdventure.ni"
require_line 'OpenAdventure_Scoring.ni' "$ROOT_DIR/build.sh"

require_line 'The openadventure-subsystem-treasure-scoring is a truth state that varies.' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'The openadventure-score-total is a number that varies.' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'Table of Open Adventure Treasure Scores' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'NUGGET	2	10	false	false' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'CHEST	2	12	false	false' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'OBJ_69	2	14	false	false' "$ROOT_DIR/OpenAdventure_State.ni"

require_line 'To initialize openadventure scoring subsystem' "$ROOT_DIR/OpenAdventure_Scoring.ni"
require_line 'To mark openadventure treasure (item - thing) as found' "$ROOT_DIR/OpenAdventure_Scoring.ni"
require_line 'To mark openadventure treasure (item - thing) as deposited' "$ROOT_DIR/OpenAdventure_Scoring.ni"
require_line 'To update openadventure pirate chest readiness' "$ROOT_DIR/OpenAdventure_Scoring.ni"
require_line 'To record openadventure death penalty' "$ROOT_DIR/OpenAdventure_Scoring.ni"
require_line 'To run openadventure scoring post-travel hooks' "$ROOT_DIR/OpenAdventure_Scoring.ni"
require_line 'Report requesting the score' "$ROOT_DIR/OpenAdventure_Scoring.ni"
require_line 'To say openadventure ranking for score' "$ROOT_DIR/OpenAdventure_Scoring.ni"

require_line 'run openadventure scoring post-travel hooks for destination target' "$ROOT_DIR/OpenAdventure_Runtime.ni"
require_line 'record openadventure score delta delta for reason reason from source "openadventure_runtime"' "$ROOT_DIR/OpenAdventure_Runtime.ni"
require_line 'mark openadventure treasure CHEST as found for reason "pirate_chest_found"' "$ROOT_DIR/OpenAdventure_Pirate.ni"
require_line 'record openadventure death penalty' "$ROOT_DIR/OpenAdventure_Reincarnation.ni"

log "scoring subsystem smoke checks passed"
