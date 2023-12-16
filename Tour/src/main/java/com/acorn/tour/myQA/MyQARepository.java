package com.acorn.tour.myQA;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyQARepository {

	@Autowired
	DataSource ds;
	
	// 나의 질문 전체 조회
	public ArrayList<MyQADTO> selectMyQA(String userid){
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String sql = "select qacode, userid, qatitle, qacontent, qafileurl, to_char(qawirtedate, 'yyyy-mm-dd'), "
				   + "answer from qatbl where userid = ? order by qawirtedate desc ";
		ArrayList<MyQADTO> list = new ArrayList<>();
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, userid);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				String qacode = rs.getString(1);
				String qatitle = rs.getString(3);
				String qacontent = rs.getString(4);
				String qafileurl = rs.getString(5);
				String qawritedate = rs.getString(6);
				String answer = rs.getString(7); // 질문 답변 여부
				
				MyQADTO item = new MyQADTO(qacode, userid, qatitle, qacontent, qafileurl, qawritedate, answer);
				list.add(item);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(rs, pst, con);
		return list;
		
	}
	
	// 나의 질문 전체 조회
	public MyQADTO selectOneMyQA(String qacode){
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String sql = "select qacode, userid, qatitle, qacontent, qafileurl from qatbl where qacode = ? ";
		MyQADTO item = new MyQADTO();
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, qacode);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				String userid = rs.getString(2);
				String qatitle = rs.getString(3);
				String qacontent = rs.getString(4);
				String qafileurl = rs.getString(5);
				
				item = new MyQADTO(qacode, userid, qatitle, qacontent, qafileurl);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(rs, pst, con);
		return item;
	}
	
	// 나의질문 삽입
	public void insertMyQA(MyQADTO item ) {
		Connection con = null;
		PreparedStatement pst = null;
		
		String sql = "insert into qatbl values( 'Q' || qacode_seq.NEXTVAL, ? , ? , ? , ? , "
				   + "sysdate ,'0')";
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, item.getUserid());
			pst.setString(2, item.getQatitle());
			pst.setString(3, item.getQacontent());
			pst.setString(4, item.getQafileurl());
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		close(pst, con);
		
	}
	
	// 나의질문 수정
	public void updateMyQA(MyQADTO item ) {
		Connection con = null;
		PreparedStatement pst = null;
		
		String sql = "update qatbl set qatitle = ? , qacontent = ? where qacode = ?";
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, item.getQatitle());
			pst.setString(2, item.getQacontent());
			pst.setString(3, item.getQacode());
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		close(pst, con);
		
	}
	
	// 나의질문 삭제
	public void deleteMyQA(String qacode) {
		Connection con = null;
		PreparedStatement pst = null;
		
		String sql = "delete from qatbl where qacode = ?";
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, qacode);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(pst, con);
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
