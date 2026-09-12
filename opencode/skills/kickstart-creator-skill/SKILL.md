---
name: kickstart-creator-skill
description: |-
  Scaffold new skills or improve existing ones. Use when users want to:
  - Create a skill from scratch ("make a skill for X", "turn this conversation into a skill", "help me capture this workflow")
  - Improve or edit an existing skill ("my skill isn't triggering", "improve this skill", "the output quality is off")
  - Optimize a skill's description for better triggering accuracy

  Always use this skill when the user mentions skills, SKILL.md, or wants to capture a repeatable workflow — even if they don't use the word "skill". Also activates for phrases like "save this as a skill", "make a slash command from this", "turn this into a reusable workflow", "capture this pattern".
---

# Skill Creator

Create and iteratively improve OpenCode skills through a draft → test → review → improve loop.

<core_approach>

Skill creation is collaborative and iterative, not mechanical.

- Identify where the user is in the loop and jump in from there — don't restart from scratch if they already have a draft.
- Explore before asking. Use read-only tools to answer what the context can already tell you, then interview for what remains genuinely unclear.
- Explain the *why* behind instructions rather than issuing rigid MUSTs. Today's models generalize better from reasoning than from rules.
- Stay flexible — if the user says "just vibe with me and skip the evals", do that.
- Adapt your communication style to the user's technical background. Use terms like "JSON" and "assertions" only after confirming the user is comfortable with them; "evaluation" and "benchmark" are generally OK.

</core_approach>

<reference>

## Skill file layout

```
skill-name/
├── SKILL.md                  (required, must be uppercase)
│   ├── YAML frontmatter      name + description required
│   │   └── Optional: license, compatibility, metadata
│   └── Markdown body         instructions, XML-tagged sections
└── bundled resources/        (optional)
    ├── scripts/              executable code for repetitive tasks
    ├── references/           docs loaded into context as needed
    └── assets/               templates, icons, fonts used in output
```

## Skill discovery paths

OpenCode searches these locations (in order):
- `.opencode/skills/<name>/SKILL.md` (project)
- `~/.config/opencode/skills/<name>/SKILL.md` (global)
- `.claude/skills/<name>/SKILL.md` (Claude compat)
- `~/.claude/skills/<name>/SKILL.md` (Claude compat global)
- `.agents/skills/<name>/SKILL.md` (agents compat)
- `~/.agents/skills/<name>/SKILL.md` (agents compat global)

Check both project root and global `~/.config/opencode/skills/` for existing skills.

## Progressive disclosure (three loading levels)

| Level | Content | Always loaded? |
|---|---|---|
| 1 | name + description (~100 words) | Yes |
| 2 | SKILL.md body (<500 lines ideal) | When skill triggers |
| 3 | Bundled resources | On demand, referenced from body |

Keep SKILL.md under 500 lines. Move overflow to `references/` and add explicit pointers in the body about when to read each file. For large reference files (>300 lines), include a table of contents.

## Description writing rules

The description is the primary trigger mechanism — it determines whether Claude consults the skill at all.

- Include both *what the skill does* and *when to use it*
- Add 2–3 concrete trigger phrase examples
- Be "pushy": explicitly name adjacent contexts where the skill applies even if not directly requested
- Keep description between 1-1024 characters

Example of a weak description:
> "How to build a dashboard for internal data."

Example of a strong description:
> "How to build a fast dashboard for internal data. Use whenever the user mentions dashboards, data visualization, internal metrics, or wants to display company data — even if they don't say 'dashboard' explicitly."

## Frontmatter fields

Required:
- `name`: lowercase, hyphens only, 1-64 chars, matches directory name
- `description`: what the skill does + when to use it

Optional:
- `license`: e.g., "MIT"
- `compatibility`: e.g., "opencode"
- `metadata`: key-value pairs for additional context

## XML tag conventions

| Tag | Purpose |
|---|---|
| `<core_approach>` | Guiding philosophy and interaction style |
| `<workflow>` | Numbered step-by-step instructions (MUST include Explore and Interview phases) |
| `<reference>` | Context tables, config formats, lookup data |
| `<examples>` | Input/output pairs |
| `<quality_checklist>` | Pre-delivery self-check |

Use XML tags to create clear section boundaries. Prefer them over flat markdown for structured instructions — models parse boundaries more reliably.

## Writing style guidelines

- Use imperative form in instructions ("Read the file", not "You should read the file")
- Explain *why* over issuing hard constraints — lean on model intelligence
- Avoid all-caps ALWAYS/NEVER unless genuinely critical; reframe as reasoning instead
- Prefer general principles over narrow, example-specific rules
- After drafting, re-read with fresh eyes and trim anything not pulling its weight

## Security

Skills must not contain malware, exploit code, or content that could compromise system security. Decline requests to create skills designed for unauthorized access, data exfiltration, or other malicious purposes. Roleplay and persona skills are fine.

</reference>

<examples>

## Skill creation example

**User input**: "make a skill for running my test suite with coverage"

**Output** (partial):
```yaml
---
name: test-coverage-runner
description: |-
  Run test suite with coverage reports. Use when user asks to run tests with
  coverage, wants to see code coverage, or says "test with cov". Activate for
  "run tests", "coverage report", "npm run test:cov".
---
```

## Skill improvement example

**User input**: "my skill for code review isn't triggering"

**Output**: Explore existing skill, identify trigger phrase gaps, propose updated description with more activation contexts.

</examples>

<workflow>

## Phase 1: Explore

Before asking any questions, explore the available context to understand structure and constraints.

Use read, grep, and other read-only tools to:
- Find existing skills in the project — avoid duplicating what's already there
- Understand the project structure and tech stack if relevant
- Find files related to the user's request (e.g. if converting a conversation into a skill, extract: tools used, step sequence, corrections made, input/output formats)
- Identify existing patterns and conventions in skill writing
- Discover constraints that affect the plan (e.g. existing abstractions, bundled scripts, config)

Do NOT ask questions that the available context can already answer.

Also check available MCPs — if useful for research, run in parallel via subagents if available, otherwise inline.

## Phase 2: Interview

Based on your exploration, use the `question` tool to clarify only what is genuinely unclear or has multiple valid answers. Do not ask questions the exploration already answered.

Ask about:
- **Ambiguities**: anything that could lead to wrong assumptions if left unclear
- **Trigger context**: what specific user phrases or situations should activate this skill
- **Output format**: what the skill is expected to produce
- **Scope**: what is explicitly out of scope for this task

Wait for all answers before proceeding to Phase 3. If the conversation has been compressed, use the compressed summary to infer context — don't re-ask questions already answered.

## Phase 3: Write the SKILL.md

Based on the interview, fill in:

- **name**: lowercase, hyphens only, matches directory name exactly (`^[a-z0-9]+(-[a-z0-9]+)*$`)
- **description**: trigger phrases + what it does + "when to use" context (all here, not in the body)
- **body**: MUST include all 5 required XML tags:
  - `<core_approach>` — guiding philosophy and interaction style
  - `<workflow>` — numbered step-by-step instructions (MUST include Explore and Interview phases)
  - `<reference>` — context tables, config formats, lookup data
  - `<examples>` — input/output pairs
  - `<quality_checklist>` — pre-delivery self-check

After drafting, re-read with fresh eyes and trim anything not pulling its weight.

## Phase 4: Review & Iterate

Propose 2–3 realistic test prompts — the kind a real user would actually type. Share them with the user and ask for confirmation before proceeding.

After the user tries them:
- Focus improvements on cases with specific complaints
- Generalize from feedback — avoid changes that only fix the test cases at hand
- Keep the skill lean: remove instructions that aren't pulling their weight
- Explain the *why* rather than adding more rules

Repeat until the user is satisfied or feedback is consistently empty.

</workflow>

<quality_checklist>

## Pre-delivery checklist

Before sharing the skill for testing:
- [ ] Description has 2–3 concrete trigger phrases
- [ ] Description includes "when to use" context
- [ ] SKILL.md is under 500 lines
- [ ] All 5 required XML tags present: `<core_approach>`, `<workflow>`, `<reference>`, `<examples>`, `<quality_checklist>`
- [ ] `<workflow>` contains Explore phase (uses read-only tools to understand context)
- [ ] `<workflow>` contains Interview phase (uses `question` tool to clarify ambiguities)
- [ ] No unnecessary rules — explain why, don't just mandate
- [ ] Test prompts are realistic user phrases, not edge cases

</quality_checklist>