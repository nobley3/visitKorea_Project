package com.acorn.tour.touradmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminController {

	@Autowired
	AdminService service;
	
//	관리자 메인페이지
	@GetMapping("/admin.do")
	public String tourAdmin() {
		return "adminIndex";
	}
	
//	관리자 등록페이지
	@GetMapping("/admin.regi")
	public String adminPage() {
		return "RegiAdmin";
	}
	
//	관리자등록
 
	@ResponseBody
	@PostMapping(value ="/insertAdmin")
	public String insertAdmin(User user) {
		//System.out.println( "userf.f,f,f,f," + user);
		String result = service.insertAdmin(user);
		return result; 
	}
	
//	아이디 중복확인
	@ResponseBody
	@PostMapping(value="/checkId")
	public String checkId(@RequestParam String userid) {
		boolean isExistId = service.checkId(userid);
		if(isExistId) {
			return "1";
		}else {
			return "0";
		}
	}


	
}
