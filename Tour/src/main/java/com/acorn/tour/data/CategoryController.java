package com.acorn.tour.data;

import java.io.IOException;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CategoryController {

	
	@Autowired
	CategoryExplorer api;
	
	@Autowired
	CategoryService s;
	
	
	// 중분류
	@ResponseBody
	@GetMapping(value = "/cat2All", produces = "application/json;charset=UTF-8")
	public void cat2API() throws IOException {
		ArrayList<Category1DTO> list = s.getSelectAll();
		ArrayList<Category2DTO> result = api.getCategory2API(list);
		s.getInsertAll2(result);
	}
	
	// 소분류
	@ResponseBody
	@GetMapping(value = "/cat3All", produces = "application/json;charset=UTF-8")
	public void cat3API() throws IOException {
		ArrayList<Category2DTO> list2 = s.getSelectAll2();
		ArrayList<Category3DTO> result = api.getCategory3API(list2);
		s.getInsertAll3(result);
	}

	
}
