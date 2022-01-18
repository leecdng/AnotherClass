package com.anotherclass.bitcamp.vo.admin;

public class AdminCalcuVO {
	private String member_id; // 강사 아이디
	private String end_date; // 클래스 옵션 종료일
	
	// 정산 관련 추가
	private String calcu_dday; // 정산 예정일
	private String calcu_date=""; // 정산일시 (정산완료일)
	private int calcu_price; // 정산 금액 합계 (결제금액 합계-수수료 합계)
	private int sum_price; // 결제 금액 합계
	private int sum_charge; // 수수료 합계
	// 페이징
	private int onePageRecord=10; // 한 페이지당 글 수
	private int totalRecord; // 총 글 수
	private int totalPage; // 총 페이지 수
	private int nowPage=1; // 현재 페이지
	private int oneGroupPage=5; // 한 번에 보일 페이지 수
	private int groupStartPage=1; // 한 페이지 그룹의 첫 페이지
	private int nowPageRecord; // 현재 페이지의 레코드 수 // 마지막 때 달라짐
	
	// 검색어, 검색 날짜
	private String searchWord; // 검색어
	private String dateSearchFirst; // 시작 날짜
	private String dateSearchLast; // 마지막 날짜

	
	
	public String getCalcu_dday() {
		return calcu_dday;
	}
	public void setCalcu_dday(String calcu_dday) {
		this.calcu_dday = calcu_dday;
	}
	public String getCalcu_date() {
		return calcu_date;
	}
	public void setCalcu_date(String calcu_date) {
		this.calcu_date = calcu_date;
	}
	public int getCalcu_price() {
		return calcu_price;
	}
	public void setCalcu_price(int calcu_price) {
		this.calcu_price = calcu_price;
	}
	public int getSum_price() {
		return sum_price;
	}
	public void setSum_price(int sum_price) {
		this.sum_price = sum_price;
	}
	public int getSum_charge() {
		return sum_charge;
	}
	public void setSum_charge(int sum_charge) {
		this.sum_charge = sum_charge;
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
		if(this.totalPage==0) {
			this.totalPage=1;
		}
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

	public int getNowPageRecord() {
		return nowPageRecord;
	}
	public void setNowPageRecord(int nowPageRecord) {
		this.nowPageRecord = nowPageRecord;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
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
	public String getDateSearchLast() {
		return dateSearchLast;
	}
	public void setDateSearchLast(String dateSearchLast) {
		this.dateSearchLast = dateSearchLast;
	}
	
	
}
