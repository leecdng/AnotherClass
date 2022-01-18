package com.anotherclass.bitcamp.service.admin;

import java.util.List;

import com.anotherclass.bitcamp.service.vo.admin.ExpectedRefundListMangementVO;

public interface AdminRefundService {
	public List<ExpectedRefundListMangementVO> refundList(ExpectedRefundListMangementVO vo);
	public int refundDelete(int no);
	public int boardLimit();
	public int addHeadCount(int no);
}
