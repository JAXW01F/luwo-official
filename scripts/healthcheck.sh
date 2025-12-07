#!/usr/bin/env bash
set -euo pipefail

PORT="${PORT:-8000}"
LOG_FILE="${LOG_FILE:-.server.log}"
TMP_DIR="$(mktemp -d)"
SERVER_PID=""

cleanup() {
  if [[ -n "$SERVER_PID" ]]; then
    kill "$SERVER_PID" 2>/dev/null || true
  fi
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

python -m http.server "$PORT" --bind 127.0.0.1 >"$LOG_FILE" 2>&1 &
SERVER_PID=$!

sleep 1

curl -fsS "http://127.0.0.1:$PORT/luwo_landing_page.html" -o "$TMP_DIR/landing.html"
curl -fsS "http://127.0.0.1:$PORT/luwo_interactive_demo.html" -o "$TMP_DIR/demo.html"
curl -fsS "http://127.0.0.1:$PORT/index.html" -o "$TMP_DIR/index.html"

grep -q 'meta name="robots" content="noindex, nofollow"' "$TMP_DIR/landing.html"
grep -q 'meta name="robots" content="noindex, nofollow"' "$TMP_DIR/demo.html"
grep -q 'meta name="robots" content="noindex, nofollow"' "$TMP_DIR/index.html"
grep -q 'luwo_landing_page.html' "$TMP_DIR/index.html"

echo "Health check passed: index redirect, landing, and demo reachable; robots meta present."
