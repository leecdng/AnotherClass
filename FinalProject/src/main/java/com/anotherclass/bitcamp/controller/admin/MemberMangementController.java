package com.anotherclass.bitcamp.controller.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.anotherclass.bitcamp.register.HashingSeting;
import com.anotherclass.bitcamp.register.RegisterVO;
import com.anotherclass.bitcamp.service.admin.AdminService;
import com.anotherclass.bitcamp.service.vo.admin.MemberMangementVO;

@Controller
@RequestMapping("/admin")
public class MemberMangementController {
	
	@Inject
	AdminService adminService;
	
	private HashingSeting hashing = new HashingSeting();
	
	@RequestMapping(value="/MemberMangement/userAccountList",method = RequestMethod.POST)
	@ResponseBody
	public List<MemberMangementVO> userList(int number, String searchWord, String dateSearchFirst, String dateSearchLast){
		MemberMangementVO vo = new MemberMangementVO();
		if(searchWord != null) {
			vo.setSearchWord(searchWord);
		}
		if(dateSearchFirst != null && dateSearchLast != null) {
			vo.setDateSearchFirst(dateSearchFirst);
			vo.setDateSearchLast(dateSearchLast);
		}
		vo.setPageNumber(number);
		int memberListLimit = 10; // 한페이지에 보여줄 페이지수
		int numberList = ((vo.getPageNumber()-1)*memberListLimit); // 페이징 시작 계산식
		
		int pageStartNumber = (numberList+1);
		int pageEndNumber = (memberListLimit*vo.getPageNumber());
		
		vo.setPageStartNumber(pageStartNumber);
		vo.setPageEndNumber(pageEndNumber);
		
		List<MemberMangementVO> list = adminService.MemberList(vo);
		return list;
	}
	
	@RequestMapping(value="/MemberMangement/btnList", method = RequestMethod.POST)
	@ResponseBody
	public int buttonList(String searchWord, String dateSearchFirst, String dateSearchLast) {
		MemberMangementVO vo = new MemberMangementVO();
		if(searchWord != null) {
			vo.setSearchWord(searchWord);
		}
		if(dateSearchFirst != null && dateSearchLast != null) {
			vo.setDateSearchFirst(dateSearchFirst);
			vo.setDateSearchLast(dateSearchLast);
		}
		int boardListNumber = adminService.boardLimit(); // 게시글 수 조회
		int memberListLimit = 10; // 한페이지에 보여줄 페이지수
		int listCalcul = (int) Math.ceil((double)boardListNumber/memberListLimit);		
		return listCalcul;
	}
	
	@RequestMapping(value="/MemberMangement/AccountInformation", method= RequestMethod.POST)
	@ResponseBody
	public MemberMangementVO memberAccountInfo(String idData){
		return adminService.MemberAccountInfo(idData);
	}
	
	@RequestMapping(value="/userManagement")
	public String userManagement() {
		return "admin/MemberManagement/userManagement";
	}
	
	
	// 크리에이터 페이징
	@RequestMapping(value="/MemberMangement/creatorAccountList",method = RequestMethod.POST)
	@ResponseBody
	public List<MemberMangementVO> creatorList(int number, String searchWord, String dateSearchFirst, String dateSearchLast){
		MemberMangementVO vo = new MemberMangementVO();
		if(searchWord != null) {
			vo.setSearchWord(searchWord);
		}
		if(dateSearchFirst != null && dateSearchLast != null) {
			vo.setDateSearchFirst(dateSearchFirst);
			vo.setDateSearchLast(dateSearchLast);
		}
		vo.setPageNumber(number);
		int memberListLimit = 10; // 한페이지에 보여줄 페이지수
		int numberList = ((vo.getPageNumber()-1)*memberListLimit); // 페이징 시작 계산식
		
		int pageStartNumber = (numberList+1);
		int pageEndNumber = (memberListLimit*vo.getPageNumber());
		
		vo.setPageStartNumber(pageStartNumber);
		vo.setPageEndNumber(pageEndNumber);
		
		List<MemberMangementVO> list = adminService.creatorList(vo);
		return list;
	}
	
	@RequestMapping(value="/MemberMangement/creatorbtnList", method = RequestMethod.POST)
	@ResponseBody
	public int creatorbuttonList() {
		int boardListNumber = adminService.creatorBoardLimit(); // 게시글 수 조회
		int memberListLimit = 10; // 한페이지에 보여줄 페이지수
		int listCalcul = (int) Math.ceil((double)boardListNumber/memberListLimit);		
		return listCalcul;
	}
	
	@RequestMapping(value="/MemberMangement/creatorInformation", method= RequestMethod.POST)
	@ResponseBody
	public MemberMangementVO creatorAccountInfo(String idData){
		return adminService.creatorAccountInfo(idData);
	}
	
	@RequestMapping(value="/creatorManagement")
	public String creatorManagement() {
		return "admin/MemberManagement/creatorManagement";
	}
	
	@RequestMapping(value="/MemberMangement/MemberAccountDelete", method = RequestMethod.POST)
	@ResponseBody
	public int accountDelete(String data) {
		MemberMangementVO vo = new MemberMangementVO();
		vo.setMember_id(data);
		Integer cnt1 =adminService.deleteAccount(vo);
		int cnt = 0;
		System.out.println(cnt1);
		return cnt;
	}
	
	// 관리자 계정생성
	@RequestMapping(value="/adminAccountMake", method = RequestMethod.POST)
	public ModelAndView adminAccountMake(RegisterVO vo)throws Exception {
		ModelAndView mav = new ModelAndView();
		vo.setMember_pw(hashing.setEncryption(vo.getMember_pw(),vo.getMember_id()));
		vo.setAdditional_information_one("admin1");
		String s = adminService.adminAccountCreate(vo);
		String check =vo.getAdditional_information_two();
		if(check=="NOT") {
			mav.setViewName("redirect:/");
		}else {
			
		}
		mav.setViewName("redirect:/");
		return mav;
	}
}
