package com.anotherclass.bitcamp.dao.creator;

import java.util.List;

import com.anotherclass.bitcamp.vo.creator.CreatorFaqVO;
import com.anotherclass.bitcamp.vo.creator.CreatorNoticeVO;

public interface CreatorHelperDAO {
	public List<CreatorNoticeVO> creatorNoticeAllRecord();
	public List<CreatorFaqVO> creatorFaqAllRecord();
}
