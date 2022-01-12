package com.anotherclass.bitcamp.service.user;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.anotherclass.bitcamp.dao.user.ClassDetailPageDAO;
import com.anotherclass.bitcamp.vo.user.ClassVO;
import com.anotherclass.bitcamp.vo.user.UserClassDetailVO;
import com.anotherclass.bitcamp.vo.user.UserClassDetailVO2;
@Service
public class ClassDetailPageServiceImp implements ClassDetailPageService {

	@Inject
	ClassDetailPageDAO classDetailPageDAO;
	
	@Override
	public List<ClassVO> temporarylistAllSelect() {//지울것		
		return classDetailPageDAO.temporarylistAllSelect();
	}
	@Override
	public UserClassDetailVO userClassDetailAllSelect(int no) {		
		return classDetailPageDAO.userClassDetailAllSelect(no);
	}
	@Override
	public List<UserClassDetailVO> userSelectOptionAllSelect(String datedate, int no) {		 
		return classDetailPageDAO.userSelectOptionAllSelect(datedate,no);
	}
	@Override
	public UserClassDetailVO classLikeCount(int no) {		
		return classDetailPageDAO.classLikeCount(no);
	}
	@Override
	public int classLikeCheck(int no, String logid) {	
		return classDetailPageDAO.classLikeCheck(no,logid);
	}
	@Override
	public int classLikeInsert(int no, String logid) {		
		return classDetailPageDAO.classLikeInsert(no,logid);
	}
	@Override
	public int classLikeDelete(int no, String logid) {		
		return classDetailPageDAO.classLikeDelete(no,logid);
	}
	@Override
	public List<UserClassDetailVO2> userClassDetailAskAllSelect(int no) {		
		return classDetailPageDAO.userClassDetailAskAllSelect(no);
	}
	@Override
	public int AskReplyCheck(int no) {		
		return classDetailPageDAO.AskReplyCheck(no);
	}
	@Override
	public List<UserClassDetailVO2> userClassDetailAskReplySelect(int no) {		
		return classDetailPageDAO.userClassDetailAskReplySelect(no);
	}
	@Override
	public int classAskWritee(UserClassDetailVO2 askVo) {		
		return classDetailPageDAO.classAskWritee(askVo);
	}
//	@Override
//	public int insertBasket(int no, String logid) {
//		
//		return classDetailPageDAO.insertBasket(no,logid);
//	}
	@Override
	public int ClassAskDDel(int no) {		
		return classDetailPageDAO.ClassAskDDel(no);
	}
	@Override
	public int ClassASkCheckRep(int no) {	
		return classDetailPageDAO.ClassASkCheckRep(no);
	}
	@Override
	public int ClassASkCheckRepDelUp(int no) {		
		return classDetailPageDAO.ClassASkCheckRepDelUp(no);
	}
	@Override
	public int ClassAskReplyEdit(UserClassDetailVO2 vo) {
		return classDetailPageDAO.ClassAskReplyEdit(vo);
	}
	@Override
	public int LikedcreatorCount(String logid) {		
		return classDetailPageDAO.LikedcreatorCount(logid);
	}
	@Override
	public int OpenClassCount(String logid) {		
		return classDetailPageDAO.OpenClassCount(logid);
	}
	


	
	

}
