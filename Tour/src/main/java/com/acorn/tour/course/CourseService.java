package com.acorn.tour.course;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.tour.paging.PageHandler;
import com.acorn.tour.sights.SightDTO;

@Component
public class CourseService {

	@Autowired
	CourseRepository rep;
	
	// 여행지
	// 조건에 맞는 전체 데이터 수
	public Integer getTotalCnt(int sidoCode) {
		int result = rep.totalCnt(sidoCode);
		return result;
	}
	
	// 최신순 content 10개씩 표출
	public ArrayList<CourseDTO> getSelectAllLatest(int startList, int endList, int sidoCode) {
		ArrayList<CourseDTO> list = rep.selectAllLatest(startList, endList, sidoCode);
		return list;
	}
	
	// 인기순 content 10개씩 표출
	public ArrayList<CourseDTO> getSelectAllPopular(int startList, int endList, int sidoCode){
		ArrayList<CourseDTO> list = rep.selectAllPopular(startList, endList, sidoCode);
		return list;
	}
	
	// 상세페이지 해당 내용 
	public CourseDTO getSelectOne(String contentId) {
		CourseDTO content = rep.selectOne(contentId);
		return content;
	}
	
	// 코스 목록별 거리 계산
	public ArrayList<CourseContentDTO> haversine(ArrayList<CourseContentDTO> list) {
			
		ArrayList<CourseContentDTO> listResult = new ArrayList<>();
		
        final int R = 6371; // 지구의 반지름 (단위: km)

        for(int i=0; i<list.size(); i++) {
        	// 위도와 경도를 라디안으로 변환
        	CourseContentDTO item = list.get(i);
        	
            double lat1Rad = Math.toRadians(Double.parseDouble(list.get(0).getMapy())); // 위도
            double lon1Rad = Math.toRadians(Double.parseDouble(list.get(0).getMapx())); // 경도
            double lat2Rad = Math.toRadians(Double.parseDouble(item.getMapy()));
            double lon2Rad = Math.toRadians(Double.parseDouble(item.getMapx()));

            // Haversine 공식을 사용하여 거리 계산
            double dlat = lat2Rad - lat1Rad;
            double dlon = lon2Rad - lon1Rad;
            double a = Math.pow(Math.sin(dlat / 2), 2) + Math.cos(lat1Rad) * Math.cos(lat2Rad) * Math.pow(Math.sin(dlon / 2), 2);
            double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
            double distance = R * c; // km
            
            listResult.add(new CourseContentDTO(item.getContentid(), item.getSubcontentid(), item.getNum(), item.getSubtitle(),
            		       item.getAddress(), item.getMapx(), item.getMapy(), item.getFirstimage(), distance, item.getContenttypeid(), item.getCat2()));
        }
        
        // 거리순으로 정렬
        Collections.sort(listResult, new Comparator<CourseContentDTO>() {
			@Override
			public int compare(CourseContentDTO o1, CourseContentDTO o2) {
				return Double.compare(o1.getDistance(), o2.getDistance());
			}
        });

        return listResult;
    }
	
	// 상세페이지에 표출할 코스 목록 내용
	public ArrayList<CourseContentDTO> getSelectCourse(String contentId) {
		ArrayList<CourseContentDTO> list = rep.selectCourse(contentId);
		ArrayList<CourseContentDTO> listResult = haversine(list);
		for(int i=0; i<listResult.size(); i++) {
			CourseContentDTO item = listResult.get(i);
			item.setNum(i+1);
		}
		return listResult;
	}
	
	// 코스 총 거리
	public Integer haversineAll(ArrayList<CourseContentDTO> list) {
			
		double result = 0;
		
        final int R = 6371; // 지구의 반지름 (단위: km)

        for(int i=0; i<list.size()-1; i++) {
        	// 위도와 경도를 라디안으로 변환
            double lat1Rad = Math.toRadians(Double.parseDouble(list.get(i).getMapy())); // 위도
            double lon1Rad = Math.toRadians(Double.parseDouble(list.get(i).getMapx())); // 경도
            double lat2Rad = Math.toRadians(Double.parseDouble(list.get(i+1).getMapy()));
            double lon2Rad = Math.toRadians(Double.parseDouble(list.get(i+1).getMapx()));

            // Haversine 공식을 사용하여 거리 계산
            double dlat = lat2Rad - lat1Rad;
            double dlon = lon2Rad - lon1Rad;
            double a = Math.pow(Math.sin(dlat / 2), 2) + Math.cos(lat1Rad) * Math.cos(lat2Rad) * Math.pow(Math.sin(dlon / 2), 2);
            double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
            double distance = R * c; // km
            
            result += distance;
        }
        
      
        return (int)result;
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
