package com.acorn.tour.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CategoryRepository {
	
	@Autowired
	DataSource ds;
	
	// 대분류 조회
	public ArrayList<Category1DTO> selectAll(){
		ArrayList<Category1DTO> list = new ArrayList<>();
		list.add(new Category1DTO("A01", "자연" ));
		list.add(new Category1DTO("A02", "인문(문화/예술/역사)" ));
		list.add(new Category1DTO("A03", "레포츠" ));
		list.add(new Category1DTO("A04", "쇼핑" ));
		list.add(new Category1DTO("A05", "음식" ));
		list.add(new Category1DTO("B02", "숙박" ));
		list.add(new Category1DTO("C01", "추천코스" ));
	
		return list;
	}
	
	// 중분류 삽입
	public void insertAll2(ArrayList<Category2DTO> list) {
		Connection con = null;
		PreparedStatement pst = null;
		
		String sql = "insert into category2Tbl values (?, ?, ?)";
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			
			for(int i =0; i<list.size(); i++) {
				Category2DTO item = list.get(i);
				pst.setString(1, item.getCat2code());
				pst.setString(2, item.getName());
				pst.setString(3, item.getCat1code());
				pst.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(pst,con);
	}
	
	// 중분류 조회
	public ArrayList<Category2DTO> selectAll2(){
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String sql = "select * from category2Tbl";
		ArrayList<Category2DTO> list = new ArrayList<>();
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				String cat2code = rs.getString(1);
				String name = rs.getString(2);
				String cat1code = rs.getString(3);
				
				Category2DTO cat2 = new Category2DTO(cat2code, name, cat1code);
				list.add(cat2);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		close(rs,pst,con);
		return list;
	}
	
	// 소분류 삽입
	public void insertAll3(ArrayList<Category3DTO> list) {
		Connection con = null;
		PreparedStatement pst = null;
		
		String sql = "insert into category3Tbl values (?, ?, ?, ?)";
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			
			for(int i =0; i<list.size(); i++) {
				Category3DTO item = list.get(i);
				pst.setString(1, item.getCat3code());
				pst.setString(2, item.getName());
				pst.setString(3, item.getCat1code());
				pst.setString(4, item.getCat2code());
				pst.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(pst,con);
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
