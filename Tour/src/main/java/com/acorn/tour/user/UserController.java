package com.acorn.tour.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class UserController {

	@Autowired
	UserService us;
	
	@Autowired
	HttpSession session;
	
	// 회원가입 메인 페이지
	@GetMapping("/tourjoin_form")
	public String tourjoin() {
		return "tourjoin";
	}
	
	// 회원가입
	@ResponseBody
	@PostMapping(value = "/userregister" ,produces ="text/plain;charset=utf-8")
	public String register(UserDTO user) {
		String result = us.regiUser(user);
		return result;
	}
	
	//	아이디 중복
	@ResponseBody
	@PostMapping( value="/checkId" ,produces = "text/plain;charset=utf-8")
	public String checkId(@RequestParam String userid) {
		boolean isExistid = us.checkId(userid);
		if(isExistid) {
			return "사용중인 아이디 입니다.";
		}else {
			return "사용 가능한 아이디 입니다.";
		}
	}
	
	//	닉네임
	@ResponseBody
	@PostMapping(value="/checkNickname",produces = "text/plain;charset=utf-8")
	public String checkNickname(@RequestParam String nickname) {
		boolean isExistnickname = us.checkNickname(nickname);
		if(isExistnickname) {
			return "1"; //중복
		}else {
			return "0";
		}
	}
	
	
	// 회원수정
	// 로그인한 회원 정보 불러오기
	@RequestMapping(value="/userupdateform" ,produces = "text/plain;charset=utf-8")
	public String userone(HttpServletRequest request, Model model) {
		try {
			
			String userId = (String)session.getAttribute("userId");
			UserDTO user = us.selectOne(userId);
			model.addAttribute("user",user);
		} catch (Exception e) {
			// TODO: handle exception
			 e.printStackTrace();
		}
		return "updateuser"; //jsp이름
	}
	
	//정보수정
	@PostMapping(value="/updateUser",produces = "text/plain;charset=utf-8")
	public String updateUser(
			@RequestParam(required = false) String nickname, 
			@RequestParam(required = false) String pw ) {
		 try {
			String userId = (String)session.getAttribute("userId");
			us.updateUser(userId, nickname, pw);
			return "redirect:/mypage.do";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "redirect:/userupdateform";
		}
		
		 
	}
	
	//닉네임 중복확인
	@ResponseBody
	@PostMapping(value="/updatecheckNickname" ,produces = "text/plain;charset=utf-8")
	public String updatecheckNickname(@RequestParam String nickname) {
		boolean isExistnickname = us.checkNickname(nickname);
		if(isExistnickname) {
			return "1";
		}else {
			return "0";
		}
	}
	
	
	// 회원탈퇴
	@ResponseBody
	@RequestMapping(value="/userdelete" , method=RequestMethod.POST)
	public String UserDelete(@RequestParam(required=true)  String userId) {	
		us.getUserWithdrawal(userId);
		session.invalidate();
		return "redirect:/home";
	}
}
