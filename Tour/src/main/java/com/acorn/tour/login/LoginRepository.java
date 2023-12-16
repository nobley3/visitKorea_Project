package com.acorn.tour.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.tour.user.UserDTO;

@Repository
public class LoginRepository {
	
	@Autowired
	DataSource ds;
	
	public boolean isValid( String id, String pw) {		
	   Connection con =  null;
	   PreparedStatement pst = null;
	   ResultSet rs = null;
	   boolean result=false;
	   String sql = "select userid, pw from usertbl  where userid = ? " ;
	   
	   try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
				String tmp_pw = rs.getString(2); // pw가 2번째에 있어서
				if(tmp_pw.trim().equals(pw)) { // trim은 공백 제거
					result=true;
				}
			}
			rs.close();
			pst.close();
			con.close();
		} catch (SQLException e) {
				e.printStackTrace();
		}
	   
		return result;
	}
	
	// 해당 id에 user객체 사용
	public UserDTO user(String id) {
		Connection con =  null;
	    PreparedStatement pst = null;
	    ResultSet rs = null;
	    
	    String sql = "select * from usertbl  where userid = ? ";
	    UserDTO user = new UserDTO();
	    
	    try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();
			
			if(rs.next()) {
		    	String nickname = rs.getString(2);
		    	String sort = rs.getString(3);
		    	String pw = rs.getString(4);
		    	String section = rs.getString(5);
		    	String profileurl = rs.getString(6);
		    	user = new UserDTO(id, nickname, sort, pw, section, profileurl);
		    }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	    close(rs,pst,con);
		return user;
	}
	
	// 카카오로그인 회원정보 테이블에 등록
	public int register(String user_kakao, String nickname, String profile_image) {	
	       Connection con = null;
	       PreparedStatement pst = null;	       
	       int rRow = 0;	       
	       String sql = "Insert into USERTBL (USERID, NICKNAME, SORT, SECTION, PROFILEURL) values (?,?,'02','02',?)";
	    
	       try {
				con = ds.getConnection();
				pst = con.prepareStatement(sql);
				pst.setString(1, user_kakao);
				pst.setString(2, nickname);
				pst.setString(3, profile_image);
				
				rRow = pst.executeUpdate();		
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	       close(pst,con);
	       return rRow;
	    }	

	// 카카오로그인을 한 적이 있는지 여부
	public boolean isMember(String user_kakao) {	  // 이메일로 기존회원테이블 조회, 기존회원이 아니면 true, false
	    Connection con =  null;
	    PreparedStatement pst = null;
	    ResultSet rs = null;
	    boolean result=true;
	    
	    String sql = "select * from usertbl where userid =?";
	 
	    try {
				con = ds.getConnection();
				pst = con.prepareStatement(sql);
				pst.setString(1, user_kakao);
				rs = pst.executeQuery();
		
				//해당 이메일로 조회된 자료가 있는 경우 (이미 회원가입이 된 카카오 이메일)
				if(rs.next()) {
					result=false; 
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    close(rs,pst,con);
	    return result;
	 }
	
	// 자원반납
	public void close(AutoCloseable ...a) {
		for(AutoCloseable item : a) {
			try {
				item.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}