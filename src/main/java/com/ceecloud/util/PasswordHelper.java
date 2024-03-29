package com.ceecloud.util;

import com.ceecloud.entity.UserFormMap;
import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

public class PasswordHelper {
	private RandomNumberGenerator randomNumberGenerator = new SecureRandomNumberGenerator();
	private String algorithmName = "md5";
	private int hashIterations = 2;

	public void encryptPassword(UserFormMap userFormMap) {
		String salt=randomNumberGenerator.nextBytes().toHex();
		userFormMap.put("credentialsSalt", salt);
		String newPassword = new SimpleHash(algorithmName, userFormMap.get("password"), ByteSource.Util.bytes(userFormMap.get("username")+salt), hashIterations).toHex();
		userFormMap.put("password", newPassword); 
	}
	public static void main(String[] args) {
		PasswordHelper passwordHelper = new PasswordHelper();
		UserFormMap userFormMap = new UserFormMap();
		userFormMap.put("password","123456789");
		userFormMap.put("accountName","sunhong");
		passwordHelper.encryptPassword(userFormMap);
		System.out.println(userFormMap);
	}
}
