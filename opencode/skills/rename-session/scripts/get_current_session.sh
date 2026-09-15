#!/usr/bin/env bash
# Prints "<sessionID>\t<title>\t<first-user-message>[\tmsgN=<later-user-message>]"
# for the most recently updated opencode session (excluding subagent/child
# sessions) in the given directory. Later user messages help the caller name the
# session after its whole arc, not just the opening request.
# Exits 1 if no server/session found.
set -euo pipefail

DIR="${1:-$PWD}"

# Find a local opencode server that responds for this directory
BASE=""
for port in $(ss -tlnp 2>/dev/null | grep 'opencode' | grep -oP '127\.0\.0\.1:\K\d+' | sort -u); do
	if curl -sf -m2 -G "http://127.0.0.1:$port/session" --data-urlencode "directory=$DIR" > /tmp/opencode-rename-sessions.json 2>/dev/null; then
		BASE="http://127.0.0.1:$port"
		break
	fi
done
if [ -z "$BASE" ]; then
	echo "ERROR: no opencode server found" >&2
	exit 1
fi

# Most recently updated session in this directory = the current one
ID=$(python3 - <<'EOF'
import json, os
try:
    ss = json.load(open('/tmp/opencode-rename-sessions.json'))
except Exception:
    raise SystemExit(1)
# exclude subagent/child sessions (they have a parentID) so the script never
# renames the session the skill is running in instead of the user's session
ss = [s for s in ss if not s.get('parentID')]
ses = max(ss, key=lambda s: s.get('time', {}).get('updated', 0))
print(ses['id'])
EOF
)

curl -sf "$BASE/session/$ID/message" > /tmp/opencode-rename-msg.json

python3 - <<EOF
import json
id = "$ID"
sessions = json.load(open('/tmp/opencode-rename-sessions.json'))
title = next((s.get('title', '') for s in sessions if s.get('id') == id), '')
ms = json.load(open('/tmp/opencode-rename-msg.json'))
user_msgs = []
for m in ms:
    if m.get('info', {}).get('role') == 'user':
        txt = ' '.join(p.get('text', '') for p in m.get('parts', []) if p.get('type') == 'text')
        txt = ' '.join(txt.split())
        if txt:
            user_msgs.append(txt[:250])
# first message (primary descriptor) plus up to 3 more (conversation arc)
out = [id, title, user_msgs[0] if user_msgs else '']
for i, t in enumerate(user_msgs[1:4], 1):
    out.append(f'msg{i}={t}')
print('\t'.join(out))
EOF
