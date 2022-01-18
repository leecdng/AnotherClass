package com.anotherclass.bitcamp.service.user;

import java.util.List;

import com.anotherclass.bitcamp.vo.user.UserFaqVO;
import com.anotherclass.bitcamp.vo.user.UserNoticeVO;

public interface UserHelperService {

	public List<UserNoticeVO> userNoticeAllRecord();
	public List<UserFaqVO> userFaqAllRecord();
}
