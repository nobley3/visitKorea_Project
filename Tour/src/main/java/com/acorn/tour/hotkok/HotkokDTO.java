package com.acorn.tour.hotkok;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor 
@AllArgsConstructor 
public class HotkokDTO {
	int sidocode;
	String nickName;
	String contentid;
	String title;
	String sigunguCode;
	String sigunguName;
	String firstimage;
	String searchCount;	
}
