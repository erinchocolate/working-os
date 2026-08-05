# 主人的知识分享风格（规则化 · 常驻指针）

由「分享 收」维护。每条都是能直接当 prompt 用的规则。
出分享/演示初稿时，先读本文件并套用。

> 由「分享 收」从主人改稿中累积。

## 结构习惯
- 开头直接进入主题：一句 "Today I want to share..."，然后给个人 key learning；不要先放额外的 meta section（如 Core Message / Draft note）。
- 偏好清楚的三段式主线：背景/问题 → 关键挑战 → 具体改变与 lesson。保留少量 numbered structure 帮听众跟上。
- 分享稿本身优先是 talk track，不默认附 slide outline、short version 或另一个总结版本；这些只有被明确要求时再加。
- 每个 lesson 讲到足够支撑观点即可；避免在同一 section 结尾再次把所有 implication 全部展开。
- 技术分享可以在结尾加一个短 live walkthrough，用真实代码/目录/配置变化证明前面讲的 lesson。

## 开场 / 例子密度
- 开场喜欢用 "For me, the key learning was this:" 引出一句核心 takeaway。
- 例子要具体但不铺满：保留 Marvin 的真实 resource/identity 例子，如 Explore/Test/Prod、deploy SP、job runtime SP、app、endpoint、MLflow traces。
- 技术列表保持代表性即可；能用 2-5 个 bullets 说明的，不展开成完整 checklist。
- 可以用短句引出 takeaway，例如 "We realized:"、"One thing to note here is:"，比长铺垫更接近主人的讲法。
- 更喜欢用真实经历解释 lesson：先讲 "we thought / what happened / what we changed"，再提炼原则。

## 详略 / 语气
- 偏好短、直接、工作中会自然说出口的句子；少用 polished abstract framing。
- 把抽象词落到具体说法：更偏 "code move" / "problem" / "how we deploy it" 这类直白表达，少用过度概括的 presentation language。
- 删除重复解释和替听众总结过满的段落；让 section heading、少量 bullets 和一句 takeaway 承担结构。
- 保留第一人称/团队视角（I / we），让分享像真实复盘，而不是外部报告。
- 草稿可以轻微润色语法，但不要因为润色而增加新观点、新形容词或更正式的语气。
- 书面稿需要保留自然口语节奏，但清理 transcript filler（如重复的 "like"、人名、timestamp、明显 ASR 错词）。

<!-- 例：先抛一个真实场景再讲原理；每个概念配一个数据工程的例子；少术语多类比 -->
