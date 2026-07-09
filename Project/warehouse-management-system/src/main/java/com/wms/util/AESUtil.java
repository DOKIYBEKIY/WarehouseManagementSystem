package com.wms.util;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;

/**
 * AES 加密工具类
 * 用于加密/解密手机号、邮箱、地址等敏感字段
 */
public class AESUtil {

    /** 16字节AES密钥（实际项目应从配置文件或环境变量读取） */
    private static final String SECRET_KEY = "WarehouseMgmtSys";

    private static SecretKey getKey() {
        byte[] keyBytes = SECRET_KEY.getBytes();
        byte[] validKey = new byte[16];
        System.arraycopy(keyBytes, 0, validKey, 0, Math.min(keyBytes.length, 16));
        return new SecretKeySpec(validKey, "AES");
    }

    /**
     * AES 加密
     * @param plainText 明文
     * @return Base64编码的密文；若输入为null则返回null
     */
    public static String encrypt(String plainText) {
        if (plainText == null || plainText.isEmpty()) return plainText;
        try {
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.ENCRYPT_MODE, getKey());
            byte[] encrypted = cipher.doFinal(plainText.getBytes("UTF-8"));
            return Base64.getEncoder().encodeToString(encrypted);
        } catch (Exception e) {
            throw new RuntimeException("AES加密失败", e);
        }
    }

    /**
     * AES 解密
     * @param cipherText Base64编码的密文
     * @return 明文；若输入为null则返回null
     */
    public static String decrypt(String cipherText) {
        if (cipherText == null || cipherText.isEmpty()) return cipherText;
        try {
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.DECRYPT_MODE, getKey());
            byte[] decrypted = cipher.doFinal(Base64.getDecoder().decode(cipherText));
            return new String(decrypted, "UTF-8");
        } catch (Exception e) {
            throw new RuntimeException("AES解密失败", e);
        }
    }
}
