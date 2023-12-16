package com.acorn.tour.course;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.tour.image.ImageDTO;
import com.acorn.tour.image.ImageService;
import com.acorn.tour.mylike.LikeService;
import com.acorn.tour.paging.PageHandler;
import com.acorn.tour.sido.SidoDTO;
import com.acorn.tour.sido.SidoService;
import com.acorn.tour.view.ViewService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


@Controller
public class CourseController {

	@Autowired
	CourseService cs; // 코스 서비스
	
	@Autowired
	SidoService ss; // 시도 서비스
	
	@Autowired
	ViewService vs; // 조회수 서비스
	
	@Autowired
	LikeService ls; // 좋아요 서비스
	
	@Autowired
	ImageService is; // 이미지 서비스
	
	@Autowired
	HttpSession session;
	
	//코스 데이터 표출
	@GetMapping(value="/course")
	public String courseView(Model model) throws IOException{
		
		int totalcnt = cs.getTotalCnt(0);
		model.addAttribute("totalcnt" , totalcnt);
		
		ArrayList<SidoDTO> sidoList = ss.getSelectAll();
		model.addAttribute("sidoList" , sidoList);
		
		PageHandler handler = cs.getPaging(1, 0);
		model.addAttribute("handler" , handler);
		
		ArrayList<CourseDTO> list = cs.getSelectAllLatest(handler.getStartList(), handler.getEndList(), 0);
		model.addAttribute("contentList" , list);
		
		int distance = 0;
		ArrayList<Integer> distanceAll = new ArrayList<>();
		for(int i=0; i<list.size(); i++) {
			ArrayList<CourseContentDTO> listCourse = cs.getSelectCourse(list.get(i).getContentid()); // 코스 목록
			distance = cs.haversineAll(listCourse);
			distanceAll.add(distance);
		}
		model.addAttribute("distanceAll", distanceAll);
		
		return "course";
	}
	
	
	@ResponseBody // return값을 데이터로 주는 것
	@RequestMapping(value="/courselist" , method=RequestMethod.GET)
	public Map<String, Object> courseList(@RequestParam(required=true) int currentPage, int sidoCode, String sortId) throws IOException{
		
		Map<String, Object> map  = new HashMap<>();
		
		int totalcnt = cs.getTotalCnt(sidoCode);
		map.put("totalcnt" , totalcnt);
		
		ArrayList<SidoDTO> sidoList = ss.getSelectAll();
		map.put("sidoList" , sidoList);
		
		PageHandler handler = cs.getPaging(currentPage, sidoCode);
		map.put("handler" , handler);
		
		ArrayList<CourseDTO> list = new ArrayList<>();
		// 정렬 조건에 따른 리스트 출력
		if(sortId.equals("sort1")) {
			list = cs.getSelectAllLatest(handler.getStartList(), handler.getEndList(), sidoCode);
			map.put("contentList" , list);
		}else{
			list = cs.getSelectAllPopular(handler.getStartList(), handler.getEndList(), sidoCode);
			map.put("contentList" , list);
		}
		
		int distance = 0;
		ArrayList<Integer> distanceAll = new ArrayList<>();
		for(int i=0; i<list.size(); i++) {
			ArrayList<CourseContentDTO> listCourse = cs.getSelectCourse(list.get(i).getContentid()); // 코스 목록
			distance = cs.haversineAll(listCourse);
			distanceAll.add(distance);
		}
		map.put("distanceAll", distanceAll);
		return map;
	}
	
	
	// 코스 상세
	@RequestMapping(value="/courseDetail" , method = RequestMethod.GET)
	public String sightsDetail(@RequestParam(required=false) String contentId, Model model){
		vs.getUpdateContentView(contentId);
		
		CourseDTO content = cs.getSelectOne(contentId); // 코스 정보
		model.addAttribute("content", content);
		
		ArrayList<CourseContentDTO> list = cs.getSelectCourse(contentId); // 코스 목록
		model.addAttribute("courseList", list);	
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list);
		model.addAttribute("courseListjson", json);
		
		
		int distanceAll = cs.haversineAll(list);
		model.addAttribute("distanceAll", distanceAll);
		
		ArrayList<ImageDTO> imglist = is.getSelectImg(list.get(0).subcontentid); // 첫번째 코스 이미지
		model.addAttribute("imglist", imglist);
		
		int likeNum = ls.getCountLike(contentId);
		model.addAttribute("likeNum", likeNum);
		
		String userId = (String)session.getAttribute("userId");
		int mylikeNum = ls.getMycountLike(contentId, userId); // 0이면 좋아요X, 1이면 좋아요O
		model.addAttribute("mylikeNum", mylikeNum);
		
		return "courseDetail";
	}
	
	// 코스 목록 상세
	@ResponseBody // return값을 데이터로 주는 것
	@RequestMapping(value="/courseDetaillist" , method=RequestMethod.GET)
	public Map<String, Object> courseDetailList(@RequestParam(required=false) String contentId, String subcontentId){
		
		Map<String, Object> map  = new HashMap<>();
		
		ArrayList<CourseContentDTO> list = cs.getSelectCourse(contentId); // 코스 목록
		CourseContentDTO result = new CourseContentDTO();
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).subcontentid.equals(subcontentId)) {
				result = list.get(i);
				break;
			}
		}
		map.put("content", result);
		
		ArrayList<ImageDTO> imglist = is.getSelectImg(subcontentId); // 해당코스 이미지
		map.put("imglist", imglist);
		
		return map;
	}
}
