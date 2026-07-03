/******************************************************************************
 * @file        warehouse_db.sql
 * @brief       仓库物资管理系统数据库脚本
 *
 * @project     Warehouse Management System
 * @author      李羽凡
 * @date        2026-07-03
 * @version     v2.0.0
 *
 * @history
 *      v1.0.0
 *          - 创建数据库
 *          - 完成基础数据表设计
 *
 *      v2.0.0
 *          - 数据库重构
 *          - 满足第三范式（3NF）
 *          - 新增库存表（inventory）
 *          - 新增价格历史表（goods_price_history）
 *
 * @section 功能说明
 *      本脚本用于创建仓库物资管理系统数据库，包括：
 *
 *      1. 创建数据库
 *      2. 创建业务数据表
 *      3. 创建主键、外键约束
 *      4. 创建索引
 *      5. 初始化基础数据
 *
 * @note
 *      1. 数据库遵循第三范式（3NF）
 *      2. 用户密码采用 BCrypt 加密存储（由Java程序生成）
 *      3. 用户敏感数据采用 AES 加密存储（由Java程序加密）
 *      4. 支持库存预警
 *      5. 支持价格历史记录
 *      6. 支持完整出入库日志
 *
 ******************************************************************************/
 
 
 /******************************************************************************
 * 数据库初始化
 *
 * 功能说明：
 *      创建 warehouse_db 数据库。
 *
 * 说明：
 *      使用 utf8mb4 字符集，支持完整 UTF-8 编码。
 ******************************************************************************/

DROP DATABASE IF EXISTS warehouse_db;

CREATE DATABASE warehouse_db
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_0900_ai_ci;

USE warehouse_db;


/******************************************************************************
 * 删除旧数据表
 *
 * 功能说明：
 *      为保证脚本可重复执行，创建新表前删除旧表。
 ******************************************************************************/

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS operation_log;
DROP TABLE IF EXISTS out_stock;
DROP TABLE IF EXISTS in_stock;
DROP TABLE IF EXISTS goods_price_history;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS goods;
DROP TABLE IF EXISTS goods_category;
DROP TABLE IF EXISTS owner;
DROP TABLE IF EXISTS warehouse;
DROP TABLE IF EXISTS sys_user;
DROP TABLE IF EXISTS sys_role;

SET FOREIGN_KEY_CHECKS = 1;


/******************************************************************************
 * 系统角色表（sys_role）
 *
 * 功能说明：
 *      保存系统角色信息。
 *
 * 设计说明：
 *      一个角色对应多个系统用户。
 ******************************************************************************/

CREATE TABLE sys_role
(
    role_id INT AUTO_INCREMENT COMMENT '角色ID',

    role_name VARCHAR(30)
        NOT NULL
        COMMENT '角色名称',

    role_code VARCHAR(30)
        NOT NULL
        UNIQUE
        COMMENT '角色编码',

    description VARCHAR(200)
        COMMENT '角色描述',

    PRIMARY KEY (role_id)

)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COMMENT='系统角色表';


/******************************************************************************
 * 初始化角色数据
 ******************************************************************************/

INSERT INTO sys_role
(role_name, role_code, description)

VALUES

('系统管理员','ADMIN','拥有系统全部权限'),

('仓库管理员','WAREHOUSE_ADMIN','负责仓库及出入库管理'),

('统计员','STATISTICS','负责统计分析及查询');


/******************************************************************************
 * 系统用户表（sys_user）
 *
 * 功能说明：
 *      保存系统登录用户信息。
 *
 * 设计说明：
 *      1. 密码采用 BCrypt 加密。
 *      2. 手机号采用 AES 加密。
 *      3. 邮箱采用 AES 加密。
 *      4. 一个用户只能属于一个角色。
 ******************************************************************************/

CREATE TABLE sys_user
(
    user_id INT AUTO_INCREMENT COMMENT '用户ID',

    username VARCHAR(30)
        NOT NULL
        UNIQUE
        COMMENT '登录账号',

    password VARCHAR(255)
        NOT NULL
        COMMENT 'BCrypt加密密码',

    real_name VARCHAR(30)
        NOT NULL
        COMMENT '真实姓名',

    phone VARCHAR(255)
        COMMENT 'AES加密手机号',

    email VARCHAR(255)
        COMMENT 'AES加密邮箱',

    role_id INT
        NOT NULL
        COMMENT '角色ID',

    status TINYINT
        NOT NULL
        DEFAULT 1
        COMMENT '账户状态',

    create_time DATETIME
        DEFAULT CURRENT_TIMESTAMP
        COMMENT '创建时间',

    update_time DATETIME
        DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
        COMMENT '更新时间',

    PRIMARY KEY(user_id),

    CONSTRAINT fk_user_role
        FOREIGN KEY(role_id)
        REFERENCES sys_role(role_id)

)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COMMENT='系统用户表';


/******************************************************************************
 * 初始化管理员账号
 *
 * 说明：
 *      此处先使用占位值，真正的 BCrypt 密码等登录模块完成后由 Java 自动生成并更新。
 ******************************************************************************/

INSERT INTO sys_user
(
username,
password,
real_name,
phone,
email,
role_id
)

VALUES
(
'admin',

'TEMP_BCRYPT_PASSWORD',

'系统管理员',

'TEMP_AES_PHONE',

'TEMP_AES_EMAIL',

1
);


