# Project Instructions for Claude

This file is the primary system prompt for Claude Code when working in this project.
It is committed to the repository and shared across all team members.

---

## Project Overview

<!-- TODO: Replace this section with a description of your project. -->
<!-- Example:
This is a REST API service for managing user accounts and authentication.
It exposes endpoints consumed by the frontend SPA and mobile clients.
-->

**Project Name:** _Your Project Name_
**Purpose:** _Describe what this project does and why it exists._
**Primary Audience:** _Developers / End users / Internal tooling_

---

## Tech Stack

<!-- TODO: Fill in the actual stack for your project. -->

| Layer        | Technology              |
|--------------|-------------------------|
| Language     | _e.g. TypeScript / Python_ |
| Runtime      | _e.g. Node.js 20 / Python 3.12_ |
| Framework    | _e.g. Express / FastAPI / Next.js_ |
| Database     | _e.g. PostgreSQL / SQLite_ |
| Testing      | _e.g. Vitest / pytest_ |
| Linter       | _e.g. ESLint + Prettier / Ruff_ |
| CI           | _e.g. GitHub Actions_ |

---

## Key Conventions

All coding and workflow conventions are documented in `.claude/rules/`.
Claude should read those files before writing or modifying code.

- **Coding style:** `.claude/rules/coding-style.md`
- **Testing practices:** `.claude/rules/testing-practices.md`
- **Git workflow:** `.claude/rules/git-workflow.md`

When in doubt, follow the existing patterns in the codebase rather than inventing new ones.

---

## Common Commands

<!-- TODO: Replace placeholders with actual commands for your project. -->

```bash
# Install dependencies
npm install          # or: pip install -r requirements.txt

# Run development server
npm run dev          # or: python -m uvicorn app.main:app --reload

# Build for production
npm run build        # or: python -m build

# Run all tests
npm test             # or: pytest

# Run linter
npm run lint         # or: ruff check . && ruff format --check .

# Run linter with auto-fix
npm run lint:fix     # or: ruff check --fix . && ruff format .

# Type-check
npm run typecheck    # or: mypy .
```

Always run tests and linting before considering a task complete.

---

## Important Notes

- **Never commit secrets.** API keys, passwords, tokens, and credentials must never appear
  in committed files. Use environment variables and a `.env` file (which is gitignored).
- **Never force-push to `main` or `master`.** See `.claude/rules/git-workflow.md`.
- **Prefer small, focused commits** over large, sweeping changes. Each commit should
  represent one logical unit of work.
- **Write tests for new functionality.** Do not leave new code paths uncovered.
- **Keep this file up to date.** When the stack or conventions change, update CLAUDE.md
  so future Claude sessions have accurate context.

---

## Architecture Notes

<!-- TODO: Add any non-obvious architectural decisions, patterns, or constraints. -->
<!-- Example:
- All database access goes through the repository layer in src/repositories/.
- Business logic lives in src/services/ — controllers are thin.
- The frontend communicates via REST; do not add GraphQL without team discussion.
-->

_Document key architectural decisions here._

---

## Out of Scope

<!-- TODO: List things Claude should NOT do in this project without explicit instruction. -->
<!-- Example:
- Do not upgrade major dependency versions without discussion.
- Do not modify database migration files after they have been applied.
-->

_List things that are explicitly off-limits or require human review._
