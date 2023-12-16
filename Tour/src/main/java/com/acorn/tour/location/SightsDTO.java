package com.acorn.tour.location;

public class SightsDTO {
	
	
	String title;
	String sights;
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



	public String getSights() {
		return sights;
	}



	public void setSights(String sights) {
		this.sights = sights;
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
	
	public SightsDTO(String title, String sights, String address, String contenttypeid, String cat2, String contentid) {
		super();
		this.title = title;
		this.sights = sights;
		this.address = address;
		this.contenttypeid = contenttypeid;
		this.cat2 = cat2;
		this.contentid = contentid;
	}
	
	
	public SightsDTO() {}



	@Override
	public String toString() {
		return "SightsDTO [title=" + title + ", sights=" + sights + ", address=" + address + ", contenttypeid="
				+ contenttypeid + ", cat2=" + cat2 + ", contentid=" + contentid + "]";
	}




}
