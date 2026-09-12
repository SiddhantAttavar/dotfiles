
> A well-commented, ready-to-use OpenCode configuration starter that helps you actually understand what's happening.

Inspired by [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) and [oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent).

<div align="center">

[English](README.md) | [简体中文](README.zh-cn.md)

</div>

## Table of contents

- [Philosophy](#philosophy)
- [Quick start](#quick-start)
- [Project structure](#project-structure)
- [How to make it yours](#how-to-make-it-yours)
- [What this is NOT](#what-this-is-not)
- [Plugins](#plugins)
- [MCPs](#mcps)
- [Skills](#skills)
- [Commands](#commands)
- [AGENTS.md](#agentsmd)
- [Agents](#agents)
- [vs oh-my-openagent](#vs-oh-my-openagent)

## Philosophy

Most OpenCode configs (like oh-my-openagent) give you a finished product.
You get power, but you don't understand what's happening or why.

**kickstart.opencode does the opposite:**

- Every file is short and heavily commented
- Every decision is explained, not just shown
- It's a starting point, not a framework
- You're expected to delete things you don't need
- Uses only free models, plugins, and MCPs by default

## Quick start

**Let AI install it for you** (recommended)

Paste this prompt into OpenCode:

```
Read the installation guide and follow it:
https://raw.githubusercontent.com/orionpax1997/kickstart.opencode/refs/heads/main/docs/installation.md
```

**Manual installation**

> ⚠️ If `~/.config/opencode/` already has config, back it up first.

```bash
git clone https://github.com/orionpax1997/kickstart.opencode ~/.config/opencode
```

Then launch OpenCode:

```bash
opencode
```

## Project structure

```
~/.config/opencode/
│
├── opencode.jsonc          ← Core config. Start here. Read every line.
├── opencode.zh-cn.jsonc    ← Core config (Chinese)
├── tui.jsonc               ← TUI config
├── tui.zh-cn.jsonc         ← TUI config (Chinese)
├── AGENTS.md               ← Global AI instructions (you create this)
├── docs/
│   ├── installation.md            ← Installation guide (for OpenCode)
│   ├── installation-rtk.md        ← Install rtk (global-level, recommended)
│   ├── installation-codegraph.md  ← Install codegraph (project-level, recommended)
│   ├── installation-codebase-memory-mcp.md  ← Install codebase-memory-mcp (project-level, recommended)
│   ├── installation-superpowers.md  ← Install superpowers (project-level, recommended)
│   ├── installation-openspec.md   ← Install OpenSpec (project-level, recommended)
│   ├── installation-agent-browser.md  ← Install agent-browser (project-level)
│   └── installation-caveman.md    ← Install caveman (project-level)
├── agents/
│   ├── careful.md         ← Agent that asks for confirmation
│   └── expert.md          ← Escalation agent
├── commands/
│   ├── kickstart-config-mcp.md    ← Recommend and install MCP servers
│   ├── kickstart-config-rule.md   ← Generate AGENTS.md interactively
│   └── kickstart-config-skill.md  ← Recommend and install skills
└── skills/
    ├── kickstart-creator-skill/   ← Create and improve skills
    └── kickstart-creator-command/ ← Create custom slash commands
```

## How to make it yours

1. **Read `README.md` from top to bottom** — understand the philosophy and what's available.
2. **Read `opencode.jsonc` line by line** — it's annotated. Every config decision is explained.
3. **Install plugins you need** — start with `rtk` (token savings), then add superpowers or OpenSpec as needed (see [Plugins](#plugins) section).
4. **Install MCPs you need** — codegraph and codebase-memory-mcp provide codebase context (see [MCPs](#mcps) section).
5. **Install skills you need** — agent-browser for browser automation, caveman for token compression, or browse [skills.sh](https://skills.sh/) (see [Skills](#skills) section).
6. **Configure `AGENTS.md`** — add your language preference, working style, and coding conventions (see [AGENTS.md](#agentsmd) section for suggested content).
7. **Create commands and agents** as your workflow grows — you'll know when you need them.

Delete anything you don't use. It's a starting point, not a framework.

## What this is NOT

- Not a multi-agent orchestration system (that's oh-my-openagent)
- Not a production-ready AI pipeline
- Not something you use without reading

## Plugins

See [Plugins docs](https://opencode.ai/docs/plugins/) for how plugins work. Plugins extend OpenCode's core behavior and are defined in `opencode.jsonc`.

### rtk

[rtk](https://github.com/rtk-ai/rtk) transparently rewrites verbose shell commands (`git status`, `pnpm list`, `vitest`, `cargo test`, …) into a compact token-saving form.

**Install globally.** Paste this into OpenCode:

```
Read the installation guide and follow it:
https://raw.githubusercontent.com/orionpax1997/kickstart.opencode/refs/heads/main/docs/installation-rtk.md
```

### Superpowers

[Superpowers](https://github.com/obra/superpowers) provides skills for brainstorming, debugging, TDD, planning, and more. Auto-loads per-task.

**Install at the project level.** `cd` into the project directory first, then paste this into OpenCode:

```
Read the installation guide and follow it:
https://raw.githubusercontent.com/orionpax1997/kickstart.opencode/refs/heads/main/docs/installation-superpowers.md
```

### OpenSpec

[OpenSpec](https://github.com/Fission-AI/OpenSpec) is a spec-driven development tool for generating and managing project specifications.

**Install at the project level.** `cd` into the project directory first, then paste this into OpenCode:

```
Read the installation guide and follow it:
https://raw.githubusercontent.com/orionpax1997/kickstart.opencode/refs/heads/main/docs/installation-openspec.md
```

## MCPs

See [MCP docs](https://opencode.ai/docs/mcp-servers/) for how MCP servers work. The two below are built-in and available in every session by default:

| MCP | Purpose |
|-----|---------|
| **context7** | Query up-to-date official library/framework documentation |
| **searchcode** | Search and analyze public git repositories |

You can also install these optional MCPs:

### codegraph

[codegraph](https://github.com/colbymchenry/codegraph) pre-indexes your codebase as a knowledge graph, so the agent gets surgical context (call paths, blast radius, related symbols) in one query instead of crawling files.

**Install at the project level.** `cd` into the project directory first, then paste this into OpenCode:

```
Read the installation guide and follow it:
https://raw.githubusercontent.com/orionpax1997/kickstart.opencode/refs/heads/main/docs/installation-codegraph.md
```

### codebase-memory-mcp

[codebase-memory-mcp](https://github.com/DeusData/codebase-memory-mcp) ships as a single static binary that indexes the codebase into a persistent SQLite-backed knowledge graph (158 languages, 14 MCP tools, sub-millisecond queries). Like codegraph, it gives the agent structural context in one call instead of crawling files.

**Install at the project level.** `cd` into the project directory first, then paste this into OpenCode:

```
Read the installation guide and follow it:
https://raw.githubusercontent.com/orionpax1997/kickstart.opencode/refs/heads/main/docs/installation-codebase-memory-mcp.md
```

## Skills

See [Skills docs](https://opencode.ai/docs/skills/) for how to create your own. Skills are `SKILL.md` files placed in the `skills/` directory that inject domain-specific knowledge into AI — framework conventions, project-specific patterns, etc.

Skills are loaded automatically based on the task context. Add project-specific skills once you recognize recurring needs. Browse [skills.sh](https://skills.sh/) to discover community skills.

**Frontmatter fields:**

```markdown
---
# Skill name (must match the directory name)
name: my-skill
# Description shown to the agent
description: What this skill does
---

Skill instructions go here. Tell the AI what to do and when to use this skill.
```

### Built-in skills

| Skill | Description |
| ----- | ----------- |
| **kickstart-creator-skill** | Create new skills, iteratively improve them, and optimize skill descriptions |
| **kickstart-creator-command** | Create custom slash commands with proper structure and best practices |

### agent-browser

[agent-browser](https://github.com/vercel-labs/agent-browser) lets the agent control a browser via CDP (Chrome DevTools Protocol) — more token-efficient than traditional headless browser approaches.

**Install at the project level.** `cd` into the project directory first, then paste this into OpenCode:

```
Read the installation guide and follow it:
https://raw.githubusercontent.com/orionpax1997/kickstart.opencode/refs/heads/main/docs/installation-agent-browser.md
```

### caveman

[caveman](https://github.com/juliusbrussee/caveman) is an ultra-compressed communication mode that cuts token usage ~75% while preserving technical accuracy.

**Install at the project level.** `cd` into the project directory first, then paste this into OpenCode:

```
Read the installation guide and follow it:
https://raw.githubusercontent.com/orionpax1997/kickstart.opencode/refs/heads/main/docs/installation-caveman.md
```

## Commands

See [Commands docs](https://opencode.ai/docs/commands/) for how they work. Commands are user-triggered shortcuts for repetitive tasks (unlike skills, which the agent loads automatically). Create `.md` files in the `commands/` directory to define slash commands. Users trigger them in TUI by typing `/filename`.

**Frontmatter fields:**

```markdown
---
# Description shown in command list
description: What this command does

# Agent to execute this command (optional, defaults to current agent)
# Built-in: build (full permissions), plan (read-only)
agent: build
---

Command instructions go here. Tell the AI what to do.
Can reference files: @path/to/file
Can run shell: !`git status`
```

### Built-in commands

| Command | Description |
|---------|-------------|
| **/kickstart-config-mcp** | Recommend and install MCP servers based on your tech stack |
| **/kickstart-config-rule** | Interactive AGENTS.md generator — detects tech stack, asks preferences, writes minimal AGENTS.md |
| **/kickstart-config-skill** | Recommend and install skills from the open agent skills ecosystem |

### Creating your own commands

- Have repetitive code review flows? Make a command, trigger with `/review`
- Frequently need to generate certain document formats? Make a command with templates
- Need fixed commit message format? Make a command that reads git diff and generates

## AGENTS.md

See [AGENTS.md docs](https://opencode.ai/docs/rules/) for the full specification. `AGENTS.md` is a global instruction file for AI, placed at `~/.config/opencode/AGENTS.md`, applies to all projects. Keep it short (under 10 lines) — only include what truly applies everywhere.

**Suggested content:**

- **Language preference** — e.g. `Reply in Chinese.`
- **MCP usage hints** — e.g. `Use context7 to look up library and framework documentation.`
- **Personal coding preferences** — e.g. `Never use any type. Prefer explicit types.`
- **Working style** — e.g. `Keep responses concise. No need to explain obvious steps.`

Project-level `AGENTS.md` goes in project root, describing project structure, tech stack, development standards, etc. Run `/kickstart-config-rule` in OpenCode to generate a concise version based on your project. (Avoid `/init` — it produces overly long output.)

## Agents

See [Agents docs](https://opencode.ai/docs/agents/) for how they work. Create `.md` files in the `agents/` directory to define agents. Each file consists of frontmatter and an optional system prompt.

**Frontmatter fields:**

```markdown
---
# Displayed in TUI, also determines when primary agent routes to this subagent
description: What this agent does

# Agent mode:
#   primary  - Appears in TUI agent switcher, user can manually switch
#   subagent - Can only be invoked by other agents via task tool, not in list
mode: primary

# Permission controls, can override global defaults
# Available actions: read / write / edit / bash / task / * (all)
# Available values: allow / deny / ask
permission:
  edit: ask    # Ask before editing files
  bash: ask    # Ask before running commands
---

System prompt goes here (optional).
Leave empty to inherit default build system prompt.
```

### careful (built-in example)

`careful` is a primary agent that behaves like the default `build`, except it asks for confirmation before editing files or running shell commands. Use it when you want full control over every AI action.

```markdown
---
description: Same as build but asks for confirmation before editing files or running
  shell commands. Switch to this agent when you want more control over what the AI does.
mode: primary
permission:
  edit: ask
  bash: ask
---
```

The [oh-my-openagent manifesto](https://github.com/code-yeongyu/oh-my-openagent/blob/dev/docs/manifesto.md) argues that requiring human intervention is a sign of system failure — ideally, you describe your intent and let AI handle the rest. `careful` is for the "not yet" phase: use confirmation as a checkpoint while you build trust. As models improve, you'll switch to it less and less.

### expert (escalation agent)

`expert` is a subagent that runs on its own model with maximum permissions, designed as an explicit escalation target.

```markdown
---
mode: all
model: opencode/big-pickle
---
```

**When to use it:**

- **Manual switch** — press Shift+Tab in the TUI to switch to `expert` and chat directly. Typical use: brainstorming, planning, or setting task goals, where you want a stronger model's reasoning without burning a subagent slot on the actual implementation.
- **Subagent escalation** — another agent calls the `task` tool with `subagent_type: expert` and a `fix_hint` describing what went wrong.

Don't use for routine multi-step tasks — that's what the built-in task agent is for. `expert` is not a "more powerful build"; its description gates auto-selection.

### Creating your own agents

- Need a read-only code review agent? Set `write: deny` `edit: deny`
- Need a domain-specific agent? Describe the role and focus in system prompt
- Need to use a specific model? Add `model: provider/model-id` in frontmatter

## vs oh-my-openagent

|            | kickstart.opencode | oh-my-openagent |
| ---------- | ------------------ | -------------- |
| Goal       | Understand & customize | Out of the box |
| Complexity | Minimal            | High           |
| Multi-agent| No (1-2)           | Yes (5+)       |
| Token cost | Low                | High           |
| Cost       | Free (default)     | Paid models    |
| Best for  | Project start, learning | Later stage, heavy use |
