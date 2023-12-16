package com.acorn.tour.sights;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.tour.paging.PageHandler;

	
@Component
public class SightsService {
	
	@Autowired
	SightsRepository rep;
	
	// 여행지
	// 조건에 맞는 전체 데이터 수
	public Integer getTotalCnt(int sidoCode) {
		int result = rep.totalCnt(sidoCode);
		return result;
	}
	
	// 최신순 content 10개씩 표출
	public ArrayList<SightDTO> getSelectAllLatest(int startList, int endList, int sidoCode) {
		ArrayList<SightDTO> list = rep.selectAllLatest(startList, endList, sidoCode);
		return list;
	}
	
	// 거리순 content 10개씩 표출
	public ArrayList<SightDTO> getSelectAllDistance(double lat1, double lon1, int startList, int endList, int sidoCode) {
		ArrayList<SightDTO> list = rep.selectAllDistance(lat1, lon1, startList, endList, sidoCode);
		return list;
	}
	
	// 인기순 content 10개씩 표출
	public ArrayList<SightDTO> getSelectAllPopular(int startList, int endList, int sidoCode){
		ArrayList<SightDTO> list = rep.selectAllPopular(startList, endList, sidoCode);
		return list;
	}
	
	// 상세페이지 해당 내용 
	public SightDTO getSelectOne(String contentId) {
		SightDTO content = rep.selectOne(contentId);
		return content;
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
