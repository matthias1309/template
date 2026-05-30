Generate a traceability matrix showing coverage across all V-Model artifacts.

Steps:
1. Scan `docs/requirements/` for all REQ-XXX.md files
2. Scan `docs/architecture/` for all ARCH-XXX.md files
3. Scan `docs/test-specs/` for all TEST-XXX.md files
4. For each REQ, determine:
   - Which ARCH files reference it (via `Traces: REQ-XXX`)
   - Which TEST-SPEC files reference it (via `Verifies: REQ-XXX`)
   - Which test files in the codebase contain TC comments (e.g. `// TC-001-01`)
5. Output the matrix in this format:

## Traceability Matrix

| REQ | Title | Status | ARCH | TEST-SPEC | Tests in Code |
|-----|-------|--------|------|-----------|---------------|
| REQ-001 | User Login | approved | ARCH-001 | TEST-001 | ✅ 3 tests |
| REQ-002 | Password Reset | draft | ❌ missing | ❌ missing | ❌ none |

Legend:
- ✅ = artifact exists and is linked
- ❌ = missing — action required
- ⚠️ = exists but not linked / status is draft

## Coverage Gaps

List any REQs that are missing ARCH, TEST-SPEC, or code-level tests.
For each gap, state the exact next step (e.g. "Run `/new-arch REQ-002` to continue").

## Summary

- Total requirements: X
- Fully traced (REQ → ARCH → TEST-SPEC → code): X
- Partially traced: X
- Untouched (draft, no ARCH): X
