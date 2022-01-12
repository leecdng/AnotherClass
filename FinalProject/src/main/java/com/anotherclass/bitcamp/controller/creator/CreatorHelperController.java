package com.anotherclass.bitcamp.controller.creator;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.anotherclass.bitcamp.service.creator.CreatorHelperService;
import com.anotherclass.bitcamp.service.user.UserHelperService;
import com.anotherclass.bitcamp.vo.creator.CreatorFaqVO;
import com.anotherclass.bitcamp.vo.creator.CreatorNoticeVO;
import com.anotherclass.bitcamp.vo.user.UserFaqVO;
import com.anotherclass.bitcamp.vo.user.UserNoticeVO;

@Controller
@RequestMapping("/creator")
public class CreatorHelperController {
	
	@Inject
	CreatorHelperService creatorHelperService;

	@RequestMapping(value = "/CreatorNotice")
	public ModelAndView CreatorNotice() {
		ModelAndView mav = new ModelAndView();
		List<CreatorNoticeVO> list = creatorHelperService.creatorNoticeAllRecord();
		mav.addObject("list",list);
		mav.setViewName("creator/creatorHelper/creator_Notice");		
		return mav;

	
	}
	
	@RequestMapping(value = "/CreatorFaq")
	public ModelAndView CreatorFaq() {
		ModelAndView mav2 = new ModelAndView();
		List<CreatorFaqVO> list = creatorHelperService.creatorFaqAllRecord();
		mav2.addObject("list",list);
		mav2.setViewName("creator/creatorHelper/creator_Faq");		
		return mav2;


	}
	

}

