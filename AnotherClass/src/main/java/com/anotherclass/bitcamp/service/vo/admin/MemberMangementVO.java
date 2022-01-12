package com.anotherclass.bitcamp.service.vo.admin;

public class MemberMangementVO {

	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_tel;
	private String member_email;
	private String post_no;
	private String addr1;
	private String addr2;
	private String nick;
	private String member_img; // 프로필 이미지
	private String sns_type="";
	private String signupdate;
	private String out_date;
	
	private String searchWord;
	private String dateSearchFirst;
	private String dateSearchLast;
	private int pageNumber;
	
	private int pageStartNumber;
	private int pageEndNumber;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_tel() {
		return member_tel;
	}
	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getPost_no() {
		return post_no;
	}
	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getMember_img() {
		return member_img;
	}
	public void setMember_img(String member_img) {
		this.member_img = member_img;
	}
	public String getSns_type() {
		return sns_type;
	}
	public void setSns_type(String sns_type) {
		this.sns_type = sns_type;
	}
	public String getSignupdate() {
		return signupdate;
	}
	public void setSignupdate(String signupdate) {
		this.signupdate = signupdate;
	}
	public String getOut_date() {
		return out_date;
	}
	public void setOut_date(String out_date) {
		this.out_date = out_date;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public String getDateSearchFirst() {
		return dateSearchFirst;
	}
	public void setDateSearchFirst(String dateSearchFirst) {
		this.dateSearchFirst = dateSearchFirst;
	}
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public int getPageStartNumber() {
		return pageStartNumber;
	}
	public void setPageStartNumber(int pageStartNumber) {
		this.pageStartNumber = pageStartNumber;
	}
	public int getPageEndNumber() {
		return pageEndNumber;
	}
	public void setPageEndNumber(int pageEndNumber) {
		this.pageEndNumber = pageEndNumber;
	}
	public String getDateSearchLast() {
		return dateSearchLast;
	}
	public void setDateSearchLast(String dateSearchLast) {
		this.dateSearchLast = dateSearchLast;
	}
	
	
}
