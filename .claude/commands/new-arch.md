Create a new architecture document for a requirement.

Steps:
1. If $ARGUMENTS contains a REQ ID (e.g. "REQ-001"), use it. Otherwise ask: "Which REQ does this architecture address?"
2. Read the referenced REQ file from `docs/requirements/<REQ-ID>.md` to understand the story and ACs.
3. Scan `docs/architecture/` for existing ARCH-XXX.md files and determine the next ID.
4. Ask the user: "What is the title of this architecture document?" (e.g. "JWT Authentication Flow")
5. Ask: "Describe the design in a few sentences — components involved, data flow, key decisions."
6. Create the file `docs/architecture/<ID>.md` using this exact template:

```markdown
# <ARCH-ID> — <Title>

**Status:** draft
**Created:** <today YYYY-MM-DD>
**Traces:** <REQ-ID>
**Verified by:** _(pending TEST-SPEC)_

## Summary

<Short description of what is being designed and why.>

## Design

<Describe components, data flow, interfaces, API contracts, or sequences.
Use ASCII diagrams or Mermaid blocks where helpful.>

## Key Decisions

<Explain why this approach was chosen over alternatives.>

## Out of Scope

<What this architecture explicitly does not cover.>

## Open Questions

<Anything that needs clarification before implementation.>
```

7. Update the REQ file: replace `_(pending ARCH and TEST)_` in the `Traced by` field with `<ARCH-ID> _(TEST pending)_`.
8. Tell the user:
   - The file path created
   - The next step: "Run `/new-test-spec` and reference <ARCH-ID> to continue."
