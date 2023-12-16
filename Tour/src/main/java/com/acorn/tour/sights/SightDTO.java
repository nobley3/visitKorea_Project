package com.acorn.tour.sights;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor // 기본생성자
@AllArgsConstructor // 매개변수 있는 생성자
public class SightDTO {
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
    String homepage; // 홈페이진
    double distance; // 현재 위치와의 거리
    
    String eventstartdate; // 행사 시작일
    String eventenddate; // 행사 종료일
    
    // 여행지 추가 정보
    String infocenter;
    String restdate;
    String expguide;
    String usetime;
    String parking;
    
    // 이미지 
    String imgid;
    String imgurl;
    String imgnum;
    
    // 최신순, 인기순 DTO 여행지
	public SightDTO(String contentid, String title, int sidoCode, String nickName,
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
	public SightDTO(String contentid, String mapx, String mapy) {
		super();
		this.contentid = contentid;
		this.mapx = mapx;
		this.mapy = mapy;
	}
	// 거리별 정렬을 위한 DTO
	public SightDTO(String contentid, double distance) {
		super();
		this.contentid = contentid;
		this.distance = distance;
	}
	// 거리순 DTO 여행지
	public SightDTO(String contentid, String title, int sidoCode, String nickName, String sigunguCode,
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
	
	// 여행지 상세페이지 DTO
	public SightDTO(String contentid, String title, int sidoCode, String nickName, String sigunguCode,
			String sigunguname, String address, String firstimage, String tel, int view_num,
			String mapx, String mapy, String homepage, String overview, String infocenter, String restdate,
			String expguide, String usetime, String parking) {
		super();
		this.contentid = contentid;
		this.title = title;
		this.sidoCode = sidoCode;
		this.nickName = nickName;
		this.sigunguCode = sigunguCode;
		this.sigunguname = sigunguname;
		this.address = address;
		this.firstimage = firstimage;
		this.tel = tel;
		this.view_num = view_num;
		this.mapx = mapx;
		this.mapy = mapy;
		this.homepage = homepage;
		this.overview = overview;
		this.infocenter = infocenter;
		this.restdate = restdate;
		this.expguide = expguide;
		this.usetime = usetime;
		this.parking = parking;
	}
	
	// 이미지 DTO
	public SightDTO(String imgid, String contentid, String imgurl, String imgnum) {
		super();
		this.imgid = imgid;
		this.contentid = contentid;
		this.imgurl = imgurl;
		this.imgnum = imgnum;
	}
	
	
	
	
	
	
	
    
    
	
}
