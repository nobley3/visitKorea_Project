<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.acorn.tour.recommend.RecSpot" %>
<%@ page import="com.acorn.tour.recommend.RecRestaurant" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 
  *{
    margin:0;
    padding:0;
  }
  .nj_total_box{
    display: flex;
  }
  .nj_rectour_result_box{
    position: absolute;
    top: 0px;
    left: 0px;
    z-index: 99;
    background-color: white;
    height: 100%;
    width: 405px;
  }
  .nj_rectour_result_box_top{
    display: flex;
    border-bottom: 1px solid gray;
  }
  .nj_rectour_days{
    position: absolute;
    right: 25px;
    top: 26px;
    width: 181px;
    height: 65px;
    background: url("http://korean.visitkorea.or.kr/resources/images/location/map_legend2.png")50% 50% no-repeat;
    background-size: contain;
    z-index: 99;
}
  }
  .nj_rectour_days_txt{
    display: flex;
  }
  ul{
    list-style: none;
  }
  .nj_rectour_result_box_menu{
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 20px 0;
    text-align: center;
    height: 50px;
  }
  .nj_rectour_result_box_back{
    position: absolute;
    left: 20px;
    top: 20px;
    width: 20px;
    height: 21px;
    background: url('http://korean.visitkorea.or.kr/resources/images/location/btn_back.png')50% 50% no-repeat;
    background-size: contain;
  }
  .nj_rectour_result_box_share{
    position: relative;
    width: 80px;
    left: 120px;
    top: 8px;
  }
  .nj_rectour_result_box_h1{
    padding-left: 60px;
    font-weight: 700;
    font-size: 20px;
    color: #000;
    line-height: 60px;
    letter-spacing: -0.5px;
  }
  .nj_rectour_result_box_share_pdf{
    float: left;
    width: 23px;
    height: 24px;
    background: url('http://korean.visitkorea.or.kr/resources/images/location/btn_top_pdf.png') 50% 50% no-repeat;
    background-size: contain;
    border: none;
    cursor: pointer;
    position: absolute;
    border: 0 none;
    left: 18px;
    top: 9px;
  }
  .nj_rectour_result_box_share_good{
    float: left;
    margin-left: 15px;
    width: 23px;
    height: 24px;
    background: url('http://korean.visitkorea.or.kr/resources/images/location/btn_share.png') no-repeat;
    position: absolute;
    border: 0 none;
    right: 0px;
    top: 8px;
    cursor: pointer;
  }
  .nj_rectour_result_box_share_good_good{
    margin-left: 15px;
    width: 22px;
    height: 24px;
    background: url('http://korean.visitkorea.or.kr/resources/images/location/btn_share.png') no-repeat;
    background-position: 0 -24px;
    cursor: pointer;
  }
  
  .nj_rectour_result_box_menu_txt{
    flex-grow: 1;
    flex-basis: 0;
    font-size: 17px;
    font-weight: 700;
    letter-spacing: -0.6px;
    line-height: 54px;
  }
  .nj_rectour_info_box{
    box-sizing: border-box;
  }
  .nj_rectour_info_box_day3{
    background: #318cf2;
    position: relative;
    padding: 0 0 20px;
    overflow: hidden;
    display: flex;
    transition: height .3s ease-in-out;
 
  }
  .nj_box_wrap{
    position: relative;
    margin: 0 20px;
    height: 100%;
    z-index: 5;
    width: 400px;
  }
  .nj_stit_wrap{
    display: flex;
    justify-content: space-between;
  }
  .nj_stit{
    font-size: 22px;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
    display: block;
    color: #fff;
    padding: 20px 0;
    font-weight: 300;
    letter-spacing: -1px;
    line-height: 25px;
  }
  .nj_inr{
    width: auto;
    background: #fff;
    padding: 0 0 15px;
    border-radius: 5px;
    margin: 0 auto;
    position: relative;
    height: 100px;
  }
  .nj_stay{
    background: #318cf2;
    float: left;
    margin: 20px 0 0 15px;
    width: 63px;
    height: 63px;
    line-height: 63px;
    text-align: center;
    font-weight: 400;
    color: #fff;
    border-radius: 100%;
    font-size: 14px;
  }
  .nj_inr ul{
    line-height: 19px;
    color: #000;
    letter-spacing: -0.8px;
    margin-left: 105px;
    position: absolute;
    top: 15px;
    
  }
  .nj_inr li{
    list-style: disc;
    font-size: 8px;
  }
  .nj_inr span{
    font-size: 16px;
    line-height: 19px;
  }
  .nj_day_tit{
    position: relative;
    margin: 0 20px;
  }
  .nj_r_btn{
    position: absolute;
    right: 0px;
    display: flex;
    top: 27px;
  }
  .nj_not_editing{
    font-size: 16px;
    letter-spacing: -0.5px;
    color: #767676;
    position: relative;
    border: 0 none;
    background-color: transparent;
    cursor: pointer;

  }
  .nj_num{
    width: 30px;
    flex-shrink: 0;
    font-size: 20px;
    letter-spacing: -0.8px;
    color: #333;
  }
  .nj_img{
    width: 80px;
    height: 80px;
    flex-shrink: 0;
    border-radius: 100%;
    background-size: cover;
    background-position: 50% 50%;
    background-repeat: no-repeat;
  }
  .nj_info{
    flex-grow: 1;
    padding: 0 20px 0 15px;
    overflow: hidden;
  }
  .nj_sort_type1{
    display: inline-block;
    width: 48px;
    height: 20px;
    line-height: 19px;
    font-size: 14px;
    text-align: center;
    letter-spacing: -0.6px;
    color: #fff;
    background: #318cf2;
  }
  .nj_sort_type2{
    display: inline-block;
    width: 48px;
    height: 20px;
    line-height: 19px;
    font-size: 14px;
    text-align: center;
    letter-spacing: -0.6px;
    color: #fff;
    background: #02b9c9;
  }
  .nj_sort_type3{
    display: inline-block;
    width: 48px;
    height: 20px;
    line-height: 19px;
    font-size: 14px;
    text-align: center;
    letter-spacing: -0.6px;
    color: #fff;
    background: #1ac788;
  }
  .nj_rectour_info_scroll{
    overflow: scroll;
    height: calc(100% - 110px);
    border-top: 1px solid #e5e6e8;
  }
  .nj_rectour_info_scroll::-webkit-scrollbar{
    width: 6px;
    height: 6px;
  }
  .nj_rectour_info_scroll::-webkit-scrollbar-thumb{
    border-radius: 3px;
    background: #abadac;
  }
  .nj_rectour_info_scroll::-webkit-scrollbar-track{
    background: #e5e5e5;
  }
  
  .nj_day_tit strong{
    display: inline-block;
    padding: 27px 0 10px;
    font-weight: 800;
    font-size: 20px;
    line-height: 23px;
    letter-spacing: -0.8px;
    color: #333;
  }
  .nj_sump_list li{
    padding: 10px 20px 10px;
    position: relative;
    display: flex;
    align-items: center;
  }
  .nj_tit{
    display: block;
    margin: 10px 0 3px;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
    font-size: 18px;
    line-height: 22px;
    letter-spacing: -0.8px;
    font-weight: 700;
    color: #333;
  }
  .nj_adrs{
    display: block;
    font-size: 14px;
    line-height: 16px;
    font-weight: 300;
    color: #767676;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
  }
  .nj_bookmark{
    position: absolute;
    right: 13px;
    top: 50%;
    margin-top: -16px;
    width: 17px;
    height: 18px;
    background: url('http://korean.visitkorea.or.kr/resources/images/location/icon_bookmark02.png') no-repeat;
    border: 0 none;  
    cursor: pointer;
  }
  .nj_bookmark_on{
    background-position: 0 -18px;
  }
  .nj_exposure{
    padding: 0 0 0 10px;
    flex-shrink: 0;
    display: flex;
    align-items: center;
  }
  .nj_public{
    position: relative;
    line-height: 20px;
    color: #fff;
    border: 1px solid #fff;
    height: 22px;
    padding: 0 8px;
    border-radius: 50px;
    font-size: 13px;
    letter-spacing: -0.5px;
  }
  .nj_pc_depth2{
    height: 100%;
    width: 405px;
    z-index: 99;
    background-color: white;
    overflow-y: auto;
    position: absolute;
    top: 0px;
    left: 405px;
  }
  .nj_pc_depth2::-webkit-scrollbar {
    width: 6px;
    height: 6px;
  }
  .nj_pc_depth2::-webkit-scrollbar-thumb {
    border-radius: 3px;
    background: #abadac;
  }
  .nj_pc_depth2::-webkit-scrollbar-track-piece {
    background: #e5e5e5;
  }
  .nj_detail_img{
    position: relative;
  }
  .nj_detail_img a{
    display: block;
    height: 267px;
    background-position: 50% 50%;
    background-size: cover;
    background-repeat: no-repeat;
  }
  .nj_detail_data{
    position: relative;
    margin: 0 25px;
    padding: 30px 0 0;
  }
  .nj_detail_data em{
    display: block;
    font-size: 15px;
    font-weight: 300;
    color: #767676;
    line-height: 18px;
  }
  .nj_detail_data .nj_stit{
    padding: 7px 0 5px;
    font-weight: bold;
  }
  .nj_adrdress{
    display: block;
    font-size: 18px;
    line-height: 22px;
    letter-spacing: -0.8px;
    font-weight: 400;
    color: #333;
    overflow: hidden;
    display: -webkit-box;
    max-height: 48px;
    word-break: keep-all;
    text-overflow: ellipsis;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
  }
  .nj_data_btn{
    display: flex;
    justify-content: center;
    margin: 30px 0;
  }
  .nj_good{
    display: flex;
    font-size: 16px;
    color: #333;
  }
  .nj_data_btn button{
    width: 23px;
    height: 21px;
    background: url('http://korean.visitkorea.or.kr/resources/images/location/icon_btn02.png') no-repeat;
    margin: 0 !important;
    border: 0 none;
    cursor: pointer;
  }
  .nj_count{
    padding-left: 8px;
    font-size: 16px;
    color: #333;
    line-height: 21px;
  }
  .nj_inquire{
    margin-left: 30px;
    display: flex;
    font-size: 16px;
    color: #333;
  }
  .nj_talk_wrap{
    padding: 0 25px;
    border-top: 1px solid #e6e6e6;
    position: relative;
  }
  .nj_talk_wrap .nj_tit{
    display: block;
    padding: 17px 0;
    font-size: 18px;
    color: #333;
  }
  .nj_talk_wrap .nj_tit span{
    display: inline-block;
    margin-left: -6px;
    font-weight: 700;
  }

  .nj_talk li{
    display: flex;
    padding: 30px 0 25px;
    border-bottom: 1px solid #ddd;
    position: relative;
  }
  .nj_talk .nj_profile{
    width: 60px;
  }
  .nj_profile .nj_img{
    position: relative;
    width: 50px;
    height: 50px;
    background-position: 50% 50%;
    background-size: cover;
    background-repeat: no-repeat;
    border-radius: 100%;
  }
  .nj_icon_kakao{
    background: url('http://korean.visitkorea.or.kr/resources/images/location/ico_kakao.png') 0 0 /100% 100% no-repeat;
    display: inline-block;
    width: 16px;
    height: 16px;
    position: absolute;
    right: 0;
    bottom: 0;
  }
  .nj_talk .nj_comment{
    flex: 2 1 0px;
  }
  .nj_talk .nj_comment p{
   padding-right: 10px;
   font-size: 16px;
   line-height: 20px;
   color: #333;
  }
  .nj_date{
   padding: 6px 0 0;
  }
  .nj_date span{
   font-size: 12px;
   line-height: 18px;
   display: inline-block;
   color: #333;
  }
  .nj_btn_report{
   float: left;
   width: 17px;
   height: 17px;
   background: url('https://korean.visitkorea.or.kr/resources/images/location/btn_m_report.png') 0 0 / 100% 100% no-repeat;
   border: 0 none;
   margin-left: 145px;
  }
  .nj_layer_close{
   position: absolute;
   left: 809px;
   top: 21px;
   width: 32px;
   height: 32px;
   z-index: 99;
   background: url('http://korean.visitkorea.or.kr/resources/images/location/btn_close_depth2.png') no-repeat;
   border: none;
   cursor: pointer;
  }
  .nj_a{
   dislay:none;
  }
  
</style>
<script>
function displayInfo(element) {
	  const depth2 = document.querySelector('.nj_pc_depth2');
	  depth2.style.display = 'block';
	  const btn = document.querySelector('.nj_layer_close');
	  btn.style.display='block';

	  const listItem = element.closest('li');

	  const imageSrc = listItem.querySelector('.nj_img').getAttribute('src');
	  const title = listItem.querySelector('.nj_tit').textContent;
	  const listItemSortType = listItem.querySelector('.nj_tit').previousElementSibling.textContent;
	  const address = listItem.querySelector('.nj_adrs').textContent;
	  var link = document.querySelector('.nj_a'); // 클래스 이름이 nj_a인 요소의 링크를 가져옴
	  var hrefValue = link.getAttribute('href'); // 가져온 링크의 href 속성 값을 가져옴
	  console.log(hrefValue); // href 속성 값 출력
	  console.log('Image Source:', imageSrc);
	  console.log('Title:', title);
	  console.log('Sort Type:', listItemSortType);

	  // 요소들을 가져와서 변수에 할당합니다.
	  const detailImgLink = document.querySelector('.nj_detail_img a');
	  const category = document.querySelector('.nj_category');
	  const titleLink = document.querySelector('.nj_stit a');
	  const addressElement = document.querySelector('.nj_adrdress');

	  detailImgLink.style.backgroundImage = "url('" + imageSrc + "')";
	  category.textContent = listItemSortType;
	  titleLink.textContent = title;
	  titleLink.setAttribute('href', hrefValue);
	  addressElement.textContent = address;
	}
function closeBox(){
	const depth2 = document.querySelector('.nj_pc_depth2');
	  if (depth2) {
	    depth2.style.display = 'none';
	  }
	const btn = document.querySelector('.nj_layer_close');
	btn.style.display='none';
}
</script>
</head>
<body>
	<div id="map" style="width: 100%; height: 100vh;">
	 <div class="nj_rectour_days">
	 </div>
	 <div class="nj_total_box">
	 <div class="nj_rectour_result_box">
		  <!-- AI콕콕 플래너 -->
		  <div class="nj_rectour_result_box_top">
		    <a href="#" class=nj_rectour_result_box_back></a>
		    <h1 class="nj_rectour_result_box_h1"><a href="#">AI콕콕 플래너</a></h1>
		    <div class="nj_rectour_result_box_share">
		       <button type="button" class="nj_rectour_result_box_share_pdf"></button>
		       <button type="button" class="nj_rectour_result_box_share_good" onclick="likeCourse(this)" title="no"></button>
		    </div>
		  </div>
		  <!-- 여행요약, 세부일정 -->
		  <div>
		    <ul class="nj_rectour_result_box_menu">
		      <li class="nj_rectour_result_box_menu_txt">여행요약</li>
		      <li class="nj_rectour_result_box_menu_txt">세부일정</li>
		    </ul>
		  </div>
		  <!-- 나의 여행코스 -->
		  <div class="nj_rectour_info_scroll">
			  <div class="nj_rectour_info_box">
			    <div class="nj_rectour_info_box_day3">
			      <div class="nj_box_wrap">
			        <div class="nj_stit_wrap">
			         
			          <strong class="nj_stit">${nickname}님을 위한 여행코스</strong>
			          <div class="nj_exposure">
			            <span class="nj_public">공개</span>
			          </div>
			        </div>
			        <div class="nj_inr">
			          <strong class="nj_stay">당일여행</strong>
			          <ul>
			            <li><span><strong>총 이동거리</strong>: ${myRecTour.totalDistance}Km</span></li>
			            <li><span><strong>여행지역</strong>: ${myRecTour.locations}</span></li>
			            <li><span>총 4개 여행지/음식점 추천!</span></li>
			          </ul>
			        </div>
			      </div>
			    </div>
			  </div>
			  <!-- 리스트 출력 -->
			  <div class="nj_sump_list">
			    <div class="nj_day_tit">
			      <strong>Day 1</strong>
			      <div class="nj_r_btn">
			        <button type="button" class="nj_not_editing">일정편집</button>
			      </div>
			    </div>
			    <!-- 데이터 출력 -->
			    <ul data-day="1">
			    
			      <li>
			        <div class="nj_num">1</div>
			        <img class="nj_img" src=${ spots[0].firstimage}>
			        <div class="nj_info">
			          <span class="nj_sort_type1">여행지</span>
			          <a class="nj_tit" href="#" onclick="displayInfo(this)">${ spots[0].title}</a>
			          <span class="nj_adrs">${ spots[0].address}</span>
			          <a class="nj_a" href="/tour/sightsDetail?contentId=${spots[0].contentid}"></a>
			        </div>
			        <button type="button" onclick="bookmark(this)" class="nj_bookmark" title="no"></button>
			      </li>
			      <li>
			        <div class="nj_num">2</div>
			        <img class="nj_img" src=${ restaurants[0].firstimage}>
			        <div class="nj_info">
			          <span class="nj_sort_type1">음식점</span>
			          <a class="nj_tit" href="#" onclick="displayInfo(this)">${ restaurants[0].title}</a>
			          <span class="nj_adrs">${ restaurants[0].address}</span>
			          <a class="nj_a" href="/tour/sightsDetail?contentId=${restaurants[0].contentid}"></a>
			        </div>
			        <button type="button" onclick="bookmark(this)" class="nj_bookmark" title="no"></button>
			      </li>
			      <li>
			        <div class="nj_num">3</div>
			        <img class="nj_img" src=${ spots[1].firstimage}>
			        <div class="nj_info">
			          <span class="nj_sort_type1">여행지</span>
			          <a class="nj_tit" href="#" onclick="displayInfo(this)">${ spots[1].title}</a>
			          <span class="nj_adrs">${ spots[1].address}</span>
			          <a class="nj_a" href="/tour/sightsDetail?contentId=${spots[1].contentid}"></a>
			        </div>
			        <button type="button" onclick="bookmark(this)" class="nj_bookmark" title="no"></button>
			      </li>
			      <li>
			        <div class="nj_num">4</div>
			        <img class="nj_img" src=${ restaurants[1].firstimage}>
			        <div class="nj_info">
			          <span class="nj_sort_type1">음식점</span>
			          <a class="nj_tit" href="#" onclick="displayInfo(this)">${ restaurants[1].title}</a>
			          <span class="nj_adrs">${ restaurants[1].address}</span>
			          <a class="nj_a" href="/tour/sightsDetail?contentId=${restaurants[1].contentid}"></a>
			        </div>
			        <button type="button" onclick="bookmark(this)" class="nj_bookmark" title="no"></button>
			      </li>
			    </ul>
			   
			    
			    

			  </div>
			  <div>
			  </div>
		  </div>
	 </div>
	   
	 <div class="nj_pc_depth2">
	   <div class="nj_detail_img">
	     <a href="/tour/sightsDetail?contentId=${spots[0].contentid}" style="background-image: url(${ spots[0].firstimage});"></a>
	   </div>
	   <div class="nj_detail_data">
	     <em class="nj_category">여행지</em>
	     <strong class="nj_stit"><a href="/tour/sightsDetail?contentId=${spots[0].contentid}">${spots[0].title}</a></strong>

	     <strong class="nj_adrdress">${ spots[0].address}</strong>
	     <div class="nj_data_btn">
	       <span class="nj_good">
	         <button type="button"></button>
	         <em class="nj_count">9</em>
	       </span>
	       <span class="nj_inquire">
	         <span>조회수</span>
	         <em class="nj_count">4814</em>
	       </span>
	     </div>
	   </div>
	   <div class="nj_talk_wrap">
	     <strong class="nj_tit"> 여행톡
	       <span class="nj_count">5</span>
	     </strong>
	     <div class="nj_talk">
	       <ul class="nj_list_reply">
	       <li>
	         <div class="nj_profile">
	           <div class="nj_img" style="background-image: url('https://cdn.eyesmag.com/content/uploads/posts/2023/07/06/everland-panda-birthday-party-f71332bb-ec07-496b-b46f-000159675d3c.jpg');">
	             <span class="nj_icon_kakao"></span>
	           </div>
	         </div>
	         <div calss="nj_comment">
	           <p>굳굳</p>
	           <div class="nj_date">
	             <span>푸바오</span>
	             <span>2023-11-30</span>
	           </div>
	         </div>
	         <div calss="nj_r_btn">
	           <button type="button" class="nj_btn_report"></button>
	         </div>
	       </li>
	       </ul>
	     </div>
	     <div class="nj_none_talk" style="display: none;">등록된 댓글이 없습니다.</div>
	     <div class="nj_reply_more">
	       <button type="button" class="type1" style></button>
	     </div>
	   </div>
	 </div>
	 <button class="nj_layer_close" type="button" onclick="closeBox()"></button>	
	 </div>
	</div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=60aaf708f2480827abf4c4a7ab34e91c"></script>
	<script type="text/javascript">
		// 위도 및 경도의 합 초기화
		var sumLat = 0;
		var sumLng = 0;	
		
		let latlng = ${courseListjson};
		console.log(latlng);
		console.log(latlng[0].mapx);
		var makerPathDay1 = [];
		var linePath=[];
		for(let i=0; i<latlng.length; i++){
			var item = new kakao.maps.LatLng(latlng[i].mapy, latlng[i].mapx);
			
			 console.log(  "dfdf"+  item);
			
			sumLat += parseFloat(latlng[i].mapy);
		    sumLng += parseFloat(latlng[i].mapx);
		    if(i<4){
		    	makerPathDay1.push(item);
		    }else if(i>3&& i<8){
		    	makerPathDay2.push(item);
		    }else{
		    	makerPathDay3.push(item);
		    }
		    linePath.push(item);
		}
	
		// 중심 좌표 계산
		var centerLat = (sumLat / linePath.length).toFixed(10);
		var centerLng = (sumLng / linePath.length).toFixed(10);
		
		console.log(centerLat);
		console.log(centerLng);
	
	
		var mapContainer = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var mapOption = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(centerLat, centerLng), //지도의 중심좌표.
			level: 8 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(mapContainer, mapOption); //지도 생성 및 객체 리턴
		// 지도에 표시할 선을 생성합니다
		var linePathDay1 = new kakao.maps.Polyline({
		    path: makerPathDay1, // 선을 구성하는 좌표배열 입니다
		    strokeWeight: 3, // 선의 두께 입니다
		    strokeColor: '#318cf2', // 선의 색깔입니다
		    strokeOpacity: 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    strokeStyle: 'shortdash' // 선의 스타일입니다
		});
		
		
		// 지도에 선을 표시합니다 
		linePathDay1.setMap(map);  
		
		var imageSrc=[
			"http://korean.visitkorea.or.kr/resources/images/location/map_onmarker1_1.png",
			"http://korean.visitkorea.or.kr/resources/images/location/map_onmarker1_2.png",
			"http://korean.visitkorea.or.kr/resources/images/location/map_onmarker1_3.png"
			
		];
		for (var i = 0; i < 4; i++) {
		    var imageSize = new kakao.maps.Size(40, 40); 
		    var markerImageDay1 = new kakao.maps.MarkerImage(imageSrc[0], imageSize); 
		   

		    var markerDay1 = new kakao.maps.Marker({
		        position: makerPathDay1[i],
		        image: markerImageDay1
		    });
		    
		    markerDay1.setMap(map);  
		    
		}

		function likeCourse(button) {
		    if(button.title=="no"){
		    	alert("좋아요를 누르셨습니다.");
		    	button.classList.add('nj_rectour_result_box_share_good_good');
		    	button.title="yes";
		    	button.style.backgroundPosition = "0 -24px";
		    }else{
		    	alert("좋아요가 취소되었습니다.");
		    	button.classList.add('nj_rectour_result_box_share_good');
		    	button.title="no";
		    	button.style.backgroundPosition = "0 0";
		    }
		}
		
		

		function bookmark(button) {
		    if(button.title=="no"){
		    	alert("즐겨찾기에 추가 되었습니다.");
		    	button.classList.add('nj_bookmark_on');
		    	button.title="yes";
		    	button.style.backgroundPosition = "0 -18px";
		    }else{
		    	alert("즐겨찾기가 취소되었습니다.");
		    	button.classList.add('nj_bookmark');
		    	button.title="no";
		    	button.style.backgroundPosition = "0 0";
		    }
		}
		
	</script>
</body>
</html>