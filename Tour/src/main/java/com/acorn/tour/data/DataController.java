package com.acorn.tour.data;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.tour.content.ContentDTO;

@Controller
public class DataController {

	@Autowired
	DataExplorer api;
	
	@Autowired
	DataService dts;
	
	// 게시글 데이터 수집
	@ResponseBody
	@GetMapping(value = "/dataAll", produces = "application/json;charset=UTF-8")
	public void contentAPI() throws IOException {
		
		int totalcnt = api.getTotal();
		int listnum = 10; // api 호출 한번에 가져올 데이터의 수
		int lastlistnum = totalcnt % listnum;
		int pagenum = 1;
//		int pagenum = (totalcnt / listnum);
//		if(lastlistnum != 0 ) {
//			pagenum = (totalcnt / listnum) +1 ;
//		}
		
		System.out.println("데이터 전체수 : " + totalcnt);
		for(int i = 1; i <= pagenum; i++) {
			ArrayList<ContentDTO> listResult = api.getContentAPI(listnum, i);
			dts.getInsertAll(listResult);
			System.out.println(listnum*i);
		}
	}
	
	// 게시글 홈페이지 및 상세내용 수집
	@ResponseBody
	@GetMapping(value = "/dataDetail", produces = "application/json;charset=UTF-8")
	public void contentDetailAPI() throws IOException {
		
		int startnum = 201; // 조회할 첫번째 데이터 순번
		int endnum = 220; // 조회할 마지막 데이터 순번 
		String contenttypeid = "12";
		// 여행지(12) : 200번째까지 업데이트 완료
		// 축제/공연/행사(15) : 200번까지 업데이트 완료
		// 여행코스(25): 수정최신순 100번까지 업데이트 완료
		
		ArrayList<String> list = dts.getSelectCheck(startnum, endnum, contenttypeid); // contentid 리스트
		System.out.println("contentid 리스트 수집 완");
		ArrayList<DataDetailDTO> list2 = new ArrayList<>();
		for (int i =0; i<list.size(); i++) {
			DataDetailDTO content = api.getContentDetailAPI(list.get(i));
			list2.add(content);
			System.out.println("dataDetail : " + i);
		}
		System.out.println("데이터 수집 완");
		dts.getUpdateContent(list2);
		System.out.println("update 성공");
	}
	
	
	// 축제/공연/행사 시작일 및 종료일
	@ResponseBody
	@GetMapping(value = "/dataDetail2", produces = "application/json;charset=UTF-8")
	public void contentDetailAPI2() throws IOException {
		
		int totalcnt = 1453;
		int listnum = 500; // api 호출 한번에 가져올 데이터의 수
		int lastlistnum = totalcnt % listnum;
		int pagenum = 0;
		if(lastlistnum != 0 ) {
			pagenum = (totalcnt / listnum) +1 ;
		}else {
			pagenum = (totalcnt / listnum);
		}
		
		for(int i = 1; i <= pagenum; i++) {
			ArrayList<DataDetailDTO2> list = api.getContentDetail2API(listnum, i);
			dts.getInsertEventAll(list);
			System.out.println(listnum*i);
		}
		System.out.println(totalcnt + ": 삽입 성공");
	}
	
	// 게시글 홈페이지 및 상세내용 수집
	@ResponseBody
	@GetMapping(value = "/dataDetail3", produces = "application/json;charset=UTF-8")
	public void contentDetailAPI3() throws IOException {
		
		int startnum = 117; // 조회할 첫번째 데이터 순번
		int endnum = 200; // 조회할 마지막 데이터 순번 
		String contenttypeid = "15";
		// 여행지(12) : 30번 데이터 없음, 100번째까지 완료
		// 축제/공연/행사(15) : 116번 데이터 없음, 200번째까지 완료
		
		ArrayList<String> list = dts.getSelectCheck(startnum, endnum, contenttypeid); // contentid 리스트
		System.out.println("contentid 리스트 수집 완");
		ArrayList<DataDetailDTO2> list2 = new ArrayList<>();
		for (int i =0; i<list.size(); i++) {
			DataDetailDTO2 content = api.getContentDetail3API(list.get(i), contenttypeid);
			list2.add(content);
			System.out.println("dataDetail3 : " +i);
		}
		System.out.println("데이터 수집 완");
		if(contenttypeid.equals("12")) {
			dts.getInsertAreaAll(list2);
		}else {
			dts.getInsertEvent(list2);
		}
		System.out.println("update 성공");
	}
	
}
