package com.anotherclass.bitcamp.vo.user;

import java.util.List;

public class UserPayVO {
	
	/*여러개의 클래스옵션번호를 담을 변수*/	
	private int[] classNoPayList;

	/*클래스옵션가지고 장바구니디비에 추가*/	
	private int[] classinsertBasket;
	
	/*주문자정보*/
	private String member_id;
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
	
	/*포인트 잇는 테이블 usertbl*/
	//idㄴ
	private int point;
	
	
	/*클래스정보*/
	private int class_no;
	private String class_name;
	private String class_info;
	private int class_price;	
	//강사아이디..흠...멤버테이블 컬럼명이랑 겹쳐서 지움
	private String class_thumb;
	private String class_content;
	private String class_img_file;
	private String class_post_no;
	private String class_addr1;
	private String class_addr2;
	private int max_headcount;	//클래스 최대인원
	private int request;
	private int progress;
	private String class_writedate;
	private String class_tag;
	
	/*클래스옵션정보*/
	private int class_option_no;
	private String start_date;
	private String end_date;
	private int all_headcount; //수강신청인원
	private int cancel;
	private String cancel_reason;
	
	/* 예약(주문/결제)테이블 */
	private int order_no;
	//주문한 사람 id
	private int headcount; // 예약인원-수량
	private int use_point;
	private int total_price;
	private int pay_company;//결제회사명
	private int payment_sort; //결제방식
	private String card_num;
	private String account; //환불계좌
	private String order_date;//주문일시
	private String payment_date;//결제
	private String cancel_date;//취소
	private String refund_date;//환불
	private String calcu_date;//정산
	private int charge;//수수료?
	private String merchant;//결제번호 ->  /*결제후 뱉어주는 정보 담을 부분*/
	
	/*총결제금액담을부분*/
	private int totalPrice;
	/*적립포인트*/
	private int savePoint;
	private int totalSavePoint;
	
	/*결제후 뱉어주는 정보 담을 부분*/

	
	
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
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
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
	public int getClass_option_no() {
		return class_option_no;
	}
	public void setClass_option_no(int class_option_no) {
		this.class_option_no = class_option_no;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public int getAll_headcount() {
		return all_headcount;
	}
	public void setAll_headcount(int all_headcount) {
		this.all_headcount = all_headcount;
	}
	public int getCancel() {
		return cancel;
	}
	public void setCancel(int cancel) {
		this.cancel = cancel;
	}
	public String getCancel_reason() {
		return cancel_reason;
	}
	public void setCancel_reason(String cancel_reason) {
		this.cancel_reason = cancel_reason;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getHeadcount() {
		return headcount;
	}
	public void setHeadcount(int headcount) {
		this.headcount = headcount;
	}
	public int getUse_point() {
		return use_point;
	}
	public void setUse_point(int use_point) {
		this.use_point = use_point;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public int getPay_company() {
		return pay_company;
	}
	public void setPay_company(int pay_company) {
		this.pay_company = pay_company;
	}
	public int getPayment_sort() {
		return payment_sort;
	}
	public void setPayment_sort(int payment_sort) {
		this.payment_sort = payment_sort;
	}
	public String getCard_num() {
		return card_num;
	}
	public void setCard_num(String card_num) {
		this.card_num = card_num;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}
	public String getCancel_date() {
		return cancel_date;
	}
	public void setCancel_date(String cancel_date) {
		this.cancel_date = cancel_date;
	}
	public String getRefund_date() {
		return refund_date;
	}
	public void setRefund_date(String refund_date) {
		this.refund_date = refund_date;
	}
	public String getCalcu_date() {
		return calcu_date;
	}
	public void setCalcu_date(String calcu_date) {
		this.calcu_date = calcu_date;
	}
	public int getCharge() {
		return charge;
	}
	public void setCharge(int charge) {
		this.charge = charge;
	}
	public String getMerchant() {
		return merchant;
	}
	public void setMerchant(String merchant) {
		this.merchant = merchant;
	}
	public int[] getClassNoPayList() {
		return classNoPayList;
	}
	public void setClassNoPayList(int[] classNoPayList) {
		this.classNoPayList = classNoPayList;
	}
	public int[] getClassinsertBasket() {
		return classinsertBasket;
	}
	public void setClassinsertBasket(int[] classinsertBasket) {
		this.classinsertBasket = classinsertBasket;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getSavePoint() {
		return savePoint;
	}
	public void setSavePoint(int savePoint) {
		this.savePoint = savePoint;
	}
	public int getTotalSavePoint() {
		return totalSavePoint;
	}
	public void setTotalSavePoint(int totalSavePoint) {
		this.totalSavePoint = totalSavePoint;
	}	
	
	
	
	
	
}
