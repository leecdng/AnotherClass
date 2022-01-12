package com.anotherclass.bitcamp.service.admin;

import java.util.List;

import com.anotherclass.bitcamp.service.vo.admin.AdminHomeQnAPagingVO;
import com.anotherclass.bitcamp.service.vo.admin.AdminHomeQnAVO;

public interface AdminHomeQnAService {
	 public int totalRecordCount(AdminHomeQnAPagingVO pVo); //총레코드수
	 public List<AdminHomeQnAVO> boardPageSelect(AdminHomeQnAPagingVO pVo);//해당페이지레코드선택
	 public AdminHomeQnAVO  adminHomeQnAView(int no);
	 public String adminHomeQnAView2(int no);
	 public AdminHomeQnAVO  adminHomeQnWrite(int no);//글쓰기페이지로이동
	 public int  adminHomeQnWrite2(AdminHomeQnAVO vo);//글등록
}
