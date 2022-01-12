package com.anotherclass.bitcamp.service.creator;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anotherclass.bitcamp.dao.creator.CreatorClassAskDAO;
import com.anotherclass.bitcamp.vo.creator.ClassListVO;
import com.anotherclass.bitcamp.vo.creator.CreatorCAskPagingVO;
import com.anotherclass.bitcamp.vo.creator.CreatorCAskVO;

@Service
public class CreatorClassAskServiceImp implements CreatorClassAskService {
	@Inject
	CreatorClassAskDAO creatorClassAskdao;


	@Override
	public int totalRecordCount(CreatorCAskPagingVO pVo) {		
		return creatorClassAskdao.totalRecordCount(pVo);
	}
	
	@Override
	public List<CreatorCAskVO> boardPageSelect(CreatorCAskPagingVO pVo) {		
		return creatorClassAskdao.boardPageSelect(pVo);
	}

	@Override
	public int CAReplyCheck(int no) {
		// TODO Auto-generated method stub
		return creatorClassAskdao.CAReplyCheck(no);
	}

	@Override
	public CreatorCAskVO CAContent(int no) {
		// TODO Auto-generated method stub
		return creatorClassAskdao.CAContent(no);
	}

	@Override
	public CreatorCAskVO CAReplyContent(int no) {
		// TODO Auto-generated method stub
		return creatorClassAskdao.CAReplyContent(no);
	}

	@Override
	public int CAReplyWrite(CreatorCAskVO vo) {
		// TODO Auto-generated method stub
		return creatorClassAskdao.CAReplyWrite(vo);
	}

	@Override
	public int CAReplyEdit(CreatorCAskVO vo) {
		// TODO Auto-generated method stub
		return creatorClassAskdao.CAReplyEdit(vo);
	}

	@Override
	public int CAReplyDel(int no) {
		// TODO Auto-generated method stub
		return creatorClassAskdao.CAReplyDel(no);
	}

	@Override
	public List<ClassListVO> classlist2(String logid) {
		// TODO Auto-generated method stub
		return creatorClassAskdao.classlist2(logid);
	}

	@Override
	public int ClasslikeCC(int no) {
		// TODO Auto-generated method stub
		return creatorClassAskdao.ClasslikeCC(no);
	}

	@Override
	public int ClassAskCC(int no) {
		// TODO Auto-generated method stub
		return creatorClassAskdao.ClassAskCC(no);
	}


	
}
