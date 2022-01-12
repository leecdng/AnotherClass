package com.anotherclass.bitcamp.vo.creator;

public class CreatorCalcuVO {
	// classTbl
	private String class_no;
	private int class_price=0;
	private String member_id; // 강사 아이디
	// classOption
	private String class_option_no;
	private String start_date="-"; // 강의 시작일 (예정 강의)
	private String end_date;
	private int all_headcount=0; // 최대 수강 가능 인원
	// orderTbl
	private int headcount=0; // 수강인원
	private int total_price=0;
	private String payment_date;
	private String calcu_date;
	private int charge=0;
	// 추가 - 예정 강의 (가장 가까운 예정 강의)
	private double rate=0.00; // 강의 수강 예약률
	// 추가 - 수강 관리
	private int new_headcount=0; // 신규 예약 인원
	private int exp_headcount=0; // 총 수강 예정 인원 (합계)
	// 추가 - 수익 관리
	private int month_total_price=0; // 이번 달 수익
	private int all_total_price=0; // 총 수익
	// 추가 - 정산 관리
	private int exp_calcu_price=0; // 정산 예정 금액
	private int total_calcu_price=0; // 총 정산 금액
	
	
	public String getClass_no() {
		return class_no;
	}
	public void setClass_no(String class_no) {
		this.class_no = class_no;
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
	public String getClass_option_no() {
		return class_option_no;
	}
	public void setClass_option_no(String class_option_no) {
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
	public int getHeadcount() {
		return headcount;
	}
	public void setHeadcount(int headcount) {
		this.headcount = headcount;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
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
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}

	public int getNew_headcount() {
		return new_headcount;
	}
	public void setNew_headcount(int new_headcount) {
		this.new_headcount = new_headcount;
	}
	public int getExp_headcount() {
		return exp_headcount;
	}
	public void setExp_headcount(int exp_headcount) {
		this.exp_headcount = exp_headcount;
	}
	public int getMonth_total_price() {
		return month_total_price;
	}
	public void setMonth_total_price(int month_total_price) {
		this.month_total_price = month_total_price;
	}
	public int getAll_total_price() {
		return all_total_price;
	}
	public void setAll_total_price(int all_total_price) {
		this.all_total_price = all_total_price;
	}
	public int getExp_calcu_price() {
		return exp_calcu_price;
	}
	public void setExp_calcu_price(int exp_calcu_price) {
		this.exp_calcu_price = exp_calcu_price;
	}
	public int getTotal_calcu_price() {
		return total_calcu_price;
	}
	public void setTotal_calcu_price(int total_calcu_price) {
		this.total_calcu_price = total_calcu_price;
	}

}
