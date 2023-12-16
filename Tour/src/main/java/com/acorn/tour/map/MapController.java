package com.acorn.tour.map;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.tour.hotkok.HotkokDTO;

@Controller
public class MapController {

	@Autowired
	MapService mapService;
	
	@GetMapping("/map")
	public String getMap(Model model  ) {			 
	    List<MapDTO> allMapInfo = mapService.getAllMapInfo("주변 여행지");
	    model.addAttribute("list", allMapInfo);
		return "map";
	}	

	@ResponseBody
	@GetMapping("/getMarkers")
	public List<MapDTO> getMarkers(@RequestParam String category) {      
	    List<MapDTO> allMapInfo = mapService.getAllMapInfo(category);
	    return filterMapData(allMapInfo);
	}
	
	// 주변 여행지
	@ResponseBody
	@GetMapping("/tour")
	public Map<String, Object> tourData(@RequestParam String category) {
	    Map<String, Object> map = new HashMap<>();
	    
	    List<MapDTO> list = mapService.getAllMapInfo(category);
	    map.put("list", list);
	    
	    ArrayList<MapDTO> tourList = new ArrayList<>();
	    map.put("tourList", tourList);
	    return map;
	}

	private List<MapDTO> filterMapData(List<MapDTO> allMapInfo) {	    
	    List<MapDTO> filteredMapData = new ArrayList<>();
	    // 학원 위도 경도
	    double targetLatitude = 37.5499076;
	    double targetLongitude = 126.9218479;
	    
	    for (MapDTO mapDTO : allMapInfo) {
	        double distance = haversine(Double.parseDouble(mapDTO.getMapY()), Double.parseDouble(mapDTO.getMapX()), targetLatitude, targetLongitude);
	        	        
	        if (distance < 1.0) {  // 1km 이내의 데이터만 추가
	            filteredMapData.add(mapDTO);
	        }
	    }
	    return filteredMapData;
	}	

	
	private double haversine(double lat1, double lon1, double lat2, double lon2) {
	    final int R = 6371; // 지구의 반지름 (단위: km)
	    
	    double dLat = Math.toRadians(lat2 - lat1);
	    double dLon = Math.toRadians(lon2 - lon1);
	    
	    double a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
	               Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) *
	               Math.sin(dLon / 2) * Math.sin(dLon / 2);
	    
	    double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
	    
	    return R * c;
	}
}