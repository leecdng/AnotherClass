package com.anotherclass.bitcamp.controller.user;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.anotherclass.bitcamp.register.RegisterVO;
import com.anotherclass.bitcamp.service.creator.MakeClassApplyService;
import com.anotherclass.bitcamp.service.user.UserHomeService;
import com.anotherclass.bitcamp.vo.creator.CreatorClassCategoryVO;
import com.anotherclass.bitcamp.vo.user.ClassVO;
import com.anotherclass.bitcamp.vo.user.ReviewVO;


@Controller
public class UserController {
	
	@Inject
	MakeClassApplyService makeClassApplyService;
	@Inject
	UserHomeService userHomeService;
	
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("userImg")==null || session.getAttribute("userImg").equals("")) {
			session.setAttribute("userImg", "/another/img/etc/basic_profile.png");
		}
		
		// 인기있는 강사 top 8 가져오기
		List<RegisterVO> creatorList = userHomeService.popularCreator();
		mav.addObject("creatorList", creatorList);
		
		// 베스트 후기 best 5 가져오기
		List<ReviewVO> reviewList = userHomeService.bestReview();
		mav.addObject("reviewList", reviewList);
		
		// 인기있는 클래스 top 8 가져오기
		List<ClassVO> popularClassList = userHomeService.popularClass();
		mav.addObject("popularClassList", popularClassList);
		
		// 신규 클래스 8개 가져오기
		List<ClassVO> newClassList = userHomeService.newClass();
		mav.addObject("newClassList", newClassList);

		
    	mav.setViewName("/user/home");
    	return mav;
	}
	
	@RequestMapping(value = "/cateL", method = RequestMethod.GET)
	@ResponseBody
	public List<CreatorClassCategoryVO> cateL() {
    	// 대분류 카테고리 가져오기
    	List<CreatorClassCategoryVO> cateL = makeClassApplyService.makeClassCategoryL();

    	return cateL;
	}
	
	
	@RequestMapping(value = "/cateS", method = RequestMethod.GET)
	@ResponseBody
	public List<CreatorClassCategoryVO> cateS(CreatorClassCategoryVO vo) {
    	// 중분류 카테고리 가져오기
    	List<CreatorClassCategoryVO> cateS = makeClassApplyService.makeClassCategoryS(vo.getCategory1_no());

    	return cateS;
	}
	
	
	// 임시 맵핑 --------------------------
	
	
	
//	@RequestMapping(value = "/classMainPage")
//	public String classMainPage() {
//		return "/user/classDetailPage/classMain";
//	}	
////	
//	@RequestMapping(value = "/homeQnA")
//	public String homeQnA() {
//		return "/user/HomeQnA/userHelper_HomeQnA_list";
//	}
	@RequestMapping(value = "/AhomeQnA")
	public String AhomeQnA() {
		return "/admin/HomeQnA/admin_HomeQnA_view";
	}
	@RequestMapping(value = "/creatorclasslist")
	public String creatorclasslist() {
		return "/creator/optionList/classList";
	}
	@RequestMapping(value = "/creatorclassoptionlist")
	public String creatorclassoptionlist() {
		return "/creator/optionList/classOptionList";
	}	
	//지수백위한임시홈
//	@RequestMapping(value = "/temporaryhome")
//	public String temporaryhome() {
//		return "/user/classDetailPage/temporaryhome";
//	}
	
	
}
