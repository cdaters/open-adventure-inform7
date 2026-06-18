#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source_title_author="$(sed -n '1p' "$ROOT_DIR/OpenAdventure.ni")"
source_headline="$(sed -n '2p' "$ROOT_DIR/OpenAdventure.ni")"
generated_title_author="$(sed -n '1p' "$ROOT_DIR/OpenAdventure.inform/Source/OpenAdventure.generated.ni")"
generated_headline="$(sed -n '2p' "$ROOT_DIR/OpenAdventure.inform/Source/OpenAdventure.generated.ni")"

if [ "$source_title_author" != "$generated_title_author" ]; then
  echo "[smoke] generated project title/author does not match OpenAdventure.ni" >&2
  echo "[smoke] source:    $source_title_author" >&2
  echo "[smoke] generated: $generated_title_author" >&2
  exit 1
fi

if [ "$source_headline" != "$generated_headline" ]; then
  echo "[smoke] generated project headline does not match OpenAdventure.ni" >&2
  echo "[smoke] source:    $source_headline" >&2
  echo "[smoke] generated: $generated_headline" >&2
  exit 1
fi

author_preamble="$(
  cd "$ROOT_DIR"
  python3 - <<'PY'
import sys
sys.path.insert(0, "tools")
import make_author_edition as author

lines = author.source_preamble().splitlines()
print(lines[0])
print(lines[1])
PY
)"

author_title_author="$(printf '%s\n' "$author_preamble" | sed -n '1p')"
author_headline="$(printf '%s\n' "$author_preamble" | sed -n '2p')"

if [ "$source_title_author" != "$author_title_author" ]; then
  echo "[smoke] Author Edition title/author source does not match OpenAdventure.ni" >&2
  echo "[smoke] source: $source_title_author" >&2
  echo "[smoke] author: $author_title_author" >&2
  exit 1
fi

if [ "$source_headline" != "$author_headline" ]; then
  echo "[smoke] Author Edition headline source does not match OpenAdventure.ni" >&2
  echo "[smoke] source: $source_headline" >&2
  echo "[smoke] author: $author_headline" >&2
  exit 1
fi

echo "[smoke] metadata lineage checks passed"
