package com.acorn.tour.review;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component
public class ReviewService {
	
	
	@Autowired
	ReviewRepository rep;
	
	// 해당 게시물 리뷰 전체 조회
	public ArrayList<ReviewDTO> getList(String contentid) {
		ArrayList<ReviewDTO> list = rep.Select(contentid);
		return list;
	}
	
	// 해당 게시물 리뷰 등록
	public void getInsertreviews(String userid, String contentid, String comment) {
		rep.insertreviews(userid, contentid, comment);
	}
	
	// 해당 게시물 리뷰 수정
	public void getUpdatereviews(int reviewcode, String content) {
		rep.updatereviews(reviewcode, content);
	}
	
	// 해당 게시물 리뷰 삭제
	public void getDeletereviews(int reviewcode) {
		rep.deletereviews(reviewcode);
	}
	
	
	
	// 답글 조회
	public ArrayList<ReviewDTO> getSelectReply(int parentcode){
		ArrayList<ReviewDTO> list = rep.selectReply(parentcode);
		return list;
	}
	
	// 답글 등록
	public void getInsertReply(ReviewDTO review) {
		rep.insertReply(review);
	}
	
	// 답글 수정
	public void getUpdateReply(int reviewcode, String content) {
		rep.updateReply(reviewcode, content);
	}
	
	
	
	
	

}
