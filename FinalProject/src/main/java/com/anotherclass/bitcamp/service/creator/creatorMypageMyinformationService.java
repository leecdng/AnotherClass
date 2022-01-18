package com.anotherclass.bitcamp.service.creator;

import com.anotherclass.bitcamp.register.RegisterVO;

public interface creatorMypageMyinformationService {
	
	public RegisterVO MemberInfo(String logid);
	public int MemberInfoEdit(RegisterVO vo);
	public String pwdCheck(RegisterVO vo);
	public int passwordChange(RegisterVO vo);
}
