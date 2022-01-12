package com.anotherclass.bitcamp.controller.creator;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.anotherclass.bitcamp.register.HashingSeting;
import com.anotherclass.bitcamp.register.RegisterVO;
import com.anotherclass.bitcamp.service.creator.creatorMypageMyinformationService;

@Controller
@RequestMapping("/creator")
public class CreatorMypageEditController {
	
	private HashingSeting hashing = new HashingSeting();
	
	@Inject
	creatorMypageMyinformationService creatorMypageMyinformation;
	
	@RequestMapping("mypage/Myinformation")
	public ModelAndView Myinformation(HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		String member_id = (String)ses.getAttribute("creatorId"); 
		mav.addObject("vo", creatorMypageMyinformation.MemberInfo(member_id));
		mav.setViewName("creator/mypage/creatorMyPage_MyInformation");
		return mav;
	}
	
	@RequestMapping(value ="mypage/MyinformationEdit",method = RequestMethod.POST )
	public ModelAndView MyinformationEdit(RegisterVO vo,HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		String member_id = (String)ses.getAttribute("creatorId"); 
		vo.setMember_id(member_id );
		int cnt = creatorMypageMyinformation.MemberInfoEdit(vo);
		mav.setViewName("redirect:Myinformation");
		return mav;
	}
	
	@RequestMapping(value="mypage/accountCheck", method = RequestMethod.POST)
	@ResponseBody
	public String pwordCheck(RegisterVO vo, String pwd, HttpSession ses)throws Exception {
		String idch= (String)ses.getAttribute("creatorId");
		vo.setMember_id(idch);
		vo.setMember_pw(hashing.setEncryption(pwd,(String)ses.getAttribute("userId")));
		creatorMypageMyinformation.pwdCheck(vo);
		String cnt =vo.getAdditional_information_one();
		return cnt;
	}
	
	@RequestMapping(value="mypage/pwordChain", method = RequestMethod.POST)
	@ResponseBody
	public int passwordChange(RegisterVO vo, String pwd, HttpSession ses)throws Exception {
		String userId= (String)ses.getAttribute("creatorId");
		vo.setMember_id(userId);
		vo.setMember_pw(hashing.setEncryption(pwd,userId));
		int cnt = creatorMypageMyinformation.passwordChange(vo);
		return cnt;
	}
}
