package com.anotherclass.bitcamp.vo.creator;


public class CreatorClassCategoryVO {
	private int category_no; //카테고리번호
	private String category_name; //분류명
	private int category1_no; //대분류번호
	private int category_sort; //분류구분
	
	public CreatorClassCategoryVO() {
		
	}
	public CreatorClassCategoryVO(int no) {
		this.category1_no = no;
	}
	
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public int getCategory_no() {
		return category_no;
	}
	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}
	public int getCategory1_no() {
		return category1_no;
	}
	public void setCategory1_no(int category1_no) {
		this.category1_no = category1_no;
	}
	public int getCategory_sort() {
		return category_sort;
	}
	public void setCategory_sort(int category_sort) {
		this.category_sort = category_sort;
	}
	
	
}
