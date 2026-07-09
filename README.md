# 仓库物资管理系统

## 项目简介

基于 SSM（Spring + Spring MVC + MyBatis）框架的 Web 应用，实现仓库物资的入库、出库、库存管理和查询统计功能。采用 MVC 分层架构与 B/S 模式，适用于企业仓储管理场景。

## 技术栈

| 层级 | 技术 |
|---|---|
| 后端框架 | Spring 5.3 + Spring MVC + MyBatis 3.5 |
| 数据库 | MySQL 8.0 + Druid 连接池 |
| 安全 | BCrypt 密码加密 + AES 敏感字段加密 |
| 前端 | JSP + JSTL + CSS3 |
| 构建 | Maven |
| 运行环境 | JDK 17 + Tomcat 9.0 + Eclipse 2026 |

## 项目结构

```
WarehouseManagementSystem/
├── Database/                  # 数据库脚本
│   ├── warehouse_db.sql       # 建库建表 + 初始化数据
│   └── init_data.sql          # 补充初始化脚本
├── Project/warehouse-management-system/
│   └── src/main/
│       ├── java/com/wms/
│       │   ├── controller/    # 控制器层（12个）
│       │   ├── entity/        # 实体类（11个）
│       │   ├── mapper/        # MyBatis 接口（11个）
│       │   ├── service/       # 业务逻辑接口+实现
│       │   ├── interceptor/   # 登录拦截器 + 角色权限拦截器
│       │   └── util/          # BCryptUtil + AESUtil
│       ├── resources/
│       │   ├── mapper/        # MyBatis XML 映射文件（11个）
│       │   └── spring/        # Spring 配置文件
│       └── webapp/
│           ├── WEB-INF/views/ # JSP 视图（34个）
│           ├── static/css/    # 样式文件
│           └── login.jsp      # 登录页
└── Screenshots/               # 数据库设计截图
```

## 功能模块

### 系统管理
- **用户管理**：系统用户的增删改查，BCrypt 密码加密，角色分配
- **角色权限**：管理员 / 仓库管理员 / 统计员，三级权限控制

### 基础数据
- **商品分类管理**：分类的增删改查，逻辑删除
- **物资信息管理**：商品的增删改查，价格变更自动记录历史
- **仓库管理**：仓库基本信息的维护
- **货主管理**：货主信息的增删改查，AES 加密敏感字段

### 核心业务
- **入库管理**：货物入库登记，自动更新库存，事务控制
- **出库管理**：货物出库登记，库存校验，超额禁止，扣减库存

### 查询统计
- **库存查询**：按商品名称、货主、仓库多条件查询
- **库存预警**：低于预警值的库存高亮提醒
- **出入库记录查询**：按商品名称、分类、时间范围查询
- **出入库统计**：按年 / 季度 / 月统计数量与金额

## 数据库设计

共 9 张业务表，遵循第三范式（3NF），支持库存预警和价格历史。

| 表名 | 说明 |
|---|---|
| sys_role | 系统角色表 |
| sys_user | 系统用户表 |
| warehouse | 仓库信息表 |
| owner | 货主信息表 |
| goods_category | 商品分类表 |
| goods | 商品信息表 |
| inventory | 库存信息表 |
| goods_price_history | 商品价格历史表 |
| in_stock | 入库记录表 |
| out_stock | 出库记录表 |
| operation_log | 系统操作日志表 |

## 快速启动

1. 执行 `Database/warehouse_db.sql` 创建数据库和表
2. 用 Eclipse 导入 `Project/warehouse-management-system`
3. 修改 `src/main/resources/jdbc.properties` 中的数据库连接信息
4. Maven → Update Project → Clean → 部署到 Tomcat 9
5. 访问 `http://localhost:8080/warehouse-management-system/login.jsp`

### 测试账号

| 账号 | 密码 | 角色 |
|---|---|---|
| admin | admin123 | 系统管理员 |
| warehouse | admin123 | 仓库管理员 |
| query | admin123 | 统计员 |

## 版本

- **v1.0** — 数据库完整设计
- **v2.0** — 完整功能实现（登录鉴权、基础管理、出入库、查询统计）
