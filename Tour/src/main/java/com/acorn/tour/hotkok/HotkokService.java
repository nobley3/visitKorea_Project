package com.acorn.tour.hotkok;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HotkokService {
	
	@Autowired
	HotkokRepository hotkokRepository;
	
	public ArrayList<HotkokDTO> getTravelHotkok(int sidocode, int index) {		
	    ArrayList<HotkokDTO> hotkok = hotkokRepository.getTravelInfo(sidocode, index);
	
	    return hotkok;
	}
	
	public ArrayList<HotkokDTO> getFoodHotkok(int sidocode, int index){
		ArrayList<HotkokDTO> hotkok = hotkokRepository.getFoodInfo(sidocode, index);
		
		return hotkok;
	}
}