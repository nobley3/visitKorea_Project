package com.acorn.tour.data;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CategoryExplorer {

	@Autowired
	CategoryExplorer api;
	
	// 공공데이터에서 제공하는 데이터
	
	// 중분류
	public ArrayList<Category2DTO> getCategory2API(ArrayList<Category1DTO> list) throws IOException {
		
		ArrayList<Category2DTO> list2 = new ArrayList<>();
		ArrayList<Category2DTO> listResult = new ArrayList<>();
		
		for(int i=0; i<list.size(); i++) {
			StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551011/KorService1/categoryCode1"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); 
			urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("category2", "UTF-8")); 
			urlBuilder.append("&" + URLEncoder.encode("cat1", "UTF-8") + "=" + URLEncoder.encode(list.get(i).getCat1code(), "UTF-8")); 
			urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); 
			urlBuilder.append("&" + URLEncoder.encode("serviceKey", "UTF-8") + "=sk0fN5MZZJs6cMbwwsAn%2FpTZblp1SHKLXTLub%2B12Crs2MRm%2FUoq480WTck8TWAFE9V2kQQMOMGfhOiyo4MBw%2BA%3D%3D"); /*Service Key*/
		
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
			list2 = api.fromJSONoItems2(result, list.get(i).getCat1code());
			
			listResult.addAll(list2);

		}
		return listResult;
	}
	
	public ArrayList<Category2DTO> fromJSONoItems2(String result, String cat1code) {

		JSONObject jsonResult = new JSONObject(result);
		JSONObject response = jsonResult.getJSONObject("response");
		JSONObject body = response.getJSONObject("body");
		JSONObject items = body.getJSONObject("items");
		JSONArray item = items.getJSONArray("item");

		ArrayList<Category2DTO> list = new ArrayList<>();

		for (int i = 0; i < item.length(); i++) {
			JSONObject tem = item.getJSONObject(i);
			
			String cat2code = tem.getString("code") ;
			String name = tem.getString("name");
			
			Category2DTO itemdto = new Category2DTO();
			itemdto.setCat2code(cat2code);
			itemdto.setName(name);
			itemdto.setCat1code(cat1code);
			
			list.add(itemdto);
		}
		return list;
	}
	
	
	// 소분류
	public ArrayList<Category3DTO> getCategory3API(ArrayList<Category2DTO> list2) throws IOException {
		
		ArrayList<Category3DTO> list3 = new ArrayList<>();
		ArrayList<Category3DTO> listResult = new ArrayList<>();
		
		for(int i=0; i<list2.size(); i++) {
			
			StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551011/KorService1/categoryCode1"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); 
			urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); 
			urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("category3", "UTF-8")); 
			urlBuilder.append("&" + URLEncoder.encode("cat1", "UTF-8") + "=" + URLEncoder.encode(list2.get(i).getCat1code(), "UTF-8")); 
			urlBuilder.append("&" + URLEncoder.encode("cat2", "UTF-8") + "=" + URLEncoder.encode(list2.get(i).getCat2code(), "UTF-8")); 
			urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); 
			urlBuilder.append("&" + URLEncoder.encode("serviceKey", "UTF-8") + "=sk0fN5MZZJs6cMbwwsAn%2FpTZblp1SHKLXTLub%2B12Crs2MRm%2FUoq480WTck8TWAFE9V2kQQMOMGfhOiyo4MBw%2BA%3D%3D"); /*Service Key*/
		
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
			list3 = api.fromJSONoItems3(result, list2.get(i).getCat1code(), list2.get(i).getCat2code());
			listResult.addAll(list3);
		}
		
		return listResult;
	}
	
	public ArrayList<Category3DTO> fromJSONoItems3(String result, String cat1code, String cat2code) {

		JSONObject jsonResult = new JSONObject(result);
		JSONObject response = jsonResult.getJSONObject("response");
		JSONObject body = response.getJSONObject("body");
		JSONObject items = body.getJSONObject("items");
		JSONArray item = items.getJSONArray("item");
		
		ArrayList<Category3DTO> list = new ArrayList<>();

		for (int i = 0; i < item.length(); i++) {
			JSONObject tem = item.getJSONObject(i);
			
			String name = tem.getString("name");
			String cat3code = tem.getString("code") ;
			
			Category3DTO itemdto = new Category3DTO();
			itemdto.setCat3code(cat3code);
			itemdto.setName(name);
			itemdto.setCat1code(cat1code);
			itemdto.setCat2code(cat2code);
			
			list.add(itemdto);
		}
		return list;
	}
	
	
	
}
