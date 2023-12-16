package com.acorn.tour.mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.acorn.tour.login.LoginService;
import com.acorn.tour.myQA.MyQADTO;
import com.acorn.tour.myQA.MyQAService;
import com.acorn.tour.mycourse.MycourseDTO;
import com.acorn.tour.mycourse.MycouseService;
import com.acorn.tour.mylike.LikeDTO;
import com.acorn.tour.mylike.LikeService;
import com.acorn.tour.myreview.MyReviewDTO;
import com.acorn.tour.myreview.MyReviewService;
import com.acorn.tour.paging.PageHandler;
import com.acorn.tour.review.ReviewDTO;
import com.acorn.tour.user.UserDTO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class MypageController {
	
	@Autowired
	LikeService ls;
	
	@Autowired
	MypageService ms;
	
	@Autowired
	MycouseService mcs;
	
	@Autowired
	LoginService logs;
	
	@Autowired
	MyQAService mqs;
	
	@Autowired
	MyReviewService mrs;
	
	@Autowired
	HttpSession session;

	// 마이페이지 메인
	@RequestMapping("/mypage.do")
    public String mypage(Model model) {
		
		String userId = (String)session.getAttribute("userId");
		ArrayList<LikeDTO> likelist = ls.getmyLike(userId);
		model.addAttribute("likesize", likelist.size()); // 총 데이터 건수
		
		ArrayList<MycourseDTO> courselist = mcs.getSelectMyCourse(userId);
		model.addAttribute("coursesize", courselist.size()); // 총 데이터 건수
		
		ArrayList<MyQADTO> qalist = mqs.getSelectMyQA(userId);
		model.addAttribute("qasize", qalist.size());
		
		ArrayList<MyReviewDTO> list = mrs.getSelectMyreview(userId, 0);
		ArrayList<MyReviewDTO> list2 = mrs.getSelectMyreview(userId, 1);
		model.addAttribute("reviewsize", list.size() + list2.size());
		
		UserDTO user = logs.getUser(userId);
		model.addAttribute("user", user);
		
        return "mypage";
    }
	
	
	// 마이페이지 좋아요 메인
	@RequestMapping("/mypagelike.do")
    public String mypagelike(Model model) {
		
		String userId = (String)session.getAttribute("userId");
		ArrayList<LikeDTO> list = ls.getmyLike(userId);
		model.addAttribute("contentList", list);
		model.addAttribute("listsize", list.size()); // 총 데이터 건수
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list);
		model.addAttribute("likeListjson", json);
		
		
		
		
		PageHandler handler = ls.getPaging(1, userId);
		model.addAttribute("handler" , handler);
        return "mypagelike";
    }
	
	
	// 마이페이지 나의코스 메인
	@RequestMapping("/mypagecourse.do")
    public String mypagecourse(Model model) {
		
		String userId = (String)session.getAttribute("userId");
		ArrayList<MycourseDTO> list = mcs.getSelectMyCourse(userId);
		model.addAttribute("courseList", list);
		model.addAttribute("listsize", list.size()); // 총 데이터 건수
		
		
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
		model.addAttribute("listimage", listimage);
		
		
		int distance = 0;
		ArrayList<Integer> distanceAll = new ArrayList<>();
		for(int i=0; i<list.size(); i++) {
			ArrayList<MycourseDTO> listCourse = mcs.getSelectMycourseList(list.get(i).getCoursecode()); // 코스 목록
			distance = mcs.haversineAll(listCourse);
			distanceAll.add(distance);
		}
		model.addAttribute("distanceAll", distanceAll);
		
		
		
		PageHandler handler = mcs.getPaging(1, userId);
		model.addAttribute("handler" , handler);
		
        return "mypagecourse";
    }
	
	
	
	// 마이페이지 여행톡 메인
	@RequestMapping("/mypagetalk.do")
    public String mypagetalk(Model model) {
		String userId = (String)session.getAttribute("userId");
		
		ArrayList<MyReviewDTO> list = mrs.getSelectMyreview(userId, 0);
		model.addAttribute("reviewlist", list);
		model.addAttribute("reviewsize", list.size());
		
		UserDTO user = logs.getUser(userId);
		model.addAttribute("user", user);
		
		PageHandler handler = mrs.getPaging(1, userId, 0);
		model.addAttribute("handler" , handler);
		
        return "mypagetalk";
    }
	
	// 마이페이지 문의하기 메인
	@RequestMapping("/mypageQA.do")
    public String mypageQA(Model model) {
		String userId = (String)session.getAttribute("userId");
		ArrayList<MyQADTO> list = mqs.getSelectMyQA(userId);
		model.addAttribute("myqalist", list);
		
		PageHandler handler = mqs.getPaging(1, userId);
		model.addAttribute("handler" , handler);
		
        return "mypageQA";
    }
}
