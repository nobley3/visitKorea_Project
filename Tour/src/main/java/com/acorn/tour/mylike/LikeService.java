package com.acorn.tour.mylike;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.tour.paging.PageHandler;

	
@Component
public class LikeService {
	
	@Autowired
	LikeRepository rep;
	
	
	// 좋아요 삽입
	public void getUpdateContentLike(String contentId, String userId) {
		rep.updateContentLike(contentId, userId);
	}
	// 좋아요 삭제
	public void getDeleteContentLike(String contentId, String userId) {
		rep.deleteContentLike(contentId, userId);
	}
	
	// 좋아요 수 조회
	public Integer getCountLike(String contentId) {
		int result = rep.countLike(contentId);
		return result;
	}
	
	// 나의 좋아요 수 조회
	public Integer getMycountLike(String contentId, String userId) {
		int result = rep.mycountLike(contentId, userId);
		return result;
	}
	
	// 좋아요 목록 조회
	public ArrayList<LikeDTO> getmyLike(String userId){
		ArrayList<LikeDTO> list = rep.myLike(userId);
		for(int i = 0; i<list.size(); i++) {
			String contenttypeid = list.get(i).getContenttypeid();
			switch (contenttypeid) {
				case "12":
					list.get(i).setContenttypename("관광지");
					break;
				case "14":
					list.get(i).setContenttypename("문화시설");
					break;
				case "15":
					list.get(i).setContenttypename("축제공연행사");
					break;
				case "25":
					list.get(i).setContenttypename("여행코스");
					break;
				case "28":
					list.get(i).setContenttypename("레포츠");
					break;
				case "32":
					list.get(i).setContenttypename("숙박");
					break;
				case "38":
					list.get(i).setContenttypename("쇼핑");
					break;
				case "39":
					list.get(i).setContenttypename("음식점");
					break;
			}
		}
		return list;
	}
	
	// 페이징
	public PageHandler getPaging(int currentPage, String userId) {
		
		int totRecords = getmyLike(userId).size();
		
		if(totRecords == 0 ) {
			totRecords=1;
		}
		
		int pageSize = 10; // 한 페이지에 표출할 리스트 수
		int grpSize = 5;
		
		PageHandler handler = new PageHandler(currentPage, totRecords, pageSize, grpSize);
		return handler;
	}

	
}
