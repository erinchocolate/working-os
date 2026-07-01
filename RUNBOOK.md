# working-os v1 runbook

This is the quick path for trying the first low-friction version.

Note: `scripts/` is local-only and ignored by Git. The commands below work on this machine when those helper scripts exist locally; GitHub keeps the workflow rules and runbook, not machine-bound automation scripts.

## 1. Try inbox ingestion

1. Put any Markdown note into `inbox/`.
   - Example: drag `High Vis Docs – User Support Drop-in Support.md` into `inbox/`.
2. In Codex, say: `摄取 inbox`.
3. The agent should first read `AGENTS.md`, then `skills/摄取.md`.
4. If metadata is unclear, the agent should ask in the current conversation.
5. After ingestion, check:
   - source archived under `projects/<项目>/ingest/`
   - useful context routed into `context.md`, `design/`, `pitfalls.md`, `open-questions.md`, or `glossary.md`
   - original inbox file moved to `inbox/_processed/<日期>/`

## 2. Try session summary

At the end of a useful Codex conversation, say: `收工`.

The agent should write a digest under `worklog/<日期>-<简述>.md`.

## 3. Try manual daily review

Create a reminder packet manually if useful:

```bash
/opt/processes/working-os/scripts/remind-review.sh daily 2026-07-01
```

Then say in Codex:

```text
复盘 2026-07-01
```

Codex should read:
- `worklog/2026-07-01-*.md`
- `projects/*/ingest/2026-07-01-*.md`
- `projects/*/project.md` and git changes from each code root
- `reminders/daily/2026-07-01.md`

Expected output:
- `reviews/daily/2026-07-01.md`
- updated `reviews/recurring.md`

## 4. Try manual weekly/system review

```bash
/opt/processes/working-os/scripts/remind-review.sh weekly 2026-07-03
/opt/processes/working-os/scripts/remind-review.sh system 2026-07-03
```

Then say `周复盘 2026-07-03` or `系统复盘 2026-07-03` in Codex.

## 5. Optional inbox watcher

Run this in a terminal if you want a visible prompt whenever Markdown files appear in `inbox/`:

```bash
/opt/processes/working-os/scripts/watch-inbox.sh
```

The watcher does not ingest by itself. It writes a reminder under `reminders/inbox/` and tells you to open Codex and say `摄取 inbox`, so metadata questions can happen in the current conversation.

## 6. Optional automation with Windows Task Scheduler (paused by default)

The current recommended mode is manual review: create a reminder packet if useful, then tell Codex `复盘 <日期>`.

The scripts below are kept for later experimentation, but scheduled tasks are not required and should stay uninstalled while evaluating manual review quality.

Install scheduled tasks from the WSL/VS Code terminal only if you explicitly want automatic Codex review runs:

```bash
/opt/processes/working-os/scripts/install-review-tasks.sh
```

Default schedule:
- Daily review: Monday-Friday at 16:05
- Weekly review: Friday at 16:05
- System review: first Friday of each month at 15:30

The installer creates three Windows Task Scheduler tasks:
- `working-os daily review`
- `working-os weekly review`
- `working-os system review`

Each task calls WSL and runs Codex non-interactively through `scripts/run-review-codex.sh`.

Scheduled-run behaviour:
- Daily review writes `reviews/daily/<date>.md` and updates `reviews/recurring.md`.
- Weekly review writes `reviews/weekly/<date>.md` and proposes asset candidates, but does not edit `assets/` automatically.
- System review writes `reviews/system/<date>.md` with recommendations, but does not edit `AGENTS.md`, `skills/`, or scripts automatically.
- Logs and final Codex messages are written under `reminders/<kind>/`.
- A Windows popup appears when the scheduled Codex run finishes or fails.

To customize times:

```bash
/opt/processes/working-os/scripts/install-review-tasks.sh -DailyTime 16:05 -WeeklyTime 16:05 -SystemTime 15:30
```

To remove the tasks:

```bash
/opt/processes/working-os/scripts/uninstall-review-tasks.sh
```

To dry-run the Codex prompt without executing it:

```bash
DRY_RUN=1 /opt/processes/working-os/scripts/run-review-codex.sh daily 2026-07-01
```

To manually run an automated daily review for testing only:

```bash
/opt/processes/working-os/scripts/run-review-codex.sh daily
```

To test the Windows wrapper without waiting for the schedule:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "$env:LOCALAPPDATA\working-os\show-review-reminder.ps1" -Kind daily
```
