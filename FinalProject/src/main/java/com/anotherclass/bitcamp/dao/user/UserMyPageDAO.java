package com.anotherclass.bitcamp.dao.user;

import java.util.List;

import com.anotherclass.bitcamp.register.RegisterVO;
import com.anotherclass.bitcamp.vo.user.UserClassDetailVO;
import com.anotherclass.bitcamp.vo.user.UserClassDetailVO2;
import com.anotherclass.bitcamp.vo.user.UserHomeQnAVO;
import com.anotherclass.bitcamp.vo.user.UserMyPageOrderVO;

public interface UserMyPageDAO {
	public List<UserHomeQnAVO> myPageHomePageAsk(String logid);
	public String myPageHpmePageAskReply(int no);
	public List<UserClassDetailVO2> myPageClassAskAll(String logid);
	public int classAskRepltCheck(int no);
	public UserClassDetailVO2 Replycreatorinfo(int no);
	
	public List<UserClassDetailVO> Likedcreator(String logid);
	public int LikedcreatorCount(String logid);
	public int OpenClassCount(String logid);
	public int CancelLikeCreator(int no);
	
	public List<UserClassDetailVO> BaskList(String logid);
	public int getBasketNum(String logid);
	public String getCreatorNick(int no);
	
	public RegisterVO MemberInfo(String logid);
	public int MemberInfoEdit(RegisterVO vo);
	
	public List<UserMyPageOrderVO> orderFinList(String logid); 
	public List<UserMyPageOrderVO> orderFinList2(String logid); 
	public List<UserMyPageOrderVO> orderFinList3(String logid); 
	public int userOrderCancleSub(int no);
	public int UserMypageCheckFrep(int no);
	public int UserMyPageHQnADel(int no);
	public int UserMyPageHQnADel2(int no);
	public int UserMyPageHQnAEdi(UserHomeQnAVO vo);
	
	public int userMyPageReviewCheck(int no);//후기작성유무
	public String pwdCheck(RegisterVO vo);
	public int passwordChange(RegisterVO vo);
	
	public  List<UserClassDetailVO> Likedclass(String logid);
	public int CancelLikeClass(int no);
	
}
