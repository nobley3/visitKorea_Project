package com.acorn.tour.tourAlist;

import lombok.Data;

@Data
public class TourlistSpot {

	String rownum;
	String contentid;
	int contenttypeid;
	String title;
	String address;
	String ck;
	String firstimage;
	
	public TourlistSpot(String contentid, int contenttypeid, String rownum, String title, String address,String ck, String firstimage) {
		super();
		this.rownum = rownum;
		this.contentid=contentid;
		this.contenttypeid=contenttypeid;
		this.title = title;
		this.address = address;
		this.ck = ck;
		this.firstimage = firstimage;
	}
	
	public TourlistSpot(String contentid) {
		
		
	}
	public TourlistSpot() {
		// TODO Auto-generated constructor stub
	}
	
 
	
}
