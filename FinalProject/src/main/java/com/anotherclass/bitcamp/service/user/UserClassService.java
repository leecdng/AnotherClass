package com.anotherclass.bitcamp.service.user;

import java.util.List;

import com.anotherclass.bitcamp.vo.user.ClassVO;

public interface UserClassService {
	public List<ClassVO> selectClassMapList(ClassVO vo);
}
