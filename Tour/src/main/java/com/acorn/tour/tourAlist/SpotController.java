package com.acorn.tour.tourAlist;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SpotController {

	@Autowired
	SpotService service;
	
	/*
//	관리자 메인페이지
	@GetMapping("/admin.do")
	public String tourAdmin() {
		return"adminIndex";
	}
	*/
	
//	여행지페이지(조회)
	@GetMapping("/spotlist")
	public String tourspot(Model model, HttpSession session) {
		List<TourlistSpot> tourspots = service.selectSpotAll();
//		System.out.println(tourspots.get(0));
		model.addAttribute("tourspots",tourspots);
		return "SpotList2";
	}
	
	
//	체크된 여행지 조회
	@ResponseBody
	@GetMapping("/selectedSpot")
	public List<TourlistSpot> selectedSpot(){
		return service.getSelectedSpots();
	}
	
//	체크여행지저장
	@ResponseBody
	@PostMapping(value ="/confirmList")
	public String insertSpot(@RequestBody List<TourlistSpot> spot) {
		String result = service.insertSpot(spot);
		return result;
	}

//	체크여행지삭제
	@ResponseBody
	@PostMapping(value ="/deleteSelectedSpots")
	public String deleteSelectedSpots(@RequestBody  List<String> contentid) {
		System.out.println( "spot =="  +contentid);
		
		 // System.out.println( spot[0]);
		   
		 try {
			System.out.println(contentid);
			service.deleteSelectedSpots(contentid);
			return "삭제 성공";
		} catch (Exception e) {
			 e.printStackTrace();
		    return "삭제 중 오류 발생";
		}
	}
	
//	행사/축제페이지(조회)
	@GetMapping("/festivalList")
	public String festivalspot(Model model, HttpSession session) {
		List<TourlistSpot> eventspots = service.selectFestivalAll();
		model.addAttribute("eventspots",eventspots);
		return "FestivalList";
	}
	
//	체크된 행사/축제페이지(조회)
	@ResponseBody
	@GetMapping(value = "/selectedF")
	public List<TourlistSpot> selectedFestival(){
		return service.selectedFestival();
	} 
	 
//  행사/축제페이지 저장
	@ResponseBody
	@PostMapping(value ="/confirmFlist")
	public String insertFspot(@RequestBody List<TourlistSpot> spot) {
		String result = service.insertFspot(spot);
		return result;
	}
	
//	여행코스조회
	@GetMapping("/courseList")
	public String courseSpot(Model model, HttpSession session) {
		List<TourlistSpot> course = service.selectCourseAll();
		model.addAttribute("course",course);
		return "CourseList";
	}
	
//	체크된 여행코스조회
	@ResponseBody
	@GetMapping("/selectedC")
	public List<TourlistSpot> selectedCourse(){
		return service.selectedCourse();
	}
	
	
//	여행코스저장
	@ResponseBody
	@PostMapping(value ="/confirmClist")
	public String insertCspot(@RequestBody List<TourlistSpot> spot) {
		String result = service.insertCspot(spot);
		return result;
	}
	
}
