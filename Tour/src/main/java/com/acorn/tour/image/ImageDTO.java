package com.acorn.tour.image;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor // 기본생성자
@AllArgsConstructor // 매개변수 있는 생성자
public class ImageDTO {
	
    // 이미지 
    String imgid;
    String contentid; // 게시물 ID
    String imgurl;
    String imgnum;
    
}
