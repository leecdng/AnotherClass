package com.anotherclass.bitcamp.dao.admin;

import java.util.List;

import com.anotherclass.bitcamp.service.vo.admin.MemberMangementVO;

public interface MemberMangementDAO {
	
	public List<MemberMangementVO> MemberList(MemberMangementVO vo);
	public MemberMangementVO MemberAccountInfo(String idCheck);
	public int boardLimit();
	
	
	public List<MemberMangementVO> creatorList(MemberMangementVO vo);
	public MemberMangementVO creatorAccountInfo(String idCheck);
	public int creatorBoardLimit();
	
	public int deleteAccount(MemberMangementVO vo);
}
