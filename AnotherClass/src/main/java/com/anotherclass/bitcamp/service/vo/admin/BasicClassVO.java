package com.anotherclass.bitcamp.service.vo.admin;

public class BasicClassVO {
	private int class_no;
	private String category_name;
	private String class_name;
	private String member_name;
	private String class_writedate;
	private String max_headcount;
	private String all_headcount;
	private int request;
	private int progress;

	
	public int getRequest() {
		return request;
	}
	public void setRequest(int request) {
		this.request = request;
	}
	public int getProgress() {
		return progress;
	}
	public void setProgress(int progress) {
		this.progress = progress;
	}
	public String getAll_headcount() {
		return all_headcount;
	}
	public void setAll_headcount(String all_headcount) {
		this.all_headcount = all_headcount;
	}
	public String getMax_headcount() {
		return max_headcount;
	}
	public void setMax_headcount(String max_headcount) {
		this.max_headcount = max_headcount;
	}
	public int getClass_no() {
		return class_no;
	}
	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getClass_writedate() {
		return class_writedate;
	}
	public void setClass_writedate(String class_writedate) {
		this.class_writedate = class_writedate;
	}
	
	
	
}
