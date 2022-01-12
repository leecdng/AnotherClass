package com.anotherclass.bitcamp.dumy;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anotherclass.bitcamp.dao.user.DumyDAO;

@Service
public class DumyServiceImp implements DumyService{

	@Inject
	DumyDAO dumyDao;
	
	@Override
	public List<String> classNumberList() {
		return dumyDao.classNumberList();
	}
	
	@Override
	public int classOptionSeting(String no){
		return dumyDao.classOptionSeting(no);
	}
	
	@Override
	public List<String> optionNumber() {
		return dumyDao.optionNumber();
	}
	
	@Override
	public int classOrdelSeting(ClassOptionDumyVO vo) {
		return dumyDao.classOrdelSeting(vo);
	}
	
	@Override
	public List<String> memberIdList() {
		return dumyDao.memberIdList();
	}
	
	@Override
	public int optionCountUpdate(HeadCountVO vo) {
		return dumyDao.optionCountUpdate(vo);
	}
	
	@Override
	public int classLikeInsert(ClassLikeDumyVO vo) {
		return dumyDao.classLikeInsert(vo);
	}
	
	@Override
	public String LikeList(ClassLikeDumyVO vo) {
		return dumyDao.LikeList(vo);
	}
}
