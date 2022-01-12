package com.anotherclass.bitcamp.service.user;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anotherclass.bitcamp.dao.user.UserReviewDAO;
import com.anotherclass.bitcamp.vo.user.ClassVO;
import com.anotherclass.bitcamp.vo.user.ReviewComVO;
import com.anotherclass.bitcamp.vo.user.ReviewVO;

@Service
public class UserReviewServiceImp implements UserReviewService {
	@Inject
	UserReviewDAO userReviewDAO;

	@Override
	public int insertReview(ReviewVO vo) { // 후기 등록
		return userReviewDAO.insertReview(vo);
	}

	@Override
	public ClassVO selectReviewClass(int order_no, String member_id) {
		return userReviewDAO.selectReviewClass(order_no, member_id);
	}

	@Override
	public List<ReviewVO> selectMyReview(ReviewVO vo) {
		return userReviewDAO.selectMyReview(vo);
	}

	@Override
	public ReviewVO countTotalMyReview(String member_id) {
		return userReviewDAO.countTotalMyReview(member_id);
	}

	@Override
	public ReviewVO countTotalClassReview(int class_no) {
		return userReviewDAO.countTotalClassReview(class_no);
	}

	@Override
	public List<ReviewVO> selectClassReview(ReviewVO vo) {
		return userReviewDAO.selectClassReview(vo);
	}

	@Override
	public int insertReviewComment(ReviewComVO vo) {
		return userReviewDAO.insertReviewComment(vo);
	}

	@Override
	public List<ReviewComVO> selectReviewComment(ReviewComVO vo) {
		return userReviewDAO.selectReviewComment(vo);
	}

	@Override
	public int deleteReviewComment(ReviewComVO vo) {
		return userReviewDAO.deleteReviewComment(vo);
	}

	@Override
	public int countReplyCheck(int review_com_no) {
		return userReviewDAO.countReplyCheck(review_com_no);
	}

	@Override
	public int updateDelReviewComment(ReviewComVO vo) {
		return userReviewDAO.updateDelReviewComment(vo);
	}

	@Override
	public List<ClassVO> selectCreatorClass(String member_id) {
		return userReviewDAO.selectCreatorClass(member_id);
	}
	
}
