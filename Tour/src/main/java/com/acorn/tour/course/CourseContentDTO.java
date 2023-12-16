package com.acorn.tour.course;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor // 기본생성자
@AllArgsConstructor // 매개변수 있는 생성자
public class CourseContentDTO {

	String contentid; 
	String subcontentid;
	int num;
	String subtitle;
	String address;
	String mapx;
	String mapy;
	String firstimage;
	
	// 거리계산을 담을 변수
	Double distance;
	
	String contenttypeid;
	String cat2;

	// 코스 목록 표출할 DTO
	public CourseContentDTO(String contentid, String subcontentid, int num, String subtitle, String address,
			String mapx, String mapy, String firstimage, String contenttypeid, String cat2) {
		super();
		this.contentid = contentid;
		this.subcontentid = subcontentid;
		this.num = num;
		this.subtitle = subtitle;
		this.address = address;
		this.mapx = mapx;
		this.mapy = mapy;
		this.firstimage = firstimage;
		this.contenttypeid = contenttypeid;
		this.cat2 = cat2;
	}
	
	// 코스 목록 표출할 DTO
		public CourseContentDTO(String contentid, String subcontentid, int num, String subtitle, String address,
				String mapx, String mapy, String firstimage, Double distance) {
			super();
			this.contentid = contentid;
			this.subcontentid = subcontentid;
			this.num = num;
			this.subtitle = subtitle;
			this.address = address;
			this.mapx = mapx;
			this.mapy = mapy;
			this.firstimage = firstimage;
			this.distance = distance;
			
		}

	
	
	
	
}
