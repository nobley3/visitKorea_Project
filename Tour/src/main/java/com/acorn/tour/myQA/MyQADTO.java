package com.acorn.tour.myQA;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor // 기본생성자
@AllArgsConstructor // 매개변수 있는 생성자
public class MyQADTO {

	String qacode;
	String userid;
	String qatitle;
	String qacontent;
	String qafileurl;
	String qawritedate;
	String answer; // 질문 답변 여부
	
	// 질문 등록
	public MyQADTO(String userid, String qatitle, String qacontent, String qafileurl) {
		super();
		this.userid = userid;
		this.qatitle = qatitle;
		this.qacontent = qacontent;
		this.qafileurl = qafileurl;
	}

	
	// 질문 수정
	public MyQADTO(String qacode, String userid, String qatitle, String qacontent, String qafileurl) {
		super();
		this.qacode = qacode;
		this.userid = userid;
		this.qatitle = qatitle;
		this.qacontent = qacontent;
		this.qafileurl = qafileurl;
	}
	
	
	
}
