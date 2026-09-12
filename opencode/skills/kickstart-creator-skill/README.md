# Kickstart Creator Skill

Scaffold new skills or improve existing ones for OpenCode.

## Overview

This skill helps you create and iteratively improve OpenCode skills through a draft → test → review → improve loop.

## When to Use

- Create a skill from scratch ("make a skill for X", "turn this conversation into a skill")
- Improve or edit an existing skill ("my skill isn't triggering", "improve this skill")
- Optimize a skill's description for better triggering accuracy

## Features

- **Collaborative & Iterative**: Not mechanical — identify where the user is in the loop
- **Explore First**: Use read-only tools to answer what context can already tell you
- **Explain Why**: Today's models generalize better from reasoning than from rules

## Quick Start

1. Describe your need (e.g., "make a skill for running tests")
2. Skill automatically activates - explores your project structure
3. Answer clarifying questions about trigger contexts and output format
4. Review and test the generated SKILL.md

## Skill File Structure

```
skill-name/
├── SKILL.md                  (required, uppercase)
│   ├── YAML frontmatter      name + description required
│   └── Markdown body         instructions, XML-tagged sections
└── bundled resources/        (optional)
    ├── scripts/              executable code
    ├── references/           docs loaded as needed
    └── assets/               templates, icons
```

## Key Concepts

- **Description**: Primary trigger mechanism — determines when the skill activates
- **Progressive Disclosure**: SKILL.md should stay under 500 lines
- **5 Required XML Tags**: `<core_approach>`, `<workflow>`, `<reference>`, `<examples>`, `<quality_checklist>`

## See Also

- [SKILL.md](./SKILL.md) — Full skill documentation