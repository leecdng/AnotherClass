package com.anotherclass.bitcamp.vo.user;

public class BasketVO {

	private int basket_no;
	private String member_id;
	private int class_option_no;
	private int headcount;
	
	private int[] option_seting;
	private int[] classoptiono; //결제페이지에서 보내는 클래스옵션번호배열...
	
	
	public int getBasket_no() {
		return basket_no;
	}
	public void setBasket_no(int basket_no) {
		this.basket_no = basket_no;
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
	
	
	public int[] getOption_seting() {
		return option_seting;
	}
	public void setOption_seting(int[] option_seting) {
		this.option_seting = option_seting;
	}
	public int[] getClassoptiono() {
		return classoptiono;
	}
	public void setClassoptiono(int[] classoptiono) {
		this.classoptiono = classoptiono;
	}
	
	
	
	
}
