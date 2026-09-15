---
name: rename-session
description: Suggest a descriptive title capturing the ENTIRE conversation's theme and rename the CURRENT opencode TUI session via the local server API. Use whenever the user asks to rename this session, give this session a better name, title this conversation, or says "rename session" / "name this session" / "fix the session title" — including when the current session still shows a placeholder like "New session - <timestamp>". Runs as a subagent via /auto-rename.
compatibility: opencode
---

<core_approach>

The current session cannot be looked up from env vars alone — the bundled scripts find the running opencode server, pick the most recently updated session in the current directory (that's the live one, since the user just sent a message), and extract its first user message. Your job: read the context, coin a good title, and rename it through the script. Never rename a session by guessing its ID or touching other sessions.

</core_approach>

<workflow>

1. Run the context script and parse its three tab-separated fields (session ID, current title, first user message snippet):

   ```bash
   bash scripts/get_current_session.sh "$PWD"
   ```

   (script paths are relative to this skill's directory; pass the project directory explicitly if shell startup changes `$PWD`)

2. Generate a title representing the ENTIRE conversation, not just its most recent activity:
   - Start from the first user message — that's usually the session's original intent and the strongest signal for the overall theme.
   - Then consider the broader arc of what happened since (major topics, the through-line of the work). Weigh recent activity only if the session genuinely pivoted to a new dominant theme.
   - If a conversation summary is available in your context, factor it in as the conversation's arc.
   - Example of the anti-pattern: a session that started as "is this project worth installing?" and later installed plugins should NOT be titled after the last plugin fix — it should be something like `Evaluating And Installing Kickstart.opencode`.
   - Aim for 3-6 words, natural descriptive case, no quotes, no trailing period. Prefer substance over cleverness — the title should remind the user 2 weeks later what the session was fundamentally about.

3. Rename:

   ```bash
   bash scripts/rename_session.sh "<sessionID>" "<suggested title>"
   ```

4. Report the new title to the user. If the user asks for alternatives, generate 2-3 and rename again with their pick.

If the script errors with "no opencode server found", no TUI is listening — tell the user, don't improvise with other tools.

</workflow>

<reference>

- Server API: the scripts talk to opencode's local REST server (`/session`, `/session/{id}`, `/session/{id}/message`, `PATCH /session/{id}` with body `{"title": "..."}`).
- "Current session" heuristic: most recently updated session for the current directory. This assumes the user asks to rename the session they are actively chatting in — true for this skill's trigger cases.
- Example titles: `Debug opencode title agent`, `Implement BinaryLifter Query`, `Create dotfiles rename skill` — not: `Opencode Session Work` or `Fixing Things`.

</reference>

<examples>

Input: "rename this session" → run script → first message: "debug why new sessions aren't renamed" → rename to `Debug Opencode Session Titles`.

Input: "/rename to my-config experiments" → user supplied a name → skip generating, rename directly to what they gave (trim to a reasonable length).

</examples>

<quality_checklist>

- [ ] Session ID came from the script output, not guessed
- [ ] Title reflects the whole conversation's theme, not the latest activity
- [ ] PATCH confirmed ("renamed ..." line) before reporting success
- [ ] Only the current session was touched

</quality_checklist>
