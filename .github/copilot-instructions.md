# GitHub Copilot 适配器 — mc-working-os

本仓库是一个**个人工作操作系统**。它的行为与约定全部定义在仓库根的 **`AGENTS.md`（唯一真源）**。

**第一步：打开并读 `AGENTS.md`，以它为准。** 本文件只是 Copilot 的触发入口，下面是精简摘要，细节一律以 `AGENTS.md` 和 `skills/` 为准。

## 触发机制：关键词 → skill（强制）

当我（主人）的请求命中某个**关键词或触发表达**，你必须先打开对应 `skills/<关键词>.md`，读完后按那份工作流执行。不能跳过、猜测或只凭记忆执行；若没读到 skill，先停下来读。

| 关键词 / 触发表达 | 读这个文件 |
|---|---|
| 摄取、摄取 inbox、处理 inbox、ingest | `skills/摄取.md` |
| 执行、做这个任务、改代码、实现 | `skills/执行.md` |
| 润色、改英文、polish | `skills/润色.md` |
| 分享、presentation、demo | `skills/分享.md` |
| 复盘、日复盘、今天复盘、周复盘、daily review、weekly review | `skills/复盘.md` |
| 学习、一起学、讲讲 | `skills/学习.md` |
| 收工、结束总结、session digest | `skills/收工.md` |
| 系统复盘、复盘系统、working-os 复盘 | `skills/系统复盘.md` |

如果一句话命中多个关键词，按 `AGENTS.md` 的优先级处理，并简短说明先跑哪个 workflow。

## 每次会话先读（常驻指针）

执行任何 skill 前，先加载这几个文件当「记忆」：
`assets/INDEX.md`、`style/english-profile.md`、`style/sharing-profile.md`。

## 约定（详见 AGENTS.md）

- 日期写绝对值（如 `2026-06-18`）。
- 不要把真实数据值 / 凭证 / PII 写进任何文件；代码、表名、字段名、DDL 可正常引用。
- 项目 context 只存代码说不出来的东西（为什么、谁拍板、坑、开放问题、术语）。
