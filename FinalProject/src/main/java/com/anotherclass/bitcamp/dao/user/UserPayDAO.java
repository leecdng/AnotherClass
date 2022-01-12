package com.anotherclass.bitcamp.dao.user;

import java.util.List;

import com.anotherclass.bitcamp.vo.user.BasketVO;
import com.anotherclass.bitcamp.vo.user.UserPayVO;

public interface UserPayDAO {
	public List<UserPayVO> userPayAllselect(int[] classNoPayList );
	public List<UserPayVO> userPayoneSelect(int no);
	public UserPayVO userInfo(String logid);
	public int saveBasket(int[] classNoPayList);
	
	public int testBasket(BasketVO vo);
	public int delBasket(BasketVO vo);
	public int delOneBasket(int no);
	
	public int oneClassOrder(UserPayVO vo);
	public int addHeadCount(int no);
	public int getClassNo(int no);
	
}
