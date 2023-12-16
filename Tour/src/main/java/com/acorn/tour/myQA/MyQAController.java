package com.acorn.tour.myQA;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.tour.paging.PageHandler;

@Controller
public class MyQAController {

	@Autowired
	MyQAService mqs;
	
	@Autowired
	HttpSession session;
	
	@ResponseBody
	@RequestMapping(value="/mypageQAlist", method=RequestMethod.GET)
    public Map<String, Object> mypageQA(@RequestParam(required=true) int currentPage) {
		String userId = (String)session.getAttribute("userId");
		Map<String, Object> map  = new HashMap<>();
		
		ArrayList<MyQADTO> list = mqs.getSelectMyQA(userId);
		map.put("myqalist", list);
		
		PageHandler handler = mqs.getPaging(currentPage, userId);
		map.put("handler" , handler);
		
        return map;
    }
	
	
	
	
	@RequestMapping("/mypageQAregister")
    public String mypageQA() {
        return "mypageQARegister";
    }
	
	
	@RequestMapping(value="/myQAregister" , method=RequestMethod.POST)
    public String insertmyQA(@RequestParam(required=true) String qatitle, String qacontent) {
		String userid = (String)session.getAttribute("userId");
		String qafileurl = ""; // 후에 파일첨부 해결 후 바꿀 것
		
		MyQADTO item = new MyQADTO(userid, qatitle, qacontent, qafileurl );
		mqs.getInsertMyQA(item);
		return "redirect:/mypageQA.do";
    }
	
	@RequestMapping("/mypageQAupdate")
    public String mypageQAupdate(String qacode, Model model) {
		MyQADTO item = mqs.getSelectOneMyQA(qacode);
		model.addAttribute("item", item);
		
        return "mypageQAupdate";
    }
	
	@RequestMapping(value="/myQAupdate" , method=RequestMethod.POST)
    public String updatemyQA(@RequestParam(required=true) String qacode, String qatitle, String qacontent) {
		String userid = (String)session.getAttribute("userId");
		String qafileurl = ""; // 후에 파일첨부 해결 후 바꿀 것
				
		MyQADTO item = new MyQADTO(qacode, userid, qatitle, qacontent, qafileurl );
		mqs.getUpdateMyQA(item);
		return "redirect:/mypageQA.do";
    }
	
	@ResponseBody
	@RequestMapping(value="/myQAdelete" , method=RequestMethod.POST)
    public void deletemyQA(@RequestParam(required=true) String qacode) {
		mqs.getDeleteMyQA(qacode);
    }
	
	
}
