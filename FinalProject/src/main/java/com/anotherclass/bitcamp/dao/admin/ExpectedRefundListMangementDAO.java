package com.anotherclass.bitcamp.dao.admin;

import java.util.List;

import com.anotherclass.bitcamp.service.vo.admin.ExpectedRefundListMangementVO;

public interface ExpectedRefundListMangementDAO {
	
	public List<ExpectedRefundListMangementVO> refundList(ExpectedRefundListMangementVO vo);
	public int refundDelete(int no);
	public int boardLimit();
	public int addHeadCount(int no);
}
