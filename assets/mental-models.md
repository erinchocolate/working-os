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

<!--
模板：
## <一句话原则>
- 标签：已验证可迁移 | 待验证
- 提炼自：reviews/daily/2026-0X-XX.md, ...
- 展开：……
-->
