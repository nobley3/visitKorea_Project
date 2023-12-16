package com.acorn.tour.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class UserService {
	
	@Autowired
	UserRepository rep;
	
	// 회원가입
	public String regiUser(UserDTO user) {
		try {
			if(checkId(user.getUserid())) {
				return "사용중인 아이디 입니다 다시 입력하세요.";
			}else if(!validationid(user.getUserid())) {
				return "아이디는 영문 대소문자와 숫자를 포함하여 4~12자리로 입력해야합니다!";
			}else if(checkNickname(user.getNickname())) {
				return "사용중인 닉네임 입니다 다시 입력하세요.";
			}else if(!validationPw(user.getPw())) {
				return "비밀번호는 영문대소문자/숫자/특수문자를 포함하여 8~16자리로 입력해야합니다!";
			}else {
				rep.regiUser(user);
				return "회원가입이 완료되었습니다.";
			}
		}catch (Exception e) {
			e.printStackTrace();
			return "회원가입에 실패했습니다.";
		}
	}
	
	//	아이디 중복
	public boolean checkId(String userid) {
		return rep.checkId(userid);
	}
	
	//	아이디 유효성
	public boolean validationid(String userid) {
		return rep.validationid(userid);
	}
	
	//	닉네임 중복
	public boolean checkNickname(String nickname) {
		return rep.checkNickname(nickname);
	}
	
	//	비밀번호 유효성
	public boolean validationPw(String pw) {
		return rep.validationPw(pw);
	}
	
	// 회원 수정
	//1명조회
	public UserDTO selectOne(String userid) {
		return rep.selectOne(userid);
	}
	
	//수정
	public void updateUser(String userid, String nickname, String pw) {
		// 기존 정보를 가져옴
		UserDTO mineUser = rep.selectOne(userid);
		
		nickname = (nickname == null || nickname.isEmpty()) ? mineUser.getNickname() : nickname;
		pw = (pw == null || pw.isEmpty()) ? mineUser.getPw() : pw;
		
		UserDTO updateUser = new UserDTO(userid,nickname,pw);
		// 데이터베이스 업데이트
		rep.updateUser(updateUser);
		//return updateUser;
		
	}
	//닉네임 중복
	public boolean updatecheckNickname(String nickname) {
		return rep.updatecheckNickname(nickname);
	}
	
	
	
	
	// 회원 탈퇴
	public void getUserWithdrawal(String userId) {
		rep.userWithdrawal(userId);
	}
}
