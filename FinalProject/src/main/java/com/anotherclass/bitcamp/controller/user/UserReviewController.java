package com.anotherclass.bitcamp.controller.user;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.anotherclass.bitcamp.service.user.UserReviewService;
import com.anotherclass.bitcamp.vo.user.ClassVO;
import com.anotherclass.bitcamp.vo.user.ReviewComVO;
import com.anotherclass.bitcamp.vo.user.ReviewVO;

@Controller
public class UserReviewController {
	
	@Inject
	UserReviewService userReviewService;
	
	// 후기 등록
	@RequestMapping("/writeReviewOK")
	public ModelAndView writeReviewOK(ReviewVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println("클래스번호->"+vo.getOrder_no());
		System.out.println("내용>"+vo.getContent());
		int result = userReviewService.insertReview(vo);
		if(result>0) { // 등록 성공
			mav.setViewName("redirect:/mypage/mypage1"); // 주문 내역 화면
		} else { // 등록 실패
			mav.setViewName("redirect:/writeReviewOK"); // 수정해야 함///////////////////////////
		}
		return mav;
	}
	
	// 해당 주문 클래스 정보 가져오기
	@RequestMapping("/reviewClassInfo")
	@ResponseBody
	public ClassVO reviewClassInfo(int order_no, HttpSession session) {
		String member_id = (String)session.getAttribute("userId");
		ClassVO vo = userReviewService.selectReviewClass(order_no, member_id);

		return vo;
	}
	
	
	@RequestMapping(value = "/mypage/review")
	public ModelAndView mypageReview(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
    	mav.setViewName("/user/mypage/myPage_review");
		return mav;
	}
	
	
	// 나의 후기 페이징 불러오기
	@RequestMapping(value = "/myReviewPage")
	@ResponseBody
	public ReviewVO myReviewPage(int nowPage, HttpSession session) {
		String member_id = (String)session.getAttribute("userId");
		ReviewVO vo = userReviewService.countTotalMyReview(member_id);
		vo.setNowPage(nowPage);

		return vo;
	}
	
	// 나의 후기 불러오기
	@RequestMapping(value = "/myReview")
	@ResponseBody
	public List<ReviewVO> myReview(ReviewVO vo) {
		List<ReviewVO> reviewList = userReviewService.selectMyReview(vo);
		return reviewList;
	}	
	
	
	
	// 클래스 후기 페이징 불러오기
	@RequestMapping(value = "/classReviewPage")
	@ResponseBody
	public ReviewVO classReviewPage(int nowPage, int class_no) {
		ReviewVO vo = userReviewService.countTotalClassReview(class_no);
		vo.setNowPage(nowPage);
		return vo;
	}
	
	// 클래스 후기 불러오기
	@RequestMapping(value = "/classReviewList")
	@ResponseBody
	public List<ReviewVO> classReviewList(ReviewVO vo) {
		List<ReviewVO> reviewList = userReviewService.selectClassReview(vo);
		return reviewList;
	}
	
	
	// 후기 댓글 등록
	@RequestMapping(value = "/writeReviewComment")
	@ResponseBody
	public int writeReviewComment(ReviewComVO vo) {
		System.out.println(vo.getCom_no1());
		System.out.println(vo.getCom_no2());
		System.out.println(vo.getReview_no());
		int review_com_no = 0;
		int cnt = userReviewService.insertReviewComment(vo);
		if(cnt > 0) {
			review_com_no = vo.getReview_com_no();
		}
		System.out.println("후기댓글등록->" + review_com_no);
		System.out.println("후기댓글번호->" + vo.getReview_com_no());
		return review_com_no;
	}
	
	
	// 후기 댓글 조회
	@RequestMapping(value = "/selectReviewComment")
	@ResponseBody
	public List<ReviewComVO> selectReviewComment(ReviewComVO vo) {
		List<ReviewComVO> reviewComList = userReviewService.selectReviewComment(vo);
		return reviewComList;
	}
	
	
	// 후기 댓글 삭제
	@RequestMapping(value = "/deleteReviewComment")
	@ResponseBody
	public int deleteReviewComment(ReviewComVO vo) {
		// 대댓글 있나 조회
		int cnt = userReviewService.countReplyCheck(vo.getReview_com_no());
		
		if(cnt>0) { // 대댓글이 있으면 삭제 여부 수정
			return userReviewService.updateDelReviewComment(vo);
		} else { // 대댓글이 없으면 진짜 삭제
			return userReviewService.deleteReviewComment(vo);
		}
	}

	
}










