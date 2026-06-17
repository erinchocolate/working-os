# working-os

一个 **agent 中立的个人工作操作系统**：帮你把工作高质量完成，并从工作中沉淀可带走的认知资产。
内核是纯 markdown，任何 agent（Claude Code / Cursor / Codex / GitHub Copilot）都能用。

系统怎么用，全部定义在 **[`AGENTS.md`](AGENTS.md)（唯一真源）**；设计蓝图见 [`BLUEPRINT.md`](BLUEPRINT.md)。

## 关键词 → skill

对任意 agent 说一个关键词，它就去 `skills/<关键词>.md` 照那份工作流执行：

| 关键词 | 做什么 |
|---|---|
| 摄取 | 把笔记/会议/交流转成结构化项目 context |
| 执行 | 基于 context 把需求转成代码/方案，副产品自动回写 |
| 润色 | 改英语 + 学你的英语风格 |
| 分享 | 出分享/演示初稿 + 学你的分享风格 |
| 复盘 | 沉淀认知，跨情境复现的晋升为认知资产 |
| 学习 | 苏格拉底式探讨一个话题，产出学习笔记 |

## 公开 vs 私有

- **公开（本仓库）**：`AGENTS.md`、`skills/`、`assets/`、`learning/`、各文件夹的 `_TEMPLATE/` 骨架与模板。
- **私有（只存本地，已 gitignore）**：`projects/`、`reviews/`、`style/` 里的**真实内容**。模板照常上传，所以架构可在任何机器上复现，但你的项目 context、复盘、风格画像不会离开本机。

## 在新机器上设置

```bash
git clone git@github.com:erinchocolate/working-os.git
cd working-os
bash setup.sh        # 从 _TEMPLATE 生成本地私有工作文件
```

之后新建项目：`cp -r projects/_TEMPLATE projects/<项目名>`。
