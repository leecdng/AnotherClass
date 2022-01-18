package com.anotherclass.bitcamp.register;

public class RegisterVO {
	
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
	
	private int type_user;
	private String additional_information_one; // 추가 정보  --  프로시저 용도
	private String additional_information_two; // 추가 정보 2 -- 프로시저 용도
	private String additional_information_the; // 추가 정보 3 -- 프로시저 용도
	private String logType; // 로그인 타입 - 회원:1 / 강사:2
	
	private int like_cnt; // 강사의 좋아요 수
	private String creator_id; // 좋아요 받은 강사 아이디
	
	private String searchWord;
	private String dateSearch;
	
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
	public int getType_user() {
		return type_user;
	}
	public void setType_user(int type_user) {
		this.type_user = type_user;
	}
	public String getAdditional_information_one() {
		return additional_information_one;
	}
	public void setAdditional_information_one(String additional_information_one) {
		this.additional_information_one = additional_information_one;
	}
	public String getAdditional_information_two() {
		return additional_information_two;
	}
	public void setAdditional_information_two(String additional_information_two) {
		this.additional_information_two = additional_information_two;
	}
	public String getAdditional_information_the() {
		return additional_information_the;
	}
	public void setAdditional_information_the(String additional_information_the) {
		this.additional_information_the = additional_information_the;
	}
	public String getLogType() {
		return logType;
	}
	public void setLogType(String logType) {
		this.logType = logType;
	}
	public int getLike_cnt() {
		return like_cnt;
	}
	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}
	public String getCreator_id() {
		return creator_id;
	}
	public void setCreator_id(String creator_id) {
		this.creator_id = creator_id;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public String getDateSearch() {
		return dateSearch;
	}
	public void setDateSearch(String dateSearch) {
		this.dateSearch = dateSearch;
	}
	
	
}
