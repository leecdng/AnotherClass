package com.anotherclass.bitcamp.service.user;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anotherclass.bitcamp.dao.user.UserHomeDAO;
import com.anotherclass.bitcamp.register.RegisterVO;
import com.anotherclass.bitcamp.vo.user.ClassVO;
import com.anotherclass.bitcamp.vo.user.ReviewVO;

@Service
public class UserHomeServiceImp implements UserHomeService {

	@Inject
	UserHomeDAO userHomeDao;

	@Override
	public List<RegisterVO> popularCreator() {
		return userHomeDao.popularCreator();
	}

	@Override
	public List<ReviewVO> bestReview() {
		return userHomeDao.bestReview();
	}

	@Override
	public List<ClassVO> popularClass() {
		return userHomeDao.popularClass();
	}

	@Override
	public List<ClassVO> newClass() {
		return userHomeDao.newClass();
	}
	
}
