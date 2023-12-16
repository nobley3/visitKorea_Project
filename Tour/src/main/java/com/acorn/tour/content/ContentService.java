package com.acorn.tour.content;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.tour.paging.PageHandler;

	
@Component
public class ContentService {
	
	@Autowired
	ContentRepository rep;
	
	// 여행지
	// 조건에 맞는 전체 데이터 수
	public Integer getTotalCnt(int sidoCode, String contenttypeid, String cat2) {
		int result = rep.totalCnt(sidoCode, contenttypeid, cat2);
		return result;
	}
	
	// 최신순 content 10개씩 표출
	public ArrayList<ContentDTO> getSelectAllLatest(int startList, int endList, int sidoCode, String contenttypeid, String cat2) {
		ArrayList<ContentDTO> list = rep.selectAllLatest(startList, endList, sidoCode, contenttypeid, cat2);
		return list;
	}
	
	// 거리순 content 10개씩 표출
	public ArrayList<ContentDTO> getSelectAllDistance(double lat1, double lon1, int startList, int endList, int sidoCode, String contenttypeid, String cat2) {
		ArrayList<ContentDTO> list = rep.selectAllDistance(lat1, lon1, startList, endList, sidoCode, contenttypeid, cat2);
		return list;
	}
	
	// 인기순 content 10개씩 표출
	public ArrayList<ContentDTO> getSelectAllPopular(int startList, int endList, int sidoCode, String contenttypeid, String cat2){
		ArrayList<ContentDTO> list = rep.selectAllPopular(startList, endList, sidoCode, contenttypeid, cat2);
		return list;
	}
	
	// 상세페이지 해당 내용 
	public ContentDTO getSelectOne(String contentId) {
		ContentDTO content = rep.selectOne(contentId);
		return content;
	}
	
	// 조회수 증가
	public void getUpdateContentView(String contentId) {
		rep.updateContentView(contentId);
	}
	
	// 좋아요 삽입
	public void getUpdateContentLike(String contentId, String userId) {
		rep.updateContentLike(contentId, userId);
	}
	// 좋아요 삭제
	public void getDeleteContentLike(String contentId, String userId) {
		rep.deleteContentLike(contentId, userId);
	}
	
	// 좋아요 조회
	public Integer getCountLike(String contentId) {
		int result = rep.countLike(contentId);
		return result;
	}
	
	// 나의 좋아요 조회
	public Integer getMycountLike(String contentId, String userId) {
		int result = rep.mycountLike(contentId, userId);
		return result;
	}
	
	// 상세페이지 이미지
	public ArrayList<ContentDTO> getSelectImg(String contentId){
		ArrayList<ContentDTO> list = rep.selectImg(contentId);
		return list;
	}
	
	// 페이징
	public PageHandler getPaging(int currentPage, int sidoCode, String contenttypeid, String cat2) {
		
		int totRecords = getTotalCnt(sidoCode, contenttypeid, cat2);
		int pageSize = 10;
		int grpSize = 10;
		
		PageHandler handler = new PageHandler(currentPage, totRecords, pageSize, grpSize);
		return handler;
	}
	
	
}
