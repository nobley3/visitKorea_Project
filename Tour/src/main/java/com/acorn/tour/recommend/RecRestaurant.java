package com.acorn.tour.recommend;

import lombok.Data;

@Data 
public class RecRestaurant {
	String contentid;
	int contenttypeid;
	String cat1;
	String cat2;
	String cat3;
	String title;
	int sidocode;
	String sigungucode;
	String address;
	String createdtime;
	String modifiedtime;
	String mapx;
	String mapy;
	float mlevel;
	String firstimage;
	String mcategory;
	String scategory;
	int searchcount;
	String overview;
}
