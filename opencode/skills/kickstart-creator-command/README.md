# Kickstart Creator Command

Create OpenCode custom commands (slash commands) for the TUI.

## Overview

This skill helps you create reusable commands that can be invoked via `/command-name` in the OpenCode TUI.

## When to Use

- Create a new command ("create a command", "add a custom command")
- Make a slash command ("make a slash command")
- Define reusable prompts ("I want to create a command that...")

## Features

- **Complete Structure**: Teaches the full command file format
- **YAML Frontmatter**: Configure description, agent, model, subtask
- **Template Placeholders**: Support for arguments, shell output, file references

## Quick Start

1. Describe your need (e.g., "create a command to run tests")
2. Skill automatically activates - answer clarifying questions
3. Command file is created in `.opencode/commands/<name>.md`
4. Use via `/command-name` in TUI

## Command File Structure

```yaml
---
description: <brief description>
agent: <agent-name>     # optional
model: <model-name>    # optional
subtask: <true|false>  # optional
---
<prompt template>
```

## Template Placeholders

| Placeholder | Description |
|-------------|-------------|
| `$ARGUMENTS` | All arguments passed to command |
| `$1`, `$2`, `$3` | Individual positional arguments |
| ``!`command``` | Shell output injected into prompt |
| `@filename` | File content referenced in prompt |

## Command Locations

- Project-level: `.opencode/commands/<name>.md`
- Global: `~/.config/opencode/commands/<name>.md`

## See Also

- [SKILL.md](./SKILL.md) — Full skill documentation