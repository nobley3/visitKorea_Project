package com.acorn.tour.review;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class ReviewController {
	
	
	@Autowired
	ReviewService serv;
	
	@Autowired
	HttpSession session;
	
	
	//등록
	@ResponseBody
	@RequestMapping(value="/reviewregister", method=RequestMethod.POST)
	public void register(String comment, String contentid) {
		String userId = (String)session.getAttribute("userId");
		serv.getInsertreviews(userId, comment, contentid);
	}
	
	//수정
	@ResponseBody
	@RequestMapping(value="/reviewupdate", method=RequestMethod.PUT)
	public void Update(@RequestBody ReviewDTO item) {
		serv.getUpdatereviews(item.getReviewcode(), item.getContent());
	}
	
	//삭제
	@ResponseBody
	@RequestMapping(value="/reviewdelete/{reviewcode}", method=RequestMethod.DELETE)
	public void delete(@PathVariable int reviewcode) {
		serv.getDeletereviews(reviewcode);
	}
	
	
	// 답글조회
	@ResponseBody
	@RequestMapping(value="/replyselect", method=RequestMethod.POST)
	public Map<String, Object> replyRegister(int parentcode) {
		Map<String, Object> map  = new HashMap<>();
		
		ArrayList<ReviewDTO> list = serv.getSelectReply(parentcode);
		map.put("replylist", list);
		
		return map;
	}
	
	// 답글등록
	@ResponseBody
	@RequestMapping(value="/replyregister", method=RequestMethod.POST)
	public void replyRegister(int parentcode, String content, String contentid) {
		String userId = (String)session.getAttribute("userId");
		ReviewDTO review = new ReviewDTO(userId, content, contentid, parentcode);
		serv.getInsertReply(review);
	}
	
	// 답글수정
	@ResponseBody
	@RequestMapping(value="/replyupdate", method=RequestMethod.POST)
	public void replyUpdate(int reviewcode, String content) {
		serv.getUpdateReply(reviewcode ,content );
	}
	

}
