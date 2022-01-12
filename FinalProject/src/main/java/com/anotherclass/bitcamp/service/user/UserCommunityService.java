package com.anotherclass.bitcamp.service.user;


import java.util.List;


import com.anotherclass.bitcamp.vo.user.CommunityVO;

public interface UserCommunityService {
	public CommunityVO CommuDetailAllRecord(int community_no);
	public List<CommunityVO> communityAllList(CommunityVO vo);
	/*
	//댓글쓰기
	public int replyInsert(CommunityComVO replyVo);
	//댓글목록									원글레코드번호
	public List<CommunityComVO> replyListSelect(int community_no);
	//댓글수정
	public int replyUpdate(CommunityComVO replyVo);
	//댓글삭제
	public int replyDelete(int community_com_no, String member_id);
	*/
}
