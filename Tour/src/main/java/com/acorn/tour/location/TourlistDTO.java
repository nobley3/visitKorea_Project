package com.acorn.tour.location;

public class TourlistDTO {
	
	/* 관광지 DTO */
	

	String title;
	String overview;
	
	
	
	public String getTitle() {
		return title;
	}




	public void setTitle(String title) {
		this.title = title;
	}




	public String getOverview() {
		return overview;
	}




	public void setOverview(String overview) {
		this.overview = overview;
	}


	
	public TourlistDTO(String title, String overview) {
		super();
		this.title = title;
		this.overview = overview;
	}
	
	
	
	public TourlistDTO() {}
	
	
	
	@Override
	public String toString() {
		return "TourlistDTO [title=" + title + ", overview=" + overview + "]";
	}
	
	

}
