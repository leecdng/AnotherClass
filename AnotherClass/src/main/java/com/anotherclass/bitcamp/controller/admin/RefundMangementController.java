package com.anotherclass.bitcamp.controller.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.anotherclass.bitcamp.service.admin.AdminRefundService;
import com.anotherclass.bitcamp.service.vo.admin.ExpectedRefundListMangementVO;

@Controller
@RequestMapping("/admin")
public class RefundMangementController {
	
	@Inject
	AdminRefundService adminRefundService;
	
	@RequestMapping(value="/RefundMangement/RefundList",method = RequestMethod.POST)
	@ResponseBody
	public List<ExpectedRefundListMangementVO> userList(int number, String searchWord, String dateSearchFirst, String dateSearchLast){
		ExpectedRefundListMangementVO vo = new ExpectedRefundListMangementVO();
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
		
		List<ExpectedRefundListMangementVO> list = adminRefundService.refundList(vo);
		return list;
	}
	
	@RequestMapping(value="/RefundMangement/btnList", method = RequestMethod.POST)
	@ResponseBody
	public int buttonList() {
		int boardListNumber = adminRefundService.boardLimit(); // 게시글 수 조회
		int memberListLimit = 10; // 한페이지에 보여줄 페이지수
		int listCalcul = (int) Math.ceil((double)boardListNumber/memberListLimit);		
		return listCalcul;
	}
	
	@RequestMapping(value="/RefundMangement/RefundDelete", method= RequestMethod.POST)
	@ResponseBody
	public int memberAccountInfo(int no){
		Integer cnt = adminRefundService.refundDelete(no);
		adminRefundService.addHeadCount(no);
		return cnt;
	}
	
	@RequestMapping(value="/RefundMangement")
	public String userManagement() {
		return "admin/RefundList/expectedRefundList";
	}
	
	
	

}
