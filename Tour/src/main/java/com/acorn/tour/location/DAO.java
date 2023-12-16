package com.acorn.tour.location;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;




@Component
public class DAO {
	
	
	@Autowired
	DataSource ds;
	
	
	public TourlistDTO Tourlist(String area) { 	// 관광지
		
		
		String sql = "SELECT tourlist, overview"
				+ " FROM ("
				+ "    SELECT CONTENTINFOTBL.title AS tourlist, CONTENTINFOTBL.overview, "
				+ "           ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE) AS rn"
				+ "    FROM CONTENTINFOTBL"
				+ "    JOIN SidoTbl ON CONTENTINFOTBL.SIDOCODE = SidoTbl.SIDOCODE"
				+ "    WHERE SidoTbl.name = ? AND contenttypeid = 12"
				+ ")"
				+ " WHERE rn = 1";
		
		
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		TourlistDTO t = null;
		
		
		
		try {
			
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, area);
			rs = pst.executeQuery();
			
			
			if(rs.next()) {
				
				String title = rs.getString(1);
				String overview = rs.getString(2);

				t = new TourlistDTO(title, overview);
				
			}
			
			
			rs.close();
			pst.close();
			con.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		return t;
		
	}

	
	
	
	public CulturalDTO Cultural(String area) {		// 문화시설
		
		
		String sql = "SELECT cultural, overview"
				+ " FROM ("
				+ "    SELECT CONTENTINFOTBL.title AS cultural, CONTENTINFOTBL.overview, "
				+ "           ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE) AS rn"
				+ "    FROM CONTENTINFOTBL"
				+ "    JOIN SidoTbl ON CONTENTINFOTBL.SIDOCODE = SidoTbl.SIDOCODE"
				+ "    WHERE SidoTbl.name = ? AND contenttypeid = 14"
				+ ")"
				+ " WHERE rn = 1";
		
		
		
		PreparedStatement pst = null;
		Connection con = null;
		ResultSet rs = null;
		CulturalDTO c = null;
		
		
		
		try {
			
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, area);
			rs = pst.executeQuery();
			
			
			if(rs.next()) {
				
				String title = rs.getString(1);
				String overview = rs.getString(2);

				c = new CulturalDTO(title, overview);
				
			}
			
			
			rs.close();
			pst.close();
			con.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		return c;
		
		
		
	}
	
	
	
	public AttractionDTO Attraction(String area) {		// 축제공연행사
		
		
		String sql = "SELECT attraction, overview"
				+ " FROM ("
				+ "    SELECT CONTENTINFOTBL.title AS attraction, CONTENTINFOTBL.overview, "
				+ "           ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE) AS rn"
				+ "    FROM CONTENTINFOTBL"
				+ "    JOIN SidoTbl ON CONTENTINFOTBL.SIDOCODE = SidoTbl.SIDOCODE"
				+ "    WHERE SidoTbl.name = ? AND contenttypeid = 15"
				+ ")"
				+ "WHERE rn = 1";

		
		
		PreparedStatement pst = null;
		Connection con = null;
		ResultSet rs = null;
		AttractionDTO a = null;
		
		
		
		try {
			
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, area);
			rs = pst.executeQuery();
			
			
			if(rs.next()) {
				
				String title = rs.getString(1);
				String overview = rs.getString(2);

				a = new AttractionDTO(title, overview);
				
			}
			
			
			rs.close();
			pst.close();
			con.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		return a;
		
		
		
	}
	
	
	
	
	public ArrayList<SightsDTO> Sights(String area) { /* 지역별 추천 여행지 */
		
		
		String sql = "SELECT title, sights, "
				+ "       SUBSTR(address, 1, INSTR(address, ' ', 1, 2) - 1) AS address, contenttypeid, cat2, contentid"
				+ " FROM ("
				+ "    SELECT firstimage2 AS sights, "
				+ "           title, "
				+ "           address, "
				+ "			  contenttypeid, "
				+ "			  cat2, contentid, "
				+ "           ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE) AS rn"
				+ "    FROM CONTENTINFOTBL "
				+ "    JOIN SidoTbl ON CONTENTINFOTBL.SIDOCODE = SidoTbl.SIDOCODE"
				+ "    WHERE SidoTbl.name = ? AND CONTENTINFOTBL.contenttypeid = 12"
				+ "      AND CONTENTINFOTBL.firstimage2 IS NOT NULL"
				+ ") "
				+ " WHERE rn <= 4";
		
		
		
		ArrayList<SightsDTO> list = new ArrayList<>();
		
		Connection con;
		
		
		try {
			
			con = ds.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, area);
			ResultSet rs = pst.executeQuery();
			
			
			
			while(rs.next()) {
				String title = rs.getString(1);
				String sights = rs.getString(2);
				String address = rs.getString(3);
				String contenttypeid = rs.getString(4);
				String cat2 = rs.getString(5);
				String contentid = rs.getString(6);
				
				list.add(new SightsDTO(title, sights, address, contenttypeid, cat2, contentid));
			}
			
			
			rs.close();
			pst.close();
			con.close();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		return list;
		
	}
	
	
	
	
	public ArrayList<RestaurantDTO> Restaurant(String area) {
		
		
		String sql = "SELECT title, restaurant, "
				+ "       SUBSTR(address, 1, INSTR(address, ' ', 1, 2) - 1) AS address, contenttypeid, cat2, contentid "
				+ "FROM ("
				+ "    SELECT firstimage2 AS restaurant, "
				+ "           title, "
				+ "           address, "
				+ "			  contenttypeid, "
				+ "			  cat2,  contentid, "
				+ "           ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE) AS rn "
				+ "    FROM CONTENTINFOTBL "
				+ "    JOIN SidoTbl ON CONTENTINFOTBL.SIDOCODE = SidoTbl.SIDOCODE "
				+ "    WHERE SidoTbl.name = ? AND CONTENTINFOTBL.contenttypeid = 39 "
				+ "      AND CONTENTINFOTBL.firstimage2 IS NOT NULL"
				+ ") "
				+ " WHERE rn <= 4";
		
		
		
		ArrayList<RestaurantDTO> list = new ArrayList<>();
		
		Connection con;
		

		try {
			
			con = ds.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, area);
			ResultSet rs = pst.executeQuery();
			
			
			
			while(rs.next()) {
				String title = rs.getString(1);
				String restaurant = rs.getString(2);
				String address = rs.getString(3);
				String contenttypeid = rs.getString(4);
				String cat2 = rs.getString(5);
				String contentid = rs.getString(6);
				
				list.add(new RestaurantDTO(title, restaurant, address, contenttypeid, cat2, contentid));
			}
			
			
			rs.close();
			pst.close();
			con.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		//System.out.println(list);
		return list;

		
	}
	
	
	
	
	public ArrayList<PosterDTO> poster(String area) {
		
		
		String sql = "SELECT "
				+ "    DISTINCT f.firstimage, "
				+ "    f.title, "
				+ "    TO_CHAR(TO_DATE(f.eventstartdate, 'YYYYMMDD'), 'YYYY. MM. DD') as eventstartdate, "
				+ "    TO_CHAR(TO_DATE(f.eventenddate, 'YYYYMMDD'), 'YYYY. MM. DD') as eventenddate, "
				+ "    SUBSTR(f.addr1, 1, INSTR(f.addr1, ' ', 1, 2) - 1) AS address "
				+ " FROM "
				+ "    festival f, contentinfotbl c, sidotbl s "
				+ " WHERE "
				+ "    f.contentid = c.contentid "
				+ "    AND s.sidocode = c.sidocode "
				+ "    AND s.name = ? "
				+ "    AND TO_DATE(f.eventstartdate, 'YYYYMMDD') BETWEEN SYSDATE - 14 AND SYSDATE + 14";
		
		
		ArrayList<PosterDTO> list = new ArrayList<>();
		
		Connection con;
		
		
		try {
			
			con = ds.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, area);
			ResultSet rs = pst.executeQuery();
			
			
			while(rs.next()) {
				
				String firstimage = rs.getString(1);
				String title = rs.getString(2);
				String eventstartdate = rs.getString(3);
				String eventenddate = rs.getString(4);
				String address = rs.getString(5);
				
				list.add(new PosterDTO(firstimage, title, eventstartdate, eventenddate, address));
				
			}
			
			
			rs.close();
			pst.close();
			con.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	} 
	
	

}
