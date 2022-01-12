package com.anotherclass.bitcamp.controller.user;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.anotherclass.bitcamp.dao.user.UserCommunityDAO;
import com.anotherclass.bitcamp.service.user.UserCommunityService;
import com.anotherclass.bitcamp.vo.user.ClassVO;
import com.anotherclass.bitcamp.vo.user.CommunityVO;


@Controller
public class UserCommunityController {
	
	@Inject
	UserCommunityService userCommunityService;
	
	@RequestMapping(value = "/CommunityMain")
	public String CommunityMain() {
		
		return "user/community/commu_main";
	}
	

	@RequestMapping(value = "/commu_main/list", method = RequestMethod.GET)
	@ResponseBody
	public List<CommunityVO> commuMainList(CommunityVO vo) {
		List<CommunityVO> commuMainList = userCommunityService.communityAllList(vo);
				
		return commuMainList;
				
	}
	/*
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
	
	/*
	@RequestMapping(value = "/CommunityMain")
	public ModelAndView CommunityMain(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/user/community/commu_main");
		
	
		/*
		try {
			String path = request.getSession().getServletContext().getRealPath("/js");
			System.out.println(path);
			File f = new File(path,"MOCK_DATA.txt");
			System.out.println(f.length());
			FileInputStream fis = new FileInputStream(f);
		
			byte[] b = new byte[(int)f.length()];
			int cnt = fis.read(b, 0, (int)f.length());
			String str = new String( b);
				System.out.println("oooooo->"+str);
			JSONParser jsonParse = new JSONParser();	
			mav.addObject("data",jsonParse.parse(str));
			System.out.println(str);
			
		}catch(Exception e) {e.printStackTrace();}
////
		
		return mav;
	}
*/
	@RequestMapping(value = "/CommunityContentDetail")
	public String CommunityContentDetail() {
		
		return "/user/community/commu_content_detail";
	}
	
	@RequestMapping(value = "/CommunityNewContent")
	public String CommunityNewContent() {
		
		return "/user/community/commu_new_content";
	}
	/*
	//댓글
	@RequestMapping("/communityAskReplyList")
	@ResponseBody
	public CommunityVO  communityQnAAskReply(int no) {	
		int a = communityClassAskService.CAReplyCheck(no);// 0이면 댓글 x 1이면 답글 있음
		CommunityVO vo = new CommunityVO();
		if(a==1) {
			vo = communityClassAskService.CAReplyContent(no);			
		}else {
			vo.setClassqnacom_reply("답댓글을 입력 해주세요");
		}
		return vo;
	}
	
	@RequestMapping("/communityAskReplyListEdit")
	@ResponseBody
	public int communityAskRepEdit(CommunityVO vo) {
		int result =0;
		System.out.println(vo.getClassqnacom_reply()+"//"+vo.getClass_qna_no());
		communityClassAskService.CAReplyEdit(vo);
		return result;
	}
	@RequestMapping("/communityAskReplyDel")
	@ResponseBody
	public int communityAskRepDel(int no) {
		int result =0;
		
		communityClassAskService.CAReplyDel(no);
		return result;
	}
	@RequestMapping("/communityAskReplyWritee")
	@ResponseBody
	public int communityAskRepWrite(CommunityVO vo) {
		int result =0;
		
		communityClassAskService.CAReplyWrite(vo);
		return result;
	}
	*/
}
