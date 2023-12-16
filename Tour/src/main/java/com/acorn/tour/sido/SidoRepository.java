package com.acorn.tour.sido;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SidoRepository {
	
	@Autowired
	DataSource ds;
	
	// 시도리스트 전체 출력
	public ArrayList<SidoDTO> selectAll() {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String sql = "select * from SidoTbl";
		ArrayList<SidoDTO> sidoList = new ArrayList<>();
		sidoList.add(new SidoDTO(0, "전체", "전체"));
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				int sidoCode = rs.getInt(1);
				String name = rs.getString(2);
				String nickName = rs.getString(3);
				SidoDTO sido = new SidoDTO(sidoCode, name, nickName);
				sidoList.add(sido);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(rs,pst,con);
		return sidoList;
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
