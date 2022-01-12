package com.anotherclass.bitcamp.service.creator;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anotherclass.bitcamp.dao.creator.CreatorCalcuDAO;
import com.anotherclass.bitcamp.vo.creator.CreatorCalcuVO;

@Service
public class CreatorCalcuServiceImp implements CreatorCalcuService {
	@Inject
	CreatorCalcuDAO creatorCalcuDAO;

	@Override
	public CreatorCalcuVO scheduledClass(String member_id) {
		return creatorCalcuDAO.scheduledClass(member_id);
	}

	@Override
	public CreatorCalcuVO classManagement(String member_id) {
		return creatorCalcuDAO.classManagement(member_id);
	}

	@Override
	public CreatorCalcuVO incomeManagement(String member_id) {
		return creatorCalcuDAO.incomeManagement(member_id);
	}
}
