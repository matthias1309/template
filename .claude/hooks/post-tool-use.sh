#!/usr/bin/env bash
# Hook: PostToolUse (matcher: Edit|Write)
# Lints the edited file. On findings, exits with code 2 so Claude Code feeds the linter output
# back to Claude, which then fixes the file. A hint on stderr with exit 0 is ignored in practice.
# Formatters (Prettier, ruff format) are intentionally not run here: on a tree that is not yet
# formatted they would rewrite whole files and bury the real change in a noise diff.

set -u

INPUT=$(cat)
# jq is not guaranteed on every machine — plain grep is enough for this single field
FILE_PATH=$(printf '%s' "$INPUT" | grep -o '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' \
  | head -1 | sed 's/.*"\([^"]*\)"$/\1/')

[[ -n "$FILE_PATH" && -f "$FILE_PATH" ]] || exit 0
cd "${CLAUDE_PROJECT_DIR:-.}" || exit 0

LINT_OUTPUT=""
if [[ "$FILE_PATH" =~ \.(ts|tsx|js|jsx)$ ]] && [[ -x node_modules/.bin/eslint ]]; then
  LINT_OUTPUT=$(node_modules/.bin/eslint --no-warn-ignored "$FILE_PATH" 2>&1) && exit 0
elif [[ "$FILE_PATH" =~ \.py$ ]] && command -v ruff >/dev/null 2>&1; then
  LINT_OUTPUT=$(ruff check "$FILE_PATH" 2>&1) && exit 0
else
  exit 0
fi

echo "Lint findings in $FILE_PATH — fix them before continuing:" >&2
echo "$LINT_OUTPUT" >&2
exit 2
