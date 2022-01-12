package com.anotherclass.bitcamp.register;

import java.security.MessageDigest;

public class HashingSeting {
	
	
	// protected 사용중 패키지 이동금지
	
	//비밀번호와 Salt를 암호화 
	static String getHashing(String password,String salt) {
		StringBuffer result = new StringBuffer();
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256"); // SHA-256 암호화
			md.update(password.getBytes()); //password를 바이트화후 암호화
			md.update(salt.getBytes());
			byte bytes[] = md.digest(); // byte 배열에 담기
			for(byte a : bytes ) {  // 16진수(Hex)로 출력하기
				result.append(String.format("%02x", a));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result.toString();
	}
	public String setEncryption(String pass, String id) throws Exception {
		return HashingSeting.getHashing(pass,id);
	}
}
