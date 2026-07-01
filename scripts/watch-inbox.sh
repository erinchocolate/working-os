#!/usr/bin/env bash
set -euo pipefail

ROOT="${WORKING_OS_ROOT:-/opt/processes/working-os}"
INBOX="$ROOT/inbox"
REMINDER_DIR="$ROOT/reminders/inbox"
POLL_SECONDS="${POLL_SECONDS:-5}"

mkdir -p "$REMINDER_DIR"

echo "Watching $INBOX for Markdown files. Press Ctrl+C to stop."

while true; do
  found=0
  while IFS= read -r -d '' file; do
    found=1
    base="$(basename "$file")"
    stamp="$(date +%F-%H%M%S)"
    reminder="$REMINDER_DIR/$stamp.md"
    cat > "$reminder" <<EOF
# $stamp · inbox item detected

Detected file: $file

## Prompt
摄取 inbox。请优先处理 $base；如果项目、类型、日期或敏感度不确定，请在当前对话直接问主人。
EOF
    echo "Inbox item detected: $file"
    echo "Prompt written to $reminder"
  done < <(find "$INBOX" -maxdepth 1 -type f -name '*.md' -print0)

  if [[ "$found" -eq 1 ]]; then
    echo "Open Codex and say: 摄取 inbox"
  fi

  sleep "$POLL_SECONDS"
done
