package com.acorn.tour.map;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.tour.hotkok.HotkokDTO;

@Repository
public class MapRepository {

	@Autowired
	private DataSource ds;
	
	public List<MapDTO> getAllMapInfo() {
        List<MapDTO> mapList = new ArrayList<>();

        try {          
            String sql = "SELECT * FROM contentInfoTbl";
            Connection con = ds.getConnection();
            PreparedStatement pst = con.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                MapDTO mapDTO = new MapDTO();
                // 필요한 필드들을 set
                mapDTO.setContentId(rs.getString("contentid"));
                mapDTO.setContentTypeId(rs.getInt("contenttypeid"));
                mapDTO.setCat2(rs.getString("cat2"));
                mapDTO.setCat3(rs.getString("cat3"));
                mapDTO.setTitle(rs.getString("title"));
                mapDTO.setSidocode(rs.getInt("sidocode"));
                mapDTO.setSigunguCode(rs.getString("sigunguCode"));
                mapDTO.setFirstimage(rs.getString("firstimage"));
                mapDTO.setMapX(rs.getString("mapx"));
                mapDTO.setMapY(rs.getString("mapy"));            	
                // 나머지 필드들도 set

                mapList.add(mapDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return mapList;
    }
	
	public List<MapDTO> getAllMapInfoByCategory(String category) {
	    List<MapDTO> mapList = new ArrayList<>();
	
	    try {
	        String sql = "";
	        if ("카페".equals(category)) {
	            sql = "SELECT * FROM contentInfoTbl WHERE cat3='A05020900'";
	        } else if("음식점".equals(category)) {
	            sql = "SELECT * FROM contentInfoTbl WHERE cat2='A0502'";
	        } else if("주변 여행지".equals(category)) {
	            sql = "SELECT * FROM contentInfoTbl WHERE contenttypeid='12'";
	        } else if("숙소".equals(category)) {
	        	sql = "SELECT * FROM contentInfoTbl WHERE contenttypeid='32'";
	        }
	         
	        Connection con = ds.getConnection();
	        PreparedStatement pst = con.prepareStatement(sql);
	        ResultSet rs = pst.executeQuery();
	
	        while (rs.next()) {
	            MapDTO mapDTO = new MapDTO();
	            mapDTO.setContentId(rs.getString("contentid"));
	            mapDTO.setContentTypeId(rs.getInt("contenttypeid"));
	            mapDTO.setCat2(rs.getString("cat2"));
	            mapDTO.setCat3(rs.getString("cat3"));
	            mapDTO.setTitle(rs.getString("title"));
	            mapDTO.setSidocode(rs.getInt("sidocode"));
	            mapDTO.setSigunguCode(rs.getString("sigunguCode"));
	            mapDTO.setFirstimage(rs.getString("firstimage"));
	            mapDTO.setMapX(rs.getString("mapx"));
	            mapDTO.setMapY(rs.getString("mapy"));
	            mapList.add(mapDTO);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	
	    return mapList;
	}
	
	// 주변 여행지 조회
	public List<MapDTO> getAllMapInfo(String title, String firstimage){
	    Connection con = null;
	    PreparedStatement pst = null;
	    ResultSet rs = null;
	    
	    String sql = "SELECT * FROM contentInfoTbl WHERE title = ? and firstimage = ?";
	    List<MapDTO> mapList = new ArrayList<>();
	    
	    try {
	        con = ds.getConnection();
	        pst = con.prepareStatement(sql);
	        pst.setString(1, title);
	        pst.setString(2, firstimage);
	        rs = pst.executeQuery();
	        
	        while (rs.next()) {
	            MapDTO mapDTO = new MapDTO();
	            mapDTO.setContentId(rs.getString("contentid"));
	            mapDTO.setContentTypeId(rs.getInt("contenttypeid"));
	            // 나머지 필드들도 set
	            mapList.add(mapDTO);
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rs, pst, con);
	    }
	    
	    return mapList;
	}

	private void close(ResultSet rs, PreparedStatement pst, Connection con) {
	    try {
	        if (rs != null) rs.close();
	        if (pst != null) pst.close();
	        if (con != null) con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}

	
}