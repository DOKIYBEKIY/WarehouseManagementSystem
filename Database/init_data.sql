-- =====================================================
--  系统初始化数据SQL（可选的补充脚本）
--
--  重要：warehouse_db.sql 已包含完整的三账号初始化
--  （admin/warehouse/query，密码均为 admin123）
--  本文件仅用于已有数据库需要更新密码的场景
-- =====================================================

USE warehouse_db;

-- 如需重置密码为 admin123（BCrypt加密）
-- 取消下面注释后执行：
--
-- UPDATE sys_user SET password = '$2a$10$ZrKz9VSaHEoleDq2zkbmfOL5JO0nM1H6H.u.nBIM7Y2djef2kpm8q'
-- WHERE username IN ('admin', 'warehouse', 'query');

-- 显示当前用户
SELECT user_id, username, real_name, role_id, status FROM sys_user;
