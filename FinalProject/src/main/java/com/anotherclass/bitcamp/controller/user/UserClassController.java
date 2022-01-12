package com.anotherclass.bitcamp.controller.user;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.anotherclass.bitcamp.service.user.UserClassService;
import com.anotherclass.bitcamp.vo.user.ClassVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UserClassController {
	
	@Inject
	UserClassService userClassService;

	
	@RequestMapping(value = "/classMap")
	public String classMap() {
		
		return "user/class/class_map";
	}
	
	// 지도 클래스 목록 가져오기
	@RequestMapping(value = "/classMap/list", method = RequestMethod.GET)
	@ResponseBody
	public List<ClassVO> classMapList(ClassVO vo) {
//		System.out.println(vo.getKeyword());
//		System.out.println(vo.getLocal());
//		System.out.println(vo.getCateL_name());
//		System.out.println(vo.getCategory_name());
		List<ClassVO> classMapList = userClassService.selectClassMapList(vo);
		
    	return classMapList;
	}
	

	
}