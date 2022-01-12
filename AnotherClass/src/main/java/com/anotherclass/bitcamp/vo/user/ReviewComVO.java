package com.anotherclass.bitcamp.vo.user;

public class ReviewComVO {
	private int review_com_no; // 강의후기댓글번호
	private int review_no; // 강의후기번호
	private String member_id; // 댓쓴 아이디
	private int com_no1; // 원댓글번호
	private int com_no2; // 대댓글번호
	private String reply; // 댓글내용
	private String writedate; // 등록일시
	private int com_sec=0; // 비밀여부
	private int delete_sort=0; // 삭제여부
	
	private int cnt;
	
	
	public int getReview_com_no() {
		return review_com_no;
	}
	public void setReview_com_no(int review_com_no) {
		this.review_com_no = review_com_no;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getCom_no1() {
		return com_no1;
	}
	public void setCom_no1(int com_no1) {
		this.com_no1 = com_no1;
	}
	public int getCom_no2() {
		return com_no2;
	}
	public void setCom_no2(int com_no2) {
		this.com_no2 = com_no2;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public int getCom_sec() {
		return com_sec;
	}
	public void setCom_sec(int com_sec) {
		this.com_sec = com_sec;
	}
	public int getDelete_sort() {
		return delete_sort;
	}
	public void setDelete_sort(int delete_sort) {
		this.delete_sort = delete_sort;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
}
