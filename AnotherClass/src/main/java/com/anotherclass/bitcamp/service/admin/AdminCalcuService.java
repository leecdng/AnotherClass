package com.anotherclass.bitcamp.service.admin;

import java.util.List;

import com.anotherclass.bitcamp.register.RegisterVO;
import com.anotherclass.bitcamp.service.vo.admin.MemberMangementVO;
import com.anotherclass.bitcamp.vo.admin.AdminCalcuVO;

public interface AdminCalcuService {
	
	public AdminCalcuVO countTotalAdminCalcu(); // 관리자 페이지 / 정산 목록 총 레코드 수
	public List<AdminCalcuVO> selectAdminCalcuList(AdminCalcuVO vo); // 관리자 페이지/ 정산 목록 조회
	public AdminCalcuVO countTotalCreatorCalcu(); // 강사 페이지 / 정산 목록 총 레코드 수
	public List<AdminCalcuVO> selectCreatorCalcuList(AdminCalcuVO vo); // 강사 페이지/ 정산 목록 조회
}
