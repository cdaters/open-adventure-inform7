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

require_line 'Include "OpenAdventure_Information.ni"' "$ROOT_DIR/OpenAdventure.ni"
require_line 'OpenAdventure_Information.ni' "$ROOT_DIR/build.sh"

require_line 'The openadventure-subsystem-information is a truth state that varies.' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'The openadventure-information-startup-presented is a truth state that varies.' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'The openadventure-information-last-section is a text that varies.' "$ROOT_DIR/OpenAdventure_State.ni"
require_line 'To enable subsystem information' "$ROOT_DIR/OpenAdventure_Runtime.ni"

require_line 'To display openadventure startup presentation' "$ROOT_DIR/OpenAdventure_Information.ni"
require_line 'Welcome to Adventure!' "$ROOT_DIR/OpenAdventure_Information.ni"
require_line '(Please type HELP for instructions and information.)' "$ROOT_DIR/OpenAdventure_Information.ni"
require_line 'To display openadventure help menu' "$ROOT_DIR/OpenAdventure_Information.ni"
require_line 'Instructions for Playing' "$ROOT_DIR/OpenAdventure_Information.ni"
require_line 'Historical Background' "$ROOT_DIR/OpenAdventure_Information.ni"
require_line 'Open Adventure' "$ROOT_DIR/OpenAdventure_Information.ni"
require_line 'About This Edition' "$ROOT_DIR/OpenAdventure_Information.ni"
require_line 'Credits' "$ROOT_DIR/OpenAdventure_Information.ni"
require_line 'Version Information' "$ROOT_DIR/OpenAdventure_Information.ni"

require_line 'Understand "help" as oahelping.' "$ROOT_DIR/OpenAdventure_Information.ni"
require_line 'After reading a command when openadventure-subsystem-information is true' "$ROOT_DIR/OpenAdventure_Information.ni"
require_line 'Understand "about" as oaabouting.' "$ROOT_DIR/OpenAdventure_Information.ni"
require_line 'Understand "info" as oainfoing.' "$ROOT_DIR/OpenAdventure_Information.ni"
require_line 'Understand "news" as oanewsing.' "$ROOT_DIR/OpenAdventure_Information.ni"
require_line 'Understand "version" as oaversioning.' "$ROOT_DIR/OpenAdventure_Information.ni"

require_line 'Original Adventure: William Crowther and Don Woods.' "$ROOT_DIR/OpenAdventure_Information.ni"
require_line 'Open Adventure: Eric S. Raymond and contributors.' "$ROOT_DIR/OpenAdventure_Information.ni"
require_line 'Inform 7 implementation: Craig Daters and contributors.' "$ROOT_DIR/OpenAdventure_Information.ni"
require_line 'BSD 2-Clause License' "$ROOT_DIR/OpenAdventure_Information.ni"
require_line 'https://github.com/cdaters/open-adventure-inform7' "$ROOT_DIR/OpenAdventure_Information.ni"
require_line 'http://www.catb.org/esr/open-adventure/' "$ROOT_DIR/OpenAdventure_Information.ni"

log "information subsystem smoke checks passed"
