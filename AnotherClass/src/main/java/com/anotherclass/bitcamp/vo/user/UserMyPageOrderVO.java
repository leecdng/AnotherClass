package com.anotherclass.bitcamp.vo.user;

public class UserMyPageOrderVO {
	//ordertbl
	private int order_no;
	private String member_id;
	private int class_option_no;
	private int headcount;
	private int use_point;
	private int total_price;
	private int payment_sort;
	private String pay_company;
	private String card_num;
	private String order_date;
	private String order_date2;
	private String payment_date;
	private String cancel_date;
	private String cancel_date2;
	private String refund_date;
	private String refund_date2;
	private String merchant;
	
	
	//classoption 
	private int class_no;
	private String start_date;
	private String end_date;
	
	//classtbl
	private String class_name;
	private String class_thumb;
	private int class_price;
	
	private int reviewChk;//후기유무
	
	public int getClass_price() {
		return class_price;
	}
	public void setClass_price(int class_price) {
		this.class_price = class_price;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
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
	public int getPayment_sort() {
		return payment_sort;
	}
	public void setPayment_sort(int payment_sort) {
		this.payment_sort = payment_sort;
	}
	public String getPay_company() {
		return pay_company;
	}
	public void setPay_company(String pay_company) {
		this.pay_company = pay_company;
	}
	public String getCard_num() {
		return card_num;
	}
	public void setCard_num(String card_num) {
		this.card_num = card_num;
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
	public String getMerchant() {
		return merchant;
	}
	public void setMerchant(String merchant) {
		this.merchant = merchant;
	}
	public int getClass_no() {
		return class_no;
	}
	public void setClass_no(int class_no) {
		this.class_no = class_no;
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
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getClass_thumb() {
		return class_thumb;
	}
	public void setClass_thumb(String class_thumb) {
		this.class_thumb = class_thumb;
	}
	public String getOrder_date2() {
		return order_date2;
	}
	public void setOrder_date2(String order_date2) {
		this.order_date2 = order_date2;
	}
	public String getCancel_date2() {
		return cancel_date2;
	}
	public void setCancel_date2(String cancel_date2) {
		this.cancel_date2 = cancel_date2;
	}
	public String getRefund_date2() {
		return refund_date2;
	}
	public void setRefund_date2(String refund_date2) {
		this.refund_date2 = refund_date2;
	}
	public int getReviewChk() {
		return reviewChk;
	}
	public void setReviewChk(int reviewChk) {
		this.reviewChk = reviewChk;
	}
		
	
}
