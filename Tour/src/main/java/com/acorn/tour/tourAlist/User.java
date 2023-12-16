package com.acorn.tour.tourAlist;

import lombok.Data;

@Data
public class User {

	String userid;
	String nickname; //관리자는 본인명
	String pw;
	
	public User(String userid, String nickname, String pw) {
		super();
		this.userid = userid;
		this.nickname = nickname;
		this.pw = pw;
	}
	
	public User() {
		// TODO Auto-generated constructor stub
	}
}
