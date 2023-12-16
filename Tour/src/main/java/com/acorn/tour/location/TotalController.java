package com.acorn.tour.location;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class TotalController {
	
	
	@Autowired
	Service serv;
	
	@ResponseBody
	@RequestMapping("/locationpageD")
	public Map<String, Object>  test2(String area){
		
		Map<String, Object> map  = new HashMap<>();
		
	
		if( area == null)
			area="서울특별시";
		
		TourlistDTO tour = serv.getTour(area);
		CulturalDTO cultural = serv.getCulture(area);
		AttractionDTO attraction = serv.getAttraction(area);
		
		
		ArrayList<SightsDTO> sights = serv.getSights(area);
		ArrayList<RestaurantDTO> restaurant = serv.getRestaurant(area);
		ArrayList<PosterDTO> poster = serv.getPoster(area);
		
		
		map.put("tour", tour);
		map.put("cultural", cultural);
		map.put("attraction", attraction);
		map.put("sights", sights);
		map.put("restaurant", restaurant);
		map.put("poster", poster);
		
		
		return map;	
	}
	
	
	//subtitle 특별한 가을 식물원 조회
	@RequestMapping("/locationpage")
	public String test1(Model model, String area) {
		
		if( area == null)
			area="서울특별시";
		
		TourlistDTO tour = serv.getTour(area);
		CulturalDTO cultural = serv.getCulture(area);
		AttractionDTO attraction = serv.getAttraction(area);
		
		
		ArrayList<SightsDTO> sights = serv.getSights(area);
		ArrayList<RestaurantDTO> restaurant = serv.getRestaurant(area);
		ArrayList<PosterDTO> poster = serv.getPoster(area);
		
		
		

		model.addAttribute("tour", tour);
		model.addAttribute("cultural", cultural);
		model.addAttribute("attraction", attraction);
		
		
		model.addAttribute("sights", sights);
		model.addAttribute("restaurant", restaurant);
		model.addAttribute("poster", poster);		
		model.addAttribute("cnt", poster.size());		//포스터 이미지 사이즈
		
		
		
		return "locationmodify";
	}
	

}
