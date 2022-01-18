package com.anotherclass.bitcamp.vo.creator;

public class CreatorChannelVO {
	private String nick;
	private String member_name;
	private String member_id;
	
	public CreatorChannelVO() {
		
	}
	public CreatorChannelVO(String id) {
		this.member_id = id;
	}
	
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
}
