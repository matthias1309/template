Create a new test specification document and write the initial failing test stubs (TDD).

Steps:
1. If $ARGUMENTS contains an ARCH ID (e.g. "ARCH-001"), use it. Otherwise ask: "Which ARCH does this test spec cover?"
2. Read `docs/architecture/<ARCH-ID>.md` to find the traced REQ ID.
3. Read `docs/requirements/<REQ-ID>.md` to get all Gherkin ACs.
4. Scan `docs/test-specs/` for existing TEST-XXX.md files and determine the next ID.
5. For each AC in the REQ, create one test case entry. Number them TC-<TEST-NUM>-01, TC-<TEST-NUM>-02, etc.
6. Create `docs/test-specs/<TEST-ID>.md` using this exact template:

```markdown
# <TEST-ID> — <Title>

**Status:** draft
**Created:** <today YYYY-MM-DD>
**Traces:** <ARCH-ID>
**Verifies:** <REQ-ID> (<list all AC IDs>)

## Test Cases

### <TC-ID-01> — <AC short name>

**Maps to:** <AC-ID-01>
**Type:** unit | integration | e2e
**File:** `<suggested test file path>`

```gherkin
Given <context>
When <action>
Then <outcome>
```

**Notes:** _(mocks needed, edge cases, setup requirements)_

---

### <TC-ID-02> — <AC short name>

...
```

7. After creating the TEST-SPEC, immediately write the failing test stubs:
   - Create or update the test file(s) listed in the spec
   - Each test stub must include:
     - The TC ID as a comment on the first line: `// TC-001-01`
     - The full Gherkin scenario as a comment block
     - An `it()` or `test()` block with Arrange/Act/Assert structure
     - The assertion must fail (use `expect(true).toBe(false)` or `throw new Error('not implemented')`)
   - Example stub:
     ```typescript
     // TC-001-01
     // Given the user is not logged in
     // When they submit valid credentials
     // Then they receive a JWT token
     it('should return a JWT token when valid credentials are submitted', () => {
       // Arrange

       // Act

       // Assert
       throw new Error('not implemented')
     })
     ```

8. Update the ARCH file: replace `_(pending TEST-SPEC)_` in the `Verified by` field with `<TEST-ID>`.
9. Update the REQ file: update the `Traced by` field to include `<TEST-ID>`.
10. Tell the user:
    - The TEST-SPEC file path
    - The test file(s) created with failing stubs
    - The next step: "Tests are failing — implement the code to make them pass. Reference <REQ-ID> in your commit message."
