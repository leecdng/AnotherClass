package com.anotherclass.bitcamp.vo.user;

public class ReviewVO {
	private int review_no;
	private int order_no;
	private String content;
	private String img1="";
	private String img2;
	private String img3;
	private int star;
	private String writedate;
	
	private String member_id;
	private int class_option_no;
	
	private int class_no;
	private String class_name;
	private String member_img;
	
	// 페이징
	private int onePageRecord=5; // 한 페이지당 글 수
	private int totalRecord; // 총 글 수
	private int totalPage; // 총 페이지 수
	private int nowPage=1; // 현재 페이지
	private int oneGroupPage=5; // 한 번에 보일 페이지 수
	private int groupStartPage=1; // 한 페이지 그룹의 첫 페이지
	private int nowPageRecord; // 현재 페이지의 레코드 수 // 마지막 때 달라짐
	
	
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public String getImg3() {
		return img3;
	}
	public void setImg3(String img3) {
		this.img3 = img3;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getClass_option_no() {
		return class_option_no;
	}
	public void setClass_option_no(int class_option_no) {
		this.class_option_no = class_option_no;
	}
	public int getClass_no() {
		return class_no;
	}
	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}
	public String getMember_img() {
		return member_img;
	}
	public void setMember_img(String member_img) {
		this.member_img = member_img;
	}
	
	
	public int getOnePageRecord() {
		return onePageRecord;
	}
	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		// 총 페이지 수
		this.totalPage = totalRecord / onePageRecord;
		if(totalRecord % onePageRecord != 0) { totalPage += 1; }
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		
		if(nowPage > 0) { groupStartPage = (nowPage-1) / oneGroupPage * oneGroupPage + 1; }
	}
	public int getOneGroupPage() {
		return oneGroupPage;
	}
	public void setOneGroupPage(int oneGroupPage) {
		this.oneGroupPage = oneGroupPage;
	}
	public int getGroupStartPage() {
		return groupStartPage;
	}
	public void setGroupStartPage(int groupStartPage) {
		this.groupStartPage = groupStartPage;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public int getNowPageRecord() {
		return nowPageRecord;
	}
	public void setNowPageRecord(int nowPageRecord) {
		this.nowPageRecord = nowPageRecord;
	}


}
