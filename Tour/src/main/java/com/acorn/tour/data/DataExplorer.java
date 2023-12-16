package com.acorn.tour.data;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Component;

import com.acorn.tour.content.ContentDTO;


@Component
public class DataExplorer {
 
	// serviceKey
	private String serviceKey() {
		String servicekey = "=sk0fN5MZZJs6cMbwwsAn%2FpTZblp1SHKLXTLub%2B12Crs2MRm%2FUoq480WTck8TWAFE9V2kQQMOMGfhOiyo4MBw%2BA%3D%3D"; //은경
		//String servicekey = "=CtQIphL%2B1EraRoFO5sjHcEInifXsxedGLcuF1UGefdG2uKMdScb9e5zN5je%2FRMLzG%2FeuF1l2w3UIa2DJv%2FKafA%3D%3D"; // 이윤
		return servicekey;
	}
	
	// contentid 널값일 경우 새로 contentid 생성을 위한 ArrayList
	ArrayList<Integer> cnt = new ArrayList<>();
	
	// 공공데이터에서 받아오는 전체 데이터의 갯수
	public Integer getTotal() throws IOException {
		StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551011/KorService1/areaBasedList1"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("content", "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("serviceKey", "UTF-8") + serviceKey()); /*Service Key*/
	
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();

		String result = sb.toString();
		
		JSONObject jsonResult = new JSONObject(result);
		JSONObject response = jsonResult.getJSONObject("response");
		JSONObject body = response.getJSONObject("body");
		int totalcnt = body.getInt("totalCount");
		
		return totalcnt;
	}
	
	
	// 공공데이터에서 받아오는 데이터
	public ArrayList<ContentDTO> getContentAPI(int listnum, int pagenum) throws IOException {
		
		ArrayList<ContentDTO> list = new ArrayList<>();
			
		StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551011/KorService1/areaBasedList1");/* URL */
		urlBuilder.append("?" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(listnum), "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(pagenum), "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("content", "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("serviceKey", "UTF-8") + serviceKey()); /*Service Key*/
	
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();

		String result = sb.toString();
		list =  fromJSONoItems(result);
		
		return list;
	}
	
	// 그 데이터를 변환
	public ArrayList<ContentDTO> fromJSONoItems(String result) {

		JSONObject jsonResult = new JSONObject(result);
		JSONObject response = jsonResult.getJSONObject("response");
		JSONObject body = response.getJSONObject("body");
		JSONObject items = body.getJSONObject("items");
		JSONArray item = items.getJSONArray("item");

		ArrayList<ContentDTO> list = new ArrayList<>();

		String contentid = ""; // 게시물 ID
		int contenttypeid = 0; // 게시물 유형 (장소/축제/공연 등)
		int sidoCode = 0; // 시/도 코드 
		
		
		for (int i = 0; i < item.length(); i++) {
			JSONObject tem = item.getJSONObject(i);
			
			// 게시물 ID
			if(tem.getString("contentid").isEmpty()) {
				contentid = contentId();
			}else {
				contentid = tem.getString("contentid");
			}
			
		    // 게시물 유형 (장소/축제/공연 등)
		    if(tem.getString("contenttypeid").isEmpty()) {
		    	contenttypeid = 0;
		    }else {
		    	contenttypeid = Integer.parseInt(tem.getString("contenttypeid")); 
		    }
		    String cat1code = tem.getString("cat1"); // 대분류
		    String cat2code = tem.getString("cat2"); // 중분류
		    String cat3code = tem.getString("cat3"); // 소분류
		    String title = tem.getString("title"); // 게시물 제목
		    
		    // 시/도 코드 
		    if(tem.getString("areacode").isEmpty()) {
		    	sidoCode = 0;
		    }else {
		    	sidoCode = Integer.parseInt(tem.getString("areacode")); 
		    }
		    
		    String sigunguCode = tem.getString("sigungucode");   // 시/군/구 코드
		    String address = tem.getString("addr1")+ " " + tem.getString("addr2");  // 주소
		    String tel = tem.getString("tel");  // 전화번호
		    String createdtime = tem.getString("createdtime"); // 생성시간
		    String modifiedtime = tem.getString("modifiedtime"); // 수정시간
		    String mapx = tem.getString("mapx");  // 지리적 경도
		    String mapy = tem.getString("mapy");  // 지리적 위도
		    String mlevel = tem.getString("mlevel"); // 지도레벨
		    String firstimage = tem.getString("firstimage");
		    String firstimage2 = tem.getString("firstimage2");
			
			ContentDTO itemdto = new ContentDTO();
			itemdto.setContentid(contentid);
			itemdto.setContenttypeid(contenttypeid);
			itemdto.setCat1code(cat1code);
			itemdto.setCat2code(cat2code);
			itemdto.setCat3code(cat3code);
			itemdto.setTitle(title);
			itemdto.setSidoCode(sidoCode);
			itemdto.setSigunguCode(sigunguCode);
			itemdto.setAddress(address);
			itemdto.setTel(tel);
			itemdto.setCreatedtime(createdtime);
			itemdto.setModifiedtime(modifiedtime);
			itemdto.setMapx(mapx);
			itemdto.setMapy(mapy);
			itemdto.setMlevel(mlevel);
			itemdto.setFirstimage(firstimage);
			itemdto.setFirstimage2(firstimage2);
			
			list.add(itemdto);
			
		}
		return list;
	}
	
	// cotentid 값이 null일 경우 새로운 contentid를 넣어주는 메소드
	public String contentId() {
		if(cnt.size() == 0) {
			cnt.add(1);
		}else {
			cnt.add(cnt.size()+1);
		}
		System.out.println("ct" + String.valueOf(cnt.size()));
		return "ct" + String.valueOf(cnt.size());
	}
	

	// 공통정보 조회 목록
	// startnum ~ endnum 까지 데이터의 홈페이지 및 상세내용 조회
	public DataDetailDTO getContentDetailAPI(String id) throws IOException {
		
		StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551011/KorService1/detailCommon1");/* URL */
		urlBuilder.append("?" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("contentDetail", "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("contentId", "UTF-8") + "=" + URLEncoder.encode(id, "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("defaultYN", "UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("overviewYN", "UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("serviceKey", "UTF-8") + serviceKey()); /*Service Key*/
		
		String result = url(urlBuilder);
		System.out.println(result);
		// 데이터 json으로 변환
		JSONObject jsonResult = new JSONObject(result);
		JSONObject response = jsonResult.getJSONObject("response");
		JSONObject body = response.getJSONObject("body");
		JSONObject items = body.getJSONObject("items");
		JSONArray item = items.getJSONArray("item");
		
		JSONObject tem = item.getJSONObject(0);
		
		String contentid = tem.getString("contentid"); 
		String homepage = tem.getString("homepage"); 
		String overview = tem.getString("overview"); 
		
		DataDetailDTO itemdto = new DataDetailDTO();
		itemdto.setContentid(contentid);
		itemdto.setHomepage(homepage);
		itemdto.setOverview(overview);
		
		return itemdto;
	}
	
	
	// 행사정보 조회 목록(시작일, 종료일)
	public ArrayList<DataDetailDTO2> getContentDetail2API(int listnum, int pagenum) throws IOException {
		
		StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551011/KorService1/searchFestival1");/* URL */
		urlBuilder.append("?" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(listnum), "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(pagenum), "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("contentDetail2", "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("eventStartDate", "UTF-8") + "=" + URLEncoder.encode("20041217", "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("serviceKey", "UTF-8") + serviceKey()); /*Service Key*/
		
		String result = url(urlBuilder);
		
		JSONObject jsonResult = new JSONObject(result);
		JSONObject response = jsonResult.getJSONObject("response");
		JSONObject body = response.getJSONObject("body");
		JSONObject items = body.getJSONObject("items");
		JSONArray item = items.getJSONArray("item");
		
		ArrayList<DataDetailDTO2> list = new ArrayList<>();
		
		for (int i = 0; i < item.length(); i++) {
			JSONObject tem = item.getJSONObject(i);
			
			String contentid = tem.getString("contentid"); 
			String eventstartdate = tem.getString("eventstartdate"); 
			String eventenddate = tem.getString("eventenddate"); 
			
			DataDetailDTO2 itemdto =  new DataDetailDTO2(contentid, eventstartdate, eventenddate);
			list.add(itemdto);
		}
		return list;
	}
	
	// 소개정보 조회 목록
	public DataDetailDTO2 getContentDetail3API(String id, String contenttypeid) throws IOException {
			
		StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551011/KorService1/detailIntro1");/* URL */
		urlBuilder.append("?" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("contentDetail", "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("contentId", "UTF-8") + "=" + URLEncoder.encode(id, "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("contentTypeId", "UTF-8") + "=" + URLEncoder.encode(contenttypeid, "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("serviceKey", "UTF-8") + serviceKey()); /*Service Key*/
		
		String result = url(urlBuilder);
		System.out.println(result);
		// 데이터 json으로 변환
		JSONObject jsonResult = new JSONObject(result);
		JSONObject response = jsonResult.getJSONObject("response");
		JSONObject body = response.getJSONObject("body");
		JSONObject items = body.getJSONObject("items");
		JSONArray item = items.getJSONArray("item");
		
		JSONObject tem = item.getJSONObject(0);
		DataDetailDTO2 itemdto = new DataDetailDTO2();
		if(contenttypeid.equals("12")) { // 여행지
			String contentid = tem.getString("contentid"); 
			String infocenter = tem.getString("infocenter");
			String restdate = tem.getString("restdate");
			String expguide = tem.getString("expguide");
			String expagerange = tem.getString("expagerange");
			String usetime = tem.getString("usetime");
			String parking = tem.getString("parking");
			
			itemdto.setContentid(contentid);
			itemdto.setInfocenter(infocenter);
			itemdto.setRestdate(restdate);
			itemdto.setExpguide(expguide);
			itemdto.setExpagerange(expagerange);
			itemdto.setUsetime(usetime);
			itemdto.setParking(parking);
		}else { // 축제/공연/행사(15)
			String contentid = tem.getString("contentid");
			String eventstartdate = tem.getString("eventstartdate");
			String eventenddate = tem.getString("eventenddate");
			String sponsor1 = tem.getString("sponsor1");
			String sponsor2 = tem.getString("sponsor2");
			String playtime = tem.getString("playtime");
			String eventplace = tem.getString("eventplace");
			String eventhomepage = tem.getString("eventhomepage");
			String agelimit = tem.getString("agelimit");
			String usetimefestival = tem.getString("usetimefestival");
			
			itemdto.setContentid(contentid);
			itemdto.setEventstartdate(eventstartdate);
			itemdto.setEventenddate(eventenddate);
			itemdto.setSponsor1(sponsor1);
			itemdto.setSponsor2(sponsor2);
			itemdto.setPlaytime(playtime);
			itemdto.setEventplace(eventplace);
			itemdto.setEventhomepage(eventhomepage);
			itemdto.setAgelimit(agelimit);
			itemdto.setUsetimefestival(usetimefestival);
		}
		return itemdto;
	}
	
	// url 불러오는 함수
	public String url(StringBuilder urlBuilder) throws IOException {
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();

		String result = sb.toString();
		return result;
	}
	
	
}
