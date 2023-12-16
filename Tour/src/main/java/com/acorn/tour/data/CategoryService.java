package com.acorn.tour.data;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class CategoryService {

	@Autowired
	CategoryRepository rep;
	
	// 대분류
	public ArrayList<Category1DTO> getSelectAll(){
		ArrayList<Category1DTO> list = rep.selectAll();
		return list;
	}
	
	// 중분류
	public ArrayList<Category2DTO> getSelectAll2(){
		ArrayList<Category2DTO> list = rep.selectAll2();
		return list;
	}
	
	public void getInsertAll2(ArrayList<Category2DTO> list) {
		rep.insertAll2(list);
	}
	
	// 소분류
	public void getInsertAll3(ArrayList<Category3DTO> list) {
		rep.insertAll3(list);
	}
}
