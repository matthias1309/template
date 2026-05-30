Summarize the pull request $ARGUMENTS in a structured format.

Steps:
1. Run `git log main..HEAD --oneline` to list commits on this branch
2. Run `git diff main...HEAD --stat` to see which files changed and how much
3. Run `git diff main...HEAD` to read the full diff
4. Check for new or modified test files

Then output a summary in this format:

## PR Summary

**Branch:** (current branch name)
**Commits:** (count)

### What Changed
(2-4 bullet points describing the functional changes)

### Files Modified
(list the key files and what was done to each)

### Tests
(were tests added or updated? which cases are covered?)

### Potential Impact
(what could this break or affect in other parts of the codebase?)
