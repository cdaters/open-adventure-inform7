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

require_line 'Include "OpenAdventure_Reincarnation.ni"' "$ROOT_DIR/OpenAdventure.ni"
require_line 'OpenAdventure_Reincarnation.ni' "$ROOT_DIR/build.sh"

require_line 'The openadventure-subsystem-reincarnation is a truth state that varies.' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'The openadventure-reincarnation-limit is a number that varies.' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'The openadventure-last-safe-room is a room that varies.' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'The openadventure-death-location is a room that varies.' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'The openadventure-cave-closing-active is a truth state that varies.' "$ROOT_DIR/OpenAdventure_State.ni"

require_line 'To initialize openadventure reincarnation subsystem' "$ROOT_DIR/OpenAdventure_Reincarnation.ni"
require_line 'To handle openadventure death caused by' "$ROOT_DIR/OpenAdventure_Reincarnation.ni"
require_line 'To resurrect openadventure player' "$ROOT_DIR/OpenAdventure_Reincarnation.ni"
require_line 'To dispose of openadventure carried items after death' "$ROOT_DIR/OpenAdventure_Reincarnation.ni"
require_line 'record openadventure death penalty' "$ROOT_DIR/OpenAdventure_Reincarnation.ni"
require_line 'move WATER to LOC_NOWHERE' "$ROOT_DIR/OpenAdventure_Reincarnation.ni"
require_line 'move OIL to LOC_NOWHERE' "$ROOT_DIR/OpenAdventure_Reincarnation.ni"
require_line 'move item to LOC_START' "$ROOT_DIR/OpenAdventure_Reincarnation.ni"
require_line 'now adventure-state of LAMP is "LAMP_DARK"' "$ROOT_DIR/OpenAdventure_Reincarnation.ni"
require_line 'move the player to LOC_BUILDING' "$ROOT_DIR/OpenAdventure_Reincarnation.ni"

require_line 'handle openadventure death caused by "dwarf_knife"' "$ROOT_DIR/OpenAdventure_Dwarves.ni"
require_line 'mark openadventure last safe room target' "$ROOT_DIR/OpenAdventure_Runtime.ni"
require_line 'enable subsystem reincarnation' "$ROOT_DIR/OpenAdventure_Runtime.ni"

log "reincarnation subsystem smoke checks passed"
