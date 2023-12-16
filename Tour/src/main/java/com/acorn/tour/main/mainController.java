package com.acorn.tour.main;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.tour.login.LoginService;
import com.acorn.tour.user.UserDTO;


@Controller
public class mainController {

	
	@Autowired
	LoginService loginService;
	
	@Autowired
	HttpSession session;
	
	
	@GetMapping("/home")
	public String homepage(Model model) {
		
		return "home";
	}
	
	@ResponseBody
	@RequestMapping(value="/homelocation" , method=RequestMethod.POST)
	public void homelocation(Double latitude, Double longitude) {
		session.setAttribute("latitude", latitude);
		session.setAttribute("longitude", longitude);
	}
}
