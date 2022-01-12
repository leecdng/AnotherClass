package com.anotherclass.bitcamp.dao.creator;

import java.util.List;

import com.anotherclass.bitcamp.vo.creator.ClassListVO;
import com.anotherclass.bitcamp.vo.creator.CreatorCAskPagingVO;
import com.anotherclass.bitcamp.vo.creator.CreatorCAskVO;

public interface CreatorClassAskDAO {
	 public int totalRecordCount(CreatorCAskPagingVO pVo); //총레코드수
	 public List<CreatorCAskVO> boardPageSelect(CreatorCAskPagingVO pVo);//해당페이지레코드선택

	 public int CAReplyCheck(int no);//게시글에댓글달렸는지 여부 - 클래스문의글번호넣어서
	 
	 public CreatorCAskVO CAContent(int no);//클래스문의글 보기
	
	 //댓글
	 public CreatorCAskVO CAReplyContent(int no);//클래스문의글에대한 댓글보기
	
	 public int CAReplyWrite(CreatorCAskVO vo);//댓글쓰기
	 public int CAReplyEdit(CreatorCAskVO vo);//댓글수정
	 public int CAReplyDel(int no);//댓글삭제
	 
	 ///////////////클래스리스트	 
	 public List<ClassListVO> classlist2(String logid);   //클래스번호,클래스명,클래스이미지
	 public int ClasslikeCC(int no);//좋아요
	 public int ClassAskCC(int no);//문의수
}
