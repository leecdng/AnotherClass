 package com.anotherclass.bitcamp.controller.user;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.anotherclass.bitcamp.service.user.ClassDetailPageService;

import com.anotherclass.bitcamp.vo.user.UserClassDetailVO;
import com.anotherclass.bitcamp.vo.user.UserClassDetailVO2;

@Controller
public class ClassDetailPageController {
	@Inject
	ClassDetailPageService classDetailPageService;

	//클래스리스트--> 기민님이구현
	@RequestMapping("/user/classDetailPage/temporaryclasslist")
	public ModelAndView temporaryclasslist() { //가짜클래스목록
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",classDetailPageService.temporarylistAllSelect());
		mav.setViewName("user/classDetailPage/temporaryclasslist");
		return mav;		
	}
	
	
	@RequestMapping("/classDetailView")
	public ModelAndView classMainPage(int no) {
		ModelAndView mav = new ModelAndView();
		UserClassDetailVO vo = classDetailPageService.userClassDetailAllSelect(no);
		System.out.println(vo.getMember_id());
		vo.setCreatorlikecount(classDetailPageService.LikedcreatorCount(vo.getMember_id()));//클래스좋아요수 LikedcreatorCount(String logid) - int
		vo.setCreatorclasscount(classDetailPageService.OpenClassCount(vo.getMember_id()));  
		mav.addObject("vo",vo);
		mav.setViewName("/user/classDetailPage/classMain2");
		return mav;
	}	
	
	@RequestMapping("/classDetailDatePick")  
	@ResponseBody		
	public List<UserClassDetailVO> ajaxDatePick(String datedate, int no){			
		List<UserClassDetailVO> list = classDetailPageService.userSelectOptionAllSelect(datedate,no);		
		return list;
	}
	
	@RequestMapping("/classDetailLikeCount")
	@ResponseBody
	public UserClassDetailVO ajaxLikeChechk(int no, HttpSession  ses){		
		UserClassDetailVO vo2= classDetailPageService.classLikeCount(no); 		
		String logid= (String)ses.getAttribute("userId");
		if(logid == null) {//|| logid.length() == 0 //로그인x
			vo2.setClass_like_check(0);
		}else {	
			int likecheck = classDetailPageService.classLikeCheck(no,logid);			
			if(likecheck == 0) {
				vo2.setClass_like_check(0); 			
			}else {
				vo2.setClass_like_check(1);			
			}			
		}		
		return vo2;
	}
	
	@RequestMapping("/classDetailLikeFun")
	@ResponseBody
	public int ajaxLikeFunc(int no,HttpSession  sess) {			
		String logid= (String)sess.getAttribute("userId");
		int result;
		System.out.println(no);
		System.out.println(logid);
		int likecheck = classDetailPageService.classLikeCheck(no,logid); 
		System.out.println(likecheck);		
		if(likecheck == 0) {
			result = classDetailPageService.classLikeInsert(no,logid); 		
		}else {
			result = classDetailPageService.classLikeDelete(no,logid);
		}			
		return result;
	}	
	
	@RequestMapping("/classDetailAskList")
	@ResponseBody
	public List<UserClassDetailVO2> ajaxAskList(int no) {		
		List<UserClassDetailVO2> list = classDetailPageService.userClassDetailAskAllSelect(no); 
			for (int i=0; i<list.size(); i++) {
				UserClassDetailVO2 vo2 = list.get(i);				
				int replyChek = classDetailPageService.AskReplyCheck(vo2.getClass_qna_no());
					if(replyChek==0) {
						vo2.setReplycheck(0);
					}else {
						vo2.setReplycheck(1);
					}
			}		
		return list;			
	}	
	
	@RequestMapping("/classDetailAskReplyList")
	@ResponseBody
	public List<UserClassDetailVO2> ajaxAskReply(int no){		
		List<UserClassDetailVO2> list = classDetailPageService.userClassDetailAskReplySelect(no); 
		return list;
	}	
	
	@RequestMapping(value="/classDetailAskWritee")
	@ResponseBody
	public int AskWritee(UserClassDetailVO2 askVo ,HttpSession  ses) {
		askVo.setClassqna_member_id((String)ses.getAttribute("userId"));
		return classDetailPageService.classAskWritee(askVo); 
	}	
	
	@RequestMapping(value="/classAskDD")
	@ResponseBody
	public int ajaxClassAskDD(int no) {
		
		int result=0;
		result = classDetailPageService.ClassAskDDel(no);
		//ClassASkCheckRep(no);//문의글에 댓글달렸는지 여부
		//ClassAskDDel(no) ->없으면 바로삭제
		//ClassASkCheckRepDelUp(no) ->있으면 댓글 달렸을 경우 문의글 삭제->classqnacom_delete_sort 컬럼 업데이트 : 1
		return result;
	}		
	
	@RequestMapping(value="/classAskConEdit")
	@ResponseBody
	public int ClassAskConEdit(UserClassDetailVO2 vo) {
		int result =0;
		result = classDetailPageService.ClassAskReplyEdit(vo);	
		return result;
	}
	

}
