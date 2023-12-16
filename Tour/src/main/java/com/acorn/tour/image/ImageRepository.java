package com.acorn.tour.image;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component
public class ImageRepository {
	
	@Autowired
	DataSource ds;
	
	// 상세페이지 이미지
	public ArrayList<ImageDTO> selectImg(String contentId) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String sql = "select * from imgtbl where contentid = ? order by imgnum";
		
		ArrayList<ImageDTO> list = new ArrayList<>();
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, contentId);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				String imgid = rs.getString(1); 
				String contentid = rs.getString(2); 
				String imgurl = rs.getString(3); 
				String imgnum = rs.getString(4);
				
				ImageDTO content = new ImageDTO(imgid,contentid,imgurl,imgnum);		
				list.add(content);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
