package com.acorn.tour.myQA;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.tour.paging.PageHandler;

@Service
public class MyQAService {

	@Autowired
	MyQARepository rep;
	
	// 나의 문의 전체조회
	public ArrayList<MyQADTO> getSelectMyQA(String userid){
		ArrayList<MyQADTO> list = rep.selectMyQA(userid);
		return list;
	}
	
	// 나의 문의 조회
	public MyQADTO getSelectOneMyQA(String qacode){
		MyQADTO item = rep.selectOneMyQA(qacode);
		return item;
	}
	
	// 나의 문의 등록
	public void getInsertMyQA(MyQADTO item ) {
		rep.insertMyQA(item);
	}
	
	// 나의 문의 수정
	public void getUpdateMyQA(MyQADTO item ) {
		rep.updateMyQA(item);
	}
	
	// 나의질문 삭제
	public void getDeleteMyQA(String qacode) {
		rep.deleteMyQA(qacode);
	}
	
	// 페이징
	public PageHandler getPaging(int currentPage, String userId) {
		
		int totRecords = getSelectMyQA(userId).size();
		if(totRecords == 0 ) {
			totRecords=1;
		}
		int pageSize = 10; // 한 페이지에 표출할 리스트 수
		int grpSize = 5;
		
		PageHandler handler = new PageHandler(currentPage, totRecords, pageSize, grpSize);
		return handler;
	}
}
