package com.acorn.tour.hotkok;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.tour.sido.SidoDTO;
import com.acorn.tour.sido.SidoService;

@Controller
public class HotkokController {

	@Autowired
	HotkokService hotkokService;
	
	@Autowired
	SidoService sidoService; 
		
	@GetMapping("/hotkok")
    public String getHotkok(Model model) {
        ArrayList<HotkokDTO> list = hotkokService.getTravelHotkok(1, 1);
        model.addAttribute("list", list);

        ArrayList<SidoDTO> sidoList = sidoService.getSelectAll();
        model.addAttribute("sidoList", sidoList);

        return "hotkok";
	}
	
 	@ResponseBody
    @GetMapping("/placeHotkok")
    public Map<String, Object> placeData(@RequestParam int sidocode,  int index) {
        Map<String, Object> map = new HashMap<>();
        
        ArrayList<HotkokDTO> list = hotkokService.getTravelHotkok(sidocode, index);
        map.put("list", list);             
       
        ArrayList<SidoDTO> sidoList = sidoService.getSelectAll();
        map.put("sidoList", sidoList);

        return map;
    }

 	@ResponseBody
    @GetMapping("/restHotkok")
    public Map<String, Object> restData(@RequestParam int sidocode, int index) {
        Map<String, Object> map = new HashMap<>();
        ArrayList<HotkokDTO> list = hotkokService.getFoodHotkok(sidocode, index);
        map.put("list", list);
        
        ArrayList<SidoDTO> sidoList = sidoService.getSelectAll();
        map.put("sidoList", sidoList);
        
        return map;
    }
}
