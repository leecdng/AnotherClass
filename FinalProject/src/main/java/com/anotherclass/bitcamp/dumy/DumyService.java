package com.anotherclass.bitcamp.dumy;

import java.util.List;


public interface DumyService {
	
	public List<String> classNumberList();
	public int classOptionSeting(String no);
	public List<String> optionNumber();
	public int classOrdelSeting(ClassOptionDumyVO vo);
	public List<String> memberIdList();
	public int optionCountUpdate(HeadCountVO vo);
	public int classLikeInsert(ClassLikeDumyVO vo);
	public String LikeList(ClassLikeDumyVO vo);
}
