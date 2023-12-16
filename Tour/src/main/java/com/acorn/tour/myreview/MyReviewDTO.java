package com.acorn.tour.myreview;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor // 기본생성자
@AllArgsConstructor // 매개변수 있는 생성자
public class MyReviewDTO {
	
	
	int reviewcode;
	String userid;
	String content;
	String writeday;
	String contentid;
	int parentcode;
	String title;
	String contenttypeid;
	String cat2;
	// 마이페이지 여행톡 조회 DTO
	
	
	
	
}
