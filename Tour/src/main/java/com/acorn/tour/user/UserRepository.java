package com.acorn.tour.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Pattern;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class UserRepository {

	@Autowired
	DataSource ds;
	
	@Autowired
	private SqlSession session;
	
	
	private static String namespace = "com.acorn.tour.TourUpdateMapper.";
	
	// 회원가입
	public void regiUser(UserDTO user) {
		session.insert(namespace + "regiUser", user);
	}
	
	//	회원가입시 아이디 중복확인 매서드
	public boolean checkId(String userid) {
		int count = session.selectOne(namespace + "checkId", userid);
		return count > 0;
	}

	//	회원가입시 닉네임 중복확인 매서드
	public boolean checkNickname(String nickname){
		int count = session.selectOne(namespace + "checkNickname", nickname);
		return count > 0;
	}
	
	//	아이디 유효성
	public boolean validationid(String userid){
		String idreg = "^(?=.*[a-zA-Z])(?=.*\\d)[a-zA-Z\\d]{4,12}$";
		return Pattern.matches(idreg, userid);
	}
	
	//	비밀번호 유효성
	public boolean validationPw(String pw) {
		String pwreg = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}$";
		return Pattern.matches(pwreg, pw);
	}
	
	
	// 회원정보수정
	//고객id를 입력으로 받아 고객정보 반환
	public UserDTO selectOne(String userid) {
		return session.selectOne(namespace +"selectOne",userid);
	}
	
	//고객정보 수정
	public void updateUser(UserDTO user) {
		 session.update(namespace+"updateUser",user);
	}
	 
	//닉네임중복
	public boolean updatecheckNickname(String nickname) {
		Integer count = session.selectOne(namespace+"checkNickname",nickname);
		 return count != null && count > 0;
	}
	
	// 회원탈퇴
	public void userWithdrawal(String userId) {
		session.delete(namespace + "userWithdrawal", userId);
	}
	
	
}
