package com.anotherclass.bitcamp.service.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anotherclass.bitcamp.dao.admin.MemberMangementDAO;
import com.anotherclass.bitcamp.dao.register.RegisterDAO;
import com.anotherclass.bitcamp.register.RegisterVO;
import com.anotherclass.bitcamp.service.vo.admin.MemberMangementVO;

@Service
public class AdminServiceImp implements AdminService {
	
	@Inject
	RegisterDAO registerDao;
	
	@Inject
	MemberMangementDAO memberMangementDao;
	
	@Override
	public String adminAccountCreate(RegisterVO vo) {
		return registerDao.adminAccountCreate(vo);
	}

	@Override
	public List<MemberMangementVO> MemberList(MemberMangementVO vo){
		return memberMangementDao.MemberList(vo);
	}
	
	@Override
	public int boardLimit() {
		return memberMangementDao.boardLimit();
	}
	
	@Override
	public  MemberMangementVO MemberAccountInfo(String idCheck) {
		return memberMangementDao.MemberAccountInfo(idCheck);
	}
	
	@Override
	public List<MemberMangementVO> creatorList(MemberMangementVO vo) {
		return memberMangementDao.creatorList(vo);
	}
	
	@Override
	public MemberMangementVO creatorAccountInfo(String idCheck) {
		return memberMangementDao.creatorAccountInfo(idCheck);
	}
	
	@Override
	public int creatorBoardLimit() {
		return memberMangementDao.creatorBoardLimit();
	}
	
	@Override
	public int deleteAccount(MemberMangementVO vo) {
		return memberMangementDao.deleteAccount(vo);
	}
}
