package com.anotherclass.bitcamp.controller.creator;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.anotherclass.bitcamp.service.creator.CreatorQuestionService;
import com.anotherclass.bitcamp.vo.creator.CreatorQuestionVO;

@Controller
@RequestMapping("/creator")
public class CreatorQuestionController {
	
	@Inject
	CreatorQuestionService creatorQuestionService;
	
	@RequestMapping("CreatorQuestion/list")
	public ModelAndView HomeQnAAskList(int no) {
		// 연결시 http://localhost:9090/another/creator/CreatorQuestion/list?no=1# 중요
		ModelAndView mav = new ModelAndView();	
		int boardLimit = 10; // 한페이지에 보여줄 페이지수
		int listFirst = ((no-1)*boardLimit); // 하단 버튼숫자에 따른 페이징 시작번호
		int listLast =  boardLimit*no;
		int cnt = creatorQuestionService.creatorQuestionBoardCnt(); // 컬럼 전체숫자 출력
		List<CreatorQuestionVO> list = creatorQuestionService.CreatorQuestionAllSelect(listFirst+1,listLast);
		mav.addObject("list",list);
		mav.addObject("number",no);
		mav.setViewName("/creator/sendQuestion/creatorQuestionsList");		
		return mav;
	}
	
	//페이징수
	@RequestMapping(value="CreatorQuestion/buttonCnt", method = RequestMethod.GET)
	@ResponseBody
	public int buttonList() {
		int boardListNumber = creatorQuestionService.creatorQuestionboardLimit(); // 게시글 수 조회
		int memberListLimit = 10; // 한페이지에 보여줄 게시글수
		int listCalcul = (int) Math.ceil((double)boardListNumber/memberListLimit);		
		return listCalcul;
	}
	
	//문의하기(글쓰기)페이지로 이동
		@RequestMapping("CreatorQuestion/write")
		public String CreatorQuestionWrite() {
			return "/creator/sendQuestion/creatorQuestionsListWrite";
		}
		
		//글등록
		@RequestMapping(value="CreatorQuestion/writeOk",method=RequestMethod.POST)
		public ModelAndView CreatorQuestionWriteOk(CreatorQuestionVO vo, HttpSession ses) {
			System.out.println("컨");
			vo.setMember_id((String)ses.getAttribute("creatorId"));
			int result = creatorQuestionService.creatorQuestionWrite(vo);
			System.out.println(result);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:list?no=1");
			return mav;
		}
		
		//제목누르면 글보기
		@RequestMapping("CreatorQuestion/view")
		public ModelAndView CreatorQuestionView(int no) {
			ModelAndView mav = new ModelAndView();
			mav.addObject("vo",creatorQuestionService.CreatorQuestionView(no));
			mav.setViewName("/creator/sendQuestion/creatorQuestionsListView");
			return mav;
		}
		
		//수정페이지로 이동
		@RequestMapping("CreatorQuestion/editForm")
		public ModelAndView CreatorQuestionEditForm(int no) {
			ModelAndView mav = new ModelAndView();
			mav.addObject("vo", creatorQuestionService.CreatorQuestionView(no));
			mav.setViewName("/creator/sendQuestion/creatorQuestionsListEdit");
			return mav;
		}
		
		//글수정
		@RequestMapping(value="CreatorQuestion/edit",method = RequestMethod.POST)
		public ModelAndView CreatorQuestionEdit(CreatorQuestionVO vo, HttpSession ses) {
			vo.setMember_id((String)ses.getAttribute("creatorId"));
			int result = creatorQuestionService.creatorQuestionEdit(vo);
			ModelAndView mav = new ModelAndView();
			if(result>0) {
				mav.setViewName("redirect:view");
				mav.addObject("no",vo.getUser_qna_no());
			}else{
				 mav.setViewName("/creator/sendQuestion/creatorQuestionsListResult");

			}
			return mav;
		}
		
		//글삭제 -> 컬럼값 업데이트....답글이잇다면 답글 컬럼값도 업데이트
		@RequestMapping(value="CreatorQuestion/del",method=RequestMethod.POST)
		public ModelAndView CreatorQuestionDel(int no , HttpSession session) {		
			String member_id = (String)session.getAttribute("creatorId"); //이부분은 삭세해도될거같은데
			int result = creatorQuestionService.creatorQuestionDel(no);
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
