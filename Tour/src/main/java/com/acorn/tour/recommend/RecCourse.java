package com.acorn.tour.recommend;

import java.time.LocalDate;
import java.util.UUID;

import lombok.Data;

@Data
public class RecCourse {
	String courseId; // 코스 아이디
	String userId; // 사용자 아이디
	String courseName;// 코스명
	int duration; // 0:당일치기, 1:1박2일, 2:2박3일
	String course; // contentid목록
	String totalDistance; // 총거리
	String locations; //지역명
	String createDate; //만든날짜
	String firstImg;
	String secondImg;
	String thirdImg;
	public RecCourse(String courseId, String userId, String courseName, int duration, String course,
			String totalDistance, String locations, String createDate, String firstImg, String secondImg,
			String thirdImg) {
		super();
		this.courseId = courseId;
		this.userId = userId;
		this.courseName = courseName;
		this.duration = duration;
		this.course = course;
		this.totalDistance = totalDistance;
		this.locations = locations;
		this.createDate = createDate;
		this.firstImg = firstImg;
		this.secondImg = secondImg;
		this.thirdImg = thirdImg;
	}
	
	
	

}

