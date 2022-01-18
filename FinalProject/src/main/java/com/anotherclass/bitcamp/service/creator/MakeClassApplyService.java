package com.anotherclass.bitcamp.service.creator;

import java.util.List;

import com.anotherclass.bitcamp.vo.creator.CreatorClassCategoryVO;
import com.anotherclass.bitcamp.vo.creator.CreatorMakeClassDateTimeVO;
import com.anotherclass.bitcamp.vo.creator.CreatorMakeClassVO;
import com.anotherclass.bitcamp.vo.user.ClassListVO;

public interface MakeClassApplyService {
	public int makeClassApply(CreatorMakeClassVO vo);
	//public List<CreatorMakeClassVO> modifyClass();
	public List<CreatorClassCategoryVO> makeClassCategoryL();
	public List<CreatorClassCategoryVO> makeClassCategoryS(int no);
	public int makeClassApplyDateTime(CreatorMakeClassDateTimeVO vo);
	public ClassListVO  creatorChannel(ClassListVO vo);
	public int modifyClass(CreatorMakeClassVO vo);
	public CreatorMakeClassVO modifyClassInfo(CreatorMakeClassVO vo);
	public int putCreatorProfile(CreatorMakeClassVO vo);
	public int modifyClassOk(CreatorMakeClassVO vo);
	public List<CreatorMakeClassDateTimeVO> putDate(CreatorMakeClassDateTimeVO vo);
	public int deleteClass(CreatorMakeClassVO vo);
}
