---
description: Recommend and install MCP servers based on project tech stack. Use when user wants to add MCP servers, search for MCP integrations, or asks to install MCP tools.
---

# MCP Config Installer

<core_approach>

- Detect tech stack → run **one inline script** that loops all keywords against PulseMCP → present a table that includes **Est. Visitors** + auto-recommendations → user picks → run **one inline script** per selected slug that pulls `<slug>/serverjson` and emits the opencode.json fragment → only then create/merge `opencode.json`.
- No intermediate files. No `webfetch`. No GitHub unless the server's `/serverjson` is empty.

</core_approach>

<workflow>

## 1. Detect tech stack

Glob/grep `package.json`, `pom.xml`, `requirements.txt`, `Cargo.toml`, `go.mod`, `pyproject.toml`, framework configs. Pick 3-5 core keywords (frameworks, databases, cloud, etc).

## 2. Target file — read only

Check whether `<project-root>/opencode.json` (or `.jsonc`) exists. **Do not create it yet** — the user might cancel before picking any MCP.

If it exists, read it so you can merge without overwriting existing `mcp` keys. Note any servers that already exist for the keywords you detected (you'll want to skip those when recommending).

## 3. Search — inline script, all keywords

Run this directly. It calls PulseMCP for every keyword, parses each result page in one Python pass, and emits a TSV (no `/tmp/` files):

```bash
python3 - mysql postgres redis github docker <<'PY'
import sys, re, urllib.request, urllib.parse

KEYWORDS = sys.argv[1:]
UA = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'
BASE = 'https://www.pulsemcp.com'

card_re = re.compile(
    r'data-test-id="mcp-server-grid-card-idx-\d+-slug-([a-z0-9-]+)"(.*?)(?=data-test-id="mcp-server-grid-card-idx-|\Z)',
    re.S,
)
name_re = re.compile(r'<h3[^>]*>\s*([^<]+?)\s*</h3>', re.S)
desc_re = re.compile(r'class="text-15 text-pulse-black leading-relaxed"\s*>\s*([^<]+?)\s*<', re.S)
vis_re  = re.compile(r'Est\s*Visitors\s*\(Week\)\s*</p>\s*<p[^>]*>\s*(\S+?)\s*<', re.S | re.I)

print('keyword\tslug\tname\test_visitors\tdescription')
for kw in KEYWORDS:
    url = f'{BASE}/servers?q=' + urllib.parse.quote_plus(kw)
    try:
        req = urllib.request.Request(url, headers={'User-Agent': UA, 'Accept': 'text/html,*/*;q=0.8'})
        html = urllib.request.urlopen(req, timeout=20).read().decode('utf-8', errors='replace')
    except Exception as e:
        print(f'{kw}\t-\t-\t-\tfetch error: {e}', file=sys.stderr)
        continue
    seen = set()
    for slug, body in card_re.findall(html):
        if slug in seen: continue
        seen.add(slug)
        nm = name_re.search(body); ds = desc_re.search(body); vs = vis_re.search(body)
        name = (nm.group(1) if nm else '').strip()
        desc = re.sub(r'\s+', ' ', (ds.group(1) if ds else '').replace('&#39;', "'").replace('&quot;', '"').replace('&amp;', '&'))[:200]
        vis  = (vs.group(1) if vs else '—').strip()
        print(f'{kw}\t{slug}\t{name}\t{vis}\t{desc}')
PY
```

Dedupe the TSV by `slug` (one card per server, even if it matched multiple keywords).

## 4. Display + auto-recommend

Show one compact table per category (Dev Tools, Databases, Cloud, Other). Always include **Est. Visitors** as a ranking signal:

| # | MCP | Type | Free | Est. Visitors | Description |
|---|-----|------|------|---------------|-------------|
| 1 | benborla-mysql | local | ✅ | 1.9k | Read-only MySQL via JDBC |

**Free rules:** ✅ = npx-installable npm package or public GitHub repo with no paid tier. 💰 = needs API key or subscription. ⚠️ = unknown — mark and ask.

Immediately after the table, print a **Recommended** block. This is the proposal — the table is just background data. The block is **dynamic**: it can be 0, 1, or many. Don't pad it.

```
Recommended install (3):
  ✅ postgres        — official modelcontextprotocol/postgres, 77.3k visitors, free
  ✅ mysql           — benborla-mysql, 1.9k visitors, free (note: /serverjson is a stub, will need GitHub fallback)
  ✅ github          — official, 12.6k visitors, requires GITHUB token

Skip:
  • freepeak-db-connector (216) — already overlaps with the postgres + mysql picks above
  • 17 other MySQL servers under 100 visitors — niche / unmaintained, no clear advantage

Needs your call (❓):
  • upstash-redis (411, 💰) — paid Redis Cloud, skip if you don't use Upstash
  • redis (2.6k, ✅) — official Redis, but you didn't mention Redis in the stack
```

Or, when nothing qualifies:

```
Recommended install (0):

Nothing in the search results actually matches a real dependency in this project. Either the PulseMCP catalog is thin for this stack, or the top-visitor picks are all duplicates of existing MCPs.

If you want me to try harder, give me a more specific keyword (e.g. "spring-data-jpa" instead of "spring").
```

**Strong install** rules — a server earns a ✅ only if **all** of these hold:
- It matches a real dependency in the tech stack (not a fuzzy keyword hit — e.g. searching `spring` shouldn't auto-recommend `spring-boot-cli` if the project doesn't use Spring Boot CLI).
- It's free, OR paid with a clear payoff the project actually needs.
- It's not already in `opencode.json`.
- It has a non-`—` visitor count, OR a strong community signal (official badge, top-of-page placement, widely-cited GitHub repo).
- It doesn't functionally duplicate a higher-ranked pick for the same keyword.

If no candidate satisfies all five, the **Recommended** list is empty. That's a valid outcome — say so, don't pad.

**Skip** rules (note them in plain text, don't list as options):
- Fails any of the five checks above.
- Functionally duplicates a higher-ranked pick for the same keyword.

**Needs your call (❓)** — servers that almost qualify but have a trade-off the user should weigh:
- 💰 paid servers.
- Free servers that match the keyword but not the actual stack usage (e.g. user said "Java" but the top pick is for JVM build tools, not Java itself).

## 5. User confirms

Use the `question` tool with **2-4 short options** — never dump the table rows into the question. Adapt to the recommendation count:

**When N ≥ 1 recommended:**
- **"Install all N recommended"** — description: "Installs: <comma-separated slugs>".
- **"Add one more MCP"** — description: "Search for another keyword and fold it into the install list."
- **"See details on each pick"** — description: "Expand each recommended server with its install type and env vars."
- **"Skip — don't install anything"** — description: "End the workflow here."

**When N = 0 recommended:**
- **"Search a more specific keyword"** — description: "e.g. 'spring-data-jpa' instead of 'spring'."
- **"Pick one manually from the table"** — description: "I'll show you the top candidates grouped by category and you choose."
- **"Skip — don't install anything"** — description: "End the workflow here."

**Do not write anything to `opencode.json` yet** — wait for the user to confirm.

If the user picks "Add one more MCP" / "Search a more specific keyword", loop back to step 3 with that single keyword, fold the new candidates into the recommendation, and re-ask this question. If the user picks "See details" / "Pick one manually", print a one-liner per candidate (`type`, free/paid, env vars, visitor count) and re-ask.

## 6. Install — inline script, batched

For all confirmed slugs in **one** call. The script loops internally with a polite 0.3s delay between fetches, prints per-slug WARN lines to stderr, and emits a single JSON object on stdout — real entries keyed by slug, plus a `_needs_github_fallback` map for the slugs PulseMCP has as metadata stubs.

```bash
python3 - github searchcode ckreiling-mcp-server-docker benborla-mysql <<'PY'
import sys, json, urllib.request, time

SLUGS = sys.argv[1:]
UA = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36'

result = {}
fallback = {}

def parse_latest(html):
    i = html.find('"index":0')
    if i < 0: return None
    start = html.find('"data":{', i)
    if start < 0: return None
    depth = 0
    for k in range(start + 7, min(start + 7 + 200000, len(html))):
        if html[k] == '{': depth += 1
        elif html[k] == '}':
            depth -= 1
            if depth == 0: return json.loads(html[start + 7:k + 1])
    return None

def build_entry(data):
    entry = {'enabled': True}
    remotes = data.get('remotes') or []
    packages = data.get('packages') or []
    if remotes:
        r = remotes[0]
        entry['type'] = 'remote'
        entry['url'] = r.get('url')
        headers = {}
        for h in (r.get('headers') or []):
            name = h.get('name', '')
            if h.get('isSecret'):
                env_name = name.upper().replace(' ', '_').replace('-', '_')
                headers[name] = '{env:' + env_name + '}'
        if headers: entry['headers'] = headers
    elif packages:
        p = packages[0]
        rt, ident = p.get('registryType', ''), p.get('identifier', '')
        envs = []
        for ra in p.get('runtimeArguments') or []:
            if ra.get('type') == 'named' and ra.get('name') == '-e':
                v = ra.get('value', '')
                if v and '=' in v: envs.append(v.split('=', 1)[0].lstrip('-e '))
        entry['type'] = 'local'
        if rt == 'npm':   entry['command'] = ['npx', '-y', ident]
        elif rt == 'pypi': entry['command'] = ['uvx', ident]
        elif rt == 'oci':
            cmd = ['docker', 'run', '-i', '--rm']
            for env in envs: cmd += ['-e', env]
            cmd.append(ident)
            entry['command'] = cmd
        if envs:
            entry['environment'] = {e: '{env:' + e + '}' for e in envs}
    return entry if ('type' in entry) else None

for idx, slug in enumerate(SLUGS):
    if idx > 0: time.sleep(0.3)
    try:
        html = urllib.request.urlopen(
            urllib.request.Request(f'https://www.pulsemcp.com/servers/{slug}/serverjson',
                                   headers={'User-Agent': UA, 'Accept': 'text/html,*/*;q=0.8'}),
            timeout=20).read().decode('utf-8', errors='replace')
    except Exception as e:
        print(f'# WARN: {slug} fetch error: {e}', file=sys.stderr)
        fallback[slug] = ''
        continue
    data = parse_latest(html)
    if data is None:
        print(f'# WARN: {slug} has no /serverjson data block', file=sys.stderr)
        fallback[slug] = ''
        continue
    entry = build_entry(data)
    if entry is None:
        repo_url = ((data.get('repository') or {}).get('url') or '').strip()
        print(f'# WARN: {slug} /serverjson is a metadata stub. GitHub: {repo_url}', file=sys.stderr)
        fallback[slug] = repo_url
        continue
    result[slug] = entry

if fallback:
    result['_needs_github_fallback'] = fallback

print(json.dumps(result, indent=2))
PY
```

The stdout looks like this (truncated):

```json
{
  "github": { "enabled": true, "type": "remote", "url": "https://api.githubcopilot.com/mcp/", "headers": { "Authorization": "{env:AUTHORIZATION}" } },
  "searchcode": { "enabled": true, "type": "remote", "url": "https://api.searchcode.com/v1/mcp" },
  "_needs_github_fallback": {
    "ckreiling-mcp-server-docker": "https://github.com/ckreiling/mcp-server-docker",
    "benborla-mysql": "https://github.com/benborla/mcp-server-mysql"
  }
}
```

For each slug in `_needs_github_fallback`, the `/serverjson` page is just a stub — PulseMCP has the slug mirrored but not the install spec. Fetch the README from the printed `repository` URL, find the install command, and add it manually. Common cases: `npx -y <pkg>` for npm, `uvx <pkg>` for PyPI, `docker run -i --rm <image>` for OCI.

## 7. Merge — only now create `opencode.json`

From the JSON object returned by step 6:

- For each **real entry** (any top-level key except `_needs_github_fallback`):
  - Pick a kebab-case key (the slug, e.g. `postgres`, `gh_grep`). Override only if it collides with an existing key.
  - **Skip if the key already exists** in `opencode.json` — never overwrite.
  - Append to the `mcp` block.
- For the **`_needs_github_fallback` map** (if present):
  - Visit each `repository` URL, read the README, synthesize the install command (npm → `npx -y <pkg>`, PyPI → `uvx <pkg>`, OCI → `docker run -i --rm <image>`, etc.).
  - Add the synthesized entry to the `mcp` block, same kebab-case + skip-if-exists rules.

If `opencode.json` doesn't exist, create it now with this minimum:

```jsonc
{
  "$schema": "https://opencode.ai/config.json",
  "mcp": {}
}
```

Preserve `$schema`, comments, and any other top-level fields from the existing file.

## 8. Verify

- `opencode mcp list` to confirm all servers load.
- For OAuth-supporting remotes, remind the user: `opencode mcp auth <name>`.
- Summarize: file edited, each new key, env vars to set, secrets NOT hardcoded (all use `{env:VAR}`).

</workflow>

<reference>

## PulseMCP URL patterns

| Use | URL | Notes |
|-----|-----|-------|
| Search | `pulsemcp.com/servers?q=<kw>` | HTML list — parse for slug + est visitors |
| Latest install spec | `pulsemcp.com/servers/<slug>/serverjson` | HTML diff viewer; first `"index":0,"data":{...}` block is latest |
| Detail (fallback) | `pulsemcp.com/servers/<slug>` | Use when `/serverjson` has no packages/remotes |

## Pitfalls — do **not** do these

- **Do not** use `webfetch` for PulseMCP — flagged as server-to-server.
- **Do not** add `sec-ch-ua` / `sec-fetch-*` headers.
- **Do not** send `Accept-Encoding: gzip` without `--compressed`.
- **Do not** try `mcpmarket.com` — Vercel Security Checkpoint, JS challenge required.
- **Do not** omit the User-Agent — the server returns an empty page.
- **Do not** write to `opencode.json` before the user confirms which MCPs to install.
- **Do not** run `curl` manually per keyword — use the inline script.
- **Do not** save the script to `/tmp/` — both scripts are designed to run inline.
- **Do not** overwrite an existing `mcp` key — pick a different kebab-case name instead.

## User-Agent fallbacks (if Chrome is rate-limited)

```
"Mozilla/5.0 (X11; Linux x86_64; rv:125.0) Gecko/20100101 Firefox/125.0"
"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15"
```

</reference>

<examples>

**Input:** "I want to add database MCPs to my project"
**Output:** Detects `postgresql`, `mysql`, `redis` from `pom.xml`. Runs the inline search with those 3 keywords. Shows a compact Databases table (top 10), then prints the **Recommended (2)** block: ✅ `modelcontextprotocol-postgres` (77.3k), ✅ `benborla-mysql` (1.9k, with the stub-fallback note). `upstash-redis` lands in ❓ (💰), not in Recommended. Asks the N≥1 question: "Install all 2 recommended" / "Add one more MCP" / "See details" / "Skip". User picks "Install all 2 recommended". Runs the **batched** install script with both slugs in one call — gets back `modelcontextprotocol-postgres` as a real entry and `benborla-mysql` under `_needs_github_fallback` (handled by fetching its GitHub README). **Only now** creates/merges `opencode.json`. Reminds the user to set `POSTGRES_URL` and `MYSQL_*`.

**Input:** "install an MCP for GitHub"
**Output:** Runs search with `github`. Recommended block: ✅ `github` (12.6k, requires token). Asks the N≥1 question. User picks "Install all 1 recommended". Runs the batched install script with `github` as the only arg. Gets back a clean `type: remote` entry. Merges into `opencode.json` and reminds user to set `AUTHORIZATION` and run `opencode mcp auth github`.

**Input:** "add an MCP for WebAssembly" (no real match in PulseMCP)
**Output:** Runs search with `webassembly`. Prints the full table (mostly `—` visitors, nothing official), then **Recommended (0)**: "Nothing in the search results actually matches a real dependency in this project. The top-visitor picks are all niche / no clear community signal." Asks the N=0 question: "Search a more specific keyword" / "Pick one manually" / "Skip". User picks "Skip". Workflow ends, `opencode.json` is not touched.

</examples>
