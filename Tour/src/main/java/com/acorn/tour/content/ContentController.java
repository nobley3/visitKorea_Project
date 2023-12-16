package com.acorn.tour.content;
//package com.visitKorea.content;
//
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.visitKorea.paging.PageHandler;
//import com.visitKorea.sido.SidoDTO;
//import com.visitKorea.sido.SidoService;
//
//@Controller
//public class ContentController {
//
//	
//	@Autowired
//	SightsService cs;
//	
//	@Autowired
//	SidoService ss;
//	
//	
//	//여행지 데이터 표출
//	@GetMapping(value="/sights_origin")
//	public String sightsView(Model model) throws IOException{
//		
//		String contentTypeId = "12";
//		String cat2 = "0";
//		
//		int totalcnt = cs.getTotalCnt(0,contentTypeId, cat2);
//		model.addAttribute("totalcnt" , totalcnt);
//		
//		ArrayList<SidoDTO> sidoList = ss.getSelectAll();
//		model.addAttribute("sidoList" , sidoList);
//		
//		PageHandler handler = cs.getPaging(1, 0,contentTypeId, cat2);
//		model.addAttribute("handler" , handler);
//		
//		ArrayList<ContentDTO> list = cs.getSelectAllLatest(handler.getStartList(), handler.getEndList(), 0,contentTypeId, cat2);
//		model.addAttribute("contentList" , list);
//		
//		return "sights";
//	}
//	
//	
//	@ResponseBody // return값을 데이터로 주는 것
//	@RequestMapping(value="/sightslist_origin" , method=RequestMethod.GET)
//	public Map<String, Object> sightsList(@RequestParam(required=true) int currentPage, int sidoCode, String sortId) throws IOException{
//		
//		Map<String, Object> map  = new HashMap<>();
//		
//		String contentTypeId = "12";
//		String cat2 = "0";
//		
//		
//		int totalcnt = cs.getTotalCnt(sidoCode,contentTypeId, cat2);
//		map.put("totalcnt" , totalcnt);
//		
//		ArrayList<SidoDTO> sidoList = ss.getSelectAll();
//		map.put("sidoList" , sidoList);
//		
//		PageHandler handler = cs.getPaging(currentPage, sidoCode, contentTypeId, cat2);
//		map.put("handler" , handler);
//		
//	
//		
//		// 정렬 조건에 따른 리스트 출력
//		if(sortId.equals("sort1")) {
//			ArrayList<ContentDTO> list = cs.getSelectAllLatest(handler.getStartList(), handler.getEndList(), sidoCode, contentTypeId, cat2);
//			map.put("contentList" , list);
//		}else if(sortId.equals("sort2")) {
//			double lat1 = 37.55413145356766; // 위도
//			double lon1 = 126.92064990121993; // 경도
//			ArrayList<ContentDTO> list = cs.getSelectAllDistance(lat1, lon1, handler.getStartList(), handler.getEndList(), sidoCode, contentTypeId, cat2);
//			map.put("contentList" , list);
//		}else{
//			ArrayList<ContentDTO> list = cs.getSelectAllPopular(handler.getStartList(), handler.getEndList(), sidoCode, contentTypeId, cat2);
//			map.put("contentList" , list);
//		}
//		
//		return map;
//	}
//	
//	// 여행지 상세
//	@RequestMapping(value="/sightsDetail_origin" , method=RequestMethod.POST)
//	public String sightsDetail(@RequestParam(required=false) String contentId, Model model){
//		cs.getUpdateContentView(contentId);
//		ArrayList<ContentDTO> imglist = cs.getSelectImg(contentId);
//		model.addAttribute("imglist", imglist);
//		ContentDTO content = cs.getSelectOne(contentId);
//		model.addAttribute("content", content);
//		int likeNum = cs.getCountLike(contentId);
//		model.addAttribute("likeNum", likeNum);
//		
//		
//		String userId = "test02";
//		int mylikeNum = cs.getMycountLike(contentId, userId); // 0이면 좋아요X, 1이면 좋아요O
//		model.addAttribute("mylikeNum", mylikeNum);
//		return "sightsDetail";
//	}
//	
//	
//}
