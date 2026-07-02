-- ===========================
-- 仓库物资管理系统数据库
-- Database：warehouse_db
-- MySQL：8.0
-- Character Set：utf8mb4
-- ===========================

-- 1 创建数据库
DROP DATABASE IF EXISTS warehouse_db;

CREATE DATABASE warehouse_db
DEFAULT CHARACTER SET utf8mb4
COLLATE utf8mb4_0900_ai_ci;

USE warehouse_db;

-- 查看全部数据库
SHOW DATABASES;

-- 确认当前使用库
SELECT DATABASE();

-- 2 创建角色表 sys_role

DROP TABLE IF EXISTS sys_role;

CREATE TABLE sys_role
(
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '角色ID',

    role_name VARCHAR(30) NOT NULL UNIQUE COMMENT '角色名称',

    role_code VARCHAR(30) NOT NULL UNIQUE COMMENT '角色编码',

    description VARCHAR(100) DEFAULT NULL COMMENT '角色描述',

    status TINYINT NOT NULL DEFAULT 1 COMMENT '状态（1：启用，0：禁用）',

    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- 初始化角色数据
INSERT INTO sys_role
(role_name, role_code, description)
VALUES
('超级管理员', 'ROLE_SUPER_ADMIN', '系统最高权限'),
('仓库管理员', 'ROLE_ADMIN', '负责仓库业务'),
('统计员', 'ROLE_STATISTIC', '负责统计分析'),
('普通用户', 'ROLE_USER', '只能查看数据');

-- 验证
SELECT * FROM sys_role;

-- 创建用户表 sys_user
DROP TABLE IF EXISTS sys_user;

CREATE TABLE sys_user
(
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '用户ID',

    username VARCHAR(30) NOT NULL UNIQUE COMMENT '登录账号',

    password VARCHAR(100) NOT NULL COMMENT 'BCrypt加密密码',

    real_name VARCHAR(30) NOT NULL COMMENT '真实姓名',

    phone VARCHAR(255) DEFAULT NULL COMMENT 'AES加密手机号',

    email VARCHAR(255) DEFAULT NULL COMMENT 'AES加密邮箱',

    role_id BIGINT NOT NULL COMMENT '角色ID',

    status TINYINT NOT NULL DEFAULT 1 COMMENT '状态（1：正常，0：禁用）',

    last_login_time DATETIME DEFAULT NULL COMMENT '最后登录时间',

    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

    CONSTRAINT fk_user_role
        FOREIGN KEY(role_id)
        REFERENCES sys_role(id)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 创建仓库表 warehouse
DROP TABLE IF EXISTS warehouse;

CREATE TABLE warehouse
(
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '仓库ID',

    warehouse_code VARCHAR(30) NOT NULL UNIQUE COMMENT '仓库编号',

    warehouse_name VARCHAR(50) NOT NULL COMMENT '仓库名称',

    location VARCHAR(100) NOT NULL COMMENT '仓库位置',

    capacity INT NOT NULL DEFAULT 0 COMMENT '最大容量',

    manager_id BIGINT DEFAULT NULL COMMENT '负责人',

    status TINYINT NOT NULL DEFAULT 1 COMMENT '状态（1：启用，0：停用）',

    is_deleted TINYINT NOT NULL DEFAULT 0 COMMENT '逻辑删除',

    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

    CONSTRAINT fk_warehouse_manager
        FOREIGN KEY(manager_id)
        REFERENCES sys_user(id)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='仓库表';

-- 初始化数据
INSERT INTO warehouse
(warehouse_code,warehouse_name,location,capacity)
VALUES
('WH001','一号仓库','A区',10000),
('WH002','二号仓库','B区',8000),
('WH003','三号仓库','C区',12000);

-- 验证
SELECT * FROM warehouse;

-- 创建货主表 owner
DROP TABLE IF EXISTS owner;

CREATE TABLE owner
(
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '货主ID',

    owner_name VARCHAR(255) NOT NULL COMMENT 'AES加密货主名称',

    phone VARCHAR(255) DEFAULT NULL COMMENT 'AES加密电话',

    email VARCHAR(255) DEFAULT NULL COMMENT 'AES加密邮箱',

    address VARCHAR(255) DEFAULT NULL COMMENT 'AES加密地址',

    status TINYINT NOT NULL DEFAULT 1 COMMENT '状态',

    is_deleted TINYINT NOT NULL DEFAULT 0 COMMENT '逻辑删除',

    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='货主表';

-- 创建货物分类表 goods_category
DROP TABLE IF EXISTS goods_category;

CREATE TABLE goods_category
(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,

    category_name VARCHAR(30) NOT NULL UNIQUE COMMENT '分类名称',

    description VARCHAR(100) DEFAULT NULL COMMENT '分类描述',

    status TINYINT NOT NULL DEFAULT 1,

    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,

    update_time DATETIME DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='货物分类表';

-- 初始化数据 
INSERT INTO goods_category
(category_name,description)
VALUES
('办公用品','办公耗材'),
('电子产品','电子设备'),
('食品','食品饮料'),
('五金工具','维修工具'),
('医疗用品','医疗耗材');

-- 验证 
SELECT * FROM goods_category;

-- 创建货物表 goods
DROP TABLE IF EXISTS goods;

CREATE TABLE goods
(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,

    goods_code VARCHAR(30) NOT NULL UNIQUE COMMENT '货物编号',

    goods_name VARCHAR(50) NOT NULL COMMENT '货物名称',

    category_id BIGINT NOT NULL COMMENT '分类',

    specification VARCHAR(50) COMMENT '规格',

    unit VARCHAR(20) COMMENT '单位',

    price DECIMAL(10,2) NOT NULL COMMENT '单价',

    stock INT NOT NULL DEFAULT 0 COMMENT '库存',

    warning_stock INT NOT NULL DEFAULT 10 COMMENT '库存预警',

    warehouse_id BIGINT NOT NULL COMMENT '仓库',

    owner_id BIGINT NOT NULL COMMENT '货主',

    status TINYINT NOT NULL DEFAULT 1,

    is_deleted TINYINT NOT NULL DEFAULT 0,

    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,

    update_time DATETIME DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_goods_category
        FOREIGN KEY(category_id)
        REFERENCES goods_category(id),

    CONSTRAINT fk_goods_warehouse
        FOREIGN KEY(warehouse_id)
        REFERENCES warehouse(id),

    CONSTRAINT fk_goods_owner
        FOREIGN KEY(owner_id)
        REFERENCES owner(id)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='货物表';

-- 创建入库记录表 in_stock
DROP TABLE IF EXISTS in_stock;

CREATE TABLE in_stock
(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,

    goods_id BIGINT NOT NULL,

    warehouse_id BIGINT NOT NULL,

    quantity INT NOT NULL,

    goods_price DECIMAL(10,2) NOT NULL,

    operator_id BIGINT NOT NULL,

    remark VARCHAR(200),

    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_in_goods
        FOREIGN KEY(goods_id)
        REFERENCES goods(id),

    CONSTRAINT fk_in_warehouse
        FOREIGN KEY(warehouse_id)
        REFERENCES warehouse(id),

    CONSTRAINT fk_in_operator
        FOREIGN KEY(operator_id)
        REFERENCES sys_user(id)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='入库记录';

-- 创建出库记录表 out_stock
DROP TABLE IF EXISTS out_stock;

CREATE TABLE out_stock
(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,

    goods_id BIGINT NOT NULL,

    warehouse_id BIGINT NOT NULL,

    quantity INT NOT NULL,

    goods_price DECIMAL(10,2) NOT NULL,

    operator_id BIGINT NOT NULL,

    remark VARCHAR(200),

    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_out_goods
        FOREIGN KEY(goods_id)
        REFERENCES goods(id),

    CONSTRAINT fk_out_warehouse
        FOREIGN KEY(warehouse_id)
        REFERENCES warehouse(id),

    CONSTRAINT fk_out_operator
        FOREIGN KEY(operator_id)
        REFERENCES sys_user(id)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='出库记录';

-- 创建系统操作日志表 operation_log
DROP TABLE IF EXISTS operation_log;

CREATE TABLE operation_log
(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,

    user_id BIGINT NOT NULL,

    module VARCHAR(30) NOT NULL,

    operation VARCHAR(50) NOT NULL,

    ip VARCHAR(50),

    result VARCHAR(20),

    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_log_user
        FOREIGN KEY(user_id)
        REFERENCES sys_user(id)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统操作日志';

-- 查看全部表 
SHOW TABLES;

SELECT table_name
FROM information_schema.tables
WHERE table_schema='warehouse_db';

-- 创建索引

-- 货物表索引 

-- 货物编号唯一索引
CREATE UNIQUE INDEX idx_goods_code
ON goods(goods_code);

-- 货物名称普通索引
CREATE INDEX idx_goods_name
ON goods(goods_name);

-- 仓库索引
CREATE INDEX idx_goods_warehouse
ON goods(warehouse_id);

-- 分类索引
CREATE INDEX idx_goods_category
ON goods(category_id);

-- 货主索引
CREATE INDEX idx_goods_owner
ON goods(owner_id);

-- 入库表索引

-- 关联货物索引
CREATE INDEX idx_instock_goods
ON in_stock(goods_id);

-- 入库时间索引（报表按时间筛选）
CREATE INDEX idx_instock_time
ON in_stock(create_time);

-- 操作人索引
CREATE INDEX idx_instock_operator
ON in_stock(operator_id);

-- 出库表索引
CREATE INDEX idx_outstock_goods
ON out_stock(goods_id);

CREATE INDEX idx_outstock_time
ON out_stock(create_time);

CREATE INDEX idx_outstock_operator
ON out_stock(operator_id);

-- 用户表索引
-- 登录账号唯一索引
CREATE UNIQUE INDEX idx_username
ON sys_user(username);

-- 查看全部索引
SELECT TABLE_NAME,INDEX_NAME,COLUMN_NAME,NON_UNIQUE
FROM information_schema.STATISTICS
WHERE TABLE_SCHEMA='warehouse_db';

-- 创建货物信息视图
CREATE VIEW v_goods_info AS

SELECT

g.id,

g.goods_code,

g.goods_name,

gc.category_name,

w.warehouse_name,

o.owner_name,

g.specification,

g.unit,

g.price,

g.stock,

g.warning_stock,

g.status

FROM goods g

LEFT JOIN goods_category gc

ON g.category_id=gc.id

LEFT JOIN warehouse w

ON g.warehouse_id=w.id

LEFT JOIN owner o

ON g.owner_id=o.id;

-- 入库查询视图
CREATE VIEW v_instock_info AS

SELECT

i.id,

g.goods_name,

w.warehouse_name,

i.quantity,

i.goods_price,

u.real_name,

i.create_time

FROM in_stock i

LEFT JOIN goods g
ON i.goods_id=g.id

LEFT JOIN warehouse w
ON i.warehouse_id=w.id

LEFT JOIN sys_user u
ON i.operator_id=u.id;

-- 出库查询视图 
CREATE VIEW v_outstock_info AS

SELECT

o.id,

g.goods_name,

w.warehouse_name,

o.quantity,

o.goods_price,

u.real_name,

o.create_time

FROM out_stock o

LEFT JOIN goods g
ON o.goods_id=g.id

LEFT JOIN warehouse w
ON o.warehouse_id=w.id

LEFT JOIN sys_user u
ON o.operator_id=u.id;

-- 验证
SHOW FULL TABLES
WHERE TABLE_TYPE='VIEW';

-- 入库自动加库存触发器
DELIMITER $$

CREATE TRIGGER trg_in_stock_after_insert

AFTER INSERT

ON in_stock

FOR EACH ROW

BEGIN

UPDATE goods

SET stock=stock+NEW.quantity

WHERE id=NEW.goods_id;

END$$

DELIMITER ;

-- 出库自动减少库存
DELIMITER $$

CREATE TRIGGER trg_out_stock_after_insert

AFTER INSERT

ON out_stock

FOR EACH ROW

BEGIN

UPDATE goods

SET stock=stock-NEW.quantity

WHERE id=NEW.goods_id;

END$$

DELIMITER ;

-- 验证触发器 查询全部触发器 
SHOW TRIGGERS FROM warehouse_db;

-- 全部库内对象查询 
-- 查询数据表
SELECT '数据表' AS type,TABLE_NAME FROM information_schema.tables WHERE TABLE_SCHEMA='warehouse_db' AND TABLE_TYPE='BASE TABLE'
UNION ALL
-- 查询视图
SELECT '视图' AS type,TABLE_NAME FROM information_schema.tables WHERE TABLE_SCHEMA='warehouse_db' AND TABLE_TYPE='VIEW';
