package com.anotherclass.bitcamp.service.creator;

import java.util.List;

import com.anotherclass.bitcamp.vo.creator.CreatorFaqVO;
import com.anotherclass.bitcamp.vo.creator.CreatorNoticeVO;

public interface CreatorHelperService {
	public List<CreatorNoticeVO> creatorNoticeAllRecord();
	public List<CreatorFaqVO> creatorFaqAllRecord();
}
