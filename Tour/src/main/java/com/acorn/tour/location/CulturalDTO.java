package com.acorn.tour.location;

public class CulturalDTO {
	
	/* 문화시설 DTO */
	

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
	
	
	
	public CulturalDTO(String title, String overview) {
		super();
		this.title = title;
		this.overview = overview;
	}
	
	
	//기본 생성자
	public CulturalDTO() {}



	@Override
	public String toString() {
		return "CulturalDTO [title=" + title + ", overview=" + overview + "]";
	}
	
	

}
