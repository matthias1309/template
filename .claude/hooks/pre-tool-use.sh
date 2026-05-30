#!/usr/bin/env bash
# Hook: PreToolUse
# Receives tool name and input via stdin as JSON.
# Exit code 0 = allow, non-zero = block the tool call.

LOG_DIR="$(dirname "$0")/../logs"
mkdir -p "$LOG_DIR"

# Parse tool name from the JSON input Claude passes via stdin
INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | grep -o '"tool_name":"[^"]*"' | head -1 | cut -d'"' -f4)
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Log every tool use
echo "[$TIMESTAMP] $TOOL_NAME" >> "$LOG_DIR/tool-use.log"

# Example: block accidental production database writes
# Uncomment and adapt as needed:
#
# if [[ "$TOOL_NAME" == "mcp__database__execute" ]]; then
#   QUERY=$(echo "$INPUT" | grep -o '"query":"[^"]*"' | cut -d'"' -f4)
#   if echo "$QUERY" | grep -qiE "^(DROP|TRUNCATE|DELETE FROM)"; then
#     echo "Blocked: destructive database operation requires manual confirmation." >&2
#     exit 1
#   fi
# fi

exit 0
