package com.anotherclass.bitcamp.controller.user;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.anotherclass.bitcamp.register.HashingSeting;
import com.anotherclass.bitcamp.register.RegisterVO;
import com.anotherclass.bitcamp.service.user.UserMyPageService;
import com.anotherclass.bitcamp.vo.user.UserClassDetailVO;
import com.anotherclass.bitcamp.vo.user.UserClassDetailVO2;
import com.anotherclass.bitcamp.vo.user.UserHomeQnAVO;
import com.anotherclass.bitcamp.vo.user.UserMyPageOrderVO;

@Controller
public class UserMyPageController {
	
	private HashingSeting hashing = new HashingSeting();
	
	@Inject
	UserMyPageService userMyPageService;
	
	
	@RequestMapping(value = "/mypage/mypage1")//주문내역
	public String mypage() {
		return "/user/mypage/myPage_order";
	}
	@RequestMapping(value = "/mypage/mypage2")//장바구니
	public String mypage2() {
		return "/user/mypage/myPage_shoppingbasket";
	}
	@RequestMapping(value = "/mypage/mypage3")//문의
	public String mypage3() {
		return "/user/mypage/myPage_Ask";
	}	
	@RequestMapping(value = "/mypage/mypage4") //좋아요목록
	public String mypage4() {
		return "/user/mypage/myPage_Creatorlike";
	}	
	@RequestMapping(value = "/mypage/mypage5") //좋아요목록
	public String mypage5() {
		return "/user/mypage/myPage_Classlike2";
	}	
	@RequestMapping(value = "/mypage/mypage6") //나의게시물
	public String mypage6() {
		return "/user/mypage/myPage_post";
	}	
	
	@RequestMapping("/mypage/Myinformation")
	public ModelAndView Myinformation(HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		String member_id = (String)ses.getAttribute("userId"); 
		mav.addObject("vo", userMyPageService.MemberInfo(member_id));
		mav.setViewName("user/mypage/myPage_MyInformation");
		return mav;
	}
	
	@RequestMapping(value ="/mypage/MyinformationEdit",method = RequestMethod.POST )
	public ModelAndView MyinformationEdit(RegisterVO vo,HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		String member_id = (String)ses.getAttribute("userId"); 
		vo.setMember_id(member_id );
		int cnt = userMyPageService.MemberInfoEdit(vo);
		mav.setViewName("redirect:Myinformation");
		return mav;
	}
	
	@RequestMapping(value="mypage/accountCheck", method = RequestMethod.POST)
	@ResponseBody
	public String pwordCheck(RegisterVO vo, String pwd, HttpSession ses)throws Exception {
		String idch= (String)ses.getAttribute("userId");
		vo.setMember_id(idch);
		vo.setMember_pw(hashing.setEncryption(pwd,(String)ses.getAttribute("userId")));
		userMyPageService.pwdCheck(vo);
		String cnt =vo.getAdditional_information_one();
		return cnt;
	}
	
	
	@RequestMapping(value="mypage/pwordChain", method = RequestMethod.POST)
	@ResponseBody
	public int passwordChange(RegisterVO vo, String pwd, HttpSession ses)throws Exception {
		String userId= (String)ses.getAttribute("userId");
		vo.setMember_id(userId);
		vo.setMember_pw(hashing.setEncryption(pwd,userId));
		int cnt = userMyPageService.passwordChange(vo);
		return cnt;
	}
	
	//HomeAskReplyList999 홈페이지문의 에이젝스로불러오기
	@RequestMapping("/HomeAskReplyList999")
	@ResponseBody
	public List<UserHomeQnAVO> ajaxHomeAskList2(String logid){			
		List<UserHomeQnAVO> list = userMyPageService.myPageHomePageAsk(logid);	
		
			for(int i=0; i<list.size(); i++) {//답변이있으면 답변내용 저장해줌 -> replyContent
				UserHomeQnAVO vo = list.get(i);				
				int replycheck = vo.getReplycount();//1이면 미답변 2이면 답변달림				
				String replyContent =String.valueOf(userMyPageService.myPageHpmePageAskReply(vo.getUser_qna_no()));
				if(replycheck==2) {
					vo.setReplyContent(replyContent);
				}				
			}		
		return list;
	}
	//클래스문의
	@RequestMapping("/ClassAskReplyList999")
	@ResponseBody
	public List<UserClassDetailVO2> ajaxClassAskList2(String logid){

		List<UserClassDetailVO2> list = userMyPageService.myPageClassAskAll(logid); //회원이 문의한 클래스문의글정보 다 가져옴
	
		//가져온문의글번호를 댓글테이블에 넣어서 댓글이있는지 여부확인 -> 있으면 댓글정보가져와서 저장
		for(int i=0; i<list.size(); i++) {
			UserClassDetailVO2 vo2 = list.get(i); // ->꺼내온한줄
	
			int replyChek = userMyPageService.classAskRepltCheck(vo2.getClass_qna_no());//문의번호를 댓글테이블에 넣어서 문의번호에 대한 댓글들이 있는지 확인
				if(replyChek==0) {
					vo2.setReplycheck(0);//댓글없음
				}else {					
					UserClassDetailVO2 vo3 = userMyPageService.Replycreatorinfo(vo2.getClass_qna_no());					
					vo2.setReplycheck(1);//댓글있음
					vo2.setCreator_img(vo3.getMember_img()); //강사이미지
					//System.out.println(vo2.creator_img);
					vo2.setCreator_nick(vo3.getNick());//강사닉네임
					//System.out.println(vo2.creator_nick);
					vo2.setCreator_reply(vo3.getClassqnacom_reply());//댓글내용
					//System.out.println(vo2.creator_reply);
					vo2.setClassqnacom_writedate(vo3.getClassqnacom_writedate());//댓글작성일
					vo2.setClass_qna_com_no(vo3.getClass_qna_com_no());//댓글번호
					//System.out.println(vo2.getClass_qna_com_no());
					//vo2.setClassqnacom_member_id(vo3.getClassqnacom_member_id());//댓글작성자				
					}
		}	
		return list;
	}
	//강사좋아요목록
	@RequestMapping("/LikedListCrea")
	@ResponseBody
	public List<UserClassDetailVO> ajaxLikedCreatorList(String logid){	
		List<UserClassDetailVO> list = userMyPageService.Likedcreator(logid);//좋아요번호,강사아이디,강사닉네임,강사프사	
		for(int i=0; i<list.size(); i++) {
			UserClassDetailVO vo = list.get(i);			
			//강사좋아요수 셋팅
			int creatorlikecount = userMyPageService.LikedcreatorCount(vo.getCreator_id());
			vo.setCreatorlikecount(creatorlikecount);		
			//강사 개설강의수 셋팅
			int creatorclasscount = userMyPageService.OpenClassCount(vo.getCreator_id());
			vo.setCreatorclasscount(creatorclasscount);
		
		}
		return list;
	}
	//강사좋아요취소
	@RequestMapping("/cancelLikedListCrea")
	@ResponseBody
	public int ajaxCancelCreatorLike(int no) {	
		int result= userMyPageService.CancelLikeCreator(no);		
		return result;
	}
	//클래스좋아요목록	
	@RequestMapping("/LikedListClass")
	@ResponseBody
	public List<UserClassDetailVO> ajaxLikedClassList(String logid){	
		//String getCreatorNick 클래스번호넣어서 강사닉네임
		List<UserClassDetailVO> list = userMyPageService.Likedclass(logid);
		for(int i=0; i<list.size(); i++) {
			UserClassDetailVO vo = list.get(i);
			String creatorNick = userMyPageService.getCreatorNick(vo.getClass_no());//클래스번호가지고 강사명구함
			vo.setCreator_nick2(creatorNick);
		}
		
		return list;
	}
	//클래스좋아요취소
	@RequestMapping("/cancelLikedListClass")
	@ResponseBody
	public int ajaxCancelClassLike(int no) {	
		System.out.println(no);
		int result= userMyPageService.CancelLikeClass(no);
		System.out.println(result);
		return result;
	}
	
	
	//장바구니목록 ajax
	@RequestMapping("/ShoppingBasket")
	@ResponseBody
	public List<UserClassDetailVO> ajaxgetBasketList(String logid){
	
		List<UserClassDetailVO> list = userMyPageService.BaskList(logid);//1차 : 장바구니테이블에서 아이디에해당하는정보담아옹ㄴ다 
		for(int i=0; i<list.size(); i++) {
			UserClassDetailVO vo = list.get(i);
			String creatorNick = userMyPageService.getCreatorNick(vo.getClass_no());//클래스번호가지고 강사명구함
			vo.setCreator_nick2(creatorNick);//구한강사명을 넣어줌
			System.out.println(creatorNick);
		}
		return list;
	}
	//장바구니상품갯수
	@RequestMapping("/BasketCount")
	@ResponseBody
	public int ajaxgetBasketCoung(String logid) {
		int basketCount = userMyPageService. getBasketNum(logid);
		return basketCount;
	}
	
	//마이페이지 주문조회
	//주문내역
	@RequestMapping("/UserOrderListFin")
	@ResponseBody
	public List<UserMyPageOrderVO> ajaxOrderListFin(String logid){		
		List<UserMyPageOrderVO> list = userMyPageService.orderFinList(logid);		
		return list;
	}
	//수강완료내역
	@RequestMapping("/UserOrderListFin2")
	@ResponseBody
	public List<UserMyPageOrderVO> ajaxOrderListFin2(String logid){				
		List<UserMyPageOrderVO> list = userMyPageService.orderFinList2(logid);	
	
		for(int i=0; i<list.size(); i++) {
			UserMyPageOrderVO vo = list.get(i);				
			vo.setReviewChk(userMyPageService.userMyPageReviewCheck(vo.getOrder_no()));
			
		}
		return list;
	}
	//취소,환불내역
	@RequestMapping("/UserOrderListFin3")
	@ResponseBody
	public List<UserMyPageOrderVO> ajaxOrderListFin3(String logid){		
		
		List<UserMyPageOrderVO> list = userMyPageService.orderFinList3(logid);	
		
		for(int i=0; i<list.size(); i++) {
			UserMyPageOrderVO vo = list.get(i);	
			String a = vo.getRefund_date();
			if(a==null) {//환불날짜없음 -> 취소신청만
				vo.setRefund_date("1");				
			}
		}
		return list;
	}
	@RequestMapping("/UserOrderCancleSub")
	@ResponseBody
	public int ajaxUserOrderCancleSub(int no) {
		int result = userMyPageService.userOrderCancleSub(no);
		System.out.println(result);
		return result;
	}
	//홈페이지문의글 삭제
	@RequestMapping("/UserMyHQnADel")
	@ResponseBody
	public int ajaxUserMyHQnADel(int no) {
		int result =0;
		int a =  userMyPageService.UserMypageCheckFrep(no);//답글있으면 2 답글없으면1
		if(a==1) {
			result = userMyPageService.UserMyPageHQnADel(no);
		}else {
			result = userMyPageService. UserMyPageHQnADel2(no);
		}
		return result;
		
	}
	//홈페이지문의글수정	
	@RequestMapping("/UserMyHQnAEdit")
	@ResponseBody
	public int ajaxUserMyHQnAEdi(UserHomeQnAVO vo) {
		int result =0;
		result =userMyPageService.UserMyPageHQnAEdi	(vo);
		return result;
	}
	
	
}
