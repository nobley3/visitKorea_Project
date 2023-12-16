package com.acorn.tour.myreview;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.tour.paging.PageHandler;



@Component
public class MyReviewService {
	
	
	@Autowired
	MyReviewRepository rep;
	
	// 해당게시물 나의 리뷰 목록 전체 조회
	public ArrayList<MyReviewDTO> getSelectMyreview(String userid, int parentcode) {
		ArrayList<MyReviewDTO> list = rep.selectMyreview(userid, parentcode);
		return list;
	}
	
	// 해당 게시물 리뷰 삭제
	public void getDeletereviews(int reviewcode) {
		rep.deletereviews(reviewcode);
	}
	
	// 페이징
	public PageHandler getPaging(int currentPage, String userId, int parentcode) {
		
		int totRecords = getSelectMyreview(userId, parentcode).size();
		
		if(totRecords == 0 ) {
			totRecords=1;
		}
		int pageSize = 10; // 한 페이지에 표출할 리스트 수
		int grpSize = 5;
		
		PageHandler handler = new PageHandler(currentPage, totRecords, pageSize, grpSize);
		return handler;
	}
	
	
	

}
