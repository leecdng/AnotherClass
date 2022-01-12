package com.anotherclass.bitcamp.dao.user;

import java.util.List;

import com.anotherclass.bitcamp.vo.user.UserFaqVO;
import com.anotherclass.bitcamp.vo.user.UserNoticeVO;

public interface UserHelperDAO {
	public List<UserNoticeVO> userNoticeAllRecord();
	public List<UserFaqVO> userFaqAllRecord();
}
