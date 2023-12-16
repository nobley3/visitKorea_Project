package com.acorn.tour.touradmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {

	@Autowired
	AdminRepository dao;
	
//	회원가입

	public String insertAdmin(User user){
		try {
			dao.insertAdmin(user);
			return "회원가입이 완료되었습니다.";
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "회원가입에 실패했습니다.";
		}
	}
	

//	아이디 중복확인
	public boolean checkId(String userid) {
		return dao.checkId(userid);
	}

//	아이디 유효성
	public boolean validationid(String userid) {
		return dao.validationid(userid);
	}

//	비밀번호 유효성
	public boolean validationpw(String pw) {
		return dao.validationpw(pw);
	}
}
