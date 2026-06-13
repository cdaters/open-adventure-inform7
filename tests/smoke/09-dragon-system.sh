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

require_line 'Include "OpenAdventure_Dragon.ni"' "$ROOT_DIR/OpenAdventure.ni"
require_line 'OpenAdventure_Dragon.ni' "$ROOT_DIR/build.sh"

require_line 'The openadventure-subsystem-dragon is a truth state that varies.' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'The openadventure-dragon-last-event is a text that varies.' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'The openadventure-dragon-room-transformed is a truth state that varies.' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'The openadventure-dragon-blood-drunk is a truth state that varies.' "$ROOT_DIR/OpenAdventure_State.ni"

require_line 'To initialize openadventure dragon subsystem' "$ROOT_DIR/OpenAdventure_Dragon.ni"
require_line 'To transform openadventure dragon room' "$ROOT_DIR/OpenAdventure_Dragon.ni"
require_line 'Instead of attacking DRAGON' "$ROOT_DIR/OpenAdventure_Dragon.ni"
require_line 'if the player consents' "$ROOT_DIR/OpenAdventure_Dragon.ni"
require_line 'now adventure-state of DRAGON is "DRAGON_DEAD"' "$ROOT_DIR/OpenAdventure_Dragon.ni"
require_line 'now adventure-state of DRAGON is "DRAGON_BLOODLESS"' "$ROOT_DIR/OpenAdventure_Dragon.ni"
require_line 'now adventure-state of RUG is "RUG_FLOOR"' "$ROOT_DIR/OpenAdventure_Dragon.ni"
require_line 'move DRAGON to LOC_SECRET5' "$ROOT_DIR/OpenAdventure_Dragon.ni"
require_line 'move RUG to LOC_SECRET5' "$ROOT_DIR/OpenAdventure_Dragon.ni"
require_line 'move BLOOD to LOC_SECRET5' "$ROOT_DIR/OpenAdventure_Dragon.ni"
require_line 'Instead of throwing AXE at DRAGON' "$ROOT_DIR/OpenAdventure_Dragon.ni"
require_line 'Instead of throwing BIRD at DRAGON' "$ROOT_DIR/OpenAdventure_Dragon.ni"
require_line 'Instead of taking RUG when openadventure dragon is alive' "$ROOT_DIR/OpenAdventure_Dragon.ni"
require_line 'Instead of drinking BLOOD' "$ROOT_DIR/OpenAdventure_Dragon.ni"
require_line 'To run openadventure dragon post-travel hooks' "$ROOT_DIR/OpenAdventure_Dragon.ni"

require_line 'run openadventure dragon post-travel hooks for destination target' "$ROOT_DIR/OpenAdventure_Runtime.ni"
require_line 'RUG	2	14	false	false' "$ROOT_DIR/OpenAdventure_State.ni"

log "dragon subsystem smoke checks passed"
