package com.acorn.tour.image;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

	
@Component
public class ImageService {
	
	@Autowired
	ImageRepository rep;
	
	// 상세페이지 이미지
	public ArrayList<ImageDTO> getSelectImg(String contentId){
		ArrayList<ImageDTO> list = rep.selectImg(contentId);
		return list;
	}
	
	
}
