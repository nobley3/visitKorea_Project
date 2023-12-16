package com.acorn.tour.festival;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.tour.content.ContentDTO;



@Component
public class FestivalRepository {
	
	@Autowired
	DataSource ds;
	
	// content 전체 갯수
	public Integer totalCnt(int sidoCode) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "";
		int result = 0;
		
		if(sidoCode == 0) {
			sql = "select count(*) from contentInfoTbl where contenttypeid = '15' and cat2 = 'A0207'" ;
		}else {
			sql = "select count(*) from contentInfoTbl where contenttypeid = '15' and cat2 = 'A0207' and sidoCode = " + sidoCode;
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
	public ArrayList<ContentDTO> selectAllLatest(int startList, int endList, int sidoCode) {
		
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "";
		
		sql = "select ct.contentid, ct.title, ct.sidoCode, sd.nickName, sg.sigungucode, sg.name, ct.firstimage, "
			+ "to_char(to_date(ev.eventstartdate, 'YYYYMMDD'), 'YYYY-MM-DD') eventstartdate, "
			+ "to_char(to_date(ev.eventenddate, 'YYYYMMDD'), 'YYYY-MM-DD') eventenddate from  "
			+ "(select rownum as num, contentid, title, sidoCode, sigungucode, firstimage "
			+ "from (select * from contentInfoTbl  ";
		if(sidoCode == 0) {
			sql += "where contenttypeid = '15' and cat2 = 'A0207'" ;
		}else {
			sql += "where contenttypeid = '15' and cat2 = 'A0207' and sidoCode = " + sidoCode;
		}
		sql += "order by createdtime desc)) ct ";
		sql += "join SidoTbl sd on sd.sidocode = ct.sidocode ";
		sql += "join SigunguTbl sg on sg.sigungucode = ct.sigungucode ";
		sql += "join eventtbl ev on ct.contentid =  ev.contentid ";
		sql += "where num between "+startList+" and "+endList + " ";
		sql += "order by num";
		
		
		ArrayList<ContentDTO> contentList = new ArrayList<>();
		ContentDTO content = new ContentDTO();
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
				String eventstartdate = rs.getString(8);
				String eventenddate = rs.getString(9);
				
				content = new ContentDTO(contentid, title, sidoCode, nickName, sigunguCode, sigunguname, firstimage, eventstartdate, eventenddate);
				
				contentList.add(content);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close(rs,pst,con);
		return contentList;
	}
	
	
	
	
	// 거리별 content 전체 
	public ArrayList<ContentDTO> distanceAll(int sidoCode) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String sql = "";
		
		if(sidoCode == 0) {
			sql = "select contentid, mapx, mapy from contentInfoTbl where contenttypeid = '15' and cat2 = 'A0207'";
		}else {
			sql = "select contentid, mapx, mapy from contentInfoTbl where contenttypeid = '15' and cat2 = 'A0207' and sidoCode = " + sidoCode;
		}
		
		ArrayList<ContentDTO> list = new ArrayList<>();
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				String contentid = rs.getString(1);
				String mapx = rs.getString(2);
				String mapy = rs.getString(3);
				
				ContentDTO content = new ContentDTO(contentid, mapx, mapy);
				list.add(content);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(rs,pst,con);
		return list;
	}
	
	// 위도 경도로 계산한 거리별로 정렬하기
	public ArrayList<ContentDTO> haversine(double lat1, double lon1, int sidoCode) {
		
		ArrayList<ContentDTO> list = distanceAll(sidoCode);
		ArrayList<ContentDTO> listResult = new ArrayList<>();
        final int R = 6371; // 지구의 반지름 (단위: km)

        for(int i=0; i<list.size(); i++) {
        	// 위도와 경도를 라디안으로 변환
        	ContentDTO item = list.get(i);
        	
            double lat1Rad = Math.toRadians(lat1); // 위도
            double lon1Rad = Math.toRadians(lon1); // 경도
            double lat2Rad = Math.toRadians(Double.parseDouble(item.getMapy()));
            double lon2Rad = Math.toRadians(Double.parseDouble(item.getMapx()));

            // Haversine 공식을 사용하여 거리 계산
            double dlat = lat2Rad - lat1Rad;
            double dlon = lon2Rad - lon1Rad;
            double a = Math.pow(Math.sin(dlat / 2), 2) + Math.cos(lat1Rad) * Math.cos(lat2Rad) * Math.pow(Math.sin(dlon / 2), 2);
            double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
            double distance = R * c; // km
            
            listResult.add(new ContentDTO(item.getContentid(), distance));
        }
        
        // 거리순으로 정렬
        Collections.sort(listResult, new Comparator<ContentDTO>() {
			@Override
			public int compare(ContentDTO o1, ContentDTO o2) {
				return Double.compare(o1.getDistance(), o2.getDistance());
			}
        });

        return listResult;
    }
	
	
	// 거리별로 정렬된 리스트 10개씩 표출
	public ArrayList<ContentDTO> selectAllDistance(double lat1, double lon1, int startList, int endList, int sidoCode) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String sql = "";
		
		sql = "select ct.contentid, ct.title, ct.sidoCode, sd.nickName, sg.sigungucode, sg.name, ct.firstimage,  " 
			+ "to_char(to_date(ev.eventstartdate, 'YYYYMMDD'), 'YYYY-MM-DD') eventstartdate, "
			+ "to_char(to_date(ev.eventenddate, 'YYYYMMDD'), 'YYYY-MM-DD') eventenddate   "
			+ "from (select contentid, title, sidoCode, sigungucode, firstimage from contentInfoTbl ";
		if(sidoCode == 0) {
			sql += "where contentid= ? ) ct ";
		}else {
			sql += "where contentid= ? and sidoCode = "+ sidoCode +" ) ct ";
		}
		sql += "join SidoTbl sd on sd.sidocode = ct.sidocode ";
		sql += "join SigunguTbl sg on sg.sigungucode = ct.sigungucode ";
		sql += "join eventtbl ev on ct.contentid =  ev.contentid ";
		
		
		
		ArrayList<ContentDTO> list = haversine(lat1, lon1, sidoCode);
		ArrayList<ContentDTO> listResult = new ArrayList<>();
		
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			for(int i=(startList-1); i < endList; i++) {
				pst.setString(1, list.get(i).getContentid());
				rs = pst.executeQuery();
				
				ContentDTO content = new ContentDTO();
				if(rs.next()) {
					String contentid = rs.getString(1); // 게시물 ID
				    String title = rs.getString(2); // 게시물 제목
				    sidoCode = rs.getInt(3); // 시/도 코드
				    String nickName = rs.getString(4);   // 시도 별칭
				    String sigunguCode = rs.getString(5);   // 시/군/구 코드
				    String sigunguname = rs.getString(6);   // 시/군/구 이름
				    String firstimage = rs.getString(7);
				    double distance = list.get(i).getDistance();
					String eventstartdate = rs.getString(8);
					String eventenddate = rs.getString(9);
					
					content = new ContentDTO(contentid, title, sidoCode, nickName, sigunguCode, sigunguname, firstimage, distance, eventstartdate, eventenddate);
				}
				listResult.add(content);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(rs,pst,con);
		return listResult;
	}
	
	
	// 인기순 
	public ArrayList<ContentDTO> selectAllPopular(int startList, int endList, int sidoCode) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String sql = "";
		
		sql = "select ct.contentid, ct.title, ct.sidoCode, sd.nickName, sg.sigungucode, sg.name, ct.firstimage, "
			+ "to_char(to_date(ev.eventstartdate, 'YYYYMMDD'), 'YYYY-MM-DD') eventstartdate, "
			+ "to_char(to_date(ev.eventenddate, 'YYYYMMDD'), 'YYYY-MM-DD') eventenddate   "
			+ "from (select rownum as num, contentid, title, sidoCode, sigungucode, firstimage, view_cnt "
			+ "from (select * from contentInfoTbl  ";
		if(sidoCode == 0) {
			sql += "where contenttypeid = '15' and cat2 = 'A0207'";
		}else {
			sql += "where contenttypeid = '15' and cat2 = 'A0207' and sidoCode = " + sidoCode +" ";
		}
		sql += "order by view_cnt desc)) ct ";
		sql += "join SidoTbl sd on sd.sidocode = ct.sidocode ";
		sql += "join SigunguTbl sg on sg.sigungucode = ct.sigungucode ";
		sql += "join eventtbl ev on ct.contentid =  ev.contentid ";
		sql += "where num between "+startList+" and "+endList;
		
		ArrayList<ContentDTO> list = new ArrayList<>();
		ContentDTO content = new ContentDTO();
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
				String eventstartdate = rs.getString(8);
				String eventenddate = rs.getString(9);
				
				content = new ContentDTO(contentid, title, sidoCode, nickName, sigunguCode, sigunguname, firstimage, eventstartdate, eventenddate);
				
				list.add(content);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(rs,pst,con);
		return list;
	}
	
	// 상세페이지에 표출할 내용
	public FestivalDTO selectOne(String contentId) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		String sql = "select ct.contentid, ct.title, ct.sidoCode, sd.nickName, sg.sigungucode, sg.name, "
				   + "ct.address, ct.tel, ct.mapx, ct.mapy, ct.firstimage, ct.view_cnt, ct.homepage, ct.overview, "
				   + "to_char(to_date(ev.eventstartdate, 'YYYYMMDD'), 'YYYY-MM-DD') eventstartdate, "
				   + "to_char(to_date(ev.eventenddate, 'YYYYMMDD'), 'YYYY-MM-DD') eventenddate, "
				   + "ev.sponsor1, ev.sponsor2, ev.playtime, ev.eventplace, ev.agelimit, ev.usetimefestival "
				   + "from (select * from contentInfoTbl where contentid= ?) ct "
				   + "join SidoTbl sd on sd.sidocode = ct.sidocode "
				   + "join SigunguTbl sg on sg.sigungucode = ct.sigungucode "
				   + "join eventtbl ev on ct.contentid =  ev.contentid ";
		
		
		FestivalDTO content = new FestivalDTO();		
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
			    String address = rs.getString(7);
			    String tel = rs.getString(8);
			    String mapx = rs.getString(9);
			    String mapy = rs.getString(10); 
			    String firstimage = rs.getString(11);
			    int view_cnt = rs.getInt(12);
			    String homepage = rs.getString(13);
			    String overview = rs.getString(14);
			    String eventstartdate = rs.getString(15);
			    String eventenddate = rs.getString(16);
			    String sponsor1 = rs.getString(17);
			    String sponsor2 = rs.getString(18);
			    String playtime = rs.getString(19);
			    String eventplace = rs.getString(20);
			    String agelimit = rs.getString(21);
			    String usetimefestival = rs.getString(22);
			   
			    
			    content = new FestivalDTO(contentid,title,sidoCode,nickName,sigunguCode,sigunguname,address,tel, mapx, mapy,
			    		firstimage, view_cnt, homepage, overview, eventstartdate, eventenddate, sponsor1, sponsor2, playtime, 
			    		eventplace, agelimit, usetimefestival);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(rs,pst,con);
		return content;
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
