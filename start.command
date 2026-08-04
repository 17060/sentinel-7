#!/bin/zsh
# SENTINEL-7 launcher — serves the dashboard over localhost so every
# feed (including proxied market/conflict data) works, then opens it.
cd "$(dirname "$0")"
PORT=7700
if ! lsof -iTCP:$PORT -sTCP:LISTEN >/dev/null 2>&1; then
  nohup python3 -m http.server $PORT >/dev/null 2>&1 &
  sleep 1
fi
open "http://localhost:$PORT/index.html"
