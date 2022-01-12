package com.anotherclass.bitcamp.dao.creator;

import com.anotherclass.bitcamp.register.RegisterVO;

public interface CreatorMypageMyinformationDAO {
	
	public RegisterVO MemberInfo(String logid);
	public int MemberInfoEdit(RegisterVO vo);
	public String pwdCheck(RegisterVO vo);
	public int passwordChange(RegisterVO vo);
}
