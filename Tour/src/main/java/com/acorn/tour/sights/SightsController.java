package com.acorn.tour.sights;

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
import com.acorn.tour.review.ReviewDTO;
import com.acorn.tour.review.ReviewService;
import com.acorn.tour.sido.SidoDTO;
import com.acorn.tour.sido.SidoService;
import com.acorn.tour.view.ViewService;


@Controller
public class SightsController {

	
	@Autowired
	SightsService cs; // 여행지 서비스
	
	@Autowired
	SidoService ss; // 시도 서비스
	
	@Autowired
	ViewService vs; // 조회수 서비스
	
	@Autowired
	LikeService ls; // 좋아요 서비스
	
	@Autowired
	ImageService is; // 이미지 서비스
	
	@Autowired
	ReviewService reviewservice; // 리뷰 서비스
	
	@Autowired
	HttpSession session;
	
	
	//여행지 데이터 표출
	@GetMapping(value="/sights")
	public String sightsView(Model model) throws IOException{
		
		int totalcnt = cs.getTotalCnt(0);
		model.addAttribute("totalcnt" , totalcnt);
		
		ArrayList<SidoDTO> sidoList = ss.getSelectAll();
		model.addAttribute("sidoList" , sidoList);
		
		PageHandler handler = cs.getPaging(1, 0);
		model.addAttribute("handler" , handler);
		
		ArrayList<SightDTO> list = cs.getSelectAllLatest(handler.getStartList(), handler.getEndList(), 0);
		model.addAttribute("contentList" , list);
		
		return "sights";
	}
	
	
	@ResponseBody // return값을 데이터로 주는 것
	@RequestMapping(value="/sightslist" , method=RequestMethod.GET)
	public Map<String, Object> sightsList(@RequestParam(required=true) int currentPage, int sidoCode, String sortId) throws IOException{
		
		Map<String, Object> map  = new HashMap<>();
		
		int totalcnt = cs.getTotalCnt(sidoCode);
		map.put("totalcnt" , totalcnt);
		
		ArrayList<SidoDTO> sidoList = ss.getSelectAll();
		map.put("sidoList" , sidoList);
		
		PageHandler handler = cs.getPaging(currentPage, sidoCode);
		map.put("handler" , handler);
		
		// 정렬 조건에 따른 리스트 출력
		if(sortId.equals("sort1")) {
			ArrayList<SightDTO> list = cs.getSelectAllLatest(handler.getStartList(), handler.getEndList(), sidoCode);
			map.put("contentList" , list);
		}else if(sortId.equals("sort2")) {
			
			double lat1 = (double)session.getAttribute("latitude"); // 위도
			double lon1 = (double)session.getAttribute("longitude"); // 경도
			
			ArrayList<SightDTO> list = cs.getSelectAllDistance(lat1, lon1, handler.getStartList(), handler.getEndList(), sidoCode);
			map.put("contentList" , list);
		}else{
			ArrayList<SightDTO> list = cs.getSelectAllPopular(handler.getStartList(), handler.getEndList(), sidoCode);
			map.put("contentList" , list);
		}
		
		return map;
	}
	
	// 여행지 상세
	@RequestMapping(value="/sightsDetail" , method = RequestMethod.GET)
	public String sightsDetail(@RequestParam(required=false) String contentId, Model model){
		vs.getUpdateContentView(contentId);
		
		ArrayList<ImageDTO> imglist = is.getSelectImg(contentId);
		model.addAttribute("imglist", imglist);
		
		SightDTO content = cs.getSelectOne(contentId);
		model.addAttribute("content", content);
		
		int likeNum = ls.getCountLike(contentId);
		model.addAttribute("likeNum", likeNum);
		
		String userId = (String)session.getAttribute("userId");
		int mylikeNum = ls.getMycountLike(contentId, userId); // 0이면 좋아요X, 1이면 좋아요O
		model.addAttribute("mylikeNum", mylikeNum);
		
		
		
		
		ArrayList<ReviewDTO> dtolist = reviewservice.getList(contentId);
		model.addAttribute("reviewlist", dtolist);
		
		
		
		return "sightsDetail";
	}
	
	
}
