#!/usr/bin/env bash
set -euo pipefail

ROOT="${WORKING_OS_ROOT:-/opt/processes/working-os}"
KIND="${1:-daily}"
DATE="${2:-$(date +%F)}"

case "$KIND" in
  daily)
    DIR="$ROOT/reminders/daily"
    FILE="$DIR/$DATE.md"
    PROMPT="复盘 $DATE。请读取今天的 ingest、worklog、git changes，然后写 reviews/daily/$DATE.md 并更新 reviews/recurring.md。"
    ;;
  weekly)
    DIR="$ROOT/reminders/weekly"
    FILE="$DIR/$DATE.md"
    PROMPT="周复盘 $DATE。请读取本周 daily reviews、worklog、ingest 和 recurring，写 reviews/weekly/$DATE.md，并提出 assets 候选。"
    ;;
  system)
    DIR="$ROOT/reminders/system"
    FILE="$DIR/$DATE.md"
    PROMPT="系统复盘 $DATE。请检查 inbox、_needs-review、worklog、reviews 和 skills 的摩擦点。"
    ;;
  *)
    echo "Usage: $0 {daily|weekly|system} [YYYY-MM-DD]" >&2
    exit 2
    ;;
esac

mkdir -p "$DIR"
cat > "$FILE" <<EOF
# $DATE · $KIND review reminder

Generated at: $(date '+%Y-%m-%d %H:%M:%S %Z %z')

## Prompt
$PROMPT
EOF

echo "$PROMPT"
echo "Reminder written to $FILE"
