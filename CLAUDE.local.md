# Local Claude Overrides

<!-- IMPORTANT: This file is listed in .gitignore and is NOT committed to the repository.
     Use it for personal preferences, local environment specifics, and notes to yourself.
     Do not put team-wide conventions here — those belong in CLAUDE.md or .claude/rules/. -->

---

## Personal Preferences

<!-- Adjust these to match your own working style. -->

- I prefer concise explanations — skip restating what I just said, get to the answer.
- When generating code, show the full function/block, not snippets with `// ...` elisions.
- If you're unsure about my intent, ask one clarifying question before proceeding.
- I prefer `const` over `let` unless mutation is required.
- Use early returns instead of deeply nested `if` blocks.

---

## Local Environment

<!-- Document paths and tools specific to your machine. -->

- **Node version manager:** `nvm` — active version pinned in `.nvmrc`
- **Python environment:** `pyenv` + `virtualenv` at `.venv/`
- **Database:** Local PostgreSQL running on port 5432, db name: `myproject_dev`
- **Redis:** Running via Docker on default port 6379

```bash
# Start local services (example)
docker compose up -d db redis

# Activate Python env
source .venv/bin/activate
```

---

## Useful Local Commands

<!-- Commands that only work on your machine or aren't part of the standard workflow. -->

```bash
# Run a subset of tests quickly during development
npm test -- --watch src/auth

# Check bundle size
npm run build -- --analyze

# Connect to local DB
psql -U postgres -d myproject_dev
```

---

## Notes to Self

<!-- Use this as a scratchpad for reminders, ongoing work, or things to revisit. -->

- Remember to rotate the staging API key before the next release.
- The `UserService.bulkCreate()` method has a known N+1 issue — tracked in #142.
- PR review checklist: tests pass, no secrets, migrations included if schema changed.

---

## Temporary Overrides

<!-- Use this section to temporarily override rules from CLAUDE.md during a specific task.
     Remove or clear this section when done. -->

<!-- Example:
For the current refactor task only:
- It's OK to leave tests as "TODO" — I will add them in a follow-up PR.
- Focus on renaming and moving files, not on logic changes.
-->
