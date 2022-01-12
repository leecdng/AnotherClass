package com.anotherclass.bitcamp.vo.user;

public class ClassVO {
	private int class_no;
	private String class_name;
	private String class_info;
	private int class_price;	
	private String member_id;	
	private String class_thumb;
	private String class_content;
	private String class_img_file;
	private String class_post_no;
	private String class_addr1;
	private String class_addr2;
	private int max_headcount;
	private int category_no;
	private int request;
	private int progress;
	private String class_writedate;
	private String class_tag;
	
	// 클래스 목록 추가 변수
	private String nick; // 강사 닉네임
	private int like_cnt; // 좋아요 수
	private double star_avg; // 별점 평균
	private String cateL_name=""; // 대분류 카테고리명
	private String category_name=""; // 중분류 카테고리명
	
	private String keyword=""; // 검색어
	private String local=""; // 지역 검색
	
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
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public int getLike_cnt() {
		return like_cnt;
	}
	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}
	public double getStar_avg() {
		return star_avg;
	}
	public void setStar_avg(double star_avg) {
		this.star_avg = star_avg;
	}
	public String getCateL_name() {
		return cateL_name;
	}
	public void setCateL_name(String cateL_name) {
		this.cateL_name = cateL_name;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}

}
