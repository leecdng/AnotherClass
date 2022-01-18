package com.anotherclass.bitcamp.service.register;

import com.anotherclass.bitcamp.register.RegisterVO;

public interface RegisterService {
	
	public int userAccountJoin(RegisterVO vo);
	
	public int creatorAccountJoin(RegisterVO vo);
	
	public RegisterVO loginMember(RegisterVO vo); // 회원, 강사 로그인
	
	public RegisterVO loginAdmin(RegisterVO vo); // 관리자 로그인
	
	public String logIdCheck(RegisterVO vo);
}
