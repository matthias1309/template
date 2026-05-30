Capture a new learning and append it to the appropriate learnings file.

The user provides the learning as $ARGUMENTS in free-form text.

Steps:
1. Parse $ARGUMENTS to extract the key insight. If it sounds project-specific (technical decisions, architecture, tooling, project conventions), write to `.claude/rules/learnings.md`. If it sounds like a personal workflow preference or general working style, write to `~/.claude/rules/learnings.md`.
2. If unclear, ask one short question: "Project-specific or personal workflow?"
3. Format the entry as:

```
## <today's date YYYY-MM-DD> — <concise title>
**Context:** <when/where was this noticed>
**Learning:** <what was learned>
**Action:** <what we change or watch out for going forward>
```

4. Append the formatted entry at the bottom of the target file (after the last `---` or at end of file).
5. Confirm to the user: which file was updated and what the entry says.

If $ARGUMENTS is empty, ask the user to describe the learning in one or two sentences.
