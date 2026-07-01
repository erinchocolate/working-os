#!/usr/bin/env bash
set -euo pipefail

ROOT="${WORKING_OS_ROOT:-/opt/processes/working-os}"
KIND="${1:-daily}"
DATE="${2:-$(date +%F)}"
DRY_RUN="${DRY_RUN:-0}"

CODE_ROOT="${CODE_ROOT:-/opt/processes/data_platform}"
LOG_DIR="$ROOT/reminders/$KIND"
RUN_ID="$(date +%Y%m%d-%H%M%S)"
LOG_FILE="$LOG_DIR/$DATE-codex-$RUN_ID.log"
LAST_MESSAGE_FILE="$LOG_DIR/$DATE-codex-$RUN_ID-final.md"
TIMEOUT_SECONDS="${CODEX_TIMEOUT_SECONDS:-900}"

find_codex() {
  if command -v codex >/dev/null 2>&1; then
    command -v codex
    return 0
  fi

  local candidate
  candidate="$(find /home/dataadmin/.vscode-server/extensions -path '*/bin/linux-x86_64/codex' -type f 2>/dev/null | sort | tail -n 1 || true)"
  if [[ -n "$candidate" ]]; then
    printf '%s\n' "$candidate"
    return 0
  fi

  return 1
}

CODEX_BIN="${CODEX_BIN:-$(find_codex)}"

mkdir -p "$LOG_DIR"

case "$KIND" in
  daily)
    REVIEW_PROMPT="复盘 $DATE"
    EXPECTED_OUTPUT="Write $ROOT/reviews/daily/$DATE.md and update $ROOT/reviews/recurring.md."
    PRIMARY_OUTPUT="$ROOT/reviews/daily/$DATE.md"
    SECONDARY_OUTPUT="$ROOT/reviews/recurring.md"
    EXTRA_RULES="If subjective context from the owner is missing, add a short '主人待补充' section instead of blocking."
    ;;
  weekly)
    REVIEW_PROMPT="周复盘 $DATE"
    EXPECTED_OUTPUT="Write $ROOT/reviews/weekly/$DATE.md and propose asset candidates, but do not edit assets without owner confirmation."
    PRIMARY_OUTPUT="$ROOT/reviews/weekly/$DATE.md"
    SECONDARY_OUTPUT=""
    EXTRA_RULES="Do not promote anything into assets automatically. Leave candidates for owner confirmation."
    ;;
  system)
    REVIEW_PROMPT="系统复盘 $DATE"
    EXPECTED_OUTPUT="Write $ROOT/reviews/system/$DATE.md with system friction, signals, and proposed improvements."
    PRIMARY_OUTPUT="$ROOT/reviews/system/$DATE.md"
    SECONDARY_OUTPUT=""
    EXTRA_RULES="Do not edit AGENTS.md, skills, or scripts automatically during scheduled runs. Record recommendations only."
    ;;
  *)
    echo "Usage: $0 {daily|weekly|system} [YYYY-MM-DD]" >&2
    exit 2
    ;;
esac

read -r -d '' PROMPT <<EOF || true
You are running an unattended scheduled working-os review.

First read $ROOT/AGENTS.md and follow its mandatory keyword-to-skill routing.
Then execute this workflow: $REVIEW_PROMPT

Non-interactive scheduled-run rules:
- Do not ask the owner questions during this run.
- If information is missing, write a concise TODO / owner-to-fill section in the output.
- Use absolute dates, not relative dates.
- Do not write credentials, PII, or real data values.
- $EXTRA_RULES

Expected output:
- $EXPECTED_OUTPUT
- Write a concise final summary explaining what files were read and written.
- After writing the expected files, respond with the final summary and stop.

Relevant roots:
- working-os root: $ROOT
- default code root: $CODE_ROOT
EOF

if [[ "$DRY_RUN" == "1" ]]; then
  echo "Codex binary: $CODEX_BIN"
  echo "Log file: $LOG_FILE"
  echo "Final message file: $LAST_MESSAGE_FILE"
  echo "Prompt:"
  printf '%s\n' "$PROMPT"
  exit 0
fi

echo "[$(date '+%Y-%m-%d %H:%M:%S %Z %z')] Starting $KIND review for $DATE" | tee "$LOG_FILE"
echo "Using Codex: $CODEX_BIN" | tee -a "$LOG_FILE"

set +e
timeout "$TIMEOUT_SECONDS" "$CODEX_BIN" exec \
  -C "$CODE_ROOT" \
  --add-dir "$ROOT" \
  -s workspace-write \
  --output-last-message "$LAST_MESSAGE_FILE" \
  "$PROMPT" >>"$LOG_FILE" 2>&1
status=$?
set -e

output_written=0
if [[ -f "$PRIMARY_OUTPUT" ]]; then
  if [[ -z "$SECONDARY_OUTPUT" || -f "$SECONDARY_OUTPUT" ]]; then
    output_written=1
  fi
fi

if [[ "$status" -eq 0 ]]; then
  echo "[$(date '+%Y-%m-%d %H:%M:%S %Z %z')] Completed $KIND review for $DATE" | tee -a "$LOG_FILE"
  echo "Final message: $LAST_MESSAGE_FILE" | tee -a "$LOG_FILE"
elif [[ "$status" -eq 124 && "$output_written" -eq 1 ]]; then
  echo "[$(date '+%Y-%m-%d %H:%M:%S %Z %z')] Codex timed out after $TIMEOUT_SECONDS seconds, but expected output exists. Treating $KIND review for $DATE as completed with timeout." | tee -a "$LOG_FILE"
  echo "Primary output: $PRIMARY_OUTPUT" | tee -a "$LOG_FILE"
  exit 0
else
  echo "[$(date '+%Y-%m-%d %H:%M:%S %Z %z')] FAILED $KIND review for $DATE with exit code $status" | tee -a "$LOG_FILE"
fi

exit "$status"
