# GitHub Copilot 适配器 — mc-working-os

本仓库是一个**个人工作操作系统**。它的行为与约定全部定义在仓库根的 **`AGENTS.md`（唯一真源）**。

**第一步：打开并读 `AGENTS.md`，以它为准。** 本文件只是 Copilot 的触发入口，下面是精简摘要，细节一律以 `AGENTS.md` 和 `skills/` 为准。

## 触发机制：关键词 → skill

当我（主人）以某个**关键词**开头跟你说话，你要先打开 `skills/<关键词>.md`，按那份工作流执行：

| 关键词 | 读这个文件 |
|---|---|
| 摄取 | `skills/摄取.md` |
| 执行 | `skills/执行.md` |
| 润色 | `skills/润色.md` |
| 分享 | `skills/分享.md` |
| 复盘 | `skills/复盘.md` |
| 学习 | `skills/学习.md` |

## 每次会话先读（常驻指针）

执行任何 skill 前，先加载这几个文件当「记忆」：
`assets/INDEX.md`、`style/english-profile.md`、`style/sharing-profile.md`。

## 约定（详见 AGENTS.md）

- 日期写绝对值（如 `2026-06-18`）。
- 不要把真实数据值 / 凭证 / PII 写进任何文件；代码、表名、字段名、DDL 可正常引用。
- 项目 context 只存代码说不出来的东西（为什么、谁拍板、坑、开放问题、术语）。
