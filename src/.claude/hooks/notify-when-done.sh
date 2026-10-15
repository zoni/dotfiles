#!/bin/bash
# Claude Code desktop notification hook.
# Shows a Linux desktop notification when Claude Code finishes or needs input.
#
# Usage: notify-when-done.sh [title]
# Reads the hook JSON payload from stdin; for Notification events the
# `message` field is used as the body, otherwise a generic message is shown.

TITLE="${1:-Claude Code}"

INPUT=$(cat)
EVENT=$(printf '%s' "$INPUT" | jq -r '.hook_event_name // empty' 2>/dev/null)
MESSAGE=$(printf '%s' "$INPUT" | jq -r '.message // empty' 2>/dev/null)
CWD=$(printf '%s' "$INPUT" | jq -r '.cwd // empty' 2>/dev/null)

if [ -z "$MESSAGE" ]; then
    case "$EVENT" in
        Stop) MESSAGE="Done, waiting for your input" ;;
        *) MESSAGE="Waiting for your input" ;;
    esac
fi

[ -n "$CWD" ] && TITLE="$TITLE: $(basename "$CWD")"

if ! command -v notify-send &>/dev/null; then
    echo "Warning: notify-send not found (install libnotify)" >&2
    exit 0  # Don't fail the hook
fi

notify-send --app-name="Claude Code" --icon=dialog-information "$TITLE" "$MESSAGE" 2>/dev/null || true
exit 0
