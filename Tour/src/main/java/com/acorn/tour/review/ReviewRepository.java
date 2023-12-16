package com.acorn.tour.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component
public class ReviewRepository {
	
	
	@Autowired
	DataSource ds;
	
	// 리뷰 전체 조회
	public ArrayList<ReviewDTO> Select(String contentid) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String sql =  "SELECT r.reviewcode, r.content, u.userid, "
				+ "  CASE "
				+ "    WHEN LENGTH(u.nickname) = 2 THEN SUBSTR(u.nickname, 1, 1) || '*' "
				+ "    ELSE SUBSTR(u.nickname, 1, 1) || LPAD('*', LENGTH(u.nickname) - 2, '*') || SUBSTR(u.nickname, -1) "
				+ "  END AS nickname, "
				+ "  u.profileurl, "
				+ "  to_char(r.WRITEDAY, 'yyyy.mm.dd') as writeday "
				+ " FROM reviewtbl r JOIN usertbl u ON r.userid = u.userid "
				+ " WHERE contentid = ? and parentcode = '0' "
				+ " order by reviewcode desc ";
		
		ArrayList<ReviewDTO> list = new ArrayList<>();
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, contentid);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				int reviewcode = rs.getInt(1);
				String content = rs.getString(2);
				String userid = rs.getString(3);
				String nickname = rs.getString(4);
				String profileurl = rs.getString(5);
				String writeday = rs.getString(6);
				
				list.add(new ReviewDTO(reviewcode, content, userid, nickname, profileurl, writeday));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close(rs, pst, con);
		return list;
		
	}
	
	
	
	// 리뷰 등록
	public void insertreviews( String userid , String content, String contentid) {
		
		Connection con = null;
		PreparedStatement pst = null;
		
		// sql 작성
		String sql = "insert into reviewtbl values(reviewnumber.NEXTVAL, ?, ?, sysdate , ? , 0)";
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			
			pst.setString(1, userid);
			pst.setString(2, content);
			pst.setString(3, contentid);
			pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//연결 해제
		close(pst, con);
	}
	
	// 리뷰 수정
	public void updatereviews(int reviewcode, String content) {
		
		Connection con = null;
		PreparedStatement pst = null;
		
		String sql = "update reviewtbl set content = ? where reviewcode = ?";
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, content);
			pst.setInt(2, reviewcode);
			pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(pst, con);
	}
	

	// 리뷰 삭제 및 답글 삭제
	public void deletereviews(int reviewcode) {
		Connection con = null;
		PreparedStatement pst = null;
		
		String sql = "delete from reviewtbl where reviewcode = ?";
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setInt(1, reviewcode);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(pst, con);
	}
	
	// 답글 조회
	public ArrayList<ReviewDTO> selectReply(int parentcode){
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String sql = "select r.reviewcode, r.userid, r.content, to_char(r.writeday,'yyyy.mm.dd.'), r.contentid, r.parentcode, "
				   + "SUBSTR(u.nickname, 1, 1) ||  LPAD(SUBSTR(u.nickname, LENGTH(u.nickname), 1), LENGTH(u.nickname), '*') as nickname from reviewtbl r "
				   + "join usertbl u "
				   + "on r.userid=u.userid "
				   + "where parentcode = ? "
				   + "order by reviewcode ";
		ArrayList<ReviewDTO> list = new ArrayList<>();
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setInt(1, parentcode);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				int reviewcode = rs.getInt(1);
				String userid = rs.getString(2);
				String content = rs.getString(3);
				String writeday = rs.getString(4);
				String contentid = rs.getString(5);
				String nickname = rs.getString(7);
				
				
				ReviewDTO review =  new ReviewDTO(reviewcode, userid, content, writeday, contentid, parentcode, nickname );
				list.add(review);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		close(rs, pst, con);
		return list;
		
	}
	
	
	
	// 답글 등록
	public void insertReply(ReviewDTO review) {
		
		Connection con = null;
		PreparedStatement pst = null;
		
		// sql 작성
		String sql = "insert into reviewtbl values(reviewnumber.NEXTVAL, ?, ?, sysdate , ? , ?)";
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			
			pst.setString(1, review.getUserid());
			pst.setString(2, review.getContent());
			pst.setString(3, review.getContentid());
			pst.setInt(4, review.getParentcode());
			pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//연결 해제
		close(pst, con);
	}
	
	
	// 리뷰 수정
	public void updateReply(int reviewcode, String content) {
		
		Connection con = null;
		PreparedStatement pst = null;
		
		String sql = "update reviewtbl set content = ? where reviewcode = ?";
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, content);
			pst.setInt(2, reviewcode);
			pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(pst, con);
	}
	
	
	private void close(AutoCloseable... acs) {
		for(AutoCloseable ac: acs) {
			try {if (ac!=null) ac.close();} catch(Exception e) {e.printStackTrace();}
		}
		
	}
	

}
