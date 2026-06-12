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
  if find "$ROOT_DIR/OpenAdventure.inform/Build" -type f \( -name '*.z8' -o -name '*.z5' -o -name '*.ulx' \) | grep -q .; then
    echo "build artifact exists"
    exit 0
  fi
fi

echo "compile not wired yet; artifact check skipped"
exit 0
