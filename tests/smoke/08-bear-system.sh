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

require_line 'Include "OpenAdventure_Bear.ni"' "$ROOT_DIR/OpenAdventure.ni"
require_line 'OpenAdventure_Bear.ni' "$ROOT_DIR/build.sh"

require_line 'The openadventure-subsystem-bear is a truth state that varies.' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'The openadventure-bear-is-following is a truth state that varies.' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'The openadventure-bear-guards-axe is a truth state that varies.' "$ROOT_DIR/OpenAdventure_State.ni"

require_line 'Feeding is an action applying to one thing.' "$ROOT_DIR/OpenAdventure_Bear.ni"
require_line 'To initialize openadventure bear subsystem' "$ROOT_DIR/OpenAdventure_Bear.ni"
require_line 'To feed openadventure bear' "$ROOT_DIR/OpenAdventure_Bear.ni"
require_line 'To unlock openadventure bear chain' "$ROOT_DIR/OpenAdventure_Bear.ni"
require_line 'To lock openadventure bear chain' "$ROOT_DIR/OpenAdventure_Bear.ni"
require_line 'To run openadventure bear post-travel hooks' "$ROOT_DIR/OpenAdventure_Bear.ni"
require_line 'openadventure bear chases troll' "$ROOT_DIR/OpenAdventure_Bear.ni"
require_line 'Instead of taking BEAR' "$ROOT_DIR/OpenAdventure_Bear.ni"
require_line 'Instead of dropping BEAR' "$ROOT_DIR/OpenAdventure_Bear.ni"
require_line 'Instead of throwing AXE at BEAR' "$ROOT_DIR/OpenAdventure_Bear.ni"
require_line 'now adventure-state of BEAR is "SITTING_BEAR"' "$ROOT_DIR/OpenAdventure_Bear.ni"
require_line 'now adventure-state of BEAR is "CONTENTED_BEAR"' "$ROOT_DIR/OpenAdventure_Bear.ni"
require_line 'now adventure-state of CHAIN is "CHAIN_HEAP"' "$ROOT_DIR/OpenAdventure_Bear.ni"

require_line 'run openadventure bear post-travel hooks for destination target' "$ROOT_DIR/OpenAdventure_Runtime.ni"
require_line 'handle openadventure death caused by "bear_bridge"' "$ROOT_DIR/OpenAdventure_Troll.ni"

log "bear subsystem smoke checks passed"
