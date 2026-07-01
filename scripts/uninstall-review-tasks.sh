#!/usr/bin/env bash
set -euo pipefail

ROOT="${WORKING_OS_ROOT:-/opt/processes/working-os}"
SCRIPT_WIN="$(wslpath -w "$ROOT/scripts/uninstall-review-tasks.ps1")"

powershell.exe -NoProfile -ExecutionPolicy Bypass -File "$SCRIPT_WIN" "$@"
