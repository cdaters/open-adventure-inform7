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

if [ ! -f "$ROOT_DIR/generated/Travel.ni" ]; then
  echo "[smoke] generated travel table missing: $ROOT_DIR/generated/Travel.ni" >&2
  exit 1
fi

require_line '138 "LOC_LONGWEST" "goto" "goto_conditional" "LOC_DIFFERENT1"' "$ROOT_DIR/generated/Travel.ni"
require_line '"nodwarves"' "$ROOT_DIR/generated/Travel.ni"
require_line 'dwarf-avoidance predicate is implemented in hand-written dwarf logic' "$ROOT_DIR/generated/Travel.ni"

require_line 'To decide whether openadventure-dwarf-route is forbidden' "$ROOT_DIR/OpenAdventure_Dwarves.ni"
require_line 'openadventure-nodwarves-mode' "$ROOT_DIR/OpenAdventure_Dwarves.ni"
require_line 'To decide whether openadventure nodwarves traversal from source-location' "$ROOT_DIR/OpenAdventure_Dwarves.ni"
require_line 'To decide whether openadventure-dwarf-blocks-travel' "$ROOT_DIR/OpenAdventure_Dwarves.ni"

require_line 'To decide whether condition (condition-kind - text) with arg1 (arg1 - text) and arg2 (arg2 - text) chance (chance - number) holds in source location (source-room - room)' "$ROOT_DIR/OpenAdventure_Conditions.ni"
require_line 'openadventure nodwarves traversal' "$ROOT_DIR/OpenAdventure_Conditions.ni"
require_line 'openadventure-dwarf-route is forbidden' "$ROOT_DIR/OpenAdventure_Dwarves.ni"

require_line 'openadventure-active-source-loc' "$ROOT_DIR/OpenAdventure_Runtime.ni"
require_line 'openadventure-active-travel-result' "$ROOT_DIR/OpenAdventure_Runtime.ni"
require_line 'Include "OpenAdventure_Dwarves.ni"' "$ROOT_DIR/OpenAdventure.ni"

log "dwarf travel integration smoke checks passed"
