package com.acorn.tour.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginIntercepter extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) 
			throws Exception{
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		
		//로그인하지 않은 경우
		if( userId == null) {
			response.sendRedirect(request.getContextPath()+"/loginform");
			return false;
		}
		
		return true;
	}

}
