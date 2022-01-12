package com.anotherclass.bitcamp.service.user;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anotherclass.bitcamp.dao.user.UserMyPageDAO;
import com.anotherclass.bitcamp.register.RegisterVO;
import com.anotherclass.bitcamp.vo.user.UserClassDetailVO;
import com.anotherclass.bitcamp.vo.user.UserClassDetailVO2;
import com.anotherclass.bitcamp.vo.user.UserHomeQnAVO;
import com.anotherclass.bitcamp.vo.user.UserMyPageOrderVO;

@Service
public class UserMyPageServiceImp implements UserMyPageService {
	@Inject
	UserMyPageDAO userMyPageDAO;

	@Override
	public List<UserHomeQnAVO> myPageHomePageAsk(String logid) {		
		return userMyPageDAO.myPageHomePageAsk(logid);
	}

	@Override
	public String myPageHpmePageAskReply(int no) {
		return userMyPageDAO.myPageHpmePageAskReply(no);
	}

	@Override
	public List<UserClassDetailVO2> myPageClassAskAll(String logid) {
		return userMyPageDAO.myPageClassAskAll(logid);
	}

	@Override
	public int classAskRepltCheck(int no) {
		return userMyPageDAO.classAskRepltCheck(no);
	}

	@Override
	public UserClassDetailVO2 Replycreatorinfo(int no) {		
		return userMyPageDAO.Replycreatorinfo(no);
	}

	@Override
	public List<UserClassDetailVO> Likedcreator(String logid) {
		return userMyPageDAO.Likedcreator(logid);
	}

	@Override
	public int LikedcreatorCount(String logid) {		
		return userMyPageDAO.LikedcreatorCount(logid);
	}

	@Override
	public int OpenClassCount(String logid) {		
		return userMyPageDAO.OpenClassCount(logid);
	}

	@Override
	public int CancelLikeCreator(int no) {
	return  userMyPageDAO.CancelLikeCreator(no);
	}

	@Override
	public List<UserClassDetailVO> BaskList(String logid) {		
		return userMyPageDAO. BaskList(logid);
	}

	@Override
	public String getCreatorNick(int no) {		
		return userMyPageDAO.getCreatorNick(no);
	}

	@Override
	public int getBasketNum(String logid) {		
		return userMyPageDAO.getBasketNum(logid);
	}
	
	@Override
	public RegisterVO MemberInfo(String logid) {
		return userMyPageDAO.MemberInfo(logid);
	}
	
	@Override
	public int MemberInfoEdit(RegisterVO vo) {
		return userMyPageDAO.MemberInfoEdit(vo);
	}
	
	@Override
	public List<UserMyPageOrderVO> orderFinList(String logid) {		
		return userMyPageDAO.orderFinList(logid);
	}

	@Override
	public List<UserMyPageOrderVO> orderFinList2(String logid) {
		return userMyPageDAO.orderFinList2(logid);
	}

	@Override
	public List<UserMyPageOrderVO> orderFinList3(String logid) {
		return userMyPageDAO.orderFinList3(logid);
	}

	@Override
	public int userOrderCancleSub(int no) {
		return  userMyPageDAO.userOrderCancleSub(no) ;
	}

	@Override
	public int UserMyPageHQnADel(int no) {
		return userMyPageDAO.UserMyPageHQnADel(no);
	}

	@Override
	public int UserMyPageHQnAEdi(UserHomeQnAVO vo) {
		return userMyPageDAO.UserMyPageHQnAEdi(vo);
	}

	@Override
	public int UserMypageCheckFrep(int no) {		
		return userMyPageDAO.UserMypageCheckFrep(no);
	}

	@Override
	public int UserMyPageHQnADel2(int no) {		
		return userMyPageDAO.UserMyPageHQnADel2(no);
	}

	@Override
	public int userMyPageReviewCheck(int no) {	
		return userMyPageDAO.userMyPageReviewCheck(no);
	}
	
	@Override
	public String pwdCheck(RegisterVO vo) {
		return userMyPageDAO.pwdCheck(vo);
	}
	
	@Override
	public int passwordChange(RegisterVO vo) {
		return userMyPageDAO.passwordChange(vo);
	}
	@Override
	public List<UserClassDetailVO> Likedclass(String logid) {
		return userMyPageDAO.Likedclass(logid);
	}

	@Override
	public int CancelLikeClass(int no) {	
		return  userMyPageDAO.CancelLikeClass(no);
	}
}
