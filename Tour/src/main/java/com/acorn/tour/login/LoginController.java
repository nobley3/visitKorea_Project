package com.acorn.tour.login;


import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.tour.user.UserDTO;

@Controller
public class LoginController {
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	HttpSession session;
	

    @RequestMapping("/loginform")
    public String loginForm() {
        return "login";
    }
    
    @ResponseBody
    @PostMapping("/login")
    public String login(@RequestParam(required=false) String id, String pw) {
    	
    	// 1:성공 0:실패
    	String data = "0";
    	boolean result = loginService.isValidUser(id, pw);
    	UserDTO user = loginService.getUser(id);
        if(result) {
        	data="1"; 
        	session.setAttribute("userId", id);
        	session.setAttribute("user", user);
        } 
        return data;
    }
    
    @PostMapping("/login/kakao")
    public String kakaologin(String user_kakao, String nickname, String profile_image) {
    	
    	// 데이터베이스    
    	// 테이블에 user_kakao (이메일로 등록된 것이 있는지 확인 !!!)
    	boolean result = loginService.isMember(user_kakao);
    	UserDTO user = loginService.getUser(user_kakao);
    	
    	session.setAttribute("userId", user_kakao);
    	session.setAttribute("user", user);
    	if(result) {  // result  == true 
    		loginService.registerKakao(user_kakao, nickname, profile_image);
    	}
    	
    	return "home";
    }
    
    @RequestMapping("/logout")
    public String logout(HttpSession session) throws IOException {
    	session.invalidate();
    	// 리다이렉트로 home맵핑으로 가는 것
    	return "redirect:/home";
    }
    
    

}