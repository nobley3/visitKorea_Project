package com.acorn.tour.event;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.tour.content.ContentDTO;
import com.acorn.tour.paging.PageHandler;

	
@Component
public class EventService {
	
	@Autowired
	EventRepository rep;
	
	// 공연/행사
	// 조건에 맞는 전체 데이터 수
	public Integer getTotalCnt(int sidoCode) {
		int result = rep.totalCnt(sidoCode);
		return result;
	}
	
	// 최신순 content 10개씩 표출
	public ArrayList<ContentDTO> getSelectAllLatest(int startList, int endList, int sidoCode) {
		ArrayList<ContentDTO> list = rep.selectAllLatest(startList, endList, sidoCode);
		return list;
	}
	
	// 거리순 content 10개씩 표출
	public ArrayList<ContentDTO> getSelectAllDistance(double lat1, double lon1, int startList, int endList, int sidoCode) {
		ArrayList<ContentDTO> list = rep.selectAllDistance(lat1, lon1, startList, endList, sidoCode);
		return list;
	}
	
	// 인기순 content 10개씩 표출
	public ArrayList<ContentDTO> getSelectAllPopular(int startList, int endList, int sidoCode){
		ArrayList<ContentDTO> list = rep.selectAllPopular(startList, endList, sidoCode);
		return list;
	}
	
	// 상세페이지 해당 내용 
	public EventDTO getSelectOne(String contentId) {
		EventDTO content = rep.selectOne(contentId);
		return content;
	}
	
	
	// 현재 날짜 구하기
	public String currentDate() {
        LocalDate currentDate = LocalDate.now(); // 현재 날짜 가져오기
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); // 날짜를 원하는 형식으로 포맷팅
        String formattedDate = currentDate.format(formatter);
        return formattedDate;
	}
	
	
	
	// 페이징
	public PageHandler getPaging(int currentPage, int sidoCode) {
		
		int totRecords = getTotalCnt(sidoCode);
		int pageSize = 10;
		int grpSize = 10;
		
		PageHandler handler = new PageHandler(currentPage, totRecords, pageSize, grpSize);
		return handler;
	}
	
	
}
