package com.anotherclass.bitcamp.dao.user;

import java.util.List;

import com.anotherclass.bitcamp.register.RegisterVO;
import com.anotherclass.bitcamp.vo.user.ClassVO;
import com.anotherclass.bitcamp.vo.user.ReviewVO;

public interface UserHomeDAO {
	public List<ClassVO> popularClass(); // 인기 클래스 조회
	public List<ClassVO> newClass();// 신규 클래스 조회
	public List<ReviewVO> bestReview();// 대표 후기 조회
	public List<RegisterVO> popularCreator(); // 인기 크리에이터 조회
}
