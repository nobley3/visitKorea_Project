package com.acorn.tour.tourAlist;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SpotService {

	@Autowired
	SpotRepository dao;
	
//	여행지리스트 조회
	public List<TourlistSpot> selectSpotAll(){
		return dao.selectSpotAll();
	}
	
	
//	체크된 여행지 조회
	public List<TourlistSpot> getSelectedSpots(){
		return dao.getSelectedSpots();
	}
	
//	여행지 삭제
    public void deleteSelectedSpots(List<String> contentid )throws Exception {
        dao.deleteSelectedSpots(contentid);
    }
	
//	여행지저장
	public String insertSpot(List<TourlistSpot> spot) {
		try {
			dao.insertSpot(spot);
			return "여행지가 저장되었습니다.";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "저장실패";
		}
	}
	
 
//	축제/행사 리스트
	public List<TourlistSpot> selectFestivalAll(){
		return dao.selectFestivalAll();
	}

//	체크된 축제/행사 조회
	public List<TourlistSpot> selectedFestival(){
		return dao.selectedFestival();
	}
	
	
//	축제/행사 저장
	public String insertFspot(List<TourlistSpot> spot) {
		try {
			dao.insertFspot(spot);
			return"축제/행사가 저장되었습니다.";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "실패";
		}
	}
	
//	여행코스조회
	public List<TourlistSpot> selectCourseAll(){
		return dao.selectCourseAll();
	}
	
//	체크된 여행코스조회
	public List<TourlistSpot> selectedCourse(){
		return dao.selectedCourse();
	}
	
//	여행코스저장
	public String insertCspot(List<TourlistSpot>spot) {
		try {
			dao.insertCspot(spot);
			return "코스가 저장되었습니다.";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "실패";
		}
	}
}
