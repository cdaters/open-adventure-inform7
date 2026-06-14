#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

required=(
  "$ROOT_DIR/generated/Rooms.ni"
  "$ROOT_DIR/generated/Objects.ni"
  "$ROOT_DIR/generated/Vocabulary.ni"
  "$ROOT_DIR/generated/Travel.ni"
)

for f in "${required[@]}"; do
  if [ ! -f "$f" ]; then
    echo "missing generated file: $f" >&2
    exit 1
  fi
done

if [ -d "$ROOT_DIR/OpenAdventure.inform" ]; then
  if [ -n "${OPENADVENTURE_BUILD_ARTIFACT:-}" ]; then
    artifact="$OPENADVENTURE_BUILD_ARTIFACT"
  else
    case "${OPENADVENTURE_INFORM_FORMAT:-Inform6/16}" in
      Inform6/32|Glulx|glulx)
        artifact="$ROOT_DIR/OpenAdventure.inform/Build/OpenAdventure.ulx"
        ;;
      *)
        artifact="$ROOT_DIR/OpenAdventure.inform/Build/OpenAdventure.z8"
        ;;
    esac
  fi
  if [ -f "$artifact" ]; then
    case "$artifact" in
      *.z[1-8]|*.Z[1-8])
        version="$(od -An -tu1 -N1 "$artifact" | tr -d '[:space:]')"
        if [ -n "$version" ] && [ "$version" -ge 1 ] && [ "$version" -le 8 ]; then
          echo "build artifact is valid Z-machine story data"
          exit 0
        fi
        echo "invalid Z-machine artifact header: $artifact" >&2
        exit 1
        ;;
      *.ulx|*.ULX)
        magic="$(head -c 4 "$artifact")"
        if [ "$magic" = "Glul" ]; then
          echo "build artifact is valid Glulx story data"
          exit 0
        fi
        echo "invalid Glulx artifact header: $artifact" >&2
        exit 1
        ;;
    esac
  fi
fi

echo "configured story artifact not present; artifact check skipped"
exit 0
