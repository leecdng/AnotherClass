package com.anotherclass.bitcamp.service.user;

import java.util.List;

import com.anotherclass.bitcamp.vo.user.ClassVO;
import com.anotherclass.bitcamp.vo.user.ReviewComVO;
import com.anotherclass.bitcamp.vo.user.ReviewVO;

public interface UserReviewService {
	
	public ClassVO selectReviewClass(int order_no, String member_id); // 해당 주문 클래스 정보 조회
	public int insertReview(ReviewVO vo); // 후기 등록
	public ReviewVO countTotalMyReview(String member_id); // 나의 후기 총 레코드 수
	public List<ReviewVO> selectMyReview(ReviewVO vo); // 나의 후기 조회
	public ReviewVO countTotalClassReview(int class_no); // 클래스 후기 총 레코드 수
	public List<ReviewVO> selectClassReview(ReviewVO vo); // 클래스 후기 조회
	
	public List<ClassVO> selectCreatorClass(String member_id); // 해당 강사의 클래스 목록 조회
	
	public int insertReviewComment(ReviewComVO vo); // 후기 댓글 등록
	public List<ReviewComVO> selectReviewComment(ReviewComVO vo); // 후기 댓글 조회
	public int countReplyCheck(int review_com_no); // 대댓글 수 조회 (대댓글 있는지 체크)
	public int deleteReviewComment(ReviewComVO vo); // 후기 댓글 삭제
	public int updateDelReviewComment(ReviewComVO vo); // 대댓글 있는 후기 댓글 삭제 처리 - 삭제여부 1 변경
}
