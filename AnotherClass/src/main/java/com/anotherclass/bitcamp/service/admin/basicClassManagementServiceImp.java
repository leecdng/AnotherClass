package com.anotherclass.bitcamp.service.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anotherclass.bitcamp.dao.admin.basicClassManagementDAO;
import com.anotherclass.bitcamp.service.vo.admin.BasicClassVO;

@Service
public class basicClassManagementServiceImp implements basicClassManagementService {
	
	@Inject 
	basicClassManagementDAO bcmDAO;

	@Override
	public List<BasicClassVO> basicClassAllRecord() {
		
		return bcmDAO.basicClassAllRecord();
	}

	@Override
	public List<BasicClassVO> optionClassAllRecord() {
		return bcmDAO.optionClassAllRecord();
	}
	
}
