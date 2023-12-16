package com.acorn.tour.course;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor // 기본생성자
@AllArgsConstructor // 매개변수 있는 생성자
public class CourseDTO {

	String contentid; 
	String title; 
	int sidoCode; 
	String nickName; 
	String sigunguCode;
	String sigunguname; 
	String firstimage;
	
	String overview;
	int view_num;
	
	
	String subcontentid;
	int num;
	String subtitle;
	String address;
	String mapx;
	String mapy;
	
	
	
	
	
	// 리스트 표출 DTO
	public CourseDTO(String contentid, String title, int sidoCode, String nickName, String sigunguCode,
			String sigunguname, String firstimage) {
		super();
		this.contentid = contentid;
		this.title = title;
		this.sidoCode = sidoCode;
		this.nickName = nickName;
		this.sigunguCode = sigunguCode;
		this.sigunguname = sigunguname;
		this.firstimage = firstimage;
	}

	// 상세내용 DTO
	public CourseDTO(String contentid, String title, int sidoCode, String nickName, String sigunguCode,
			String sigunguname, String overview, int view_num) {
		super();
		this.contentid = contentid;
		this.title = title;
		this.sidoCode = sidoCode;
		this.nickName = nickName;
		this.sigunguCode = sigunguCode;
		this.sigunguname = sigunguname;
		this.overview = overview;
		this.view_num = view_num;
		
		
	}

	
}
