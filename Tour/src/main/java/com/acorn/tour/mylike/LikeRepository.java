package com.acorn.tour.mylike;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component
public class LikeRepository {
	
	@Autowired
	DataSource ds;
	
	
	// 좋아요 삽입
	public void updateContentLike(String contentId, String userId) {
		Connection con = null;
		PreparedStatement pst = null;
		
		String sql = "insert into liketbl values( ? , ? )";
				
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, userId);
			pst.setString(2, contentId);
			pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 좋아요 삭제
	public void deleteContentLike(String contentId, String userId) {
		Connection con = null;
		PreparedStatement pst = null;
		
		String sql = "delete from likeTbl where userId = ? and contentid = ?";
				
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, userId);
			pst.setString(2, contentId);
			pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 해당 게시물 좋아요 수 조회
	public Integer countLike(String contentId) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String sql = "select count(*) from liketbl where contentid = ?";
		int likeNum = 0;	
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, contentId);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				likeNum = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		close(rs,pst,con);
		return likeNum;
	}
	
	// 나의좋아요 조회
	public Integer mycountLike(String contentId, String userId) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String sql = "select count(*) from liketbl where userId = ? and contentid = ?";
		int likeNum = 0;	
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, userId);
			pst.setString(2, contentId);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				likeNum = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		close(rs,pst,con);
		return likeNum;
	}
	
	// 마이페이지 좋아요 목록
	public ArrayList<LikeDTO> myLike(String userId) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String sql = "select li.userid, li.contentid, ct.contenttypeid, ct.title, "
				   + "si.sidocode, si.nickname, sg.sigungucode, sg.name, ct.firstimage, ct.cat2, ct.mapx, ct.mapy "
				   + "from liketbl li "
				   + "join contentInfoTbl ct on li.contentid = ct.contentid "
				   + "join sidotbl si on ct.sidocode = si.sidocode "
				   + "join sigungutbl sg on ct.sigungucode = sg.sigungucode "
				   + "where userid= ? ";
		ArrayList<LikeDTO> list =  new ArrayList<>();   
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, userId);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				String contentid = rs.getString(2);
				String contenttypeid = rs.getString(3);
				String title = rs.getString(4);
				String sidocode = rs.getString(5);
				String nickname = rs.getString(6);
				String sigungucode = rs.getString(7);
				String sigunguname = rs.getString(8);
				String firstimage = rs.getString(9);
				String cat2 = rs.getString(10);
				String mapx = rs.getString(11);
				String mapy = rs.getString(12);
				
				LikeDTO item = new LikeDTO(userId, contentid, contenttypeid, title, sidocode, nickname, 
											sigungucode, sigunguname, firstimage, cat2, mapx, mapy);
				list.add(item);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(rs,pst,con);
		return list;
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
