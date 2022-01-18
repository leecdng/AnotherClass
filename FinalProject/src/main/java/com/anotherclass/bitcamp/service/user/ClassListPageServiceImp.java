package com.anotherclass.bitcamp.service.user;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anotherclass.bitcamp.dao.user.ClassListDAO;
import com.anotherclass.bitcamp.vo.user.ClassListVO;

@Service
public class ClassListPageServiceImp implements ClassListPageService {
	@Inject
	ClassListDAO classListDao;
	@Override
	public List<ClassListVO> ClassList() {
		return classListDao.ClassList();
	}
	@Override
	public List<ClassListVO> sortByPrice(ClassListVO vo) {
		return classListDao.sortByPrice(vo);
	}
	@Override
	public List<ClassListVO> sortByApplyDate(ClassListVO vo) {
		return classListDao.sortByApplyDate(vo);
	}
	@Override
	public List<ClassListVO> rangePrice(int minp, int maxp, String sText) {
		return classListDao.rangePrice(minp, maxp, sText);
	}
	@Override
	public List<ClassListVO> findCreatorClass(ClassListVO vo) {
		return classListDao.findCreatorClass(vo);
	}

}
