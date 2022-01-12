package com.anotherclass.bitcamp.service.user;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anotherclass.bitcamp.dao.user.UserHomeQnADAO;
import com.anotherclass.bitcamp.vo.user.UserHomeQnAVO;

@Service
public class UserHomeQnAServiceImp implements UserHomeQnAService {

	@Inject
	UserHomeQnADAO userHomeQnADAO;

	@Override
	public List<UserHomeQnAVO> userHomeQnAAllSelect(int start, int end) {
	
		return userHomeQnADAO.userHomeQnAAllSelect(start,end);
	}

	@Override
	public UserHomeQnAVO userHomeQnAView(int no) {
		
		return userHomeQnADAO.userHomeQnAView(no);
	}

	@Override
	public int userHomeQnAEdit(UserHomeQnAVO vo) {
		
		return userHomeQnADAO.userHomeQnAEdit(vo);
	}

	@Override
	public int userHomeQnAWrite(UserHomeQnAVO vo) {
		
		return userHomeQnADAO.userHomeQnAWrite(vo);
	}

	@Override
	public int userHomeQnADel(int no) {
		
		return userHomeQnADAO.userHomeQnADel(no);
	}
	
	@Override
	public int userHomeOnABoardCnt() {
		return userHomeQnADAO.userHomeOnABoardCnt();
	}
	
	@Override
	public int userHomeQnAboardLimit() {
		return userHomeQnADAO.userHomeQnAboardLimit();
	}
	
}
