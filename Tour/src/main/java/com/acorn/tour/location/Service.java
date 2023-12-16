package com.acorn.tour.location;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component
public class Service {
	
	
	@Autowired
	DAO dao;
	
	
	public TourlistDTO getTour(String area) {
		
		TourlistDTO tour = dao.Tourlist(area);
		
		return tour;
		
	}
	
	
	public CulturalDTO getCulture(String area) {
		
		CulturalDTO cultural = dao.Cultural(area);
		return cultural;
		
	}
	
	
	public AttractionDTO getAttraction(String area) {
		
		AttractionDTO attraction = dao.Attraction(area);
		return attraction;
		
	}
	
	
	
	public ArrayList<SightsDTO> getSights(String area) {
		
		ArrayList<SightsDTO> sights = dao.Sights(area);
		return sights;
		
	}
	
	
	
	public ArrayList<RestaurantDTO> getRestaurant(String area) {
		
		//System.out.println(dao.Restaurant());
		ArrayList<RestaurantDTO> restaurant = dao.Restaurant(area);
		return restaurant;
		
	}
	
	
	public ArrayList<PosterDTO> getPoster(String area) {
		System.out.println(dao.poster(area));
		ArrayList<PosterDTO> poster = dao.poster(area);
		return poster;
	}
	

}
