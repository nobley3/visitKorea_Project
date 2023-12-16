package com.acorn.tour.location;

public class PosterDTO {
	

	String firstimage;
	String title;
	String eventstartdate;
	String eventenddate;
	String address;

	
	
	public PosterDTO(String firstimage, String title, String eventstartdate, String eventenddate, String address) {
		super();
		this.firstimage = firstimage;
		this.title = title;
		this.eventstartdate = eventstartdate;
		this.eventenddate = eventenddate;
		this.address = address;
	}

	
	// 기본 생성자
	public PosterDTO() {}
	
	
	
	public String getFirstimage() {
		return firstimage;
	}



	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getEventstartdate() {
		return eventstartdate;
	}



	public void setEventstartdate(String eventstartdate) {
		this.eventstartdate = eventstartdate;
	}



	public String getEventenddate() {
		return eventenddate;
	}



	public void setEventenddate(String eventenddate) {
		this.eventenddate = eventenddate;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	@Override
	public String toString() {
		return "PosterDTO [firstimage=" + firstimage + ", title=" + title + ", eventstartdate=" + eventstartdate
				+ ", eventenddate=" + eventenddate + ", address=" + address + "]";
	}
	

}
