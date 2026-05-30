Scan the codebase for technical debt markers and report them grouped by file.

Run this command:
```
grep -rn --include="*.ts" --include="*.tsx" --include="*.js" --include="*.jsx" --include="*.py" -E "(TODO|FIXME|HACK|XXX|TEMP|NOCOMMIT)(\(.*\))?:" . | grep -v node_modules | grep -v ".git"
```

Then output a structured report:

## Technical Debt Report

**Total findings:** (count)

### By File

For each file that has matches, list:
- The file path
- Each finding with line number, type (TODO/FIXME/etc.), and the comment text

### By Type

Group counts: how many TODOs, FIXMEs, HACKs, etc.

### Oldest / Most Critical

If any FIXME or HACK items exist, highlight them separately since they indicate known bugs or unstable workarounds.

End with a recommendation: are there items that should be addressed before the next release?
