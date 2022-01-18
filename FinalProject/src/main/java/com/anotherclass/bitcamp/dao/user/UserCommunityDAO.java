package com.anotherclass.bitcamp.dao.user;

import java.util.List;

import com.anotherclass.bitcamp.vo.user.CommunityVO;


public interface UserCommunityDAO {
	public CommunityVO CommuDetailAllRecord(int community_no);
	public List<CommunityVO> communityAllList(CommunityVO vo);
	/*
	public void boardSelect(CommunityVO vo);
	//댓글쓰기
	public int replyInsert(CommunityVO replyVo);
	//댓글목록									원글레코드번호
	public List<CommunityVO> replyListSelect(int community_no);
	//댓글수정
	public int replyUpdate(CommunityVO replyVo);
	//댓글삭제
	public int replyDelete(int community_com_no, String member_id);
	*/
}

