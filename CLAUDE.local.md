# CLAUDE.local.md — Personal Local Overrides

<!-- IMPORTANT: This file is listed in .gitignore and is NEVER committed to the repository.
     Use it for personal preferences, local environment specifics, and private notes.
     Do not put team-wide conventions here — those belong in CLAUDE.md or .claude/rules/.
     Each developer maintains their own copy of this file independently. -->

---

## Personal Preferences

<!-- Adjust these to match your own working style. Claude will follow these in this project. -->

- I prefer concise explanations — skip restating what I just said, get to the answer.
- When generating code, show the full function or block, not snippets with `// ...` elisions.
- If you are unsure about my intent, ask one clarifying question before proceeding.
- I prefer `const` over `let` unless mutation is required.
- Use early returns instead of deeply nested `if` blocks.
- Prefer named exports over default exports for better refactoring support.
- When writing comments, explain *why*, not *what* — the code shows what, comments show intent.

---

## Local Environment

<!-- Document paths and tools specific to your machine. -->

- **Node version manager:** `nvm` — active version pinned in `.nvmrc`
- **Python environment:** `pyenv` + `virtualenv` at `.venv/`
- **Database:** Local PostgreSQL running on port 5432, database name: `myproject_dev`
- **Redis:** Running via Docker on default port 6379
- **Editor:** VS Code with ESLint + Prettier extensions enabled

```bash
# Start local services (example — adjust for your setup)
docker compose up -d db redis

# Activate Python virtual environment
source .venv/bin/activate

# Switch to the correct Node version
nvm use
```

---

## Useful Local Commands

<!-- Commands that only work on your machine or are not part of the standard workflow. -->

```bash
# Run a focused subset of tests during development
npm test -- --watch src/auth

# Check bundle size after build
npm run build -- --analyze

# Connect to the local database directly
psql -U postgres -d myproject_dev

# Tail application logs (local Docker setup)
docker compose logs -f app
```

---

## Notes to Self

<!-- Use this section as a scratchpad for reminders, ongoing work, or things to revisit.
     Update or clear entries as work progresses. -->

- Remember to rotate the staging API key before the next release.
- The `UserService.bulkCreate()` method has a known N+1 query issue — tracked in issue #142.
- PR review checklist: tests pass, no secrets, migrations included if schema changed.
- Check back on the performance regression in the search endpoint after the next deploy.

---

## Temporary Task Overrides

<!-- Use this section to temporarily override rules from CLAUDE.md during a specific task.
     Remove or clear this section when the task is done.

     Example:
     For the current refactoring task only:
     - It is OK to leave TODO comments for tests — I will add them in a follow-up PR.
     - Focus on moving and renaming files; avoid logic changes in this pass.
-->

_No active overrides._
