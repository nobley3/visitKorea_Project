package com.acorn.tour.data;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor // 기본생성자
@AllArgsConstructor // 매개변수 있는 생성자
public class Category2DTO {
	
	String cat2code;
	String name;
	String cat1code;
}
