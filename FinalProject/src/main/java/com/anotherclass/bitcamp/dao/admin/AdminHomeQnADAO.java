package com.anotherclass.bitcamp.dao.admin;

import java.util.List;

import com.anotherclass.bitcamp.service.vo.admin.AdminHomeQnAPagingVO;
import com.anotherclass.bitcamp.service.vo.admin.AdminHomeQnAVO;
import com.anotherclass.bitcamp.vo.user.UserHomeQnAVO;



public interface AdminHomeQnADAO {
	 public int totalRecordCount(AdminHomeQnAPagingVO pVo); //총레코드수
	 public List<AdminHomeQnAVO> boardPageSelect(AdminHomeQnAPagingVO pVo);//해당페이지레코드선택
	 public AdminHomeQnAVO  adminHomeQnAView(int no);//게시글보기
	 public String adminHomeQnAView2(int no);//답변보기
	 public AdminHomeQnAVO  adminHomeQnWrite(int no);//글쓰기페이지로이동
	 public int  adminHomeQnWrite2(AdminHomeQnAVO vo);//글등록
}
