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


/******************************************************************************
 * 仓库信息表（warehouse）
 *
 * 功能说明：
 *      保存仓库基本信息。
 *
 * 设计说明：
 *      1. 一个仓库可存放多种货物。
 *      2. 不保存库存数量，库存信息独立维护。
 ******************************************************************************/

CREATE TABLE warehouse
(
    warehouse_id INT AUTO_INCREMENT COMMENT '仓库ID',

    warehouse_code VARCHAR(30)
        NOT NULL
        UNIQUE
        COMMENT '仓库编号',

    warehouse_name VARCHAR(50)
        NOT NULL
        COMMENT '仓库名称',

    location VARCHAR(100)
        NOT NULL
        COMMENT '仓库位置',

    capacity DECIMAL(12,2)
        NOT NULL
        DEFAULT 0
        COMMENT '仓库容量',

    manager VARCHAR(30)
        COMMENT '负责人',

    remark VARCHAR(200)
        COMMENT '备注',

    status TINYINT
        NOT NULL
        DEFAULT 1
        COMMENT '状态',

    create_time DATETIME
        DEFAULT CURRENT_TIMESTAMP
        COMMENT '创建时间',

    update_time DATETIME
        DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
        COMMENT '更新时间',

    PRIMARY KEY (warehouse_id)

)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COMMENT='仓库信息表';


/******************************************************************************
 * 初始化仓库数据
 ******************************************************************************/

INSERT INTO warehouse
(warehouse_code,warehouse_name,location,capacity,manager)

VALUES

('WH001','一号仓库','A区一层',5000,'张三'),

('WH002','二号仓库','A区二层',8000,'李四'),

('WH003','三号仓库','B区一层',10000,'王五');


/******************************************************************************
 * 货主信息表（owner）
 *
 * 功能说明：
 *      保存货主基本信息。
 *
 * 设计说明：
 *      1. 一个货主可拥有多种货物。
 *      2. 敏感信息采用 AES 加密存储。
 ******************************************************************************/

CREATE TABLE owner
(
    owner_id INT AUTO_INCREMENT COMMENT '货主ID',

    owner_name VARCHAR(255)
        NOT NULL
        COMMENT 'AES加密货主名称',

    phone VARCHAR(255)
        COMMENT 'AES加密联系电话',

    email VARCHAR(255)
        COMMENT 'AES加密邮箱',

    address VARCHAR(255)
        COMMENT 'AES加密联系地址',

    remark VARCHAR(200)
        COMMENT '备注',

    status TINYINT
        DEFAULT 1
        COMMENT '状态',

    create_time DATETIME
        DEFAULT CURRENT_TIMESTAMP
        COMMENT '创建时间',

    update_time DATETIME
        DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
        COMMENT '更新时间',

    PRIMARY KEY(owner_id)

)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COMMENT='货主信息表';


/******************************************************************************
 * 商品分类表（goods_category）
 *
 * 功能说明：
 *      保存商品分类信息。
 *
 * 设计说明：
 *      一个分类包含多个商品。
 ******************************************************************************/

CREATE TABLE goods_category
(
    category_id INT AUTO_INCREMENT COMMENT '分类ID',

    category_name VARCHAR(50)
        NOT NULL
        UNIQUE
        COMMENT '分类名称',

    description VARCHAR(200)
        COMMENT '分类描述',

    status TINYINT
        DEFAULT 1
        COMMENT '状态',

    create_time DATETIME
        DEFAULT CURRENT_TIMESTAMP
        COMMENT '创建时间',

    update_time DATETIME
        DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
        COMMENT '更新时间',

    PRIMARY KEY(category_id)

)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COMMENT='商品分类表';


/******************************************************************************
 * 初始化商品分类
 ******************************************************************************/

INSERT INTO goods_category
(category_name,description)

VALUES

('办公用品','办公耗材'),

('电子产品','电子设备'),

('食品','食品饮料'),

('机械设备','机械设备');


/******************************************************************************
 * 商品信息表（goods）
 *
 * 功能说明：
 *      保存商品基础资料。
 *
 * 设计说明：
 *      1. 保存商品静态信息。
 *      2. 库存数量独立维护。
 *      3. 当前价格保存在本表。
 *      4. 历史价格保存在价格历史表。
 ******************************************************************************/

CREATE TABLE goods
(
    goods_id INT AUTO_INCREMENT COMMENT '商品ID',

    goods_code VARCHAR(30)
        NOT NULL
        UNIQUE
        COMMENT '商品编号',

    goods_name VARCHAR(100)
        NOT NULL
        COMMENT '商品名称',

    category_id INT
        NOT NULL
        COMMENT '分类ID',

    specification VARCHAR(100)
        COMMENT '规格型号',

    unit VARCHAR(20)
        NOT NULL
        COMMENT '计量单位',

    price DECIMAL(10,2)
        NOT NULL
        DEFAULT 0
        COMMENT '当前单价',

    status TINYINT
        DEFAULT 1
        COMMENT '状态',

    create_time DATETIME
        DEFAULT CURRENT_TIMESTAMP
        COMMENT '创建时间',

    update_time DATETIME
        DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
        COMMENT '更新时间',

    PRIMARY KEY(goods_id),

    CONSTRAINT fk_goods_category
        FOREIGN KEY(category_id)
        REFERENCES goods_category(category_id)

)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COMMENT='商品信息表';


/******************************************************************************
 * 库存信息表（inventory）
 *
 * 功能说明：
 *      保存各仓库商品库存信息。
 *
 * 设计说明：
 *      1. 商品基础信息与库存信息分离。
 *      2. 同一种商品可存放多个仓库。
 *      3. 不同货主库存独立管理。
 *      4. 支持库存预警。
 ******************************************************************************/

CREATE TABLE inventory
(
    inventory_id INT AUTO_INCREMENT COMMENT '库存ID',

    goods_id INT
        NOT NULL
        COMMENT '商品ID',

    warehouse_id INT
        NOT NULL
        COMMENT '仓库ID',

    owner_id INT
        NOT NULL
        COMMENT '货主ID',

    quantity INT
        NOT NULL
        DEFAULT 0
        COMMENT '当前库存',

    warning_quantity INT
        NOT NULL
        DEFAULT 20
        COMMENT '库存预警值',

    create_time DATETIME
        DEFAULT CURRENT_TIMESTAMP
        COMMENT '创建时间',

    update_time DATETIME
        DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
        COMMENT '更新时间',

    PRIMARY KEY(inventory_id),

    CONSTRAINT fk_inventory_goods
        FOREIGN KEY(goods_id)
        REFERENCES goods(goods_id),

    CONSTRAINT fk_inventory_warehouse
        FOREIGN KEY(warehouse_id)
        REFERENCES warehouse(warehouse_id),

    CONSTRAINT fk_inventory_owner
        FOREIGN KEY(owner_id)
        REFERENCES owner(owner_id),

    -- 复合唯一键，防止同一商品在同一仓库同一货主下重复多条库存
    UNIQUE(goods_id,warehouse_id,owner_id)

)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COMMENT='库存信息表';


/******************************************************************************
 * 商品价格历史表（goods_price_history）
 *
 * 功能说明：
 *      保存商品历史价格信息。
 *
 * 设计说明：
 *      每次商品价格调整时，
 *      自动新增一条历史记录。
 ******************************************************************************/

CREATE TABLE goods_price_history
(
    history_id INT AUTO_INCREMENT COMMENT '历史记录ID',

    goods_id INT
        NOT NULL
        COMMENT '商品ID',

    old_price DECIMAL(10,2)
        NOT NULL
        COMMENT '原价格',

    new_price DECIMAL(10,2)
        NOT NULL
        COMMENT '新价格',

    update_user INT
        NOT NULL
        COMMENT '修改人',

    update_time DATETIME
        DEFAULT CURRENT_TIMESTAMP
        COMMENT '修改时间',

    PRIMARY KEY(history_id),

    CONSTRAINT fk_history_goods
        FOREIGN KEY(goods_id)
        REFERENCES goods(goods_id),

    CONSTRAINT fk_history_user
        FOREIGN KEY(update_user)
        REFERENCES sys_user(user_id)

)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COMMENT='商品价格历史表';


/******************************************************************************
 * 入库记录表（in_stock）
 *
 * 功能说明：
 *      保存商品入库记录。
 *
 * 设计说明：
 *      每次入库产生一条记录，
 *      不允许修改历史记录。
 ******************************************************************************/

CREATE TABLE in_stock
(
    in_id INT AUTO_INCREMENT COMMENT '入库ID',

    goods_id INT NOT NULL COMMENT '商品ID',

    warehouse_id INT NOT NULL COMMENT '仓库ID',

    owner_id INT NOT NULL COMMENT '货主ID',

    quantity INT NOT NULL COMMENT '入库数量',

    unit_price DECIMAL(10,2)
        NOT NULL
        COMMENT '入库单价',

    total_amount DECIMAL(12,2)
        NOT NULL
        COMMENT '入库金额',

    operator_id INT
        NOT NULL
        COMMENT '操作员',

    in_time DATETIME
        DEFAULT CURRENT_TIMESTAMP
        COMMENT '入库时间',

    remark VARCHAR(200)
        COMMENT '备注',

    PRIMARY KEY(in_id),

    FOREIGN KEY(goods_id)
        REFERENCES goods(goods_id),

    FOREIGN KEY(owner_id)
        REFERENCES owner(owner_id),

    FOREIGN KEY(warehouse_id)
        REFERENCES warehouse(warehouse_id),

    FOREIGN KEY(operator_id)
        REFERENCES sys_user(user_id)

)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COMMENT='入库记录表';


/******************************************************************************
 * 出库记录表（out_stock）
 *
 * 功能说明：
 *      保存商品出库记录。
 *
 * 设计说明：
 *      出库前必须检查库存数量。
 *      库存不足禁止出库。
 ******************************************************************************/

CREATE TABLE out_stock
(
    out_id INT AUTO_INCREMENT COMMENT '出库ID',

    goods_id INT NOT NULL COMMENT '商品ID',

    warehouse_id INT NOT NULL COMMENT '仓库ID',

    owner_id INT NOT NULL COMMENT '货主ID',

    quantity INT NOT NULL COMMENT '出库数量',

    unit_price DECIMAL(10,2)
        NOT NULL
        COMMENT '出库单价',

    total_amount DECIMAL(12,2)
        NOT NULL
        COMMENT '出库金额',

    operator_id INT
        NOT NULL
        COMMENT '操作员',

    out_time DATETIME
        DEFAULT CURRENT_TIMESTAMP
        COMMENT '出库时间',

    remark VARCHAR(200)
        COMMENT '备注',

    PRIMARY KEY(out_id),

    FOREIGN KEY(goods_id)
        REFERENCES goods(goods_id),

    FOREIGN KEY(owner_id)
        REFERENCES owner(owner_id),

    FOREIGN KEY(warehouse_id)
        REFERENCES warehouse(warehouse_id),

    FOREIGN KEY(operator_id)
        REFERENCES sys_user(user_id)

)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COMMENT='出库记录表';


/******************************************************************************
 * 系统操作日志表（operation_log）
 *
 * 功能说明：
 *      保存系统关键业务操作日志。
 *
 * 设计说明：
 *      记录所有重要操作，
 *      便于系统审计与问题追踪。
 ******************************************************************************/

CREATE TABLE operation_log
(
    log_id INT AUTO_INCREMENT COMMENT '日志ID',

    user_id INT
        NOT NULL
        COMMENT '操作用户',

    operation_type VARCHAR(50)
        NOT NULL
        COMMENT '操作类型',

    operation_content VARCHAR(500)
        NOT NULL
        COMMENT '操作内容',

    ip_address VARCHAR(50)
        COMMENT 'IP地址',

    operation_time DATETIME
        DEFAULT CURRENT_TIMESTAMP
        COMMENT '操作时间',

    PRIMARY KEY(log_id),

    CONSTRAINT fk_log_user
        FOREIGN KEY(user_id)
        REFERENCES sys_user(user_id)

)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COMMENT='系统操作日志';


