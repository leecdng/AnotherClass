package com.anotherclass.bitcamp.service.vo.admin;

public class AdminHomeQnAVO {
	private int user_qna_no; //회원문의번호
	private String member_id; //아이디 - 작성자
	private String title;
	private String content;
	private String file1;
	private String file2;
	private String file3;
	private String writedate;
	private int board_no1; //원글번호 -> 답글이 아닐경우 회원문의번호
	private int board_no2; //원글이면:0 답글이면 :1
	private int com_sec; //공개글:0 비공개 :1
	private int delete_sort; //삭제여부 -> 기본 :0 삭제:1
	private int view_grade;
	
	private int replycount; //user_qna_no -> boardno1갯수 : 답변이 달리면 boardno1(원글번호)의 번호가 같은 데이터갯수가 늘어난다
	private String replystatus; //답변여부 - 미답변, 답변완료
	
	private String replyContent; //답글내용저장
	
	private int boardNumber;

	public int getUser_qna_no() {
		return user_qna_no;
	}

	public void setUser_qna_no(int user_qna_no) {
		this.user_qna_no = user_qna_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
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

	public String getFile1() {
		return file1;
	}

	public void setFile1(String file1) {
		this.file1 = file1;
	}

	public String getFile2() {
		return file2;
	}

	public void setFile2(String file2) {
		this.file2 = file2;
	}

	public String getFile3() {
		return file3;
	}

	public void setFile3(String file3) {
		this.file3 = file3;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public int getBoard_no1() {
		return board_no1;
	}

	public void setBoard_no1(int board_no1) {
		this.board_no1 = board_no1;
	}

	public int getBoard_no2() {
		return board_no2;
	}

	public void setBoard_no2(int board_no2) {
		this.board_no2 = board_no2;
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

	public int getView_grade() {
		return view_grade;
	}

	public void setView_grade(int view_grade) {
		this.view_grade = view_grade;
	}

	public int getReplycount() {
		return replycount;
	}

	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}

	public String getReplystatus() {
		return replystatus;
	}

	public void setReplystatus(String replystatus) {
		this.replystatus = replystatus;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public int getBoardNumber() {
		return boardNumber;
	}

	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}
	
	
	
}
