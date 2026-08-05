# mc-working-os — 给 AI 的系统说明（唯一真源）

这是一个**个人工作操作系统**：帮主人（数据工程师）把工作高质量完成，沉淀可带到下一个项目/工作的行动原则与表达素材，并通过分享把认知固化下来。
本文件是**唯一真源**——任何 agent（Claude Code / Cursor / Codex / GitHub Copilot…）进入这个仓库后，先读本文件，就知道整个系统怎么用。

## 这个系统是什么

两条互相喂养的主线：

1. **把工作高质量完成**：把笔记/交流「摄取」成共享 context 或个人 worklog → 新需求来时，基于积累的 context 快速产出代码与分享材料。系统越用越懂项目、越懂主人。
2. **把认知沉淀下来**：任务后用「小结」轻量捕获 → 收工时整理补漏 → 定期系统复盘时晋升为可带走的行动原则。
3. **通过分享固化认知**：Notion 保留原始素材，`materials/` 沉淀可复用表达素材，`sharing/` 把素材组织成某一次分享的主题地图、outline 和 talk track。

底层目的：把执行的时间省出来，留给思考和学习。

## 怎么用：关键词 → skill（强制路由）

主人对你说一个**关键词**，你必须把它当成工作流触发器，而不是普通聊天。

**强制规则**：
1. 只要主人的请求里出现下表关键词，第一步必须打开并完整阅读对应的 `skills/<关键词>.md`。
2. 读完 skill 后，先按 skill 的「先读」要求加载常驻指针和必要 context；共享项目/公司 context 从 `/opt/processes/context_platform` 读取。
3. 不能跳过、猜测或只凭记忆执行。若没有读到对应 skill，必须先停下来读。
4. 若一句话命中多个关键词，优先级为：`系统复盘` > `素材` > `摄取` > `执行` > `小结` > `收工` > `分享` > `润色` > `学习`；必要时说明会按哪个 workflow 先跑。
5. 关键词可以出现在句首或句中，例如「素材 这篇 Notion 笔记」「摄取 Marvin 这段笔记」「执行 Marvin 这个需求」「小结 Marvin 这次调试」「做一次系统复盘」。

### 日常执行与捕获

| 关键词 / 触发表达 | 必读 skill 文件 | 做什么 |
|---|---|---|
| 摄取、ingest | `skills/摄取.md` | 把输入路由到共享 context 或个人认知管道 |
| 执行、做这个任务、改代码、实现 | `skills/执行.md` | 基于共享 context + 真实代码仓库完成任务，副产品自动回写 |
| 小结、任务小结 | `skills/小结.md` | 任务后 3 分钟捕获结果、follow-up 和反思候选 |
| 收工、结束总结、session digest | `skills/收工.md` | 日终整理 daily 小结、follow-up 和可复用反思 |

### 学习与分享

| 关键词 / 触发表达 | 必读 skill 文件 | 做什么 |
|---|---|---|
| 素材、素材卡、整理素材、摄取素材 | `skills/素材.md` | 把 Notion/阅读/AI 聊天笔记提炼成可复用 Zettelkasten 素材卡 |
| 学习、一起学、讲讲 | `skills/学习.md` | 苏格拉底式探讨一个话题，产出学习笔记 |
| 分享、presentation、demo | `skills/分享.md` | 先组织 theme map，再写 outline / talk track |
| 润色、改英文、polish | `skills/润色.md` | 改英语 + 学主人的英语风格 |

### 系统维护

| 关键词 / 触发表达 | 必读 skill 文件 | 做什么 |
|---|---|---|
| 系统复盘、复盘系统、working-os 复盘 | `skills/系统复盘.md` | 从 recurring 晋升行动原则 + 检查/改进系统本身 |

**执行确认句**：触发 skill 后，agent 应该简短说明「我会先读 `skills/<关键词>.md`，再按它执行」。

## 认知管道

```
任务结束 → 小结 → worklog/<日期>-daily.md (可含 Reflection Candidate)
工作 session → 收工 → 汇总/补漏 daily worklog + 必要时更新 recurring.md
执行任务 → 执行 worklog (可含 Reflections) + 必要时增量更新 recurring.md
                                                          ↓
                              reviews/recurring.md（认知候选池）
                                  ↙                         ↘
            系统复盘 → assets/（行动原则）       素材 → materials/（表达素材）
                                                          ↓
                                                分享 → sharing/（主题地图/讲稿）
```

- **worklog/** — 原始数据：daily 小结、每次 session / 执行任务的事实记录 + 认知提炼，默认只留本地
- **reviews/recurring.md** — 中间层：候选池，小结/收工/执行在有可复用反思时增量维护，默认只留本地
- **assets/** — 行动原则：少量、已验证、会改变主人工作方式的常驻 prompt 级认知，可上传
- **materials/** — 表达素材：可讲给别人听、可服务未来深入分享的素材卡，可上传
- **sharing/** — 分享产物：某一次分享的 theme map、outline、talk track，默认只留本地

## 每次会话先读（常驻指针）

开始任何 skill 前，先加载这几个文件作为「记忆」——它们是提炼后能直接当 prompt 用的精炼结论：

1. `assets/INDEX.md` — 行动原则精简索引（主人是谁、怎么思考、有哪些已验证原则）
2. `style/english-profile.md` — 主人的英语表达风格规则
3. `style/sharing-profile.md` — 主人的知识分享风格规则

重内容（`/opt/processes/context_platform` 的项目/公司 context、worklog 历史）**按需读**，不要每次全量加载。

## 文件地图

```
AGENTS.md            本文件，唯一真源
skills/              工作流（行为层）：9 个 skill
materials/           表达素材库：index.md + cards/
worklog/             AI session digest + reflections（认知管道原料）
reviews/recurring.md 认知候选池（中间层，有可复用反思时增量更新）
reviews/system/      系统复盘记录（系统演化轨迹）
assets/              行动原则：INDEX.md / mental-models.md
style/               风格画像 + 配对样本
sharing/             某一次分享的 theme map、outline、talk track
```

## 低摩擦运行原则

- **主人负责捕获，不负责整理**：在对话中说「摄取 <项目/主题>」+ 粘贴内容，或指定文件路径即可。
- **AI 负责分类、归档、抽取**：摄取时由 AI 判断类型、路由目标；共享项目/公司 context 写到 `/opt/processes/context_platform`，个人反思写到本 repo。
- **认知先候选，再分流**：工作/学习中的认知先进入 `reviews/recurring.md`；能指导主人做事的，系统复盘后进 `assets/mental-models.md`；适合讲给别人听的，经「素材」变成 `materials/` 卡片。
- **素材先归卡片，再变分享**：Notion 是原始素材真源；`materials/` 存跨分享复用的表达素材，`sharing/` 存某一次分享的组织和成稿。
- **上传已提炼、可迁移的东西**：能带到下一个项目/工作的个人认知、表达框架和风格画像可以进 repo；原始工作记录、review 过程、具体分享稿、样本和公司内部材料默认留本地。
- **在记忆最热的时候问**：交互摄取时缺 metadata、项目归属不确定、敏感度不确定或遇到矛盾，就直接在当前对话问主人。
- **行动原则谨慎确认**：`assets/` 只保留 `INDEX.md` 和 `mental-models.md`；重要教训、坑、判断框架都写成行动原则，且必须在系统复盘晋升前问主人确认。

## 约定

- **日期写绝对值**（如 `2026-06-18`），不要写「今天/上周」。
- **脱敏**：不要把真实数据值 / 凭证 / PII 样例写进任何文件。代码、表名、字段名、DDL 不算敏感，可正常引用。
- **共享 context 只存代码说不出来的东西**：为什么这么设计、谁拍的板、试过什么放弃了、开放问题、术语——不复述代码本身；共享 context 的唯一位置是 `/opt/processes/context_platform`。
- **中英边界**：`working-os` 可保留中文 workflow trigger 和个人反思；写入 `context_platform` 的共享 context 默认用英文，必要时先翻译再沉淀。
- **素材版权边界**：`materials/` 以主人的总结、takeaway 和使用场景为主；只保留短 quote 和 source link，不复制长篇原文。
- 写文件时遵循各 skill 里定义的「调和 / 晋升 / 人机边界」规则，别盲目覆盖或追加。
