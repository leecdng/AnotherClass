package com.anotherclass.bitcamp.service.admin;

import java.util.List;

import com.anotherclass.bitcamp.register.RegisterVO;
import com.anotherclass.bitcamp.service.vo.admin.MemberMangementVO;

public interface AdminService {
	public int boardLimit();
	public String adminAccountCreate(RegisterVO vo);
	public List<MemberMangementVO> MemberList(MemberMangementVO vo);
	public  MemberMangementVO MemberAccountInfo(String idCheck);
	
	public List<MemberMangementVO> creatorList(MemberMangementVO vo);
	public MemberMangementVO creatorAccountInfo(String idCheck);
	public int creatorBoardLimit();
	
	public int deleteAccount(MemberMangementVO vo);
	
}
