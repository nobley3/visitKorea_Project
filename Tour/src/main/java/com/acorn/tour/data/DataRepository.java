package com.acorn.tour.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.tour.content.ContentDTO;



@Component
public class DataRepository {
	
	@Autowired
	DataSource ds;
	
	// content 삽입
	public void insertAll(ArrayList<ContentDTO> list) {
		Connection con = null;
		PreparedStatement pst = null;
		
		String sql = "insert into contentInfoTbl values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0)";
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			
			for(int i =0; i<list.size(); i++) {
				ContentDTO item = list.get(i);
				pst.setString(1, item.getContentid());
				pst.setInt(2, item.getContenttypeid());
				pst.setString(3, item.getCat1code());
				pst.setString(4, item.getCat2code());
				pst.setString(5, item.getCat3code());
				pst.setString(6, item.getTitle());
				pst.setInt(7, item.getSidoCode());
				// 시군구 코드 '01001'형식으로 변환
				String sidocode = String.format("%02d",item.getSidoCode());
				String sigungucodeStr = item.getSigunguCode();
				while(sigungucodeStr.length() < 3) {
					sigungucodeStr = "0" + sigungucodeStr;
				}
				String sigungucode = sidocode + sigungucodeStr;
				pst.setString(8, sigungucode);
				pst.setString(9, item.getAddress());
				pst.setString(10, item.getTel());
				pst.setString(11, item.getCreatedtime());
				pst.setString(12, item.getModifiedtime());
				pst.setString(13, item.getMapx());
				pst.setString(14, item.getMapy());
				pst.setString(15, item.getMlevel());
				pst.setString(16, item.getFirstimage());
				pst.setString(17, item.getFirstimage2());
				
				pst.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(pst,con);
	}
	
	
	// 홈페이지 및 상세내용 담기
	// 조건에 맞는 contentid 조회하기
	public ArrayList<String> selectCheck(int startnum, int endnum, String contenttypeid) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String sql = "select contentid from "
				   + "(select rownum as num, contentid from "
				   + "(select contentid from contentinfotbl where contenttypeid = '"+contenttypeid+"' order by createdtime desc)) "
				   + "where num between "+startnum+" and "+ endnum;
		// contenttypeid = 12 // 여행지
		// contenttypeid = 15 // 축제/공연/행사
		ArrayList<String> list = new ArrayList<>();
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				String contentid = rs.getString(1);
				list.add(contentid);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(rs, pst,con);
		return list;
	}

	// 조건에 맞는 contentid에 홈페이지, 상세내용 추가
	public void updateContent(ArrayList<DataDetailDTO> list2){
		Connection con = null;
		PreparedStatement pst = null;
		
		String sql = "update contentinfotbl set homepage = ?, overview = ? where contentid = ? ";
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			
			for(int i=0; i<list2.size(); i++) {
				DataDetailDTO item = list2.get(i);
				pst.setString(1, item.getHomepage());
				pst.setString(2, item.getOverview());
				pst.setString(3, item.getContentid());
				
				pst.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(pst, con);
	}
	
	// 여행지 추가 정보
	public void insertAreaAll(ArrayList<DataDetailDTO2> list) {
		Connection con = null;
		PreparedStatement pst = null;
		
		String sql = "insert into areatbl values(?,?,?,?,?,?,?)";
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			
			
			for(int i =0; i<list.size(); i++) {
				DataDetailDTO2 item = list.get(i);
				pst.setString(1, item.getContentid());
				pst.setString(2, item.getInfocenter());
				pst.setString(3, item.getRestdate());
				pst.setString(4, item.getExpguide());
				pst.setString(5, item.getExpagerange());
				pst.setString(6, item.getUsetime());
				pst.setString(7, item.getParking());
				
				pst.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	// 축제, 공연, 행사 시작일 및 종료일 
	public void insertEventAll(ArrayList<DataDetailDTO2> list) {
		Connection con = null;
		PreparedStatement pst = null;
		
		String sql = "insert into eventtbl values (?, ?, ?)";
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			
			for(int i =0; i<list.size(); i++) {
				DataDetailDTO2 item = list.get(i);
				pst.setString(1, item.getContentid());
				pst.setString(2, item.getEventstartdate());
				pst.setString(3, item.getEventenddate());
			
				try {
	                pst.executeUpdate();
	            } catch (SQLException e) {
	                // 무결성 제약 조건 위반 시 에러 처리
	                e.printStackTrace();
	                // 현재 처리 중인 데이터 출력
	                System.out.println("Error for Data: " + item.getContentid());
	                // 다음 데이터 처리를 위해 continue
	                continue;
	            }
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(pst,con);
	}
	
	// 축제 추가 정보
	public void insertEvent(ArrayList<DataDetailDTO2> list) {
		Connection con = null;
		PreparedStatement pst = null;
		
		String sql = "update eventtbl set sponsor1 = ?, sponsor2 = ?, eventplace = ?, eventhomepage = ?, "
				   + "agelimit = ? , usetimefestival = ? where contentid = ? ";
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			
			for(int i =0; i<list.size(); i++) {
				DataDetailDTO2 item = list.get(i);
				pst.setString(1, item.getSponsor1());
				pst.setString(2, item.getSponsor2());
				pst.setString(3, item.getEventplace());
				pst.setString(4, item.getEventhomepage());
				pst.setString(5, item.getAgelimit());
				pst.setString(6, item.getUsetimefestival());
				pst.setString(7, item.getContentid());
				
				try {
	                pst.executeUpdate();
	            } catch (SQLException e) {
	                // 무결성 제약 조건 위반 시 에러 처리
	                e.printStackTrace();
	                // 현재 처리 중인 데이터 출력
	                System.out.println("Error for Data: " + item.getContentid());
	                // 다음 데이터 처리를 위해 continue
	                continue;
	            }
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
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
