# CLAUDE.md — Project Instructions for Claude Code

This file is the primary system prompt for Claude Code when working in this project.
It is committed to the repository and shared across all team members.
Claude Code reads it automatically at the start of every session.

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
**Status:** _Active development / Maintenance / Experimental_

---

## Tech Stack

<!-- TODO: Fill in the actual stack for your project. -->

| Layer        | Technology                             |
|--------------|----------------------------------------|
| Language     | _e.g. TypeScript 5.x / Python 3.12_   |
| Runtime      | _e.g. Node.js 20 LTS_                  |
| Framework    | _e.g. Express / FastAPI / Next.js 14_ |
| Database     | _e.g. PostgreSQL 15 / SQLite_          |
| ORM          | _e.g. Prisma / SQLAlchemy_             |
| Testing      | _e.g. Vitest + Testing Library / pytest_ |
| Linting      | _e.g. ESLint + Prettier / Ruff_        |
| CI/CD        | _e.g. GitHub Actions_                  |

---

## Key Conventions

All coding and workflow conventions are documented in `.claude/rules/`.
Claude should read those files before writing or modifying code.

- **Coding style:** `.claude/rules/coding-style.md`
- **Testing practices:** `.claude/rules/testing-practices.md`
- **Git workflow:** `.claude/rules/git-workflow.md`
- **V-Model & traceability:** `.claude/rules/v-model.md`
- **Project learnings:** `.claude/rules/learnings.md`

When in doubt, follow the existing patterns in the codebase rather than inventing new ones.
If a convention is unclear, ask before proceeding.

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

# Run tests in watch mode
npm run test:watch   # or: pytest-watch

# Run linter
npm run lint         # or: ruff check . && ruff format --check .

# Run linter with auto-fix
npm run lint:fix     # or: ruff check --fix . && ruff format .

# Type-check
npm run typecheck    # or: mypy .
```

Always run tests and linting before considering a task complete.

---

## Project Structure

<!-- TODO: Update this tree to reflect the actual project layout. -->

```
src/
  components/     # Reusable UI components
  features/       # Feature-scoped modules (co-locate tests here)
  lib/            # Shared utilities and helpers
  types/          # Global TypeScript type definitions
  app/            # Entry points / pages / routes
tests/
  unit/           # Pure unit tests (fast, no I/O)
  integration/    # Integration & API tests
  e2e/            # End-to-end tests (if applicable)
```

---

## Language

- **All repository content is written in English** — code, comments, rules, commands, docs, commit messages.
- Conversation with the developer may happen in any language; the repository always stays English.

---

## Important Notes

- **Never commit secrets.** API keys, passwords, tokens, and credentials must never appear
  in committed files. Use environment variables and a `.env` file (which is gitignored).
  Provide a `.env.example` with placeholder values as documentation.
- **Never force-push to `main` or `master`.** See `.claude/rules/git-workflow.md`.
- **Prefer small, focused commits** over large, sweeping changes. Each commit should
  represent one logical unit of work.
- **Write tests for new functionality.** Do not leave new code paths uncovered.
- **Before adding a dependency**, check whether the functionality already exists in the
  codebase or standard library. Confirm with the developer before installing new packages.
- **Database migrations** must be reviewed by a human before being run in production.
- **Keep this file up to date.** When the stack or conventions change, update CLAUDE.md
  so future Claude sessions have accurate context.

---

## Architecture Notes

<!-- TODO: Add any non-obvious architectural decisions, patterns, or constraints. -->
<!-- Example:
- All database access goes through the repository layer in src/repositories/.
- Business logic lives in src/services/ — controllers are thin.
- The frontend communicates via REST; do not add GraphQL without team discussion.
- Authentication uses JWT; tokens are short-lived (15 min) with refresh token rotation.
-->

_Document key architectural decisions and patterns here._

---

## Out of Scope

<!-- TODO: List things Claude should NOT do in this project without explicit instruction. -->
<!-- Example:
- Do not upgrade major dependency versions without discussion.
- Do not modify database migration files after they have been applied.
- Do not change the public API contract without updating the OpenAPI spec.
-->

_List things that are explicitly off-limits or require human review before proceeding._
