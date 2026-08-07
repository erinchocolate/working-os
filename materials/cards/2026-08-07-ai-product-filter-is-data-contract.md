# AI 产品里的 Filter 是数据契约，不只是一个按钮

- id: 2026-08-07-ai-product-filter-is-data-contract
- source: Worklog
- source_link:
- origin: worklog/2026-07-15-Marvin-fleet-downstream-columns.md; worklog/2026-07-20-Marvin-fleet-backfill-sql.md; worklog/2026-07-24-Marvin-fleet-filter-tests.md
- use_type: framework
- created: 2026-08-07
- topics: [AI, AI product engineering, retrieval, metadata, product filters, sharing]
- status: seed

## 核心想法
- AI 产品里的 filter 不是 UI 上多一个按钮，而是一条端到端的数据契约：源数据、转换、chunk、index metadata、retrieval filter、前端状态和 evaluation 都要对齐。

## 为什么对我有用
- 这条材料能帮助我讲清楚 AI 产品工程的复杂性：一个看似简单的用户控制项，背后其实依赖数据链路和检索链路的多个层次共同生效。
- 它也提醒我以后做任何 scope/filter 类 feature 时，不要只问“界面怎么选”，还要问“metadata 有没有从源头一路传到 retrieval 和 evaluation”。

## 可用于哪些分享
- AI 产品为什么需要系统思维。
- RAG / retrieval 产品里的 metadata filtering。
- 从 feature 实现到端到端产品能力。
- HVD / Marvin 半年复盘中的工程案例。

## 关联卡片
- 2026-08-07-evaluation-separates-wiring-retrieval-answer-quality
- 2026-08-06-ai-era-human-value-judgment-organization-architecture

## 原文短摘
- "treat `fleet` as inherited metadata in downstream tables."
- "the vector search index still needs to be rebuilt or recreated so `fleet` is available as index metadata."
