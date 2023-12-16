package com.acorn.tour.location;

public class AttractionDTO {
	
	
	/* 축제공연행사 DTO */
	

	String title;
	String overview;
	
	
	
	public AttractionDTO() {}
	
	
	
	public AttractionDTO(String title, String overview) {
		super();
		this.title = title;
		this.overview = overview;
	}

	
	
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



	
	@Override
	public String toString() {
		return "AttractionDTO [title=" + title + ", overview=" + overview + "]";
	}
	

}
