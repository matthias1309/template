Check whether every Test Case (TC) defined in TEST-SPEC files is implemented in code.

Steps:
1. Scan `docs/test-specs/` for all TEST-XXX.md files
2. For each TEST-SPEC, extract all TC IDs (pattern: `### TC-XXX-YY`)
3. For each TC ID, search the entire codebase (`tests/`, `e2e/`) for a comment referencing it (pattern: `// TC-XXX-YY`)
4. Output the results in this format:

## Test Coverage Matrix

| TEST-SPEC | TC ID | Description | Test File | Status |
|-----------|-------|-------------|-----------|--------|
| TEST-001 | TC-001-01 | Successful login redirects to "/" | `e2e/auth.spec.ts` | ✅ |
| TEST-001 | TC-001-02 | Generic error on wrong credentials | `tests/auth.test.ts` | ✅ |
| TEST-002 | TC-002-01 | Some scenario | — | ❌ missing |

Legend:
- ✅ = TC comment found in at least one test file
- ❌ = no `// TC-XXX-YY` comment found anywhere in `tests/` or `e2e/`
- ⚠️ = TEST-SPEC status is `draft` (test cases may still be provisional)

## Missing Implementations

List every TC that has no corresponding code comment.
For each missing TC, include:
- Which TEST-SPEC it belongs to
- The AC it covers (from the TEST-SPEC)
- The test file(s) declared in the TEST-SPEC's "Test Files" table (where the implementation should live)

Example output:
> **TC-003-02** (TEST-003, covers AC-003-02)
> Expected in: `tests/parsers/openair-parser.test.ts`
> Action: Add a test with `// TC-003-02` and implement the scenario.

## Summary

- Total TCs defined in TEST-SPECs: X
- Implemented (TC comment found): X  ✅
- Missing (no TC comment in code): X  ❌
- TEST-SPECs with full coverage: X / Y
