# Evaluation 要区分 Wiring、Retrieval Quality 和 Answer Quality

- id: 2026-08-07-evaluation-separates-wiring-retrieval-answer-quality
- source: Worklog
- source_link:
- origin: worklog/2026-07-24-Marvin-fleet-filter-tests.md; worklog/2026-07-31-Marvin-fleet-filter-evaluation.md; worklog/2026-07-31-Marvin-retrieval-diagnostics-experiments.md
- use_type: framework
- created: 2026-08-07
- topics: [AI, evaluation, retrieval, RAG, AI product engineering, sharing]
- status: seed

## 核心想法
- AI 产品 evaluation 不能混成一个问题：wiring tests 证明机制有没有接通，retrieval evaluation 证明有没有找到对的材料，answer-quality evaluation 才证明最终回答是否更好。

## 为什么对我有用
- 这条材料能帮助我解释为什么一个 feature “能工作”不等于“质量有提升”。Fleet filter 的测试可以证明 payload 和 retrieval filter 接通了，但是否真的改善 retrieval，需要 paired evaluation 和更合适的样本。
- 它也能帮助我设计后续 acronym、AI prep、check sheets 实验：先分清要验证的是机制、检索质量，还是最终回答质量。

## 可用于哪些分享
- RAG evaluation 入门。
- AI 产品改进为什么不能只靠感觉。
- 如何把用户反馈转成可验证实验。
- HVD / Marvin retrieval improvement 复盘。

## 关联卡片
- 2026-08-07-ai-product-filter-is-data-contract
- 2026-08-06-ai-era-human-value-judgment-organization-architecture

## 原文短摘
- "Kept tests deterministic and environment-light."
- "this change only validates code mechanics."
- "Real answer-quality comparison still requires running the Databricks RAG evaluation job."
