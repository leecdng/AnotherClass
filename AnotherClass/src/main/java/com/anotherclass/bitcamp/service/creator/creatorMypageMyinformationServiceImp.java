package com.anotherclass.bitcamp.service.creator;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anotherclass.bitcamp.dao.creator.CreatorMypageMyinformationDAO;
import com.anotherclass.bitcamp.register.RegisterVO;

@Service
public class creatorMypageMyinformationServiceImp implements creatorMypageMyinformationService{
	
	@Inject
	CreatorMypageMyinformationDAO creatorMypageMyinformationDAO;
	
	@Override
	public RegisterVO MemberInfo(String logid) {
		return creatorMypageMyinformationDAO.MemberInfo(logid);
	}
	@Override
	public int MemberInfoEdit(RegisterVO vo) {
		return creatorMypageMyinformationDAO.MemberInfoEdit(vo);
	}
	@Override
	public int passwordChange(RegisterVO vo) {
		return creatorMypageMyinformationDAO.passwordChange(vo);
	}
	@Override
	public String pwdCheck(RegisterVO vo) {
		return creatorMypageMyinformationDAO.pwdCheck(vo);
	}
}
