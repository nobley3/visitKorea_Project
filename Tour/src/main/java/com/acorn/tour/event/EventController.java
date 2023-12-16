package com.acorn.tour.event;

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

import com.acorn.tour.content.ContentDTO;
import com.acorn.tour.image.ImageDTO;
import com.acorn.tour.image.ImageService;
import com.acorn.tour.mylike.LikeService;
import com.acorn.tour.paging.PageHandler;
import com.acorn.tour.sido.SidoDTO;
import com.acorn.tour.sido.SidoService;
import com.acorn.tour.view.ViewService;

@Controller
public class EventController {

	
	@Autowired
	EventService es; // 공연/행사 서비스
	
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
	
	// 공연/행사
	//공연/행사 데이터 표출
	@GetMapping(value="/event")
	public String eventView(Model model) throws IOException{
		
		
		int totalcnt = es.getTotalCnt(0);
		model.addAttribute("totalcnt" , totalcnt);
		
		ArrayList<SidoDTO> sidoList = ss.getSelectAll();
		model.addAttribute("sidoList" , sidoList);
		
		PageHandler handler = es.getPaging(1, 0);
		model.addAttribute("handler" , handler);
		
		ArrayList<ContentDTO> list = es.getSelectAllLatest(handler.getStartList(), handler.getEndList(), 0);
		model.addAttribute("contentList" , list);
		
		String currentDate = es.currentDate();
		model.addAttribute("currentDate" , currentDate);
		
		return "event";
		
	}
	
	@ResponseBody // return값을 데이터로 주는 것
	@RequestMapping(value="/eventlist" , method=RequestMethod.GET)
	public Map<String, Object> eventList(@RequestParam(required=true) int currentPage, int sidoCode, String sortId) throws IOException{
		
		Map<String, Object> map  = new HashMap<>();
		
		int totalcnt = es.getTotalCnt(sidoCode);
		map.put("totalcnt" , totalcnt);
		
		ArrayList<SidoDTO> sidoList = ss.getSelectAll();
		map.put("sidoList" , sidoList);
		
		PageHandler handler = es.getPaging(currentPage, sidoCode);
		map.put("handler" , handler);
	
		String currentDate = es.currentDate();
		map.put("currentDate" , currentDate);
		
		// 정렬 조건에 따른 리스트 출력
		if(sortId.equals("sort1")) {
			ArrayList<ContentDTO> list = es.getSelectAllLatest(handler.getStartList(), handler.getEndList(), sidoCode);
			map.put("contentList" , list);
		}else if(sortId.equals("sort2")) {
			double lat1 = (double)session.getAttribute("latitude"); // 위도
			double lon1 = (double)session.getAttribute("longitude"); // 경도
			ArrayList<ContentDTO> list = es.getSelectAllDistance(lat1, lon1, handler.getStartList(), handler.getEndList(), sidoCode);
			map.put("contentList" , list);
		}else{
			ArrayList<ContentDTO> list = es.getSelectAllPopular(handler.getStartList(), handler.getEndList(), sidoCode);
			map.put("contentList" , list);
		}
		
		return map;
	}
	
	// 공연/행사 상세
	@RequestMapping(value="/eventDetail" , method=RequestMethod.GET)
	public String eventDetail(@RequestParam(required=false) String contentId, Model model){
		vs.getUpdateContentView(contentId);
		
		ArrayList<ImageDTO> imglist = is.getSelectImg(contentId);
		model.addAttribute("imglist", imglist);
		
		EventDTO content = es.getSelectOne(contentId);
		model.addAttribute("content", content);
		
		int likeNum = ls.getCountLike(contentId);
		model.addAttribute("likeNum", likeNum);
		
		String currentDate = es.currentDate();
		model.addAttribute("currentDate" , currentDate);
		
		String userId = (String)session.getAttribute("userId");
		int mylikeNum = ls.getMycountLike(contentId, userId); // 0이면 좋아요X, 1이면 좋아요O
		model.addAttribute("mylikeNum", mylikeNum);
		return "eventDetail";
	}
	
}
