package com.anotherclass.bitcamp.service.creator;

import java.util.List;

import com.anotherclass.bitcamp.vo.creator.CreatorQuestionVO;

public interface CreatorQuestionService {
	
	public List<CreatorQuestionVO> CreatorQuestionAllSelect(int start, int end);
	public int creatorQuestionWrite(CreatorQuestionVO vo);
	public CreatorQuestionVO CreatorQuestionView(int no);
	public int creatorQuestionEdit(CreatorQuestionVO vo);
	public int creatorQuestionBoardCnt();
	public int creatorQuestionDel(int no);
	public int creatorQuestionboardLimit();
}
