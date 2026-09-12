---
description: Interactive AGENTS.md generator - minimal, focused
agent: build
---

<core_approach>

Generate a minimal AGENTS.md through guided conversation. AGENTS.md should only contain what the model cannot discover itself. Keep it under 100 lines.

</core_approach>

<workflow>

## Phase 1: Detect Tech Stack

Explore the project using glob, grep, read and other tools:

1. Check config files: `package.json`, `requirements.txt`, `Cargo.toml`, `go.mod`, `pom.xml`, `build.gradle`, `pyproject.toml`, `*.csproj`
2. Check framework-specific files: `next.config.js`, `nuxt.config.ts`, `vite.config.ts`, `webpack.config.js`, `tsconfig.json`
3. Scan source code imports to identify libraries/frameworks
4. Check if `AGENTS.md` already exists
5. Understand the project's purpose and top-level directory structure

Detect build commands from the above:
- `package.json` → npm/pnpm/yarn scripts
- `pom.xml` → `mvn clean install`, `mvn test`
- `build.gradle` → `./gradlew build`, `./gradlew test`
- `Cargo.toml` → `cargo build`, `cargo test`
- `go.mod` → `go build`, `go test`
- `requirements.txt` / `pyproject.toml` → `pip install`, `pytest`
- `*.csproj` → `dotnet build`, `dotnet test`

## Phase 2: Interview

Ask these questions sequentially using the `question` tool:

1. **Language preference** (single select):
   - No preference
   - Reply in Chinese (中文)
   - Reply in Japanese (日本語)
   - Reply in Korean (한국어)
   - Reply in Spanish (Español)
   - Reply in French (Français)

2. **Working style** (multi select):
   - Keep responses concise
   - No need to explain obvious steps
   - Always add detailed debug logs
   - Prefer editing existing files over creating new ones
   - Ask before running destructive commands
   - Always run tests after making changes
   - Follow existing code patterns before introducing new ones
   - Always check for null/exception handling
   - Prefer immutable objects where possible

3. **Boundaries** (free text, optional):
   - "Are there any files or directories the AI should never modify? (e.g. /legacy/, /vendor/) Leave blank if none."

## Phase 3: Draft

Always include these sections:
```markdown
# AGENTS.md

## Project Overview
Brief description of what this project does.

## Tech Stack
Key technologies detected from the project (e.g. React, TypeScript, Spring Boot, Maven).

## Project Structure
Top-level directories and their purpose.

## Build Commands
Key commands for this project.
```

Add optional sections only if user provided input:
```markdown
## Language
Reply in Chinese.

## Working Style
Keep responses concise. No need to explain obvious steps.

## Boundaries
- Never modify files in /legacy/
- Ask before running destructive commands.
```

Skip: Code Style, ESLint/Prettier configs, detailed conventions (AI reads these from config files automatically).

## Phase 4: Review

Show the draft and ask (using `question` tool):
- "Does this look right?"
- Options: "Looks good" / "I want to change something"
- If change: let user describe what to change, update draft, ask again.

## Phase 5: Confirm & Write

Use `question` tool:
- "Write AGENTS.md to [path]?"
- Options: "Yes, write it" / "Make changes"
- If "Yes, write it" → write the file
- If "Make changes" → iterate on draft

</workflow>

<reference>

## What to include vs skip

| Include | Skip |
|---------|------|
| Project Overview | ESLint/Prettier configs |
| Tech Stack (auto-detected) | TypeScript settings |
| Project Structure | Framework conventions |
| Build Commands | Detailed code patterns |
| Language preference | Test framework configs |
| Working style | CI/CD config |
| Boundaries | Package versions |

AI automatically reads config files like `.eslintrc`, `tsconfig.json`, `prettier.config.js`, `checkstyle.xml` — no need to repeat them in AGENTS.md.

## Example output (Java)

```markdown
# AGENTS.md

## Project Overview
Spring Boot REST API for order management.

## Tech Stack
Java 17, Spring Boot, Maven, MyBatis

## Project Structure
src/main/java/ (source), src/test/ (tests), src/main/resources/ (config)

## Build Commands
mvn clean install, mvn test, mvn spring-boot:run

## Language
Reply in Chinese.

## Working Style
Always check for null/exception handling. Follow existing code patterns.

## Boundaries
- Never modify files in /legacy/
```

## Example output (Frontend)

```markdown
# AGENTS.md

## Project Overview
Electron app for managing Mihomo proxy configurations.

## Tech Stack
Electron, React, TypeScript, pnpm

## Project Structure
src/main/ (Electron main), src/renderer/ (React UI), src/preload/

## Build Commands
pnpm dev, pnpm build:win/mac/linux

## Language
Reply in Chinese.
```

</reference>

<quality_checklist>

- [ ] Under 100 lines
- [ ] Tech stack auto-detected from config files
- [ ] Build commands inferred from project type
- [ ] Only includes what AI cannot discover from files
- [ ] User confirmed optional sections
- [ ] User reviewed draft before writing

</quality_checklist>