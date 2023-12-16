package com.acorn.tour.tourAlist;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SpotRepository {

	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.acorn.TourSpotMapper."; //별칭, 임의로 작성
	
//	여행지리스트 조회
	public List<TourlistSpot> selectSpotAll(){
		return session.selectList(namespace+"selectSpotAll");
	}
	
//	체크된 여행지 조회
	public List<TourlistSpot> getSelectedSpots(){
		return session.selectList(namespace+"selectedSpot");
	}
	
	
//	여행지저장
	public int insertSpot(List<TourlistSpot> spot)throws Exception {
		 
		 for (TourlistSpot selctedspot : spot) {
		        session.insert(namespace + "insertSpot", selctedspot);
		    }
		 return spot.size();
	}
	
//	여행지 삭제
	public void deleteSelectedSpots(List<String> contentid)throws Exception{
		 session.delete(namespace+"deleteSelectedSpots",contentid);
	}
	
//	축제/행사 리스트 조회
	public List<TourlistSpot> selectFestivalAll(){
		return session.selectList(namespace+"selectFestivalAll");
	}
	
//	체크된 축제/행사 조회
	public List<TourlistSpot> selectedFestival(){
		return session.selectList(namespace+"selectedFestival");
	}

//	축제/행사 저장
	public int insertFspot(List<TourlistSpot> spot)throws Exception{
		for(TourlistSpot selctedspot : spot) {
			session.insert(namespace+"insertFspot",selctedspot);
		}
		return spot.size();
	}
	
//	여행코스조회
	public List<TourlistSpot> selectCourseAll(){
		return session.selectList(namespace+"selectCourseAll");
	}
	
//	체크된 여행코스 조회
	public List<TourlistSpot> selectedCourse(){
		return session.selectList(namespace+"selectedCourse");
	}
	
//	여행코스 저장
	public int insertCspot(List<TourlistSpot> spot) throws Exception{
		for(TourlistSpot selctedspot : spot) {
			session.insert(namespace+"insertCspot",selctedspot);
		}
		return spot.size();
	}
	
}
