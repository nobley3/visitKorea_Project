package com.acorn.tour.map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MapDTO {
	String contentId;
	int contentTypeId;
	String cat2;
	String cat3;
	String title;
	int sidocode;
	String sigunguCode;
	String firstimage;
	String mapX;
	String mapY;
}
