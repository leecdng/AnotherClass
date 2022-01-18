package com.anotherclass.bitcamp.controller.creator;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.anotherclass.bitcamp.service.creator.CreatorCalcuService;
import com.anotherclass.bitcamp.vo.creator.CreatorCalcuVO;

@Controller
@RequestMapping("/creator")
public class CreatorCalcuController {
	@Inject
	CreatorCalcuService creatorCalcuService;

	// 수익관리 - 클래스 통계
	@RequestMapping(value = "/incomeChart")
	public ModelAndView incomeChart(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String member_id = (String)session.getAttribute("creatorId");
		CreatorCalcuVO ccvo1 = creatorCalcuService.scheduledClass(member_id); // 예정 강의
		CreatorCalcuVO ccvo2 = creatorCalcuService.classManagement(member_id); // 수강 관리
		CreatorCalcuVO ccvo3 = creatorCalcuService.incomeManagement(member_id); // 수익 관리
		
		mav.addObject("ccvo1", ccvo1);
		mav.addObject("ccvo2", ccvo2);
		mav.addObject("ccvo3", ccvo3);
		mav.setViewName("creator/income/income_chart");
		return mav;
	}
	
	// 수익관리 - 정산내역
	@RequestMapping("/calcuList")
	public String creatorCalcuList() {
		return "creator/income/creator_calcu_list";
	}
	
}
