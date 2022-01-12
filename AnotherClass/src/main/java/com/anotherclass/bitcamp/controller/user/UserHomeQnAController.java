package com.anotherclass.bitcamp.controller.user;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.anotherclass.bitcamp.service.user.UserHomeQnAService;
import com.anotherclass.bitcamp.vo.user.UserHomeQnAVO;

@Controller
public class UserHomeQnAController {
	@Inject
	UserHomeQnAService userHomeQnAService;
	


	@RequestMapping("/HomeQnAAsk/list")
	public ModelAndView HomeQnAAskList(int no) {
		
		ModelAndView mav = new ModelAndView();	
		int boardLimit = 10; // 한페이지에 보여줄 페이지수
		int listFirst = ((no-1)*boardLimit); // 하단 버튼숫자에 따른 페이징 시작번호
		int listLast =  boardLimit*no;
		int cnt = userHomeQnAService.userHomeOnABoardCnt(); // 컬럼 전체숫자 출력
		System.out.println("테스트--->"+cnt);
		List<UserHomeQnAVO> list = userHomeQnAService.userHomeQnAAllSelect(listFirst+1,listLast);
		mav.addObject("list",list);
		System.out.println(no);
		mav.addObject("number",no);
		mav.setViewName("/user/HomeQnA/userHelper_HomeQnA_list");		
		return mav;
	}
	
	//페이징수
	@RequestMapping(value="/HomeQnAAsk/buttonCnt", method = RequestMethod.GET)
	@ResponseBody
	public int buttonList() {
		int boardListNumber = userHomeQnAService.userHomeQnAboardLimit(); // 게시글 수 조회
		int memberListLimit = 10; // 한페이지에 보여줄 게시글수
		int listCalcul = (int) Math.ceil((double)boardListNumber/memberListLimit);		
		return listCalcul;
	}
	
	
	//문의하기(글쓰기)페이지로 이동
	@RequestMapping("/HomeQnAAsk/write")
	public String HomeQnAAskWrite() {
		return "/user/HomeQnA/userHelper_HomeQnA_write";
	}
	
	//글등록
	@RequestMapping(value="/HomeQnAAsk/writeOk",method=RequestMethod.POST)
	public ModelAndView HomeQnAAskWriteOk(UserHomeQnAVO vo, HttpSession ses) {
	
		vo.setMember_id((String)ses.getAttribute("userId"));
		int result = userHomeQnAService.userHomeQnAWrite(vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:list?no=1");
		return mav;
	}
	
	//제목누르면 글보기
	@RequestMapping("/HomeQnAAsk/view")
	public ModelAndView HomeQnAAskView(int no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",userHomeQnAService.userHomeQnAView(no));
		mav.setViewName("/user/HomeQnA/userHelper_HomeQnA_view");
		return mav;
	}
	
	//수정페이지로 이동
	@RequestMapping("/HomeQnAAsk/editForm")
	public ModelAndView HomeQnAAskEditForm(int no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", userHomeQnAService.userHomeQnAView(no));
		mav.setViewName("/user/HomeQnA/userHelper_HomeQnA_edit");
		return mav;
	}
	
	//글수정
	@RequestMapping(value="/HomeQnAAsk/edit",method = RequestMethod.POST)
	public ModelAndView HomeQnAAskEdit(UserHomeQnAVO vo, HttpSession ses) {
		vo.setMember_id((String)ses.getAttribute("userId"));
		int result = userHomeQnAService.userHomeQnAEdit(vo);
		ModelAndView mav = new ModelAndView();
		if(result>0) {
			mav.setViewName("redirect:view");
			mav.addObject("no",vo.getUser_qna_no());
		}else{
			 mav.setViewName("/user/HomeQnA/userHelper_HomeQnA_result");

		}
		return mav;
	}
	
	//글삭제 -> 컬럼값 업데이트....답글이잇다면 답글 컬럼값도 업데이트
	@RequestMapping(value="/HomeQnAAsk/del",method=RequestMethod.POST)
	public ModelAndView HomeQnAAskDel(int no , HttpSession session) {		
		String member_id = (String)session.getAttribute("userId"); //이부분은 삭세해도될거같은데
		int result = userHomeQnAService.userHomeQnADel(no);
		ModelAndView mav = new ModelAndView();
		if(result>0) {
			mav.setViewName("redirect:list?no=1"); //디ㅏ른컨트롤러호풀
		}else {
			System.out.println("삭제실패");
			mav.addObject("no",no); //no라는 변수에 매개변수no를 보맨다
			mav.setViewName("redirect:view");
		}
		return mav;
	}
	
	
	
}
