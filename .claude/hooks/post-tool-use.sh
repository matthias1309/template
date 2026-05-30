#!/usr/bin/env bash
# Hook: PostToolUse
# Runs after a tool completes. Receives tool name + result via stdin as JSON.
# Exit code is ignored — this is notification-only.

INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | grep -o '"tool_name":"[^"]*"' | head -1 | cut -d'"' -f4)

# After file edits, remind to run the linter for relevant file types
if [[ "$TOOL_NAME" == "Write" || "$TOOL_NAME" == "Edit" ]]; then
  FILE_PATH=$(echo "$INPUT" | grep -o '"file_path":"[^"]*"' | head -1 | cut -d'"' -f4)

  if [[ "$FILE_PATH" =~ \.(ts|tsx|js|jsx)$ ]]; then
    echo "Hint: run 'npm run lint -- $FILE_PATH' to check for style issues." >&2
  fi

  if [[ "$FILE_PATH" =~ \.py$ ]]; then
    echo "Hint: run 'ruff check $FILE_PATH' to check for style issues." >&2
  fi
fi

# Example: notify on Bash tool use involving git push
# if [[ "$TOOL_NAME" == "Bash" ]]; then
#   COMMAND=$(echo "$INPUT" | grep -o '"command":"[^"]*"' | head -1 | cut -d'"' -f4)
#   if echo "$COMMAND" | grep -q "git push"; then
#     echo "Post-push hook: consider triggering a deploy preview." >&2
#   fi
# fi

exit 0
