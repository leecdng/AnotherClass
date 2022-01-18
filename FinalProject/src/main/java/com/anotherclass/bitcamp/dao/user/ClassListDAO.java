package com.anotherclass.bitcamp.dao.user;

import java.util.List;

import com.anotherclass.bitcamp.vo.user.ClassListVO;

public interface ClassListDAO {
	public List<ClassListVO> ClassList();
	public List<ClassListVO> sortByPrice(ClassListVO vo);
	public List<ClassListVO> sortByApplyDate(ClassListVO vo);
	public List<ClassListVO> rangePrice(int minp, int maxp, String sText);
	public List<ClassListVO> findCreatorClass(ClassListVO vo);
}
