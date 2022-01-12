package com.anotherclass.bitcamp.dao.creator;

import com.anotherclass.bitcamp.vo.creator.CreatorCalcuVO;

public interface CreatorCalcuDAO {
	public CreatorCalcuVO scheduledClass(String member_id); // 예정 강의 조회
	public CreatorCalcuVO classManagement(String member_id); // 수강 관리
	public CreatorCalcuVO incomeManagement(String member_id); // 수익 관리
}
