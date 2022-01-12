package com.anotherclass.bitcamp.service.admin;

import java.util.List;

import com.anotherclass.bitcamp.service.vo.admin.BasicClassVO;

public interface basicClassManagementService {
 
	public List<BasicClassVO> basicClassAllRecord ();
	public List<BasicClassVO> optionClassAllRecord ();
}
