# CHANGELOG

## V2.0 (2026-07-09)
### 新增
1. **Phase1 基础工具**：BCryptUtil（密码加密）、AESUtil（AES加密/解密）、pom.xml新增jbcrypt和commons-codec依赖
2. **Phase2 骨架搭建**：补全 SysRole、Owner、Inventory、GoodsPriceHistory、InStock、OutStock、OperationLog 七个模块的 Entity + Mapper + Service 完整骨架
3. **Phase3 基础管理**：
   - 货主管理（Controller + CRUD 页面，AES加密敏感字段）
   - 用户管理（Controller + CRUD 页面，BCrypt密码加密，角色选择）
4. **Phase4 核心业务**：
   - 入库管理（登记 + 自动更新库存，@Transactional 事务控制）
   - 出库管理（登记 + 库存校验 + 超额禁止 + 自动扣减库存）
   - 价格历史追踪（修改商品价格时自动记录到 goods_price_history）
   - 商品启用/停用状态支持
5. **Phase5 查询统计**：
   - 库存查询（按商品名称/货主/仓库，只读）
   - 库存预警（低于预警值的库存高亮显示）
   - 入库记录查询（按商品名称/分类/时间范围）
   - 出库记录查询（按商品名称/分类/时间范围）
   - 入库统计（按年/季度/月统计数量和金额）
   - 出库统计（按年/季度/月统计数量和金额）
6. spring-dao.xml 新增事务管理器配置，支持 @Transactional 注解

### 修复
1. UserServiceImpl 登录密码校验从明文改为 BCrypt
2. layout.jsp 仓库管理路由 `/warehouse/list` → `/warehouse/manage/list`
3. warehouse JSP 表单路径统一加上 `/manage` 前缀
4. GoodsMapper.xml update 语句新增 status 字段

### 数据库
- 新增 `init_data.sql`：admin BCrypt密码（admin123）+ 货主测试数据更新

## V1.0 (2026-07-02)
### 新增
1. 项目目录初始化
2. warehouse_db 完整数据库脚本（9张业务表）
3. 数据库索引、视图、触发器设计
4. 数据库安全方案：BCrypt密码加密、AES隐私加密、角色权限、防SQL注入
### 优化
1. 外键约束保证数据完整性
2. 索引优化查询性能
3. 视图封装多表联查逻辑
### 设计亮点
数据库触发器实现库存自动更新（演示用，业务层统一事务控制）
