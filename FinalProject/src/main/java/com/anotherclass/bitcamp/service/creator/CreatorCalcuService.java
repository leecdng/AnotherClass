package com.anotherclass.bitcamp.service.creator;

import com.anotherclass.bitcamp.vo.creator.CreatorCalcuVO;

public interface CreatorCalcuService {
	public CreatorCalcuVO scheduledClass(String member_id); // 예정 강의 조회
	public CreatorCalcuVO classManagement(String member_id); // 수강 관리
	public CreatorCalcuVO incomeManagement(String member_id); // 수익 관리
}
