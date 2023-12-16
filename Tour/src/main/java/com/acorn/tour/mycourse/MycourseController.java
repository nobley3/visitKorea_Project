package com.acorn.tour.mycourse;

import java.io.IOException;
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
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class MycourseController {

	@Autowired
	MycouseService mcs;
	
	@Autowired
	HttpSession session;
	
	
	

	@ResponseBody // return값을 데이터로 주는 것
	@RequestMapping(value="/mypagecourselist" , method=RequestMethod.GET)
	public Map<String, Object> mypagecourseList(@RequestParam(required=true) int currentPage) throws IOException{
		
		String userId = (String)session.getAttribute("userId");
		
		Map<String, Object> map  = new HashMap<>();
		
		ArrayList<MycourseDTO> list = mcs.getSelectMyCourse(userId);
		map.put("courseList", list);
		
		
		ArrayList<String> listimage = new ArrayList<>();
		for(int i = 0; i< list.size(); i++) {
			ArrayList<MycourseDTO> courselist = mcs.getSelectMycourseList(list.get(i).getCoursecode());
			if(courselist.size() == 0) {
				listimage.add("https://korean.visitkorea.or.kr/resources/images/common/no_img_01.png");
			}else if(courselist.get(0).getFirstimage() == null){
				listimage.add("https://korean.visitkorea.or.kr/resources/images/common/no_img_01.png");
			}else {
				listimage.add(courselist.get(0).getFirstimage());
			}
		}
		map.put("listimage", listimage);
		
		
		
		int distance = 0;
		ArrayList<Integer> distanceAll = new ArrayList<>();
		for(int i=0; i<list.size(); i++) {
			ArrayList<MycourseDTO> listCourse = mcs.getSelectMycourseList(list.get(i).getCoursecode()); // 코스 목록
			distance = mcs.haversineAll(listCourse);
			distanceAll.add(distance);
		}
		map.put("distanceAll", distanceAll);
		
		PageHandler handler = mcs.getPaging(currentPage, userId);
		map.put("handler" , handler);
		
		return map;
	}
		
		
	@ResponseBody
	@RequestMapping(value="/insertmycourse" , method=RequestMethod.POST)
    public void insertmycourse(@RequestParam(required=true)String courseName) {
		String userId = (String)session.getAttribute("userId");
		mcs.getInsertMyCourse(userId, courseName);
    }
	
	@ResponseBody
	@RequestMapping(value="/deletemycourse" , method=RequestMethod.POST)
    public void deletemycourse(@RequestParam(required=true)String coursecode) {
		String userId = (String)session.getAttribute("userId");
		mcs.getDeleteMyCourse(userId, coursecode);
    }
	
	@RequestMapping(value="/mypagecoursedetail" , method=RequestMethod.GET)
	public String mypagecourseDetail(@RequestParam(required=true) String coursecode, Model model){
		String userId = (String)session.getAttribute("userId");
		MycourseDTO item = mcs.getSelectOneMyCourse(userId, coursecode);
		model.addAttribute("courseDetail", item);
		
		ArrayList<MycourseDTO> list = mcs.getSelectMycourseList(coursecode);
		model.addAttribute("courseList", list);
		
		int distanceAll = mcs.haversineAll(list);
		model.addAttribute("distanceAll", distanceAll);
		
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list);
		model.addAttribute("courseListjson", json);
		
		return "mypagecourseDetail";
	}
	
	// 코스 내용 수정
	@RequestMapping(value="/updatemycourse" , method=RequestMethod.POST)
	public String mypagecourseDetail(@RequestParam(required=true) String coursecode, String coursename, String coursecontent){
		String userId = (String)session.getAttribute("userId");
		MycourseDTO item = new MycourseDTO(userId, coursecode, coursename, coursecontent);
		mcs.getUpdateMyCourse(item);
		return "redirect:/mypagecoursedetail?coursecode=" + coursecode;
	}
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@ResponseBody // return값을 데이터로 주는 것
	@RequestMapping(value="/mycourselist" , method=RequestMethod.GET)
	public Map<String, Object> selectMyCourseList(){
		
		String userId = (String)session.getAttribute("userId");
		
		Map<String, Object> map  = new HashMap<>();
		ArrayList<MycourseDTO> list = mcs.getSelectMyCourse(userId);
		map.put("mycourseList", list);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/insertmycourselist" , method=RequestMethod.POST)
	public Integer insertmycourselist(@RequestParam(required=true) String coursecode, String contentId ) {
		int result = mcs.getCountInsertMycourseList(coursecode, contentId);
		if(result == 0 ) {
			mcs.getInsertMyCourseList(coursecode, contentId);
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/deletemycourselist" , method=RequestMethod.GET)
	public void deletemycourselist(@RequestParam(required=true) String coursecode, String contentid ) {
		mcs.getDeleteMyCourseList(coursecode, contentid);
	}
}
