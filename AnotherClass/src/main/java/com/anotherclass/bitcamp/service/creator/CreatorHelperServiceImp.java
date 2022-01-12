package com.anotherclass.bitcamp.service.creator;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anotherclass.bitcamp.dao.creator.CreatorHelperDAO;

import com.anotherclass.bitcamp.vo.creator.CreatorFaqVO;
import com.anotherclass.bitcamp.vo.creator.CreatorNoticeVO;

@Service
public class CreatorHelperServiceImp implements CreatorHelperService{
	
	@Inject 
	CreatorHelperDAO chDAO;

	@Override
	public List<CreatorNoticeVO> creatorNoticeAllRecord() {
		
		return chDAO.creatorNoticeAllRecord();
	}

	@Override
	public List<CreatorFaqVO> creatorFaqAllRecord() {
		return chDAO.creatorFaqAllRecord();
	}
}