package com.acorn.tour.mycourse;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor // 기본생성자
@AllArgsConstructor // 매개변수 있는 생성자
public class MycourseDTO {

	String userId;
	String coursecode;
	String coursename;
	int coursenum;
	String coursecontent;
	String firstimage;
	
	// 코스 상세 리스트
	String contentid;
	int contentnum;
	String title;
	String address;
	String mapx;
	String mapy;
	Double distance;
	String contenttypeid;
	String cat2;
	
	
	public MycourseDTO(String userId, String coursecode, String coursename, String coursecontent) {
		super();
		this.userId = userId;
		this.coursecode = coursecode;
		this.coursename = coursename;
		this.coursecontent = coursecontent;
	}


	public MycourseDTO(String userId, String coursecode, String coursename, int coursenum, String coursecontent,
			String firstimage) {
		super();
		this.userId = userId;
		this.coursecode = coursecode;
		this.coursename = coursename;
		this.coursenum = coursenum;
		this.coursecontent = coursecontent;
		this.firstimage = firstimage;
	}


	public MycourseDTO(String coursecode, String contentid, int contentnum) {
		super();
		this.coursecode = coursecode;
		this.contentid = contentid;
		this.contentnum = contentnum;
	}


	// 나의 코스 상세리스트
	public MycourseDTO(String coursecode, String contentid, int contentnum,  String title,
			String address, String firstimage,  String mapx, String mapy, String contenttypeid, String cat2) {
		super();
		this.coursecode = coursecode;
		this.firstimage = firstimage;
		this.contentid = contentid;
		this.contentnum = contentnum;
		this.title = title;
		this.address = address;
		this.mapx = mapx;
		this.mapy = mapy;
		this.contenttypeid = contenttypeid;
		this.cat2 = cat2;
	}
	
	// 나의 코스 상세리스트 거리비교
	public MycourseDTO(String coursecode, String contentid, int contentnum,  String title,
			String address, String firstimage,  String mapx, String mapy, String contenttypeid, String cat2, Double distance ) {
		super();
		this.coursecode = coursecode;
		this.firstimage = firstimage;
		this.contentid = contentid;
		this.contentnum = contentnum;
		this.title = title;
		this.address = address;
		this.mapx = mapx;
		this.mapy = mapy;
		this.contenttypeid = contenttypeid;
		this.cat2 = cat2;
		this.distance = distance;
	}
	
	
	
	
	
	
}
