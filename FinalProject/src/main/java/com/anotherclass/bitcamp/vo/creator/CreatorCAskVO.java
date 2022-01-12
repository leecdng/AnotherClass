package com.anotherclass.bitcamp.vo.creator;

public class CreatorCAskVO {
	/*클래스테이블*/
	private String class_name;
	private int category_no;
	
	
	/*멤버테이블*/
	private String member_pw;
	private String member_name;
	private String member_tel;
	private String member_email;
	private String post_no;
	private String addr1;
	private String addr2;
	private String nick;
	private String member_img;
	private String sns_type;
	private String signupdate;
	private String out_date;	
	
	/*클래스문의테이블*/
	private int class_qna_no;
	private int class_no;
	private String classqna_member_id; //작성자 임 로그인한 아이디  x
	private String classqna_content;
	private String classqna_writedate;
	private int classqna_com_sec;
	
	/*클래스문의댓글테이블*/
	private  int class_qna_com_no;
									//클래스문의번호
	private String classqnacom_member_id;
	private int com_no1;
	private int com_no2;
	private String classqnacom_reply;
	private String classqnacom_writedate;
	private int classqnacom_com_sec;
	private int classqnacom_delete_sort;
	
	/*문의글에대해 댓글이 달렸는지 알려줌 0:댓글없은 1:댓글있음*/
	private int replycheck;
	
	/*list size*/
	public int listSize;
	
	/*댓글정보따로담기...*/
	public String creator_img;//강사 - 멤버이미지
	public String creator_nick;//강사닉네임 - 멤버닉
	public String creator_reply;//댓글내용
	public String creator_writedate;//댓글작성자
	
	
	/*카테고리테이블*/
	private String category_name;

	/*댓글유뮤*/

	
	public String getClass_name() {
		return class_name;
	}


	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}


	public int getCategory_no() {
		return category_no;
	}


	public void setCategory_no(int category_no) {
		this.category_no = category_no;
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


	public int getClass_qna_no() {
		return class_qna_no;
	}


	public void setClass_qna_no(int class_qna_no) {
		this.class_qna_no = class_qna_no;
	}


	public int getClass_no() {
		return class_no;
	}


	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}


	public String getClassqna_member_id() {
		return classqna_member_id;
	}


	public void setClassqna_member_id(String classqna_member_id) {
		this.classqna_member_id = classqna_member_id;
	}


	public String getClassqna_content() {
		return classqna_content;
	}


	public void setClassqna_content(String classqna_content) {
		this.classqna_content = classqna_content;
	}


	public String getClassqna_writedate() {
		return classqna_writedate;
	}


	public void setClassqna_writedate(String classqna_writedate) {
		this.classqna_writedate = classqna_writedate;
	}


	public int getClassqna_com_sec() {
		return classqna_com_sec;
	}


	public void setClassqna_com_sec(int classqna_com_sec) {
		this.classqna_com_sec = classqna_com_sec;
	}


	public int getClass_qna_com_no() {
		return class_qna_com_no;
	}


	public void setClass_qna_com_no(int class_qna_com_no) {
		this.class_qna_com_no = class_qna_com_no;
	}


	public String getClassqnacom_member_id() {
		return classqnacom_member_id;
	}


	public void setClassqnacom_member_id(String classqnacom_member_id) {
		this.classqnacom_member_id = classqnacom_member_id;
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


	public String getClassqnacom_reply() {
		return classqnacom_reply;
	}


	public void setClassqnacom_reply(String classqnacom_reply) {
		this.classqnacom_reply = classqnacom_reply;
	}


	public String getClassqnacom_writedate() {
		return classqnacom_writedate;
	}


	public void setClassqnacom_writedate(String classqnacom_writedate) {
		this.classqnacom_writedate = classqnacom_writedate;
	}


	public int getClassqnacom_com_sec() {
		return classqnacom_com_sec;
	}


	public void setClassqnacom_com_sec(int classqnacom_com_sec) {
		this.classqnacom_com_sec = classqnacom_com_sec;
	}


	public int getClassqnacom_delete_sort() {
		return classqnacom_delete_sort;
	}


	public void setClassqnacom_delete_sort(int classqnacom_delete_sort) {
		this.classqnacom_delete_sort = classqnacom_delete_sort;
	}


	public int getReplycheck() {
		return replycheck;
	}


	public void setReplycheck(int replycheck) {
		this.replycheck = replycheck;
	}


	public int getListSize() {
		return listSize;
	}


	public void setListSize(int listSize) {
		this.listSize = listSize;
	}


	public String getCreator_img() {
		return creator_img;
	}


	public void setCreator_img(String creator_img) {
		this.creator_img = creator_img;
	}


	public String getCreator_nick() {
		return creator_nick;
	}


	public void setCreator_nick(String creator_nick) {
		this.creator_nick = creator_nick;
	}


	public String getCreator_reply() {
		return creator_reply;
	}


	public void setCreator_reply(String creator_reply) {
		this.creator_reply = creator_reply;
	}


	public String getCreator_writedate() {
		return creator_writedate;
	}


	public void setCreator_writedate(String creator_writedate) {
		this.creator_writedate = creator_writedate;
	}


	public String getCategory_name() {
		return category_name;
	}


	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	
	
	
	
	
	
	
	
}
