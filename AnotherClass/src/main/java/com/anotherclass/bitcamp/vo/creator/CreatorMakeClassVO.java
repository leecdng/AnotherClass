package com.anotherclass.bitcamp.vo.creator;

import java.util.List;

public class CreatorMakeClassVO {
	private int class_no; //클래스번호
	private String class_name; //클래스명
	private String class_info; //클래스간단소개
	private int class_price; // 금액
	private String member_id; // 아이디
	private String class_thumb; //클래스썸네일
	private String class_content; //클래스 소개
	private String class_img_file; //이미지파일이름
	private String class_post_no; //우편번호
	private String class_addr1; // 도로명주소
	private String class_addr2; //상세주소
	private int max_headcount; //최대인원
	private int category_no; //카테고리번호
	private int request; // 신청산태
	private int progress; //진행상태
	private String class_writedate; //등록일시
	private String class_tag; //태그
	private String creator_content;
	private String creator_content_img;
	
	
	public String getCreator_content_img() {
		return creator_content_img;
	}
	public void setCreator_content_img(String creator_content_img) {
		this.creator_content_img = creator_content_img;
	}
	public String getCreator_content() {
		return creator_content;
	}
	public void setCreator_content(String creator_content) {
		this.creator_content = creator_content;
	}
	public int getClass_no() {
		return class_no;
	}
	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getClass_info() {
		return class_info;
	}
	public void setClass_info(String class_info) {
		this.class_info = class_info;
	}
	public int getClass_price() {
		return class_price;
	}
	public void setClass_price(int class_price) {
		this.class_price = class_price;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getClass_thumb() {
		return class_thumb;
	}
	public void setClass_thumb(String class_thumb) {
		this.class_thumb = class_thumb;
	}
	public String getClass_content() {
		return class_content;
	}
	public void setClass_content(String class_content) {
		this.class_content = class_content;
	}
	public String getClass_img_file() {
		return class_img_file;
	}
	public void setClass_img_file(String class_img_file) {
		this.class_img_file = class_img_file;
	}
	public String getClass_post_no() {
		return class_post_no;
	}
	public void setClass_post_no(String class_post_no) {
		this.class_post_no = class_post_no;
	}
	public String getClass_addr1() {
		return class_addr1;
	}
	public void setClass_addr1(String class_addr1) {
		this.class_addr1 = class_addr1;
	}
	public String getClass_addr2() {
		return class_addr2;
	}
	public void setClass_addr2(String class_addr2) {
		this.class_addr2 = class_addr2;
	}
	public int getMax_headcount() {
		return max_headcount;
	}
	public void setMax_headcount(int max_headcount) {
		this.max_headcount = max_headcount;
	}
	public int getCategory_no() {
		return category_no;
	}
	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}
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
	public String getClass_writedate() {
		return class_writedate;
	}
	public void setClass_writedate(String class_writedate) {
		this.class_writedate = class_writedate;
	}
	public String getClass_tag() {
		return class_tag;
	}
	public void setClass_tag(String class_tag) {
		this.class_tag = class_tag;
	}
	
	
}
