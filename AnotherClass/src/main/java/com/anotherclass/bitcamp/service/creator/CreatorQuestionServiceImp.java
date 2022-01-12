package com.anotherclass.bitcamp.service.creator;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anotherclass.bitcamp.dao.creator.CreatorQuestionDAO;
import com.anotherclass.bitcamp.vo.creator.CreatorQuestionVO;

@Service
public class CreatorQuestionServiceImp  implements CreatorQuestionService{
	
	@Inject
	CreatorQuestionDAO  creatorQuestionServiceDAO;
	
	@Override
	public List<CreatorQuestionVO> CreatorQuestionAllSelect(int start, int end) {
		return creatorQuestionServiceDAO.CreatorQuestionAllSelect(start, end);
	}
	
	@Override
	public int creatorQuestionBoardCnt() {
		return creatorQuestionServiceDAO.creatorQuestionBoardCnt();
	}
	
	@Override
	public int creatorQuestionboardLimit() {
		return creatorQuestionServiceDAO.creatorQuestionboardLimit();
	}
	
	@Override
	public int creatorQuestionDel(int no) {
		return creatorQuestionServiceDAO.creatorQuestionDel(no);
	}
	
	@Override
	public int creatorQuestionEdit(CreatorQuestionVO vo) {
		return creatorQuestionServiceDAO.creatorQuestionEdit(vo);
	}
	
	@Override
	public CreatorQuestionVO CreatorQuestionView(int no) {
		return creatorQuestionServiceDAO.CreatorQuestionView(no);
	}
	
	@Override
	public int creatorQuestionWrite(CreatorQuestionVO vo) {
		return creatorQuestionServiceDAO.creatorQuestionWrite(vo);
	}
	
}
