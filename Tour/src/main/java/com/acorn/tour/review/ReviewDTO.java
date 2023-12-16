package com.acorn.tour.review;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor // 기본생성자
@AllArgsConstructor // 매개변수 있는 생성자
public class ReviewDTO {
	
	
	int reviewcode;
	String content;
	String nickname;
	String profileurl;
	String writeday;
	
	String userid;
	String contentid;
	int parentcode;
	

	// 리뷰 전체 조회 DTO
	public ReviewDTO(int reviewcode, String content, String userid, String nickname, String profileurl, String writeday) {
		super();
		this.reviewcode = reviewcode;
		this.content = content;
		this.userid = userid;
		this.nickname = nickname;
		this.profileurl = profileurl;
		this.writeday = writeday;
	}

	//  리뷰 수정 및 삭제 DTO
	public ReviewDTO(int reviewcode, String userid, String content, String writeday, String contentid, int parentcode) {
		super();
		this.reviewcode = reviewcode;
		this.userid = userid;
		this.content = content;
		this.writeday = writeday;
		this.contentid = contentid;
		this.parentcode = parentcode;
	}

	// 답글 조회 DTO
	public ReviewDTO(int reviewcode, String userid, String content, String writeday, String contentid,
			int parentcode, String nickname ) {
		super();
		this.reviewcode = reviewcode;
		this.content = content;
		this.nickname = nickname;
		this.writeday = writeday;
		this.userid = userid;
		this.contentid = contentid;
		this.parentcode = parentcode;
	}
	
	
	
	
	
	
	// 답글 등록 DTO
	public ReviewDTO(String userid, String content, String contentid, int parentcode) {
		super();
		this.userid = userid;
		this.content = content;
		this.contentid = contentid;
		this.parentcode = parentcode;
	}

	

	
	
	
	/*
	public ReviewDTO(int reviewcode, String content) {
		super();
		this.reviewcode = reviewcode;
		this.content = content;
	}
	 */
	
	
	
	
	
	
}
