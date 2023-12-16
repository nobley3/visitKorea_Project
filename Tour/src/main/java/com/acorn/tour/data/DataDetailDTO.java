package com.acorn.tour.data;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor // 기본생성자
@AllArgsConstructor // 매개변수 있는 생성자
public class DataDetailDTO {

	
	// 홈페이지 및 상세내용 담을 DTO
	String contentid;
	String homepage;
	String overview;
	
	
}
