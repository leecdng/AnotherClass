package com.anotherclass.bitcamp.dao.admin;

import java.util.List;

import com.anotherclass.bitcamp.service.vo.admin.BasicClassVO;

public interface basicClassManagementDAO {
	
	public List<BasicClassVO> basicClassAllRecord ();
	public List<BasicClassVO> optionClassAllRecord ();
}
