package com.acorn.tour.data;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.tour.content.ContentDTO;

@Component
public class DataService {

	
	@Autowired
	DataRepository rep;
	
	// 공공데이터 content 전체 삽입
	public void getInsertAll(ArrayList<ContentDTO> list) {
		rep.insertAll(list);
	}
	
	// 조건에 맞는 contentid 조회하기
	public ArrayList<String> getSelectCheck(int startnum, int endnum, String contenttypeid) {
		ArrayList<String> list = rep.selectCheck(startnum, endnum, contenttypeid);
		return list;
	}
	
	// 조건에 맞는 contentid에 홈페이지, 상세내용 추가
	public void getUpdateContent(ArrayList<DataDetailDTO> list2) {
		rep.updateContent(list2);
	}
	
	// 여행지 추가정보 삽입
	public void getInsertAreaAll(ArrayList<DataDetailDTO2> list) {
		rep.insertAreaAll(list);
	}
	
	// 축제, 공연, 행사 시작일 및 종료일 전체 삽입
	public void getInsertEventAll(ArrayList<DataDetailDTO2> list) {
		rep.insertEventAll(list);
	}
	
	// 축제, 공연, 행사 추가정보 삽입
	public void getInsertEvent(ArrayList<DataDetailDTO2> list) {
		rep.insertEvent(list);
	}
	
}
