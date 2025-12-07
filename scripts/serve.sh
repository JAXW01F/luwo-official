#!/usr/bin/env bash
set -euo pipefail

PORT="${PORT:-8000}"
LOG_FILE="${LOG_FILE:-.server.log}"
MODE="foreground"

usage() {
  cat <<'USAGE'
Usage: scripts/serve.sh [--daemon] [--port <port>]

Options:
  --daemon        Run the server in the background (pid stored in .server.pid)
  --port <port>   Override the port (default: 8000 or $PORT)
  --help          Show this help text

Environment:
  PORT            Port to bind (takes precedence over --port when both set)
  LOG_FILE        Log file path when running in daemon mode (default: .server.log)
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --daemon)
      MODE="daemon"
      shift
      ;;
    --port)
      PORT="$2"
      shift 2
      ;;
    --help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage
      exit 1
      ;;
  esac
done

if [[ -z "$PORT" ]]; then
  echo "Port cannot be empty" >&2
  exit 1
fi

if [[ "$MODE" == "daemon" ]]; then
  nohup python -m http.server "$PORT" --bind 0.0.0.0 >"$LOG_FILE" 2>&1 &
  SERVER_PID=$!
  echo "$SERVER_PID" > .server.pid
  echo "Server running in background on http://0.0.0.0:$PORT (pid: $SERVER_PID)"
  echo "Logs: $LOG_FILE"
else
  echo "Serving on http://localhost:$PORT (press Ctrl+C to stop)"
  python -m http.server "$PORT" --bind 0.0.0.0
fi
