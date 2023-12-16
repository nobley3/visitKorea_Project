package com.acorn.tour.myreview;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component
public class MyReviewRepository {
	
	
	@Autowired
	DataSource ds;
	
	// 해당게시물 나의 리뷰 목록 전체 조회
	public ArrayList<MyReviewDTO> selectMyreview(String userid, int parentcode) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String sql = "select r.reviewcode, r.userid, r.content, to_char(r.writeday , 'yyyy.mm.dd.'), r.contentid, r.parentcode, c.title,  "
				   + "c.contenttypeid, c.cat2 "
				   + "from reviewtbl r "
				   + "join contentinfotbl c "
				   + "on r.contentid=c.contentid ";
		if(parentcode == 0) {
			sql += "where userid = ? and parentcode = 0 order by reviewcode desc "; // 댓글
		}else {
			sql += "where userid = ? and parentcode != 0 order by reviewcode desc "; // 답글
		}
				   
		
		ArrayList<MyReviewDTO> list = new ArrayList<>();
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, userid);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				int reviewcode = rs.getInt(1);
				String content = rs.getString(3);
				String writeday = rs.getString(4);
				String contetid = rs.getString(5);
				parentcode = rs.getInt(6);
				String title = rs.getString(7);
				String contenttypeid = rs.getString(8);
				String cat2 = rs.getString(9);
				
				list.add(new MyReviewDTO(reviewcode,userid,  content, writeday, contetid, parentcode, title, contenttypeid, cat2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close(rs, pst, con);
		return list;
		
	}

	// 리뷰 삭제
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
