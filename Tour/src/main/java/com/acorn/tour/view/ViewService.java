package com.acorn.tour.view;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


	
@Component
public class ViewService {
	
	@Autowired
	ViewRepository rep;
	
	
	// 조회수 증가
	public void getUpdateContentView(String contentId) {
		rep.updateContentView(contentId);
	}
}
