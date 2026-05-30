# CR-XXX — <Title>

**Status:** draft | in-review | approved | needs-changes
**Created:** YYYY-MM-DD
**Reviewer:** <Name>
**Traces:** REQ-XXX
**Covers:** ARCH-XXX, TEST-XXX

---

## Summary

_Brief description of what was reviewed (feature, scope, relevant files)._

---

## Checklist

### Traceability

- [ ] REQ exists and is complete
- [ ] ARCH exists and traces back to REQ
- [ ] TEST-SPEC exists and covers all ACs
- [ ] All test functions reference their TC-ID
- [ ] Commit messages reference the REQ

### Code Quality

- [ ] Follows coding style (`coding-style.md`)
- [ ] No `any` types (TypeScript) / no untyped variables (Python)
- [ ] No magic numbers or unexplained constants
- [ ] No commented-out code
- [ ] Functions are single-responsibility and ≤ 30 lines
- [ ] Early returns used instead of deep nesting

### Tests

- [ ] Tests written before implementation (TDD)
- [ ] All ACs have corresponding test cases
- [ ] Tests follow AAA structure
- [ ] No real I/O in unit tests (mocks at boundaries)
- [ ] Edge cases covered explicitly

### Security

- [ ] No secrets or credentials in code or comments
- [ ] Input validated at system boundaries
- [ ] No obvious injection vectors (SQL, XSS, command)
- [ ] Dependencies not unnecessarily added

### Documentation

- [ ] Public interfaces have a short doc comment where non-obvious
- [ ] `CLAUDE.md` / rules updated if conventions changed
- [ ] Migration or breaking changes noted

---

## Findings

_List issues found during review. Use severity: **blocker** / **major** / **minor** / **nit**._

| # | Severity | File / Line | Description |
|---|----------|-------------|-------------|
| 1 | blocker  | `src/foo.ts:42` | _Example: missing input validation_ |

---

## Decision

- [ ] **Approved** — ready to merge
- [ ] **Approved with minor fixes** — fix before merge, no re-review needed
- [ ] **Needs changes** — address findings and re-submit

### Notes

_Optional: reasoning, open questions, follow-up tasks._
