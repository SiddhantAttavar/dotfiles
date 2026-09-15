#!/usr/bin/env bash
# Renames an opencode session: rename_session.sh <sessionID> "<new title>"
set -euo pipefail

ID="${1:?usage: rename_session.sh <sessionID> <title>}"
TITLE="${2:?usage: rename_session.sh <sessionID> <title>}"
shift 2

# Find a local opencode server
BASE=""
for port in $(ss -tlnp 2>/dev/null | grep 'opencode' | grep -oP '127\.0\.0\.1:\K\d+' | sort -u); do
	if curl -sf -m2 "http://127.0.0.1:$port/session/$ID" > /dev/null 2>&1; then
		BASE="http://127.0.0.1:$port"
		break
	fi
done
if [ -z "$BASE" ]; then
	echo "ERROR: no opencode server found" >&2
	exit 1
fi

BODY=$(python3 -c 'import json,sys; print(json.dumps({"title": sys.argv[1]}))' "$TITLE")

curl -sf -X PATCH "$BASE/session/$ID" -H "Content-Type: application/json" -d "$BODY" > /dev/null
echo "renamed $ID -> $TITLE"
