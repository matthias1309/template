# V-Model Process & Traceability

Every feature follows the V-Model sequence. Claude must never skip or reorder steps.

## Sequence (strictly enforced)

```
REQ  →  ARCH  →  TEST-SPEC  →  Tests (TDD)  →  Implementation  →  Code Review
```

1. **REQ** — A User Story exists in `docs/requirements/REQ-XXX.md`
2. **ARCH** — An architecture document exists in `docs/architecture/ARCH-XXX.md` that traces back to the REQ
3. **TEST-SPEC** — A test specification exists in `docs/test-specs/TEST-XXX.md` that maps every Gherkin AC to a concrete test case
4. **Tests** — Failing tests are written from the TEST-SPEC before any implementation code
5. **Implementation** — Code is written to make the tests pass
6. **Code Review** — A review document `docs/code-reviews/CR-XXX.md` is created from the template, filled in, and signed off before merging

## TDD Rule

- **Always write tests first** — before any implementation code
- Tests are derived directly from the Gherkin ACs in the REQ
- The test file must exist and fail before implementation begins
- Only skip TDD if the task is provably untestable (e.g. a one-off migration script) — in that case, state the reason explicitly

## Traceability IDs

| Artifact | ID Format | Location |
|---|---|---|
| User Story | `REQ-XXX` | `docs/requirements/REQ-XXX.md` |
| Architecture | `ARCH-XXX` | `docs/architecture/ARCH-XXX.md` |
| Test Spec | `TEST-XXX` | `docs/test-specs/TEST-XXX.md` |
| Acceptance Criterion | `AC-XXX-YY` | Inside the REQ file |
| Test Case | `TC-XXX-YY` | Inside the TEST-SPEC file |
| Code Review | `CR-XXX` | `docs/code-reviews/CR-XXX.md` |

IDs are zero-padded three-digit numbers (001, 002, ...).

## Linking Rules

- Every ARCH references at least one REQ: `Traces: REQ-XXX`
- Every TEST-SPEC references one ARCH and lists which ACs it verifies: `Traces: ARCH-XXX`, `Verifies: REQ-XXX (AC-XXX-01, AC-XXX-02)`
- Every test function or `it()` block references its TEST-SPEC ID in a comment: `// TC-001-01`
- Commit messages reference the REQ: `feat(auth): implement login — REQ-001`
- Every CR references the REQ, ARCH, and TEST-SPEC it covers: `Traces: REQ-XXX`, `Covers: ARCH-XXX, TEST-XXX`

## Code-Level Traceability

Implementation code is **not** annotated with REQ IDs in comments — that creates maintenance debt and violates the "comments explain why, not what" principle.

Instead, traceability from requirements to code is derived from **git history**:

- The commit message convention (`feat(auth): implement login — REQ-001`) is the link
- Every commit that implements or changes behavior for a requirement must reference the REQ ID
- This makes the full chain queryable without touching production code

**Querying the chain manually:**

```bash
# All commits for a requirement
git log --oneline --grep="REQ-001"

# Which implementation files were changed for a requirement
git log --oneline --name-only --grep="REQ-001"

# Full diff of all implementation changes for a requirement
git log -p --grep="REQ-001" -- src/
```

**Automated:** Run `/traceability` — it executes these queries for every REQ and includes the results in the coverage matrix.

## Claude Behaviour

- Before writing any implementation code, check that REQ + ARCH + TEST-SPEC exist for the feature
- If any artifact is missing, stop and tell the user which step is next
- When creating test stubs, copy the Gherkin scenario as a comment above the test
- A feature is not complete until a CR-XXX.md with status `approved` exists in `docs/code-reviews/`
- The template for new reviews is `docs/code-reviews/CR-TEMPLATE.md` — copy and rename it to `CR-XXX.md`
- Run `/traceability` at any time to get an overview of coverage gaps
