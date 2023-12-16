package com.acorn.tour.mycourse;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.tour.course.CourseContentDTO;
import com.acorn.tour.mylike.LikeService;
import com.acorn.tour.paging.PageHandler;

@Component
public class MycouseService {

	
	@Autowired
	MycourseRepository rep;
	
	// 나의 코스 목록 조회
	public ArrayList<MycourseDTO> getSelectMyCourse(String userId){
		ArrayList<MycourseDTO> list = rep.selectMyCourse(userId);
		return list;
	}
	
	// 나의 코스 목록 삽입
	public void getInsertMyCourse(String userId, String courseName) {
		rep.insertMyCourse(userId, courseName);
	}
	// 나의 코스 목록 삭제
	public void getDeleteMyCourse(String userId, String coursecode) {
		rep.deleteMyCourse(userId, coursecode);
	}
	
	// 나의코스상세내용 조회 
	public MycourseDTO getSelectOneMyCourse(String userid, String coursecode) {
		MycourseDTO item = rep.selectOneMyCourse(userid, coursecode);
		return item;
	}
	
	// 나의코스상세내용 수정
	public void getUpdateMyCourse(MycourseDTO item) {
		rep.updateMyCourse(item);
	}
	
	// 나의 코스 상세리스트 조회
	public ArrayList<MycourseDTO> getSelectMycourseList(String coursecode) {
		ArrayList<MycourseDTO> list = rep.selectMycourseList(coursecode);
		ArrayList<MycourseDTO> listResult = haversine(list);
		return listResult;
	}
	
	// 코스 목록별 거리 계산
	public ArrayList<MycourseDTO> haversine(ArrayList<MycourseDTO> list) {
			
		ArrayList<MycourseDTO> listResult = new ArrayList<>();
		
        final int R = 6371; // 지구의 반지름 (단위: km)

        for(int i=0; i<list.size(); i++) {
        	// 위도와 경도를 라디안으로 변환
        	MycourseDTO item = list.get(i);
        	
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
            
            listResult.add(new MycourseDTO(item.getCoursecode(), item.getContentid(), item.getContentnum(), item.getTitle(), item.getAddress(),
            							   item.getFirstimage(), item.getMapx(), item.getMapy(), 
            							   item.getContenttypeid(), item.getCat2(), distance));
        }
        
        // 거리순으로 정렬
        Collections.sort(listResult, new Comparator<MycourseDTO>() {
			@Override
			public int compare(MycourseDTO o1, MycourseDTO o2) {
				return Double.compare(o1.getDistance(), o2.getDistance());
			}
        });

        return listResult;
    }
	
	// 코스 총 거리
	public Integer haversineAll(ArrayList<MycourseDTO> list) {
			
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
	
	//나의 코스 상세리스트 삽입여부 판단
	public Integer getCountInsertMycourseList(String coursecode, String contentid) {
		int result = rep.countInsertMycourseList(coursecode, contentid);
		return result;
	}
	
	// 나의 코스 상세리스트 삽입
	public void getInsertMyCourseList(String coursecode, String contentid) {
		ArrayList<MycourseDTO> list = rep.selectMycourseList(coursecode);
		int contentnum = 0;
		if(list.size() != 0 ) {
			contentnum = list.get(list.size()-1).getContentnum();
		}
		//int contentnum = rep.countMycourseList(coursecode);
		rep.insertMyCourseList(coursecode, contentid, contentnum+1);
	}
	
	//나의 코스 상세리스트 삭제
	public void getDeleteMyCourseList(String coursecode, String contentid) {
		rep.deleteMyCourseList(coursecode, contentid);
	}
	
	// 페이징
	public PageHandler getPaging(int currentPage, String userId) {
		
		int totRecords = getSelectMyCourse(userId).size();
		if(totRecords == 0 ) {
			totRecords = 1;
		}
		int pageSize = 10; // 한 페이지에 표출할 리스트 수
		int grpSize = 5;
		
		PageHandler handler = new PageHandler(currentPage, totRecords, pageSize, grpSize);
		return handler;
	}
	
}
