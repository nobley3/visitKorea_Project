package com.acorn.tour.course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.tour.sights.SightDTO;


@Component
public class CourseRepository {

	@Autowired
	DataSource ds;
	
	// content 전체 갯수
	public Integer totalCnt(int sidoCode) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "";
		int result = 0;
		
		 // 여행지
		if(sidoCode == 0) {
			sql = "select count(*) from contentInfoTbl where contenttypeid = '25' ";
		}else {
			sql = "select count(*) from contentInfoTbl where contenttypeid = '25' and sidoCode = " + sidoCode;
		}
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(rs,pst,con);
		return result;
	}
	
	
	// 지역별 최신순 content 10개씩 조회
	public ArrayList<CourseDTO> selectAllLatest(int startList, int endList, int sidoCode) {
		
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "";
		
	    // 코스
		sql = "select ct.contentid, ct.title, ct.sidoCode, sd.nickName, sg.sigungucode, sg.name, ct.firstimage from "
			+ "(select rownum as num, contentid, title, sidoCode, sigungucode, firstimage "
			+ "from (select * from contentInfoTbl  ";
		if(sidoCode == 0) {
			sql += "where contenttypeid = '25' ";
		}else {
			sql+= "where contenttypeid = '25' and sidoCode = "+sidoCode;
		}
		sql += "order by modifiedtime desc)) ct ";
		sql += "join SidoTbl sd on sd.sidocode = ct.sidocode ";
		sql += "join SigunguTbl sg on sg.sigungucode = ct.sigungucode ";
		sql += "where num between "+startList+" and "+endList + " ";
		sql += "order by num";
			
		
		ArrayList<CourseDTO> contentList = new ArrayList<>();
		CourseDTO content = new CourseDTO();
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				String contentid = rs.getString(1); 
				String title = rs.getString(2); 
				sidoCode = rs.getInt(3); 
				String nickName = rs.getString(4); 
				String sigunguCode = rs.getString(5);
				String sigunguname = rs.getString(6); 
				String firstimage = rs.getString(7);
				
				content = new CourseDTO(contentid, title, sidoCode, nickName, sigunguCode, sigunguname, firstimage );
				
				contentList.add(content);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(rs,pst,con);
		return contentList;
	}
		
	
	// 인기순 
	public ArrayList<CourseDTO> selectAllPopular(int startList, int endList, int sidoCode) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String sql = "";
		
		// 여행지
		sql = "select ct.contentid, ct.title, ct.sidoCode, sd.nickName, sg.sigungucode, sg.name, ct.firstimage  "
			+ "from (select rownum as num, contentid, title, sidoCode, sigungucode, firstimage, view_cnt "
			+ "from (select * from contentInfoTbl  ";
		if(sidoCode == 0) {
			sql += "where contenttypeid = '25' ";
		}else {
			sql+= "where contenttypeid = '25' and sidoCode = "+sidoCode +" ";
		}
		sql += "order by view_cnt desc)) ct ";
		sql += "join SidoTbl sd on sd.sidocode = ct.sidocode ";
		sql += "join SigunguTbl sg on sg.sigungucode = ct.sigungucode ";
		sql += "where num between "+startList+" and "+endList + " ";
		sql += "order by num";
				
		
		ArrayList<CourseDTO> list = new ArrayList<>();
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				String contentid = rs.getString(1); 
				String title = rs.getString(2); 
				sidoCode = rs.getInt(3); 
				String nickName = rs.getString(4); 
				String sigunguCode = rs.getString(5);
				String sigunguname = rs.getString(6); 
				String firstimage = rs.getString(7);
				
				CourseDTO content = new CourseDTO(contentid, title, sidoCode, nickName, sigunguCode, sigunguname, firstimage );
				
				list.add(content);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(rs,pst,con);
		return list;
	}
	
	// 상세페이지에 표출할 내용
	public CourseDTO selectOne(String contentId) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String sql = "select ct.contentid, ct.title, ct.sidoCode, sd.nickName, sg.sigungucode, sg.name,  ct.overview, ct.view_cnt "
				   + "from (select * from contentInfoTbl  "
				   + "where contentid= ?) ct "
				   + "join SidoTbl sd on sd.sidocode = ct.sidocode "
				   + "join SigunguTbl sg on sg.sigungucode = ct.sigungucode ";
		
		CourseDTO content = new CourseDTO();		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, contentId);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				String contentid = rs.getString(1); // 게시물 ID
			    String title = rs.getString(2); // 게시물 제목
			    int sidoCode = rs.getInt(3); // 시/도 코드
			    String nickName = rs.getString(4);   // 시도 별칭
			    String sigunguCode = rs.getString(5);   // 시/군/구 코드
			    String sigunguname = rs.getString(6);   // 시/군/구 이름
			    String overview = rs.getString(7);
			    int view_num = rs.getInt(8); 
			    
			    
			    content = new CourseDTO(contentid,title,sidoCode,nickName,sigunguCode,sigunguname,overview, view_num);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(rs,pst,con);
		return content;
	}
	
	// 상세페이지에 표출할 코스 목록 내용
	public ArrayList<CourseContentDTO> selectCourse(String contentId) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String sql ="select ca.contentid, ca.subcontentid, ca.num, ct.title, ct.address, "
				   +"ct.mapx, ct.mapy, ct.firstimage, ct.contenttypeid, ct.cat2 from courseareaTbl ca "
				   +"join contentInfoTbl ct on ca.subcontentid = ct.contentid "
				   +"where ca.contentid= ? "
				   +"order by num ";
		
		ArrayList<CourseContentDTO> list = new ArrayList<>();	
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, contentId);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				String subcontentid = rs.getString(2);
				int num = rs.getInt(3);
				String subtitle = rs.getString(4);
				String address = rs.getString(5);
				String mapx = rs.getString(6);
				String mapy = rs.getString(7);
				String firstimage = rs.getString(8);
				
				String contenttypeid = rs.getString(9);
				String cat2 = rs.getString(10);
				
				CourseContentDTO content = new CourseContentDTO(contentId, subcontentid, num, subtitle, address, mapx, mapy, firstimage, contenttypeid, cat2 );
				
				list.add(content);
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
