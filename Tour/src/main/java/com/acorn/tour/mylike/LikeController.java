package com.acorn.tour.mylike;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.tour.paging.PageHandler;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


@Controller
public class LikeController {

	@Autowired
	LikeService ls;
	
	@Autowired
	HttpSession session;
	
	// 여행지 상세페이지 좋아요
	@ResponseBody
	@RequestMapping(value="/like" , method=RequestMethod.GET)
	public Map<String, Object> LikeControl(@RequestParam(required=false) String contentId, int mylikeNum){
		
		String userId = (String)session.getAttribute("userId");
		
		if(mylikeNum == 0) {
			ls.getUpdateContentLike(contentId, userId); // 좋아요 테이블에 삽입
		}else {
			ls.getDeleteContentLike(contentId, userId); // 좋아요 테이블에 삭제
		}
		
		Map<String, Object> map  = new HashMap<>();
		int likeNum = ls.getCountLike(contentId); // 게시물 좋아요 수 조회
		map.put("likeNum" , likeNum);
		
		return map;
	}
	
	// 마이페이지 좋아요 리스트
	@ResponseBody // return값을 데이터로 주는 것
	@RequestMapping(value="/mypagelikelist" , method=RequestMethod.GET)
	public Map<String, Object> mypagelikeList(@RequestParam(required=true) int currentPage) throws IOException{
		
		String userId = (String)session.getAttribute("userId");
		
		Map<String, Object> map  = new HashMap<>();
		
		ArrayList<LikeDTO> list = ls.getmyLike(userId);
		map.put("contentList", list);
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list);
		map.put("likeListjson", json);
		
		PageHandler handler = ls.getPaging(currentPage, userId);
		map.put("handler" , handler);
		
		return map;
	}
	
	// 마이페이지 좋아요 삭제
	@ResponseBody
	@RequestMapping(value="/deletemylike" , method=RequestMethod.POST)
    public void deletemycourse(@RequestParam(required=true)String contentid) {
		String userId = (String)session.getAttribute("userId");
		ls.getDeleteContentLike(contentid, userId);
    }
	
	
}
