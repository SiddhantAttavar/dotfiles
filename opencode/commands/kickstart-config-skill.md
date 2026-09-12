---
description: Recommend and install skills based on project tech stack. Use when user wants to add skills, search for skill integrations, or asks to install agent skills.
agent: build
---

# Skill Installer

<core_approach>

- Recommend skills based on detected tech stack before asking user preferences
- Search skills.sh for relevant skills
- Present results in a clear comparison table
- Install selected skills to the correct directory

</core_approach>

<workflow>

## Phase 1: Detect Tech Stack

Explore the project using glob, grep, read and other tools:

1. Check config files: `package.json`, `requirements.txt`, `Cargo.toml`, `go.mod`, `pom.xml`, `build.gradle`, `pyproject.toml`, `*.csproj`
2. Check framework-specific files: `next.config.js`, `nuxt.config.ts`, `vite.config.ts`, `webpack.config.js`, `tsconfig.json`
3. Scan source code imports to identify libraries/frameworks

## Phase 2: Search and Recommend Skills

Using the tech stack keywords from Phase 1, search skills.sh:

### Search Strategy

Extract 3-5 core keywords from Phase 1 (e.g. frameworks, databases, languages). For each keyword, use `webfetch` to search:

```
https://skills.sh/?search=<keyword>
```

Optionally use `websearch` to search `<keyword> skills.sh agent skill` for additional results.

### Recommendation Display

After deduplication, display recommendations in this format:

| # | Skill Name | Owner | Weekly Installs | Description |
|---|------------|-------|-----------------|-------------|
| 1 | name | owner/repo | 12.3K | one-line description |

Display grouped by category: Frameworks, Languages, Tools, Productivity

Always include these universally useful skills regardless of tech stack:

| Skill | Owner | Description |
|-------|-------|-------------|
| systematic-debugging | obra/superpowers | Systematic debugging workflow |
| verification-before-completion | obra/superpowers | Verify before marking tasks done |

## Phase 3: User Selection

Use the `question` tool to let the user choose:

1. "Select skills to install:" (multi-select, list all recommended skills)
2. Or search for other skills by name

## Phase 4: Install Selected Skills

For each selected skill:

1. Fetch skill details:
   ```
   https://skills.sh/<owner>/<repo>/<skill-name>
   ```

2. Get the install command from the page, format:
   ```
   npx skills add https://github.com/<owner>/<repo> --skill <skill-name>
   ```

3. Run the install command via bash tool. Skills install to:
   - Global: `~/.config/opencode/skills/`
   - Project: `.opencode/skills/`

4. Use the `question` tool to ask:
   - "Install globally or project-only?"
   - Options: "Global (~/.config/opencode/skills/)" / "This project only (.opencode/skills/)"

   If project-only, add `--target .opencode/skills/` to the install command.

## Phase 5: Complete

Summarize installed skills and remind the user:
- Skills are loaded automatically when relevant
- To see installed skills, check the skills directory

</workflow>

<reference>

## Install Command Format

```bash
npx skills add https://github.com/<owner>/<repo> --skill <skill-name>
```

## Skills Directory

| Scope | Path |
|-------|------|
| Global | `~/.config/opencode/skills/` |
| Project | `.opencode/skills/` |

## Recommended Universal Skills

| Skill | Install |
|-------|---------|
| systematic-debugging | `npx skills add https://github.com/obra/superpowers --skill systematic-debugging` |
| verification-before-completion | `npx skills add https://github.com/obra/superpowers --skill verification-before-completion` |

</reference>

<examples>

**Input:** `/kickstart-config-skill`
**Output:** Detects React + TypeScript from package.json → recommends frontend-design, vercel-react-best-practices, shadcn + universal skills → user selects → installs

**Input:** `/kickstart-config-skill`
**Output:** Detects Spring Boot + Maven → recommends java-related skills + universal skills → user selects → installs

</examples>