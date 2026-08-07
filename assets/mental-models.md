# 心智模型 / 方法论（行动原则）

跨情境反复出现、已验证可迁移、会改变主人工作方式的思考方式与方法。由「系统复盘」晋升写入，每条链回支撑它的证据。重要坑、判断框架、方法和反复验证的教训都统一写成这里的行动原则；适合讲给别人听的表达版本进入 `materials/`。

## 排查复杂系统问题时，先把管理职责按层拆开，再逐层验证

一个资源可能同时被多个层管理（配置层、部署层、运行时层、权限层）。出问题时，先画出"谁管什么"的 ownership matrix，再逐层确认实际状态，避免在错误的层上排查。

- **Databricks 具象**：bundle-managed（配置声明）、job-managed（部署 job 代码创建/更新）、app-runtime-managed（app 运行时持续写入）是三类不同 ownership；权限上 deploy SP、job runtime SP、app identity、endpoint identity、UI 用户可见性也各自独立。
- **泛化**：任何"一个动作经过多层代理"的系统（CI/CD、IaC、微服务编排）都适用同样的拆层排查法。

**证据（4 次，跨 bundle 配置层 + app 运行时两个情境）**：
- 2026-06-24: endpoint 从 bundle 迁到 job 管理后，deploy 与 run job 职责分离
- 2026-06-19: bundle variable / experiment resource / app runtime 三层拆开后定位 feedback experiment 漂移
- 2026-06-29: bundle config / app.yaml / rag_deployment_job / endpoint 拆开后确认 `${bundle.target}` 行为
- 2026-07-08: deploy SP / job runtime SP / app identity / endpoint identity / UI 用户分开后看清生产权限模型

晋升日期：2026-07-08

## 改进 AI 产品时，用反馈、观察和实验共同决定优先级

AI 产品的问题很容易被“感觉”描述出来，但真正排优先级时，要把用户反馈、定性观察和量化实验连成决策循环。先用定性信号发现问题，再用 evaluation / golden dataset / 对比实验判断问题严重程度、出现频率和潜在收益，最后再决定下一步做什么。

- **适用场景**：retrieval improvement、RAG evaluation、feature impact 判断、roadmap priority、business feedback triage。
- **使用方式**：不要只问“这个问题存在吗”，还要问“它出现多少次、影响多大、修复后能改善什么、有没有样本或实验支持”。
- **边界**：定性反馈仍然重要，它帮助发现问题和解释现象；量化实验帮助判断严重程度和优先级。二者互补，不互相替代。

**证据（来自 HVD retrieval strategy）**：
- 2026-07-31: retrieval diagnostics 先分层标注 coverage、ranking window、reranker behavior 和 query wording，再决定调 query expansion、top-k 或 chunking。
- 2026-08-07: sprint review 中确认，acronym expansion 的优先级来自 golden dataset analysis 和 retrieval experiments，而不是只凭感觉。
- 2026-08-07: 对比定性分析和量化分析后，明确“涉及优先级，需要用户反馈和量化实验共同辅助决策”。

晋升日期：2026-08-07

## 把隐性知识外化成 AI 可用的 context infrastructure

高质量 AI 协作不是把每次需求写成长 prompt，而是给 AI 搭建一个能长期使用的信息环境：项目背景、代码入口、历史决策、踩过的坑、个人偏好和判断原则。文档化不是行政负担，而是人和 AI 共同复用判断的基础设施。

- **适用场景**：复杂项目协作、agent coding、项目交接、个人知识系统、团队 context sharing。
- **使用方式**：把脑中反复使用的判断、项目背景和决策依据写成可被 AI 读取的 context；保留能帮助未来判断的信息，过滤一次性噪音。
- **筛选问题**：
  - 这个信息能帮助 AI 理解我现在为什么这样做吗？
  - 这个信息能帮助未来的我或 AI 做更好的判断吗？
  - 这个信息能帮助我避免重复踩同一个坑吗？
- **边界**：context 不是越多越好；更多 context 如果没有筛选，会变成噪音。真正有价值的是经过提炼、能帮助下一步判断的信息。

**证据（来自 Working OS / Context Platform / AI collaboration）**：
- 2026-08-04: shared project/company context 从 working-os 迁到 context_platform，个人反思和分享材料留在 working-os，系统边界更清楚。
- 2026-08-06: thinking log 中明确“Prompt 是入口，context infrastructure 才是复杂项目里真正的协作环境”。
- 2026-08-06: 素材卡 `从 Prompt 到 Context Infrastructure` 和 `AI 协作飞轮` 将这个经验转成可复用表达素材。
- 2026-08-07: 系统复盘确认 historical worklog 可以回捞 recurring 和 materials，说明外化记录正在产生复利。

晋升日期：2026-08-07

<!--
模板：
## <一句话原则>
- 标签：已验证可迁移 | 待验证
- 提炼自：reviews/daily/2026-0X-XX.md, ...
- 展开：……
-->
