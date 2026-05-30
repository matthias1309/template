# Git Workflow

## Branch Naming

```
feature/<short-description>
fix/<issue-or-description>
chore/<what-is-being-done>
docs/<what-is-documented>
```

Examples: `feature/user-auth`, `fix/login-redirect`, `chore/update-deps`

## Commit Messages (Conventional Commits)

Format: `<type>(<scope>): <short description>`

Types: `feat`, `fix`, `chore`, `docs`, `refactor`, `test`, `perf`, `ci`

```
feat(auth): add JWT refresh token rotation
fix(api): correct status code on empty results
chore(deps): bump typescript to 5.4
```

Rules:
- Subject line: max 72 chars, imperative mood, no period at end
- Body: explain WHY, not what (the diff already shows what)
- Reference issue numbers: `Closes #42` or `Refs #42`

## Pull Requests

- One logical change per PR
- Fill in the PR template — summary, test plan, screenshots if UI
- Self-review the diff before requesting review
- No force-push to `main` or `master`
- Squash-merge feature branches; merge-commit for release branches

## Protected Branches

- `main` / `master`: production, protected, requires PR + review
- `develop` (if used): integration branch, requires PR

## What Not to Commit

- Secrets, API keys, credentials — use environment variables
- `node_modules/`, build artifacts, `.env` files
- Editor configs that aren't project-wide (`.vscode/` personal settings)
- Large binary files — use Git LFS or object storage
