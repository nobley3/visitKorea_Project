package com.acorn.tour.user;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor // 기본생성자
@AllArgsConstructor // 매개변수 있는 생성자
public class UserDTO {

	
	String userid;
	String nickname;
	String sort;
	String pw;
	String section;
	String profileurl;
	
	// 회원가입, 수정
	public UserDTO(String userid, String nickname, String pw) {
		super();
		this.userid = userid;
		this.nickname = nickname;
		this.pw = pw;
	}
	

	public UserDTO(String userid, String nickname, String sort, String pw, String section) {
		super();
		this.userid = userid;
		this.nickname = nickname;
		this.sort = sort;
		this.pw = pw;
		this.section = section;
	}





	
	
}