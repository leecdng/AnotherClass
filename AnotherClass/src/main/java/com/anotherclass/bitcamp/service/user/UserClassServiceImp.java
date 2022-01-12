package com.anotherclass.bitcamp.service.user;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anotherclass.bitcamp.dao.user.UserClassDAO;
import com.anotherclass.bitcamp.vo.user.ClassVO;

@Service
public class UserClassServiceImp implements UserClassService {

	@Inject
	UserClassDAO userClassDao;
	
	@Override
	public List<ClassVO> selectClassMapList(ClassVO vo) {
		return userClassDao.selectClassMapList(vo);
	}
	
}
