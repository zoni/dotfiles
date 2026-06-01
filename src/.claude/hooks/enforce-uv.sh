#!/bin/bash
set -euo pipefail

INPUT=$(cat)
COMMAND=$(printf '%s' "$INPUT" | jq -r '.tool_input.command')
CWD=$(printf '%s' "$INPUT" | jq -r '.cwd')

# Match python/python3 (with optional version suffix like 3.11) at the start of any
# pipeline segment (beginning of command, or after ; & | characters), but not when
# it's part of a longer word (e.g. python-pip).
if ! printf '%s' "$COMMAND" | grep -qE '(^|[;&|])[[:space:]]*python(3(\.[0-9]+)?)?[[:space:]]|(^|[;&|])[[:space:]]*python(3(\.[0-9]+)?)?$'; then
  exit 0
fi

# Resolve project root: git root if available, else cwd
PROJECT_ROOT=$(cd "$CWD" && git rev-parse --show-toplevel 2>/dev/null) || PROJECT_ROOT="$CWD"

# Allow when no uv.lock present
[ ! -f "$PROJECT_ROOT/uv.lock" ] && exit 0

# Deny with a clear message
jq -n '{
  hookSpecificOutput: {
    hookEventName: "PreToolUse",
    permissionDecision: "deny",
    permissionDecisionReason: "Raw python/python3 invocations are not allowed in this project. A uv.lock was found — use `uv run python ...` instead."
  }
}'
