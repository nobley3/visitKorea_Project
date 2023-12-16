package com.acorn.tour.recommend;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ThreadLocalRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.tour.recommend.RecRepository;
import com.acorn.tour.recommend.RecSpot;
import com.acorn.tour.sido.SigunguDTO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class RecController {
	@Autowired 
	RecRepository rec;
	
	@Autowired
	RecService service;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping(value="/mycourse", method = RequestMethod.GET)
	public String recview(Model model) {
		String userId = (String)session.getAttribute("userId");
		if(userId==null) {
			return "viewlike";
		}
		
		List<RecCourse> courseList = rec.getMyRecTour(userId);
	
		model.addAttribute("cList", courseList);
		return "viewlike"; 
		
	}
	@RequestMapping(value="/recTour", method = RequestMethod.GET)
	public String recommed() {
		return "recTour";
	}
	@ResponseBody
	@RequestMapping(value="/recTour2", method = RequestMethod.GET)
	public List<SigunguDTO> home2( int value) {
		List<SigunguDTO> sList = rec.selectList(value);
		return sList;   
	}
	
	@ResponseBody
	@RequestMapping(value="/recTour3", method = RequestMethod.GET)
	public List<RecSpot> place10(){
		List<RecSpot> rList = rec.getPlace10();
		return rList;
	}
	
	
	@ResponseBody
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/recList", method = RequestMethod.POST)
	public String getRecommendationList(@RequestBody String dataList) {
		String userId = (String)session.getAttribute("userId");
		String decodedIds;
		String currentDate = (LocalDate.now()).toString();
		String courseid="";
		try {
			courseid= (UUID.randomUUID()).toString();
			decodedIds = URLDecoder.decode(dataList, "UTF-8");
			String[] infoArray=decodedIds.split("=");
			
		    int selectedArea =Integer.parseInt(infoArray[2]);
		    int selectedDay =Integer.parseInt(infoArray[4]);
		    String[] idsArray = infoArray[6].split(":");
		    
	        int count = (selectedDay+1)*2;
           
		    String area = service.getAreaName(selectedArea);
		    String courseName=area+" 여행코스";
		    Map<String, Object> recInfo = service.getRecInfo(count, idsArray);
		    ArrayList<RecSpot> allRecSpots = (ArrayList<RecSpot>) recInfo.get("spot");
		    ArrayList<RecRestaurant> allRecRestaurant = (ArrayList<RecRestaurant>) recInfo.get("restaurant");
		
	   
		    ArrayList<Object> minDistance = new ArrayList<>();
			service.manipulateLists(minDistance, allRecSpots, allRecRestaurant);
		
            String totalDistance = service.getTotalDistance(minDistance);
            String courseList ="";
            for(Object obj:minDistance) {
            	courseList +=service.getTourCourse(obj) + ":";
            }
          
            String firstImg = ((RecSpot)minDistance.get(0)).firstimage;
            String secdImg = ((RecRestaurant)minDistance.get(1)).firstimage;
            String thirImg = ((RecSpot)minDistance.get(2)).firstimage;
            
            System.out.println(firstImg);
            System.out.println(secdImg);
            System.out.println(thirImg);
            RecCourse mycourse = new RecCourse(courseid,userId,courseName,selectedDay,courseList,totalDistance,area,currentDate,firstImg,secdImg,thirImg);
            rec.insertRecTour(mycourse);
		

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			System.out.println("error");
		}
        return  courseid ;
    }
	@SuppressWarnings("unused")
	@RequestMapping(value="/myRecommendCourse" , method = RequestMethod.GET)
	public String viewTourMap(@RequestParam(required=false) String courseId, Model model){
		String userId = (String)session.getAttribute("userId");
		//사용자 닉네임
		String nickname = rec.getUserNickname(userId);
		model.addAttribute("nickname", nickname);
		//사용자가 선택한 기간에 따라 데이터의 수가 달라짐
		
		RecCourse myRecTour = rec.viewMyRecTour(courseId);
		model.addAttribute("myRecTour", myRecTour);
		int duration = myRecTour.duration;
		String courseContentIds = myRecTour.course;
		String[] courseContentIdsArr = courseContentIds.split(":");
		ArrayList<RecSpot> spots = new ArrayList<>();
		ArrayList<RecRestaurant> restaurants = new ArrayList<>();
		ArrayList<Object> all = new ArrayList<>();
		
		for(int i=0; i<courseContentIdsArr.length; i++) {
			if ((i % 2) == 0) {
		        spots.add((RecSpot)(rec.recSpot(courseContentIdsArr[i])).get(0));
		        all.add((RecSpot)(rec.recSpot(courseContentIdsArr[i])).get(0));
		    } else {
		    	restaurants.add((RecRestaurant)(rec.recFood(courseContentIdsArr[i])).get(0)); 
		    	all.add((RecRestaurant)(rec.recFood(courseContentIdsArr[i])).get(0));
		    }
		}
		
		model.addAttribute("spots", spots);
		model.addAttribute("restaurants", restaurants);
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(all);
		model.addAttribute("courseListjson", json);
		
		
		if(duration ==0) {
			return "recMapDay1";
		}
		else if(duration ==1) {
			return "recMapDay2";
		}else {
			
			return "recMapDay3"; 
		}
	
	
	}


}
 