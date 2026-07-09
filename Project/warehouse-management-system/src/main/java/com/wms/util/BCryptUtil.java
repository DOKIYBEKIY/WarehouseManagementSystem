package com.wms.util;

import org.mindrot.jbcrypt.BCrypt;

/**
 * BCrypt 密码加密工具类
 * 用于用户密码的加密存储和校验
 */
public class BCryptUtil {

    /** 加密强度（4-31，默认10） */
    private static final int ROUNDS = 10;

    /**
     * 加密密码
     * @param plainPassword 明文密码
     * @return BCrypt密文
     */
    public static String hash(String plainPassword) {
        return BCrypt.hashpw(plainPassword, BCrypt.gensalt(ROUNDS));
    }

    /**
     * 校验密码
     * @param plainPassword 明文密码
     * @param hashedPassword BCrypt密文
     * @return 是否匹配
     */
    public static boolean verify(String plainPassword, String hashedPassword) {
        try {
            return BCrypt.checkpw(plainPassword, hashedPassword);
        } catch (Exception e) {
            return false;
        }
    }
}
