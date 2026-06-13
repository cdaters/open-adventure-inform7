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

require_line 'Include "OpenAdventure_Endgame.ni"' "$ROOT_DIR/OpenAdventure.ni"
require_line 'OpenAdventure_Endgame.ni' "$ROOT_DIR/build.sh"

require_line 'The openadventure-subsystem-endgame is a truth state that varies.' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'The openadventure-endgame-complete is a truth state that varies.' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'The openadventure-endgame-last-outcome is a text that varies.' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'The openadventure-endgame-final-bonus is a number that varies.' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'The openadventure-repository-ready is a truth state that varies.' "$ROOT_DIR/OpenAdventure_State.ni"

require_line 'To initialize openadventure endgame subsystem' "$ROOT_DIR/OpenAdventure_Endgame.ni"
require_line 'To initialize openadventure endgame repository' "$ROOT_DIR/OpenAdventure_Endgame.ni"
require_line 'To decide whether openadventure repository-room is' "$ROOT_DIR/OpenAdventure_Endgame.ni"
require_line 'To decide whether openadventure rusty-mark rod exists' "$ROOT_DIR/OpenAdventure_Endgame.ni"
require_line 'To decide whether openadventure rusty-mark rod is here' "$ROOT_DIR/OpenAdventure_Endgame.ni"
require_line 'To complete openadventure endgame with outcome' "$ROOT_DIR/OpenAdventure_Endgame.ni"
require_line 'To awaken openadventure endgame dwarves' "$ROOT_DIR/OpenAdventure_Endgame.ni"
require_line 'Blasting is an action applying to nothing.' "$ROOT_DIR/OpenAdventure_Endgame.ni"
require_line 'Detonating is an action applying to one thing.' "$ROOT_DIR/OpenAdventure_Endgame.ni"
require_line 'Carry out blasting' "$ROOT_DIR/OpenAdventure_Endgame.ni"
require_line 'Carry out detonating' "$ROOT_DIR/OpenAdventure_Endgame.ni"
require_line 'complete openadventure endgame with outcome "splatter" bonus 25' "$ROOT_DIR/OpenAdventure_Endgame.ni"
require_line 'complete openadventure endgame with outcome "defeat" bonus 30' "$ROOT_DIR/OpenAdventure_Endgame.ni"
require_line 'complete openadventure endgame with outcome "victory" bonus 45' "$ROOT_DIR/OpenAdventure_Endgame.ni"
require_line 'complete openadventure endgame with outcome "dwarves_awakened" bonus 10' "$ROOT_DIR/OpenAdventure_Endgame.ni"
require_line 'mark openadventure cave closed bonus bonus' "$ROOT_DIR/OpenAdventure_Endgame.ni"
require_line 'mark openadventure quit bonus earned' "$ROOT_DIR/OpenAdventure_Endgame.ni"
require_line 'Instead of attacking MIRROR when openadventure-cave-closed-active is true' "$ROOT_DIR/OpenAdventure_Endgame.ni"
require_line 'Instead of waking DWARF when openadventure-cave-closed-active is true' "$ROOT_DIR/OpenAdventure_Endgame.ni"
require_line 'To run openadventure endgame post-travel hooks for destination' "$ROOT_DIR/OpenAdventure_Endgame.ni"

require_line 'initialize openadventure endgame repository' "$ROOT_DIR/OpenAdventure_CaveClosing.ni"
require_line 'run openadventure endgame post-travel hooks for destination target' "$ROOT_DIR/OpenAdventure_Runtime.ni"

log "endgame subsystem smoke checks passed"
