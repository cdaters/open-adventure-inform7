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

require_line 'Include "OpenAdventure_Pirate.ni"' "$ROOT_DIR/OpenAdventure.ni"
require_line 'OpenAdventure_Pirate.ni' "$ROOT_DIR/build.sh"

require_line 'The openadventure-subsystem-pirate is a truth state that varies.' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'The openadventure-pirate-chest-location is a room that varies.' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'Table of Open Adventure Pirate Treasures' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'CHEST' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'PYRAMID' "$ROOT_DIR/OpenAdventure_State.ni"

require_line 'To initialize openadventure pirate subsystem' "$ROOT_DIR/OpenAdventure_Pirate.ni"
require_line 'To place openadventure pirate chest' "$ROOT_DIR/OpenAdventure_Pirate.ni"
require_line 'To steal openadventure pirate booty in' "$ROOT_DIR/OpenAdventure_Pirate.ni"
require_line 'To run openadventure pirate post-dwarf-round' "$ROOT_DIR/OpenAdventure_Pirate.ni"
require_line 'openadventure-pirate treasure loot is protected' "$ROOT_DIR/OpenAdventure_Pirate.ni"
require_line 'move CHEST to openadventure-pirate-chest-location' "$ROOT_DIR/OpenAdventure_Pirate.ni"
require_line 'move MESSAG to openadventure-pirate-message-location' "$ROOT_DIR/OpenAdventure_Pirate.ni"

require_line 'run openadventure pirate post-dwarf-round in current-room with dwarf-count visible-dwarves' "$ROOT_DIR/OpenAdventure_Dwarves.ni"
require_line 'if dwarf-index entry is 6:' "$ROOT_DIR/OpenAdventure_Pirate.ni"
require_line 'enable subsystem pirate' "$ROOT_DIR/OpenAdventure_Runtime.ni"

log "pirate subsystem smoke checks passed"
