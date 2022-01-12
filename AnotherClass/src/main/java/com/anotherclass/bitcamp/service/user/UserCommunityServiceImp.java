package com.anotherclass.bitcamp.service.user;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anotherclass.bitcamp.dao.user.UserCommunityDAO;
import com.anotherclass.bitcamp.vo.user.CommunityVO;

@Service
public class UserCommunityServiceImp implements UserCommunityService {

	@Inject 
	UserCommunityDAO userCommunityDAO;

	@Override
	public CommunityVO CommuDetailAllRecord(int community_no) {
		
		return userCommunityDAO.CommuDetailAllRecord(community_no);
	}
	
	@Override
	public List<CommunityVO> communityAllList(CommunityVO vo){
		return userCommunityDAO.communityAllList(vo);
	}

	/*
	@Override
	public int replyInsert(CommunityComVO replyVo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CommunityComVO> replyListSelect(int community_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int replyUpdate(CommunityComVO replyVo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int replyDelete(int community_com_no, String member_id) {
		// TODO Auto-generated method stub
		return 0;
	}
	*/
}
