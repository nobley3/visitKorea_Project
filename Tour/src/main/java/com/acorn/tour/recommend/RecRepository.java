package com.acorn.tour.recommend;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.acorn.tour.sido.SigunguDTO;

@Repository
public class RecRepository {
	@Autowired
	private SqlSession session;
	private static String namespace = "com.acorn.RecMapper.";
	
	public List<SigunguDTO> selectList(int code){
		return session.selectList(namespace+"selectAll",code);
	}
	public List<RecSpot> getPlace10(){
		return session.selectList(namespace+"getRandom");
	}
	public List<RecSpot> recSpot(String contentid){
		return session.selectList(namespace+"getRecInfo",contentid);
	}
	public List<RecRestaurant> recFood(String contentid){
		return session.selectList(namespace+"getFoodInfo",contentid);
	}
	public String getSidoName(int sidocode) {
		return session.selectOne(namespace+"getSido",sidocode);
	}
	public String getSigunguName(String sigungucode) {
		return session.selectOne(namespace+"getSigungu",sigungucode);
	}
	public int insertRecTour(RecCourse tour) {
		return session.insert(namespace+"insertTravelCourse",tour);
	}
	public List<RecCourse> getMyRecTour(String userId) {
		return session.selectList(namespace+"getMyRecCourse" ,userId);
	}
	public List<RecCourse> getAllRecTour(){
		return session.selectOne(namespace+"allRecCourse");
	}
	public RecCourse viewMyRecTour(String courseId) {
		return session.selectOne(namespace+"viewMyRecCourse" ,courseId);
	}
	public String getUserNickname(String userid) {
		return session.selectOne(namespace+"getUserNickname",userid);
	}

}
