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

require_line 'Include "OpenAdventure_CaveClosing.ni"' "$ROOT_DIR/OpenAdventure.ni"
require_line 'OpenAdventure_CaveClosing.ni' "$ROOT_DIR/build.sh"

require_line 'The openadventure-subsystem-cave-closing is a truth state that varies.' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'The openadventure-cave-clock1 is a number that varies.' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'The openadventure-cave-clock2 is a number that varies.' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'The openadventure-cave-panic-clock is a number that varies.' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'The openadventure-cave-closing-active is a truth state that varies.' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'The openadventure-cave-closed-active is a truth state that varies.' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'The openadventure-cave-panic-active is a truth state that varies.' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'The openadventure-cave-last-clock-turn is a number that varies.' "$ROOT_DIR/OpenAdventure_State.ni"

require_line 'To initialize openadventure cave closing subsystem' "$ROOT_DIR/OpenAdventure_CaveClosing.ni"
require_line 'To decide whether openadventure all treasures have been located' "$ROOT_DIR/OpenAdventure_CaveClosing.ni"
require_line 'To decide whether openadventure cave closing should tick in' "$ROOT_DIR/OpenAdventure_CaveClosing.ni"
require_line 'To start openadventure cave closing warning phase' "$ROOT_DIR/OpenAdventure_CaveClosing.ni"
require_line 'To trigger openadventure cave closing panic' "$ROOT_DIR/OpenAdventure_CaveClosing.ni"
require_line 'To set up openadventure repository' "$ROOT_DIR/OpenAdventure_CaveClosing.ni"
require_line 'To close openadventure cave completely' "$ROOT_DIR/OpenAdventure_CaveClosing.ni"
require_line 'To run openadventure cave closing clock for location' "$ROOT_DIR/OpenAdventure_CaveClosing.ni"
require_line 'To decide whether openadventure cave closing blocks travel from' "$ROOT_DIR/OpenAdventure_CaveClosing.ni"
require_line 'To run openadventure cave closing post-travel hooks' "$ROOT_DIR/OpenAdventure_CaveClosing.ni"

require_line 'now adventure-state of GRATE is "GRATE_CLOSED"' "$ROOT_DIR/OpenAdventure_CaveClosing.ni"
require_line 'now adventure-state of FISSURE is "UNBRIDGED"' "$ROOT_DIR/OpenAdventure_CaveClosing.ni"
require_line 'mark openadventure cave closing score reached' "$ROOT_DIR/OpenAdventure_CaveClosing.ni"
require_line 'now openadventure-cave-closing-active is true' "$ROOT_DIR/OpenAdventure_CaveClosing.ni"
require_line 'now openadventure-cave-clock2 is openadventure-cave-panic-clock' "$ROOT_DIR/OpenAdventure_CaveClosing.ni"
require_line 'move BOTTLE to LOC_NE' "$ROOT_DIR/OpenAdventure_CaveClosing.ni"
require_line 'move GRATE to LOC_SW' "$ROOT_DIR/OpenAdventure_CaveClosing.ni"
require_line 'move MIRROR to LOC_NE' "$ROOT_DIR/OpenAdventure_CaveClosing.ni"
require_line 'move the player to LOC_NE' "$ROOT_DIR/OpenAdventure_CaveClosing.ni"
require_line 'Before going to a room (called target-room) when openadventure-subsystem-cave-closing is true' "$ROOT_DIR/OpenAdventure_CaveClosing.ni"
require_line 'Every turn when openadventure-subsystem-cave-closing is true' "$ROOT_DIR/OpenAdventure_CaveClosing.ni"

require_line 'openadventure cave closing blocks travel from source to target' "$ROOT_DIR/OpenAdventure_Runtime.ni"
require_line 'run openadventure cave closing post-travel hooks for destination target' "$ROOT_DIR/OpenAdventure_Runtime.ni"
require_line 'if openadventure-cave-closing-active is true' "$ROOT_DIR/OpenAdventure_Reincarnation.ni"
require_line 'mark openadventure cave closing score reached' "$ROOT_DIR/OpenAdventure_Scoring.ni"

log "cave-closing subsystem smoke checks passed"
