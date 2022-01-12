package com.anotherclass.bitcamp.dao.creator;

import java.util.List;

import com.anotherclass.bitcamp.vo.creator.CreatorQuestionVO;

public interface CreatorQuestionDAO {
	
	public List<CreatorQuestionVO> CreatorQuestionAllSelect(int start, int end);
	public int creatorQuestionWrite(CreatorQuestionVO vo);
	public CreatorQuestionVO CreatorQuestionView(int no);
	public int creatorQuestionEdit(CreatorQuestionVO vo);
	public int creatorQuestionBoardCnt();
	public int creatorQuestionDel(int no);
	public int creatorQuestionboardLimit();
}
