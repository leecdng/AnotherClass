package com.anotherclass.bitcamp.controller.creator;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.anotherclass.bitcamp.service.creator.MakeClassApplyService;
import com.anotherclass.bitcamp.service.user.UserReviewService;
import com.anotherclass.bitcamp.vo.user.ClassVO;

@Controller
@RequestMapping("/creator")
public class CreatorReviewController {
	@Inject
	MakeClassApplyService makeClassApplyService;
	
	@Inject
	UserReviewService userReviewService;
	
	@RequestMapping("/review")
	public ModelAndView creatorReview(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String member_id = (String)session.getAttribute("creatorId");
		System.out.println(member_id);
		List<ClassVO> classList = userReviewService.selectCreatorClass(member_id);
		if(classList.size()>0) {
			System.out.println("클래스리스트사이즈->"+classList.size());
			mav.addObject("vo", classList);
		} else {
			System.out.println("클래스리스트사이즈ㅍㅍㅍㅍ->"+classList.size());
		}
		mav.setViewName("creator/creatorClassReview");
		
		return mav;
	}
	
}
