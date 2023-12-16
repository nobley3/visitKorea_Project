package com.acorn.tour.location;

public class RestaurantDTO {
	

	String title;
	String restaurant;
	String address;
	String contenttypeid;
	String cat2;
	String contentid;

	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getRestaurant() {
		return restaurant;
	}



	public void setRestaurant(String restaurant) {
		this.restaurant = restaurant;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getContenttypeid() {
		return contenttypeid;
	}



	public void setContenttypeid(String contenttypeid) {
		this.contenttypeid = contenttypeid;
	}



	public String getCat2() {
		return cat2;
	}



	public void setCat2(String cat2) {
		this.cat2 = cat2;
	}

	
	public String getContentid() {
		return contentid;
	}



	public void setContentid(String contentid) {
		this.contentid = contentid;
	}
	
	public RestaurantDTO(String title, String restaurant, String address, String contenttypeid, String cat2, String contentid) {
		super();
		this.title = title;
		this.restaurant = restaurant;
		this.address = address;
		this.contenttypeid = contenttypeid;
		this.cat2 = cat2;
		this.contentid = contentid;
	}


	
	public RestaurantDTO() {}



	@Override
	public String toString() {
		return "RestaurantDTO [title=" + title + ", restaurant=" + restaurant + ", address=" + address
				+ ", contenttypeid=" + contenttypeid + ", cat2=" + cat2 + ", contentid=" + contentid + "]";
	}
	
	

	
	

}
