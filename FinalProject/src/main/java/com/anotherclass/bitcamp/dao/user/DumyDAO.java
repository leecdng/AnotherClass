package com.anotherclass.bitcamp.dao.user;

import java.util.List;

import com.anotherclass.bitcamp.dumy.ClassLikeDumyVO;
import com.anotherclass.bitcamp.dumy.ClassOptionDumyVO;
import com.anotherclass.bitcamp.dumy.HeadCountVO;


public interface DumyDAO {
	
	public List<String> classNumberList();
	public int classOptionSeting(String no);
	public List<String> optionNumber();
	public int classOrdelSeting(ClassOptionDumyVO vo);
	public List<String> memberIdList();
	public int optionCountUpdate(HeadCountVO vo);
	public int classLikeInsert(ClassLikeDumyVO vo);
	public String LikeList(ClassLikeDumyVO vo);
}
