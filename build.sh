#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ARTIFACT_DIR="$ROOT_DIR/build"
LOG_FILE="$ARTIFACT_DIR/build.log"
PROJECT_DIR="${OPENADVENTURE_INFORM_PROJECT:-$ROOT_DIR/OpenAdventure.inform}"
PROJECT_SOURCE_FILE="$PROJECT_DIR/Source/OpenAdventure.generated.ni"
PROJECT_DEFAULT_ARTIFACT="$PROJECT_DIR/Build/OpenAdventure.z8"
PROJECT_DEFAULT_FORMAT="Inform6/16"
INFORM_BIN_ARG="${OPENADVENTURE_INFORM_BIN:-}"
INFORM_RESOURCES_HINT="${OPENADVENTURE_INFORM_RESOURCES:-/Applications/Inform.app/Contents/Resources}"
INFORM_FORMAT="${OPENADVENTURE_INFORM_FORMAT:-$PROJECT_DEFAULT_FORMAT}"
NI_BIN_ARG="${OPENADVENTURE_NI_BIN:-}"
CBLORB_BIN_ARG="${OPENADVENTURE_CBLORB_BIN:-}"
BUILD_ARTIFACT="${OPENADVENTURE_BUILD_ARTIFACT:-$PROJECT_DEFAULT_ARTIFACT}"

GENERATE=1
COMPILE=0
PACKAGE=0
GENERATE_ONLY=0
CLEAN=0

usage() {
  cat <<'USAGE'
Usage: ./build.sh [options]

Options:
  --generate-only   Regenerate source from adventure.yaml only
  --compile         Compile Inform project after generation
  --package         Package compiled output with cBlorb after compile
  --project PATH    Override Inform project directory
  --artifact PATH   Override expected output artifact path
  --clean           Remove build artifacts before running
  -h, --help       Show this message

Environment overrides:
  OPENADVENTURE_INFORM_BIN       Inform/ni compiler binary
  OPENADVENTURE_INFORM_RESOURCES  Inform Resources directory
  OPENADVENTURE_INFORM_FORMAT    Format passed to Inform compiler (default: Inform6/16)
  OPENADVENTURE_NI_BIN           ni compiler binary
  OPENADVENTURE_CBLORB_BIN       cBlorb binary
  OPENADVENTURE_INFORM_PROJECT    Inform project directory
  OPENADVENTURE_BUILD_ARTIFACT    Expected output artifact path
USAGE
}

resolve_binary() {
  local name="$1"
  local explicit="$2"
  if [ -n "$explicit" ] && [ -x "$explicit" ]; then
    echo "$explicit"
    return
  fi

  local candidates=(
    "$name"
    "/Applications/Inform.app/Contents/MacOS/$name"
    "/Applications/Inform.app/Contents/MacOS/ni"
    "/Applications/Inform.app/Contents/MacOS/Inform"
  )

  for candidate in "${candidates[@]}"; do
    if command -v "$candidate" >/dev/null 2>&1; then
      echo "$candidate"
      return
    fi
    if [ -x "$candidate" ] && [ "$candidate" != "$name" ]; then
      echo "$candidate"
      return
    fi
  done

  return 1
}

resolve_inform_resources() {
  if [ -n "$INFORM_RESOURCES_HINT" ] && [ -d "$INFORM_RESOURCES_HINT" ]; then
    echo "$INFORM_RESOURCES_HINT"
    return 0
  fi

  if [ -n "$INFORM_BIN" ] && [ -x "$INFORM_BIN" ]; then
    local candidate="$(dirname "$(dirname "$INFORM_BIN")")/Resources"
    if [ -d "$candidate" ]; then
      echo "$candidate"
      return 0
    fi
  fi

  if [ -d "/Applications/Inform.app/Contents/Resources" ]; then
    echo "/Applications/Inform.app/Contents/Resources"
    return 0
  fi

  return 1
}

run_generator() {
  mkdir -p "$ARTIFACT_DIR"
  {
    echo "[build] generating Inform sources from source/adventure.yaml"
    python3 "$ROOT_DIR/tools/yaml2inform.py"
  } 2>&1 | tee -a "$LOG_FILE"
}

compose_source() {
  mkdir -p "$(dirname "$PROJECT_SOURCE_FILE")"

  prepare_travel_file() {
    awk '
      function trim(text) {
        sub(/^[[:space:]]+/, "", text)
        sub(/[[:space:]]+$/, "", text)
        return text
      }

      function split_quoted(line, fields,    n, rest, start, len, token) {
        n = 0
        rest = line
        while (match(rest, /"[^"]*"|[^[:space:]]+/)) {
          token = substr(rest, RSTART, RLENGTH)
          n++
          fields[n] = token
          rest = substr(rest, RSTART + RLENGTH)
        }
        return n
      }

      function emit_row(line) {
        line = trim(line)
        if (line == "") {
          return
        }
        sub(/[.,]$/, "", line)
        n = split_quoted(line, fields)
        if (n < 2) {
          return
        }
        printf "%s", fields[1]
        for (i = 2; i <= n; i++) {
          printf "\t%s", fields[i]
        }
        print ""
      }

      BEGIN { in_table = 0; saw_table_name = 0; saw_header = 0 }

      {
        if (in_table == 0) {
          if ($0 == "[ Non-direct dispatch metadata table ]") {
            in_table = 1
            next
          }
          print $0
          next
        }

        if (in_table == 1) {
          if ($0 == "Table of Generated Travel Non-Direct Rules") {
            print $0
            saw_table_name = 1
            in_table = 2
          }
          next
        }

        if (in_table == 2 && saw_table_name == 1) {
          if ($0 ~ /^rule-id[[:space:]]/) {
            header = trim($0)
            gsub(/ \([^)]+\)/, "", header)
            gsub(/[[:space:]]+/, "\t", header)
            print header
            saw_header = 1
            next
          }
          if (saw_header == 1 && $0 !~ /^$/) {
            emit_row($0)
          }
        }
      }
    ' "$ROOT_DIR/generated/Travel.ni"
  }

  prepare_rooms_file() {
    sed \
      -e 's/^The short description of /The printed name of /' \
      -e 's/\[sic\]/[bracket]sic[close bracket]/g' \
      -e 's/\[Witt Construction Company\]/[bracket]Witt Construction Company[close bracket]/g' \
      "$ROOT_DIR/generated/Rooms.ni"
  }

  prepare_objects_file() {
    awk '
      {
        if ($0 == "[ DOOR ]") {
          in_door_block = 1
          print $0
          next
        }
        if ($0 ~ /^\[[[:space:]]*[A-Z0-9_]+[[:space:]]*\]$/ && in_door_block == 1 && $0 != "[ DOOR ]") {
          in_door_block = 0
        }

        if (in_door_block == 1) {
          if ($0 == "DOOR is a thing.") {
            print "The door object is a thing."
            next
          }
          if ($0 ~ /DOOR/) {
            gsub("DOOR", "the door object", $0)
            print $0
            next
          }
        }

        print $0
      }
    ' "$ROOT_DIR/generated/Objects.ni"
  }

  {
    sed '/^Include /d' "$ROOT_DIR/OpenAdventure.ni"

    local generated_file
    {
      prepare_rooms_file
      prepare_objects_file
      cat "$ROOT_DIR/generated/Vocabulary.ni"
    }
      echo ""

    prepare_travel_file

    local runtime_file
    for runtime_file in "$ROOT_DIR/OpenAdventure_State.ni" "$ROOT_DIR/OpenAdventure_Conditions.ni" "$ROOT_DIR/OpenAdventure_Plover.ni" "$ROOT_DIR/OpenAdventure_Troll.ni" "$ROOT_DIR/OpenAdventure_Bear.ni" "$ROOT_DIR/OpenAdventure_Dwarves.ni" "$ROOT_DIR/OpenAdventure_Pirate.ni" "$ROOT_DIR/OpenAdventure_Scoring.ni" "$ROOT_DIR/OpenAdventure_Reincarnation.ni" "$ROOT_DIR/OpenAdventure_Dragon.ni" "$ROOT_DIR/OpenAdventure_CaveClosing.ni" "$ROOT_DIR/OpenAdventure_Endgame.ni" "$ROOT_DIR/OpenAdventure_Information.ni" "$ROOT_DIR/OpenAdventure_Runtime.ni"; do
      echo ""
      cat "$runtime_file"
    done
  } > "$PROJECT_SOURCE_FILE"
}

run_compile() {
  local inform_bin="$1"
  local inform_resources="$2"

  if [ ! -d "$PROJECT_DIR" ]; then
    echo "[build] error: Inform project missing: $PROJECT_DIR" >&2
    return 1
  fi

  compose_source
  mkdir -p "$(dirname "$BUILD_ARTIFACT")"
  echo "[build] compiling Inform source from: $PROJECT_SOURCE_FILE"
  "$inform_bin" -at "$inform_resources" -source "$PROJECT_SOURCE_FILE" -release -format="$INFORM_FORMAT" -o "$BUILD_ARTIFACT"
}

run_package() {
  local cblorb_bin="$1"

  if [ ! -d "$PROJECT_DIR" ]; then
    echo "[build] error: Inform project missing: $PROJECT_DIR" >&2
    return 1
  fi

  if [ ! -f "$BUILD_ARTIFACT" ]; then
    echo "[build] error: package requested without built artifact: $BUILD_ARTIFACT" >&2
    return 1
  fi

  if [ -f "$PROJECT_DIR/Release.blurb" ]; then
    echo "[build] packaging via cBlorb project release"
    "$cblorb_bin" -project "$PROJECT_DIR"
    return 0
  fi

  echo "[build] packaging skipped: no Release.blurb found in project" >&2
  return 1
}

find_artifact() {
  if [ -n "$BUILD_ARTIFACT" ] && [ -f "$BUILD_ARTIFACT" ]; then
    echo "$BUILD_ARTIFACT"
    return 0
  fi

  if [ -d "$PROJECT_DIR/Build" ]; then
    local artifact
    artifact="$(find "$PROJECT_DIR/Build" -type f \( -name '*.z8' -o -name '*.z5' -o -name '*.ulx' \) | head -n 1)"
    if [ -n "$artifact" ]; then
      echo "$artifact"
      return 0
    fi
  fi

  return 1
}

mkdir -p "$ARTIFACT_DIR"
: > "$LOG_FILE"

while (($# > 0)); do
  case "$1" in
    --generate-only)
      GENERATE_ONLY=1
      ;;
    --compile)
      COMPILE=1
      ;;
    --package)
      PACKAGE=1
      ;;
    --project)
      if [ $# -lt 2 ]; then
        echo "Missing argument for --project" >&2
        usage
        exit 1
      fi
      PROJECT_DIR="$2"
      PROJECT_SOURCE_FILE="$PROJECT_DIR/Source/OpenAdventure.generated.ni"
      PROJECT_DEFAULT_ARTIFACT="$PROJECT_DIR/Build/OpenAdventure.z8"
      if [ -z "${OPENADVENTURE_BUILD_ARTIFACT:-}" ]; then
        BUILD_ARTIFACT="$PROJECT_DEFAULT_ARTIFACT"
      fi
      shift
      ;;
    --artifact)
      if [ $# -lt 2 ]; then
        echo "Missing argument for --artifact" >&2
        usage
        exit 1
      fi
      BUILD_ARTIFACT="$2"
      shift
      ;;
    --clean)
      CLEAN=1
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage
      exit 1
      ;;
  esac
  shift
done

if [ "$CLEAN" -eq 1 ]; then
  rm -rf "$ARTIFACT_DIR"
  mkdir -p "$ARTIFACT_DIR"
  : > "$LOG_FILE"
fi

run_generator

if [ "$GENERATE_ONLY" -eq 1 ]; then
  echo "[build] complete (generate-only)." | tee -a "$LOG_FILE"
  exit 0
fi

if [ "$COMPILE" -eq 1 ] || [ "$PACKAGE" -eq 1 ]; then
  INFORM_BIN="$(resolve_binary ni "$NI_BIN_ARG")"
  if [ -z "$INFORM_BIN" ]; then
    INFORM_BIN="$(resolve_binary Inform "$INFORM_BIN_ARG")"
  fi

  if [ -z "$INFORM_BIN" ]; then
    echo "[build] error: ni/Inform compiler not found" >&2
    exit 1
  fi

  INFORM_RESOURCES="$(resolve_inform_resources)"
  if [ -z "$INFORM_RESOURCES" ]; then
    echo "[build] error: Inform Resources directory not found" >&2
    exit 1
  fi

  if [ "$COMPILE" -eq 1 ]; then
    if ! run_compile "$INFORM_BIN" "$INFORM_RESOURCES"; then
      echo "[build] compile step failed." | tee -a "$LOG_FILE"
      exit 1
    fi
  fi

if [ "$PACKAGE" -eq 1 ]; then
    CBLORB_BIN="$(resolve_binary cBlorb "$CBLORB_BIN_ARG")"
    if [ -z "$CBLORB_BIN" ]; then
      echo "[build] error: cBlorb not found; install or set OPENADVENTURE_CBLORB_BIN." >&2
      exit 1
    fi
    if ! run_package "$CBLORB_BIN"; then
      echo "[build] package step failed." | tee -a "$LOG_FILE"
      exit 1
    fi
  fi
fi

if [ "$COMPILE" -eq 1 ] || [ "$PACKAGE" -eq 1 ]; then
  artifact_path="$(find_artifact || true)"
  if [ -n "$artifact_path" ]; then
    echo "[build] artifact: $artifact_path" | tee -a "$LOG_FILE"
  else
    echo "[build] warning: no output artifact detected automatically" | tee -a "$LOG_FILE"
  fi
fi

echo "[build] done" | tee -a "$LOG_FILE"
