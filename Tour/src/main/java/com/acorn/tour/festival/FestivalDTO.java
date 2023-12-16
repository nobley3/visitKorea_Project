package com.acorn.tour.festival;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor // 기본생성자
@AllArgsConstructor // 매개변수 있는 생성자
public class FestivalDTO {
	int num;
	String contentid; // 게시물 ID
    int contenttypeid; // 게시물 유형 (장소/축제/공연 등)
    String cat1code; // 대분류
    String cat2code; // 중분류
    String cat3code; // 소분류
    String title; // 게시물 제목
    int sidoCode; // 시/도 코드
    String nickName; // 시도별칭
    String sigunguCode;   // 시/군/구 코드
    String sigunguname; // 시군구명
    String address;  // 주소
    String tel;  // 전화번호
    String createdtime; // 생성시간
    String modifiedtime; // 수정시간
    String mapx;  // 지리적 경도
    String mapy;  // 지리적 위도
    String mlevel; // 지도레벨
    String firstimage;
    String firstimage2;
    int view_num;
    String overview; // 상세내용
    String homepage; // 홈페이지
    double distance; // 현재 위치와의 거리
    
    //행사 추가 정보
    String eventstartdate; // 행사 시작일
    String eventenddate; // 행사 종료일
    String sponsor1; 
    String sponsor2; 
    String playtime;
    String eventplace; 
    String agelimit; 
    String usetimefestival; 
    
    
    
    // 최신순, 인기순 DTO 여행지
	public FestivalDTO(String contentid, String title, int sidoCode, String nickName,
			String sigunguCode, String sigunguname,	String firstimage) {
		super();
		
		this.contentid = contentid;
		this.title = title;
		this.sidoCode = sidoCode;
		this.nickName = nickName;
		this.sigunguCode = sigunguCode;
		this.sigunguname = sigunguname;
		this.firstimage = firstimage;
	}
	
	
	// 거리 계산을 위한 DTO
	public FestivalDTO(String contentid, String mapx, String mapy) {
		super();
		this.contentid = contentid;
		this.mapx = mapx;
		this.mapy = mapy;
	}
	// 거리별 정렬을 위한 DTO
	public FestivalDTO(String contentid, double distance) {
		super();
		this.contentid = contentid;
		this.distance = distance;
	}
	// 거리순 DTO 여행지
	public FestivalDTO(String contentid, String title, int sidoCode, String nickName, String sigunguCode,
			String sigunguname, String firstimage, double distance) {
		super();
		this.contentid = contentid;
		this.title = title;
		this.sidoCode = sidoCode;
		this.nickName = nickName;
		this.sigunguCode = sigunguCode;
		this.sigunguname = sigunguname;
		this.firstimage = firstimage;
		this.distance = distance;
	}

	// 상세페이지 DTO
	public FestivalDTO(String contentid, String title, int sidoCode, String nickName, String sigunguCode, String sigunguname, String address,
			String tel, String mapx, String mapy, String firstimage, int view_num, String homepage, String overview, 
			String eventstartdate, String eventenddate, String sponsor1, String sponsor2, String playtime, String eventplace,
			String agelimit, String usetimefestival) {
		super();
		
		this.contentid = contentid;
		this.title = title;
		this.sidoCode = sidoCode;
		this.nickName = nickName;
		this.sigunguCode = sigunguCode;
		this.sigunguname = sigunguname;
		this.address = address;
		this.tel = tel;
		this.mapx = mapx;
		this.mapy = mapy;
		this.firstimage = firstimage;
		this.view_num = view_num;
		this.homepage = homepage;
		this.overview = overview;
		this.eventstartdate = eventstartdate;
		this.eventenddate = eventenddate;
		this.sponsor1 = sponsor1;
		this.sponsor2 = sponsor2;
		this.playtime = playtime;
		this.eventplace = eventplace;
		this.agelimit = agelimit;
		this.usetimefestival = usetimefestival;
	}
	
	
	
	
	
	
	
	
	
	
	
	
    
    
	
}
