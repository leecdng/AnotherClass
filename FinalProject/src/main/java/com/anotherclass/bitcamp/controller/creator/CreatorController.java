package com.anotherclass.bitcamp.controller.creator;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.anotherclass.bitcamp.service.creator.CreatorCalcuService;
import com.anotherclass.bitcamp.service.creator.MakeClassApplyService;
import com.anotherclass.bitcamp.vo.creator.CreatorCalcuVO;
import com.anotherclass.bitcamp.vo.creator.CreatorClassCategoryVO;
import com.anotherclass.bitcamp.vo.creator.CreatorMakeClassDateTimeVO;
import com.anotherclass.bitcamp.vo.creator.CreatorMakeClassVO;
import com.anotherclass.bitcamp.vo.user.ClassListVO;

@Controller
@RequestMapping("/creator")
public class CreatorController {
	@Inject
	MakeClassApplyService makeClassApplyService;
	@Inject
	CreatorCalcuService creatorCalcuService;
	
	// 크리에이터 메인
	@RequestMapping("/")
	public ModelAndView creator(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String member_id = (String)session.getAttribute("creatorId");
		CreatorCalcuVO ccvo2 = creatorCalcuService.scheduledClass(member_id); // 예정 강의 현황
		mav.addObject("ccvo2", ccvo2);
		mav.setViewName("creator/creator");
		return mav;
	}
	
	@RequestMapping("/historyback")
	public String historyBack() {
		return "creator/historyback";
	}
	
	@RequestMapping("/makeClass")
	public ModelAndView makeClass(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("cate", makeClassApplyService.makeClassCategoryL());
		mav.setViewName("/creator/makeClass");
		return mav;
	}
	
	
	@RequestMapping(value="/makeClassOk", method=RequestMethod.POST)
	public ModelAndView creatClass(CreatorMakeClassVO vo,CreatorMakeClassDateTimeVO vo2, HttpServletRequest req,HttpSession ses) {
		
		ModelAndView mav = new ModelAndView();
		String id = (String)req.getSession().getAttribute("creatorId");
		vo.setMember_id(id);///////////////////////아이디 세션
		
		int result = makeClassApplyService.makeClassApply(vo);
		String vo2GetStartDate = vo2.getStart_date();
		String vo2GetEndDate = vo2.getEnd_date();
		
		String[] startTimeResult = vo2GetStartDate.split(",");
		String[] endTimeResult = vo2GetEndDate.split(",");		
		System.out.println(startTimeResult.length);
		
		int result_date=0;
			for(int i=0; i < startTimeResult.length; i++) {
				
			vo2.setStart_date(startTimeResult[i]);
			vo2.setEnd_date(endTimeResult[i]);
			vo2.setClass_no(vo.getClass_no()); 
			result_date = makeClassApplyService.makeClassApplyDateTime(vo2);
			
			};
		
		if(result == 1 && result_date ==1) {
			System.out.println("등록성공");
			mav.setViewName("/creator/makeClassOk");
		}
		return mav;
	}
	   
	@RequestMapping("/modifyClass")
	public ModelAndView modifyClass(int no,HttpSession ses,CreatorMakeClassVO vo,CreatorMakeClassDateTimeVO vo2) {
		ModelAndView mav = new ModelAndView();
	//	String id = (String)ses.getAttribute("creatorId");
		vo.setClass_no(no);
	//	int result = makeClassApplyService.modifyClass(vo);
		mav.addObject("cate", makeClassApplyService.makeClassCategoryL());
		mav.addObject("modify", makeClassApplyService.modifyClassInfo(vo));
		mav.setViewName("/creator/modifyClass");
	    return mav;
	}
	@RequestMapping("/deleteClass")
	public String deleteClass(int no, CreatorMakeClassVO vo) {
		vo.setClass_no(no);
		int result = makeClassApplyService.deleteClass(vo);
		if(result == 1) {
			System.out.println("클래스 삭제가 완료되었습니다.");
		}
		return "creator/deleteClass";
	}
	
	
	
	@RequestMapping("/creatorChannel")
	public ModelAndView creatorChannel(HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		ClassListVO vo = new ClassListVO();
		String id = (String)ses.getAttribute("creatorId");
		vo.setMember_id(id);
		mav.addObject("channel", makeClassApplyService.creatorChannel(vo));
		mav.setViewName("/creator/creatorChannel");
		return mav;
	}
	
	@RequestMapping("/classMain")
	public String classMain() {
	    return "user/classDetailPage/classMain";
	}
	
	
	@RequestMapping(value="makeClass/ajaxList")
	@ResponseBody
	public List<CreatorClassCategoryVO> ajaxList(int no) {
		List<CreatorClassCategoryVO> result = makeClassApplyService.makeClassCategoryS(no);
		
		System.out.println("카테고리 디비");
		
		return result;
	}
	@RequestMapping("/creatorClassList")
	public String creatorClassList() {
	    return "/creator/creatorClassList";
	}
	@RequestMapping(value="/creatorProfileOk", method=RequestMethod.POST)
	public String putCreatorProfile(HttpSession ses, CreatorMakeClassVO vo, String creator_content,
			String creator_content_img) {
		
		String id = (String)ses.getAttribute("creatorId");
		vo.setMember_id(id);
		vo.setCreator_content(creator_content);
		vo.setCreator_content_img(creator_content_img);
		System.out.println(creator_content_img);
		int result = makeClassApplyService.putCreatorProfile(vo);
		if(result == 1) {
			System.out.println("업데이트등록완료");
		}
		return "/creator/creatorProfileOk";
	}
	@RequestMapping(value="/modifyClassOk", method=RequestMethod.POST)
	public String modifyClassOk(CreatorMakeClassVO vo,CreatorMakeClassDateTimeVO vo2,HttpSession ses) {
		CreatorMakeClassVO classno = makeClassApplyService.modifyClassInfo(vo);
		
		vo.setClass_no(classno.getClass_no());
		
		int result = makeClassApplyService.modifyClassOk(vo); 
		if(result == 1) {
			System.out.println("클래스 메이크 업데이트등록완료");
			
		}
		return "/creator/modifyClassOk";
	}
	
}
