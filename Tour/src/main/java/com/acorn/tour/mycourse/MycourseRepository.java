package com.acorn.tour.mycourse;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MycourseRepository {
	
	@Autowired
	DataSource ds;
	
	// 나의코스목록 조회
	public ArrayList<MycourseDTO> selectMyCourse(String userId){
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String sql = "select * from mycourseTbl where userid = ? order by coursenum";
		ArrayList<MycourseDTO> list = new ArrayList<>();
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, userId);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				String coursecode = rs.getString(2);
				String coursename = rs.getString(3);
				int coursenum = rs.getInt(4);
				String coursecontent = rs.getString(5);
				String firstimage = rs.getString(6);
				MycourseDTO item = new MycourseDTO(userId, coursecode, coursename, coursenum, coursecontent, firstimage);
				list.add(item);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		close(rs, pst, con);
		return list;
		
	}
	
	
	
	// 나의코스목록 삽입
	public void insertMyCourse(String userId, String courseName) {
		Connection con = null;
		PreparedStatement pst = null;
		
		String sql = "insert into mycourseTbl values( ? , 'C' || coursenum_seq.NEXTVAL, ? , coursenum_seq.nextval, '', "
				   + "'https://korean.visitkorea.or.kr/resources/images/common/no_img_01.png')";
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, userId);
			pst.setString(2, courseName);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		close(pst, con);
		
	}
	
	// 나의코스목록 삭제
	public void deleteMyCourse(String userId, String coursecode) {
		Connection con = null;
		PreparedStatement pst = null;
		
		String sql = "delete from mycourseTbl where userid = ? and coursecode = ?";
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, userId);
			pst.setString(2, coursecode);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		close(pst, con);
		
	}
	
	// 나의코스상세내용 조회
	public MycourseDTO selectOneMyCourse(String userid, String coursecode) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String sql = "select userid, coursecode, coursename, coursecontent from mycourseTbl where userid = ? and coursecode = ? ";
		MycourseDTO item = new MycourseDTO();
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, userid);
			pst.setString(2, coursecode);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				String coursename = rs.getString(3);
				String coursecontent = rs.getString(4);
				
				item = new MycourseDTO(userid, coursecode, coursename, coursecontent);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		close(rs, pst, con);
		return item;
	}
	
	
	// 나의코스상세내용 수정
	public void updateMyCourse(MycourseDTO item) {
		Connection con = null;
		PreparedStatement pst = null;
		
		String sql = "update mycourseTbl set coursename= ? , coursecontent= ? "
				   + "where userid = ? and coursecode = ? ";
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, item.getCoursename());
			pst.setString(2, item.getCoursecontent());
			pst.setString(3, item.getUserId());
			pst.setString(4, item.getCoursecode());
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		close(pst, con);
	}
	
	// 나의 코스 상세리스트 조회
	public ArrayList<MycourseDTO> selectMycourseList(String coursecode) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String sql = "select m.coursecode, m.contentid, m.contentnum, c.title, c.address, c.firstimage, c.mapx, c.mapy, "
				   + "c.contenttypeid, c.cat2 "
				   + "from mycourseContentTbl m "
				   + "join contentinfotbl c "
				   + "on m.contentid = c.contentid "
				   + "where m.coursecode = ? "
				   + "order by contentnum ";
		ArrayList<MycourseDTO> list = new ArrayList<>();
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, coursecode);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				
				String contentid = rs.getString(2);
				int contentnum  = rs.getInt(3);
				String title  = rs.getString(4);
				String address  = rs.getString(5);
				String firstimage = rs.getString(6);
				String mapx = rs.getString(7);
				String mapy = rs.getString(8);
				String contenttypeid = rs.getString(9);
				String cat2 = rs.getString(10);
				MycourseDTO item = new MycourseDTO(coursecode, contentid, contentnum, title, address, 
						 						   firstimage, mapx, mapy, contenttypeid, cat2  );
				list.add(item);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		close(rs, pst, con);
		return list;
		
	}
	
	//나의 코스 상세리스트 삽입여부 판단
	public Integer countInsertMycourseList(String coursecode, String contentid) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select count(*) from mycourseContentTbl where coursecode = ? and contentid = ? ";
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, coursecode);
			pst.setString(2, contentid);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		close(rs, pst, con);
		return result;
		
	}
	
	//나의 코스 상세리스트 삽입
	public void insertMyCourseList(String coursecode, String contentid , int contentnum) {
		Connection con = null;
		PreparedStatement pst = null;
		
		String sql = "insert into mycourseContentTbl values( ? , ? , ? ) ";
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, coursecode);
			pst.setString(2, contentid);
			pst.setInt(3, contentnum);
			pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(pst, con);
	}
	
	//나의 코스 상세리스트 삭제
	public void deleteMyCourseList(String coursecode, String contentid) {
		Connection con = null;
		PreparedStatement pst = null;
		
		String sql = "delete from mycourseContentTbl where coursecode = ? and contentid = ? ";
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, coursecode);
			pst.setString(2, contentid);
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
