package com.acorn.tour.map;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.tour.hotkok.HotkokDTO;

@Service
public class MapService {

	@Autowired
	MapRepository mapRepository;
	
	 public List<MapDTO> getAllMapInfo(String category) {		 		  
	        return mapRepository.getAllMapInfoByCategory(category);
	 }
	 
	 public List<MapDTO> getTourMap(String category){
		 return mapRepository.getAllMapInfoByCategory(category);
	 }
	 
	}