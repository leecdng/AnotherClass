package com.anotherclass.bitcamp.controller.user;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import com.anotherclass.bitcamp.service.user.UserHelperService;
import com.anotherclass.bitcamp.vo.user.UserFaqVO;
import com.anotherclass.bitcamp.vo.user.UserNoticeVO;


@Controller
public class UserHelperController {


	@Inject
	UserHelperService userHelperService;
	
	@RequestMapping(value = "/UserNotice")
	public ModelAndView UserNotice() {
		System.out.println("test-------------------");
		ModelAndView mav = new ModelAndView();
		List<UserNoticeVO> list = userHelperService.userNoticeAllRecord();
		mav.addObject("list",list);
		mav.setViewName("user/userHelper/user_Notice");		
		return mav;

	}
	
	@RequestMapping(value = "/UserFaq")
	public ModelAndView UserFaq() {
		ModelAndView mav2 = new ModelAndView();
		List<UserFaqVO> list = userHelperService.userFaqAllRecord();
		mav2.addObject("list",list);
		mav2.setViewName("user/userHelper/user_Faq");		
		return mav2;

	}
	

}
