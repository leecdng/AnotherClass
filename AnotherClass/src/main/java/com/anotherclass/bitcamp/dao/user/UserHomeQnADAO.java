package com.anotherclass.bitcamp.dao.user;

import java.util.List;

import com.anotherclass.bitcamp.vo.user.UserHomeQnAVO;

public interface UserHomeQnADAO {
	
	public List<UserHomeQnAVO> userHomeQnAAllSelect(int start, int end);
	public int userHomeQnAWrite(UserHomeQnAVO vo);
	public UserHomeQnAVO userHomeQnAView(int no);
	public int userHomeQnAEdit(UserHomeQnAVO vo);
	public int userHomeOnABoardCnt();
	public int userHomeQnADel(int no);
	public int userHomeQnAboardLimit();
}
