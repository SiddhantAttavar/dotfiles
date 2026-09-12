---
name: kickstart-creator-command
description: |-
  Create OpenCode custom commands. Use when user wants to create a new command,
  make a slash command, add a command, or define reusable prompts for TUI.
  Activates for phrases like "/create command", "create a command", "add a custom command",
  "make a slash command", "I want to create a command that...".
---

<core_approach>

Command creation is collaborative and iterative, not mechanical.

- Identify where the user is in the loop and jump in from there — don't restart from scratch if they already have a draft.
- Explore before asking. Use read-only tools to answer what the context can already tell you, then interview for what remains genuinely unclear.
- Explain the *why* behind instructions rather than issuing rigid MUSTs. Today's models generalize better from reasoning than from rules.
- Stay flexible — if the user says "just vibe with me and skip the evals", do that.
- Generated commands can include 5 XML sections (`<core_approach>`, `<workflow>`, `<reference>`, `<examples>`, `<quality_checklist>`) just like skills, but this is optional — simpler commands without XML tags are also valid.

</core_approach>

<reference>

## Command file location

- Project-level: `.opencode/commands/<name>.md`
- Global: `~/.config/opencode/commands/<name>.md`

## Command file structure

Commands are `.md` files with YAML frontmatter:

```yaml
---
description: What this command does
agent: build                    # Optional: which agent to use
model: anthropic/claude-3-5-sonnet-20241022  # Optional
subtask: false                 # Optional: force as subtask
---
Command prompt template here.
Use $ARGUMENTS for user input.
Use !`command` for shell output.
```

## Frontmatter options

| Option | Required | Description |
|--------|----------|-------------|
| description | No | Brief description shown in TUI |
| agent | No | Agent to use (e.g., "build", "plan") |
| model | No | Specific model to override |
| subtask | No | Force as subtask (true/false) |

## Template placeholders

| Placeholder | Description |
|-------------|-------------|
| `$ARGUMENTS` | All arguments passed to command |
| `$1`, `$2`, `$3` | Individual positional arguments |
| ``!`command``` | Shell output injected into prompt |
| `@filename` | File content referenced in prompt |

## Extended command structure (optional)

For complex commands, include 5 XML-tagged sections just like skills:

| Tag | Purpose |
|-----|---------|
| `<core_approach>` | Guiding philosophy and interaction style |
| `<workflow>` | Step-by-step instructions (should include Explore and Interview phases) |
| `<reference>` | Context tables, config formats, lookup data |
| `<examples>` | Input/output pairs |
| `<quality_checklist>` | Pre-delivery self-check |

## Configuration alternative

Commands can also be defined in `opencode.jsonc`:

```jsonc
{
  "command": {
    "test": {
      "template": "Run the full test suite...",
      "description": "Run tests with coverage",
      "agent": "build"
    }
  }
}
```

## Writing style guidelines

- Use imperative form in instructions ("Read the file", not "You should read the file")
- Explain *why* over issuing hard constraints — lean on model intelligence
- Avoid all-caps ALWAYS/NEVER unless genuinely critical
- Prefer general principles over narrow, example-specific rules
- After drafting, re-read with fresh eyes and trim anything not pulling its weight

</reference>

<examples>

## Example 1: Simple command

**User input**: "create a command to run tests"
**Output**: Creates `.opencode/commands/test.md`

```markdown
---
description: Run the full test suite
---
Run the test suite and report any failures.
```

## Example 2: Command with arguments

**User input**: "create a component command that accepts a name"
**Output**: Creates `.opencode/commands/component.md`

```markdown
---
description: Create a new component
---
Create a new React component named $ARGUMENTS.
Include TypeScript types and basic structure.
```

Usage: `/component Button`

## Example 3: Command with shell output

**User input**: "create a command to analyze coverage"
**Output**: Creates `.opencode/commands/analyze-coverage.md`

```markdown
---
description: Analyze test coverage
---
Here are the current test results:
!`npm test`
Based on these results, suggest improvements.
```

## Example 4: Command using specific agent

**User input**: "create a review command using plan agent"
**Output**: Creates `.opencode/commands/review.md`

```markdown
---
description: Review code changes
agent: plan
---
Review the recent code changes for quality and suggest improvements.
```

## Example 5: Complex command with XML structure

**User input**: "create a command for deploying to production with approval stages"
**Output**: Creates `.opencode/commands/deploy.md` with full XML sections

```markdown
---
description: Deploy to production with approval workflow
agent: build
---

<core_approach>

Deployments require careful approval at each stage...

</core_approach>

<workflow>

1. Check current branch is production-ready
2. Request user confirmation before each stage
3. Execute deployment steps sequentially

</workflow>

<reference>

## Deployment stages

| Stage | Action |
|-------|--------|
| 1 | Build and test |
| 2 | Stage deployment |
| 3 | Production rollout |

</reference>

<examples>

**Input**: `/deploy`
**Output**: Runs through deployment workflow with approvals

</examples>

<quality_checklist>

- [ ] Stage gates in place
- [ ] Rollback plan documented
- [ ] User confirms each stage

</quality_checklist>
```

</examples>

<workflow>

## Phase 1: Explore

Before asking any questions, explore the available context to understand structure and conventions.

Use read, grep, and other read-only tools to:
- Find existing commands in the project — understand current patterns
- Check `.opencode/commands/` directory
- Look for related skills or agents that might influence command design
- Identify any project-specific conventions

Do NOT ask questions that the available context can already answer.

## Phase 2: Interview

Based on your exploration, use the `question` tool to clarify only what is genuinely unclear or has multiple valid answers.

Ask about:
- **Name**: What should the command be called?
- **Purpose**: What prompt/template should the command execute?
- **Complexity**: Simple one-liner or multi-phase workflow?
- **Agent**: Should it use a specific agent (build, plan) or current agent?
- **Arguments**: Are there any arguments the command should accept?
- **XML structure**: Should the command include 5 XML sections (like skills), or keep it simple?

If the user requests a complex command, recommend including XML sections for better structure.

Wait for all answers before proceeding to Phase 3.

## Phase 3: Create the command

Create the command file in `.opencode/commands/<command-name>.md`.

**For simple commands:**
```markdown
---
description: <description>
agent: <agent-name>
---
<template prompt>
```

**For complex commands (recommended 5-section structure):**
```markdown
---
description: <description>
agent: <agent-name>
---

<core_approach>

Guiding philosophy for this command.

</core_approach>

<workflow>

1. Step one
2. Step two

</workflow>

<reference>

Context tables and lookup data.

</reference>

<examples>

**Input**: `/command-name`
**Output**: Expected behavior

</examples>

<quality_checklist>

- [ ] Item one
- [ ] Item two

</quality_checklist>
```

After drafting, re-read with fresh eyes and trim anything not pulling its weight.

## Phase 4: Review & Iterate

Show the user the created file and explain how to use it:
- Command invoked via `/<command-name>` in TUI
- Can also add via `command` in opencode.jsonc config

Propose 1-2 realistic test prompts and iterate based on feedback.

</workflow>

<quality_checklist>

## Pre-delivery checklist

Before sharing the command:
- [ ] Command file created in correct location (`.opencode/commands/`)
- [ ] File name matches command name
- [ ] Frontmatter includes appropriate options (description, agent, etc.)
- [ ] Template uses correct placeholders if needed (`$ARGUMENTS`, ``!`command```, etc.)
- [ ] `<workflow>` includes Explore phase (uses read-only tools to understand context)
- [ ] `<workflow>` includes Interview phase (uses `question` tool to clarify ambiguities)
- [ ] Complex commands include 5 XML sections: `<core_approach>`, `<workflow>`, `<reference>`, `<examples>`, `<quality_checklist>`
- [ ] Explained usage to user (`/command-name`)
- [ ] Test prompts are realistic user phrases

</quality_checklist>
