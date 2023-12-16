package com.acorn.tour.login;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.tour.user.UserDTO;

@Service
public class LoginService {

	@Autowired
	LoginRepository rep;
	
	 public boolean isValidUser(String userid, String pw) {

		 boolean result = rep.isValid(userid, pw);
		 return result;
    }
	 
	public UserDTO getUser(String id) {
		UserDTO user = rep.user(id);
		return user;
	}
	
	public int registerKakao(String user_kakao, String nickname, String profile_image) {
		int result = rep.register(user_kakao, nickname, profile_image);
	    return result;
	 }
	 
	 
	public boolean isMember(String user_kakao) {		 
		boolean result = rep.isMember(user_kakao);
		return result;
	}
	 
	 
	 
}