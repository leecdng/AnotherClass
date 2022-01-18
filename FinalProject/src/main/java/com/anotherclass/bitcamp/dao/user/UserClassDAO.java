package com.anotherclass.bitcamp.dao.user;

import java.util.List;

import com.anotherclass.bitcamp.vo.user.ClassVO;

public interface UserClassDAO {
	public List<ClassVO> selectClassMapList(ClassVO vo);
}
