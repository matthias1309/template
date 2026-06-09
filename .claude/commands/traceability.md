Generate a traceability matrix showing coverage across all V-Model artifacts,
including which code files and commits belong to each requirement.

Steps:
1. Scan `docs/requirements/` for all REQ-XXX.md files
2. Scan `docs/architecture/` for all ARCH-XXX.md files
3. Scan `docs/test-specs/` for all TEST-XXX.md files
4. For each REQ, determine:
   - Which ARCH files reference it (via `Traces: REQ-XXX`)
   - Which TEST-SPEC files reference it (via `Verifies: REQ-XXX`)
   - Which test files in the codebase contain TC comments (e.g. `// TC-001-01`)
5. For each REQ, run the following git command to find all commits that reference it:
   ```
   git log --oneline --name-only --grep="REQ-XXX"
   ```
   Collect the unique set of changed files across all matching commits.
   Exclude docs/ files and test files — only list implementation source files.
   If no commits match, mark as ❌ no commits.
6. Output the matrix in this format:

## Traceability Matrix

| REQ | Title | Status | ARCH | TEST-SPEC | Tests in Code | Code Files |
|-----|-------|--------|------|-----------|---------------|------------|
| REQ-001 | User Login | approved | ARCH-001 | TEST-001 | ✅ 3 tests | ✅ 2 files |
| REQ-002 | Password Reset | draft | ❌ missing | ❌ missing | ❌ none | ❌ none |

Legend:
- ✅ = artifact exists and is linked
- ❌ = missing — action required
- ⚠️ = exists but not linked / status is draft

## Code-Level Traceability

For each REQ that has matching commits, list the details:

### REQ-001 — <Title>
**Commits:** X commits found
**Implementation files touched:**
- `src/auth/login.ts` — changed in 2 commits
- `src/auth/session.ts` — changed in 1 commit

**How to drill deeper:**
```bash
git log --oneline --grep="REQ-001"          # all commits
git log -p --grep="REQ-001" -- src/         # full diff of implementation changes
```

## Coverage Gaps

List any REQs that are missing ARCH, TEST-SPEC, code-level tests, or commits.
For each gap, state the exact next step (e.g. "Run `/new-arch REQ-002` to continue").

## Summary

- Total requirements: X
- Fully traced (REQ → ARCH → TEST-SPEC → code → commits): X
- Partially traced: X
- Untouched (draft, no ARCH): X
