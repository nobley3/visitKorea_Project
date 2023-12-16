package com.acorn.tour.touradmin;

import java.util.regex.Pattern;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AdminRepository {

	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.acorn.TourAdminMapper.";
	
//	회원가입
	 
	public int insertAdmin(User user) throws Exception{
		System.out.println("User :" + user);
		return session.insert(namespace+"insertAdmin", user);
	}
	
//	아이디중복
	
	public boolean checkId(String userid) {
		Integer count = session.selectOne(namespace+"checkId",userid);
		return count !=null && count>0;
	}

//	아이디 유효성
	public boolean validationid(String userid) {
		String idreg =  "^(?=.*[a-zA-Z])(?=.*\\d)[a-zA-Z\\d]{4,12}$";
		return Pattern.matches(idreg, userid);
	}
	
//	비밀번호 유효성
	public boolean validationpw(String pw) {
		String pwreg =  "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}$";
		return Pattern.matches(pwreg, pw);
	}
	
}
