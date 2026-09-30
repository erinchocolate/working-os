# 个人判断

只保存会影响今后工作取舍的判断和有意识记录的技术学习；不是项目事实库或每日笔记。新条目先与主人核对表述、依据、适用边界及下一次如何验证；证据不足时标记为待验证。已有判断出现新证据时更新原条目，不重复新增。工作过程留在本地 `worklog/`，团队要依赖的正式项目决定以 `/opt/processes/context_platform` 为准。

## 排查多层系统，先拆管理职责

- 判断：先分清配置、部署、运行时和权限分别由谁管理，再逐层回读实际状态；不要把不同层的成功当成同一件事。
- 适用边界：多层代理的部署、CI/CD、应用运行时和权限问题；具体资源行为仍需核对项目文档与代码。
- 依据：2026-06-19、2026-06-29、2026-07-08 的 Marvin 排查记录；详见本地 `worklog/` 和共享项目索引 `/opt/processes/context_platform/projects/marvin/index.md`。
- 状态：已验证；记录于 2026-07-08。

## 用反馈和实验判断 AI 产品优先级

- 判断：定性反馈帮助发现问题；决定优先级还需要观察、样本和量化实验，区分问题是否存在、出现频率及潜在收益。
- 适用边界：AI 产品与检索改进的优先级判断；不能用单一指标代替用户反馈。
- 依据：本地 `worklog/2026-07-31-Marvin-retrieval-diagnostics-experiments.md`、`worklog/2026-08-07-session-sprint-review.md`。
- 状态：已验证；记录于 2026-08-07。

## 外化经过筛选的 context

- 判断：复杂项目不能只依赖一段 prompt；记录代码无法说明的背景、约束和决策依据，才能让人和 agent 复用判断。更多 context 不一定更好。
- 适用边界：项目协作和交接；只记录能帮助下一次判断的内容，不复制实现或原始私密材料。
- 依据：本地 `worklog/2026-08-04-two-repo-cleanup.md`、`worklog/2026-08-06-thinking.md`。
- 状态：已验证；记录于 2026-08-07。

## 分层验证 AI 产品的质量

- 判断：分别验证 wiring、retrieval quality、answer quality 和 serving safety；机制接通不等于检索改善、回答更好或可以上线。
- 适用边界：RAG 功能与实验。对比检索方案前，先确认预处理和语料路由等条件是否一致。
- 依据：本地 `worklog/2026-07-24-Marvin-fleet-filter-tests.md`、`worklog/2026-07-31-Marvin-fleet-filter-evaluation.md`、`worklog/2026-09-03-Marvin-CCS-search-routing.md`。
- 状态：已有多次实践；整理于 2026-09-30。

## 把产品过滤条件当作端到端数据契约

- 判断：scope/filter 不只是 UI 控件；源数据、转换、chunk、index metadata、检索条件、界面状态和评估必须对齐。
- 适用边界：涉及 metadata 的数据产品和 RAG 功能；逐段验证，不能只用前端测试证明端到端生效。
- 依据：本地 `worklog/2026-07-15-Marvin-fleet-downstream-columns.md`、`worklog/2026-07-20-Marvin-fleet-backfill-sql.md`、`worklog/2026-07-24-Marvin-fleet-filter-tests.md`。
- 状态：已有项目实践；整理于 2026-09-30。

## 诊断检索问题后再选优化手段

- 判断：先区分语料覆盖、召回窗口、reranker 行为和 query wording；再决定调整 top-k、query expansion 或 chunking。
- 适用边界：检索失败的归因；一次诊断不能自动证明某项优化普遍有效。
- 依据：本地 `worklog/2026-07-31-Marvin-retrieval-diagnostics-experiments.md`。
- 状态：一次项目实践，跨场景适用性待验证；整理于 2026-09-30。

## 人负责定义问题与取舍

- 判断：与 AI 协作时，我的价值在于判断目标、组织信息和架构工作，并为最终取舍负责，而不是只比较产出速度。
- 适用边界：个人工作方法；这不是对所有岗位或任务的普遍结论。
- 依据：本地 `worklog/2026-08-06-thinking.md` 中关于 AI 协作的口述整理。
- 状态：个人判断；记录于 2026-08-06。

## 自然语言可能成为调用计算与知识的高层界面

- 判断：AI 不只是一个聊天产品；自然语言可能降低人调用计算、数据和知识能力的门槛。
- 适用边界：对人机界面变化的个人技术观察，不等于所有能力都能可靠地用自然语言完成。
- 依据：2026-08-05 的文章阅读与个人讨论；原始文章链接未保留。
- 状态：来源待补、观点待验证；整理于 2026-09-30。