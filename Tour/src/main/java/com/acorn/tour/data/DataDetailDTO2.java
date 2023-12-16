package com.acorn.tour.data;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor // 기본생성자
@AllArgsConstructor // 매개변수 있는 생성자
public class DataDetailDTO2 {

	
	// 축제,공연,행사 기간 담을 DTO
	String contentid;
	String eventstartdate;
	String eventenddate;
	String sponsor1;
	String sponsor2;
	String playtime;
	String eventplace;
	String eventhomepage;
	String agelimit;
	String usetimefestival;

	
	// 여행지 추가 정보
	String infocenter;
	String restdate;
	String expguide;
	String expagerange;
	String usetime;
	String parking;
	
	
	// 여행지 추가 정보
	public DataDetailDTO2(String contentid, String infocenter,
			String restdate, String expguide, String expagerange,
			String usetime, String parking) {
		super();
		this.contentid = contentid;
		this.infocenter = infocenter;
		this.restdate = restdate;
		this.expguide = expguide;
		this.expagerange = expagerange;
		this.usetime = usetime;
		this.parking = parking;
		
	}
	
	
	// 축제,공연,행사 기간 담을 DTO
	public DataDetailDTO2(String contentid, String eventstartdate, String eventenddate) {
		super();
		this.contentid = contentid;
		this.eventstartdate = eventstartdate;
		this.eventenddate = eventenddate;
	}

	// 축제,공연,행사 추가정보 담을 DTO
	public DataDetailDTO2(String contentid, String eventstartdate, String eventenddate, String sponsor1,
			String sponsor2, String playtime, String eventplace, String eventhomepage, String agelimit,
			String usetimefestival) {
		super();
		this.contentid = contentid;
		this.eventstartdate = eventstartdate;
		this.eventenddate = eventenddate;
		this.sponsor1 = sponsor1;
		this.sponsor2 = sponsor2;
		this.playtime = playtime;
		this.eventplace = eventplace;
		this.eventhomepage = eventhomepage;
		this.agelimit = agelimit;
		this.usetimefestival = usetimefestival;
	}
	
	
	
	
	
	
	
}
