package com.anotherclass.bitcamp.service.creator;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anotherclass.bitcamp.dao.creator.MakeClassDAO;
import com.anotherclass.bitcamp.vo.creator.CreatorClassCategoryVO;
import com.anotherclass.bitcamp.vo.creator.CreatorMakeClassDateTimeVO;
import com.anotherclass.bitcamp.vo.creator.CreatorMakeClassVO;
import com.anotherclass.bitcamp.vo.user.ClassListVO;

@Service
public class MakeClassApplyServiceImp implements MakeClassApplyService {
	
	@Inject
	MakeClassDAO makeClassDao;
	@Override
	public int makeClassApply(CreatorMakeClassVO vo) {
		return makeClassDao.makeClassApply(vo);
	}
	@Override
	public List<CreatorClassCategoryVO> makeClassCategoryL() {
		return makeClassDao.makeClassCategoryL();
	}
	@Override
	public List<CreatorClassCategoryVO> makeClassCategoryS(int no) {
		return makeClassDao.makeClassCategoryS(no);
	}
	@Override
	public int makeClassApplyDateTime(CreatorMakeClassDateTimeVO vo) {
		return makeClassDao.makeClassApplyDateTime(vo);
	}
	@Override
	public ClassListVO  creatorChannel(ClassListVO vo) {
		return makeClassDao.creatorChannel(vo);
	}
	@Override
	public int modifyClass(CreatorMakeClassVO vo) {
		return makeClassDao.modifyClass(vo);
	}
	@Override
	public CreatorMakeClassVO modifyClassInfo(CreatorMakeClassVO vo) {
		return makeClassDao.modifyClassInfo(vo);
	}
	@Override
	public int putCreatorProfile(CreatorMakeClassVO vo) {
		return makeClassDao.putCreatorProfile(vo);
	}
	@Override
	public int modifyClassOk(CreatorMakeClassVO vo) {
		return makeClassDao.modifyClassOk(vo);
	}
	@Override
	public List<CreatorMakeClassDateTimeVO> putDate(CreatorMakeClassDateTimeVO vo) {
		return makeClassDao.putDate(vo);
	}
	@Override
	public int deleteClass(CreatorMakeClassVO vo) {
		return makeClassDao.deleteClass(vo);
	}
	

//	@Override
//	public List<CreatorMakeClassVO> modifyClass() {
//		return null;
//	}

}
