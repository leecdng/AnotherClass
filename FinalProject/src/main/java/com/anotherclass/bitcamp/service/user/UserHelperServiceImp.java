package com.anotherclass.bitcamp.service.user;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anotherclass.bitcamp.dao.user.UserHelperDAO;

import com.anotherclass.bitcamp.vo.user.UserFaqVO;
import com.anotherclass.bitcamp.vo.user.UserNoticeVO;

@Service
public class UserHelperServiceImp implements UserHelperService{
	
	@Inject 
	UserHelperDAO uhDAO;

	@Override
	public List<UserNoticeVO> userNoticeAllRecord() {
		
		return uhDAO.userNoticeAllRecord();
	}

	@Override
	public List<UserFaqVO> userFaqAllRecord() {
		return uhDAO.userFaqAllRecord();
	}
}
