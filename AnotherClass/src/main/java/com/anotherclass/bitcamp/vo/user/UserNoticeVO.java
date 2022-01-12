package com.anotherclass.bitcamp.vo.user;

public class UserNoticeVO {
	public int notice_no;
	public String title;
	public String content;
	public String member_id;
	public String writedate;
	public int view_grade;
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public int getView_grade() {
		return view_grade;
	}
	public void setView_grade(int view_grade) {
		this.view_grade = view_grade;
	}
	
	
}
