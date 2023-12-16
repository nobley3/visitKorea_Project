<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TourKorea</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Sans:wght@100&family=Orbit&display=swap" rel="stylesheet">

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aad2fba6dae0bad9267b3e158cc19bd4"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${path}/resources/javascript/common.js"></script>

<style>

    *{
        margin: 0;
        padding: 0;
        border: 0;
        background-color: transparent;
        list-style: none;
    }
    section{
    	padding-top: 140px;
    	position: relative;
    }

    .section_wrap{
    	width: 940px;
    	margin: 0 auto;
    }
    /*타이틀 박스*/
    .TitleText{
        margin: 0px;
        text-align: center;
    }
    .TitleCourseNum{
    	width: 65px;
    	height: 32px;
    	margin:0 auto;
    	text-align: center;
    	line-height: 32px;
    	background: #ed4956;
	    border-radius: 50px;
	    color: #fff;
	    font-weight: 700;
	    font-size: 18px;
    }
    .TitleText h1 {
        color: black;
        padding: 10px 0 20px 0;
        font-size: 36px;
    }
    .TitleText_address{
    	display: flex;
    	justify-content: center;
    	align-items: center;
    	
    	color: #666666;
        font-weight: 500;
        padding-bottom: 15px;
    }
    .TitleText_address p:first-child:after{
    	 content: "|";
    	 margin: 0 10px;
    }
    
    .PostBtn{ /* 즐겨찾기 조회수 코스에 저장 박스*/
        height: 20px;
        display: flex; 
    	justify-content: flex-end; /* 버튼들을 오른쪽으로 정렬 */
    	padding: 10px 5px 20px 5px;
    	border-bottom: 1px solid #e6e6e6;
    }
    
	.PostBtn button{
		cursor: pointer;
		margin-left:10px;
		display: flex; /* 버튼 내부 요소를 가로로 정렬 */
    	align-items: center; /* 이미지와 텍스트를 세로 중앙 정렬 */
	}
	.PostBtn img{
		width: 21px;
		height: 19px;
		margin-right: 5px;
	}
	
	/*상세정보 텍스트*/
	.DetailText{ 
	    padding: 35px 0;
	    color: #333333;
	    font-size: 18px;
	    line-height: 1.7;
	    letter-spacing: -1px
	}
	
	/*지도*/
    #map{
       height:500px;
       margin-bottom: 25px;
    }
    .customoverlay {
    	position:relative;
    	bottom:45px;
    	border-radius:6px;
    	border: 1px solid #ccc;
    	border-bottom:2px solid #ddd;
    	float:left;
    }
	.customoverlay:nth-of-type(n) {
		border:0; 
		box-shadow:0px 1px 2px #888;
	}
	.customoverlay a {
		display:block;
		text-decoration:none;
		color:#000;
		text-align:center;
		border-radius:6px;
		font-size:14px;
		font-weight:bold;
		overflow:hidden;
		background: #13294b;
		background: #13294b url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
	.customoverlay .title {
		display:block;
		text-align:center;
		background:#fff;
		margin-right:35px;
		padding:10px 15px;
		font-size:14px;
		font-weight:bold;
	}
	.customoverlay:after {
		content:'';
		position:absolute;
		margin-left:-12px;
		left:50%;
		bottom:-12px;
		width:22px;
		height:12px;
		background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
	}
	

	/* 코스내용 박스 */
	.course_wrap{
		background: #f3f2f2;
		padding: 20px 0;
		margin-bottom: 50px;
	}
	.course_info{
		width: 880px;
		height: 280px;
		margin:0 auto;
		display: flex;
		position: relative;
		
		overflow: hidden;
	}
	.course_info li{
		width: 180px;
		height: 240px;
		position: absolute;
		top: 15px;
	}
	.course_num{
		width: 33px;
		height: 33px;
		margin: 0 auto;
		border: 2px solid #ed4956;
		border-radius: 100%;
		font-size: 16px;
    	color: #ed4956;
    	text-align: center;
    	line-height: 33px;
    	
    	position:relative;
	}
	.course_num_before:before{
		content:"";
		border: 1px solid #ed4956;
		display: inline-block; 
	    width: 70px; 
	    position: absolute;
	    top: 16px; 
	    left: -74px;
	}
	.course_num:after{
		content:"";
		border: 1px dashed #666666;
		display: inline-block; 
	    width: 161px; 
	    position: absolute;
	    top: 16px; 
	    left: 35px;
	}
	.course_num_after:after{
		border: 1px solid #ed4956;
	}
	.clickBtn{
		width: 30px; 
		height: 30px;
		position: absolute;
		top: 135px;
	}
	.click_pre{
		left:12px;
		opacity: 0.5;
	}
	.click_next{
		right:10px;
		cursor: pointer;
	}
	.course_img{
		width: 180px;
		height: 180px;
		margin: 0 auto;
		margin-top: 10px;
		border-radius: 10px;
		overflow: hidden;
		position:relative;
		cursor: pointer;
	}
	.course_img img{
		display: block;
		width: 100%;
		height: 100%;
	}
	.course_img_click{
		width: 100%;
		height: 100%;
		position: absolute;
		top:0;
		background-color: rgba(237,73,86,0.8);
		
		color: white;
		text-align: center;
		font-size: 16px;
		font-weight: 800;
		
		display: flex;
	    align-items: center;
	    justify-content: center;
	}
	
	/* 여행지 상세 */
	.course_datail{
		border: 1px solid #ed4956;
		border-radius: 10px;
		background: white;
		width: 880px;
		padding: 20px 0;
		margin: 0 auto;
		
		
	}
	.course_datail_title{
		display: flex;
		justify-content: center;
		align-items: center;
		margin-bottom: 5px;
	}
	.course_datail_title p:nth-child(1){
		width: 30px;
		height: 30px;
		margin-right: 10px;
		line-height: 30px;
		text-align: center;
		background: #ed4956;
		border-radius: 100%;
		color: white;
		font-size: 16px;
		font-weight: 700;
	}
	.course_datail_title p:nth-child(2){
		font-size: 22px;
		olor: #333333;
	}
	.course_datail_address{
		display: flex;
		justify-content: center;
		align-items: center;
		margin-bottom: 5px;
		font-size: 16px;
		color: #666666;
	}
	
	.course_datail_img{
		display: flex;
		justify-content: center;
		align-items: center;
		margin-top: 20px;
	}
	.course_datail_img img{
		display: block;
		width: 250px;
		height: 260px;
		border-radius: 10px;
		margin-right: 30px;
		
	}
	.course_datail_img img:nth-child(3){
		margin-right:0;
		
	}
</style>

<script>
	
	
	// 스크롤 이벤트 감지
	window.addEventListener('scroll', function() {
	    let lastScrollTop = 0; // 이전 스크롤 위치 초기화
	    let currentScrollTop = window.scrollY; // 현재 스크롤 위치 가져오기
	        // 스크롤 방향 확인
	        if (currentScrollTop > lastScrollTop) {
	        	document.querySelector('header').classList.add('scrolled'); // 스크롤된 상태를 나타내는 클래스 추가
	        } else {
	            // 위로 스크롤할 때
	            document.querySelector('header').classList.remove('scrolled'); // 스크롤된 상태를 나타내는 클래스 제거
	        }
	    lastScrollTop = currentScrollTop; // 현재 스크롤 위치를 이전 스크롤 위치로 업데이트
	});
	
	
	// 좋아요 버튼 클릭
   	function likeclick(contentId, mylikeNum){
		
   		let userId = '<%= session.getAttribute("userId")%>'; // 세션에 저장된 userId값 가져오기
   		if (userId == 'null') {
   			alert("로그인이 필요한 서비스입니다.");
   			window.location.href = "${path}/loginform";
   	    }else{
   	    	$.ajax({
   		 		type:"GET" ,
   		 		url: "${path}/like",
   		 		data: "contentId=" + contentId + "&mylikeNum=" + mylikeNum,
   		 		success : function( data){
   		 			$("#likeimg").empty();
   		 			let str = "";
   		 			if(mylikeNum == 0){ // 좋아요 
   		 				alert("좋아요를 누르셨습니다.");
   		 				str = "<img src=\"https://korean.visitkorea.or.kr/resources/images/sub/ico_post01_on.png\" "
   		 					+ "onclick=\"likeclick("+contentId+", 1)\">" + data.likeNum;
   		 			}else{ // 좋아요 취소
   		 				alert("좋아요가 취소되었습니다.");
   		 				str = "<img src=\"https://korean.visitkorea.or.kr/resources/images/sub/ico_post01.png\" "
   		 					+ "onclick=\"likeclick("+contentId+", 0)\">" + data.likeNum;
   		 			}
   		 			$("#likeimg").append(str);
   		 		},
   		 		error: function(){
   		 			alert( "error");
   		 		}
   		 	});	
   	    }
   	}
	
	// ul 아래에 있는 li의 스타일 변경
    document.addEventListener('DOMContentLoaded', licalc);
	function licalc(){
		let ulElement = document.querySelector('.course_info'); // ul 요소를 선택합니다.
		let liElements = ulElement.querySelectorAll('li'); // ul 요소 내의 li 요소를 선택합니다.
		
		for(let i=0; i<liElements.length; i++){
			liElements[i].style.left = (i * 200) + "px";
		}
	}
	
	// 클릭된 여행지 스타일 및 상세정보 변경
	function clickSight(obj){
		
		let elements = document.querySelector('.course_img_click');
		elements.classList.remove('course_img_click');
		
		let divelements = obj.querySelector('div');
		divelements.classList.add('course_img_click');
		
		let contentId = ${courseList[0].contentid};
		let subcontentId = obj.id; // 클릭된 요소의 id값 가져오기
		
		$.ajax({
		 		type:"GET" ,
		 		url: "${path}/courseDetaillist",
		 		data: "contentId=" + contentId + "&subcontentId=" + subcontentId,
		 		success : function( data){
		 			let content = data.content;
		 			let imglist = data.imglist;
		 			
		 			$(".course_datail").empty();
		 			let str = "<div class=\"course_datail_title\">"
		 					+ "		<p>"+content.num+"</p>"
		 					+ "		<p>"+content.subtitle+"</p>"
		 					+ "</div>"
		 					+ "<div class=\"course_datail_address\">"
		 					+ "		<p>"+content.address+"</p>"
		 					+ "</div>"
		 					+ "<div class=\"course_datail_img\">"
		 					+ "		<img src=\""+imglist[0].imgurl+"\">"
		 					+ "		<img src=\""+imglist[1].imgurl+"\">"
		 					+ "		<img src=\""+imglist[2].imgurl+"\">"
		 					+ "</div>";
		 			$(".course_datail").append(str);	
		 		},
		 		error: function(){
		 			alert( "error");
		 		}
		 	});	
	}
	
	// 슬라이드 바 스타일 변경
	function clickSlidebar(obj){
		let parentElement = obj.parentElement; //클릭된 요소의 부모요소
		let childdiv = parentElement.querySelector(".course_num"); // 그 부모요소 밑에 course_num클래스명을 가진 div선택
		let courseNum = childdiv.innerText; // 그 div안에 있는 텍스트
		let parentUL = obj.closest("ul");
		let liList = parentUL.querySelectorAll("li");
		for(let i=0; i<liList.length; i++){
			if(i<courseNum-1){
				liList[i].querySelector(".course_num").classList.add("course_num_after");
			}else if(i==courseNum-1){
				liList[i].querySelector(".course_num").classList.remove("course_num_after");
			}else{
				liList[i].querySelector(".course_num").classList.remove("course_num_after");
			}
		}
	}
   	
	// 마커 이미지보다 텍스트가 위로 올라오게 하기
	$(document).ready(function() {
	    // 문서가 로드되면 실행될 코드 작성
	    let overlayDivs = document.querySelectorAll(".customoverlay");
	    for (let i = 0; i < overlayDivs.length; i++) {
	    	let overlayDiv = overlayDivs[i];

	        // .customoverlay의 부모 div를 찾습니다.
	        let parentDiv = overlayDiv.parentNode;

	        if (parentDiv) {
	            parentDiv.style.zIndex = "1"; // 원하는 새로운 z-index 값으로 변경
	        }
	    }
	    
	});
	
	// 슬라이드버튼
	let btnIndex = 1;
	function preBtn(obj){
		if(1 < btnIndex){
			btnIndex--;
			let divElement = obj.parentElement;
			let nextImgElement = divElement.querySelector(".click_next");
			let ulElement = divElement.querySelector('ul');
			let liElements = ulElement.querySelectorAll('li');
			
			let liGroupSize = 0;
			let liLastList =  liElements.length%4 ;
			if(liLastList == 0){
				liGroupSize = Math.floor(liElements.length/4);
			}else{
				liGroupSize = Math.floor(liElements.length/4)+1;
			}
			if(liLastList == 0){
				liLastList = 4;
			}
			
			for (let i = 0; i < liElements.length; i++) {
				let li = liElements[i];
				let currentLeft = parseInt(li.style.left) || 0;
				li.style.transition = 'left 0.5s ease'; // transition 설정
				if( btnIndex == liGroupSize - 1){
					li.style.left = (currentLeft + (200*(liLastList-1) + 100)) + 'px';
				}else{
					li.style.left = (currentLeft + 800) + 'px';
				}
			}
			
			if(btnIndex < liGroupSize){
				nextImgElement.style.opacity = "1";
				nextImgElement.style.cursor = "pointer";
			}
			if(btnIndex == 1){
				obj.style.opacity = "0.5";
				obj.style.cursor = "unset";
			}
		}
	}
	
	function nextBtn(obj){
		let divElement = obj.parentElement;
		let preImgElement = divElement.querySelector(".click_pre");
		let ulElement = divElement.querySelector('ul');
		let liElements = ulElement.querySelectorAll('li');
		
		let liGroupSize = 0;
		let liLastList =  liElements.length%4 ;
		
		if(liLastList == 0){
			liGroupSize = Math.floor(liElements.length/4);
		}else{
			liGroupSize = Math.floor(liElements.length/4)+1;
		}
		if(liLastList == 0){
			liLastList = 4;
		}
		
		// 각 li 요소의 left 값에 800px씩 더하기
		if(btnIndex < liGroupSize){
			btnIndex++;
			
			for (let i = 0; i < liElements.length; i++) {
				  let li = liElements[i];
				  let currentLeft = parseInt(li.style.left) || 0;
				  li.style.transition = 'left 0.5s ease'; // transition 설정
				  if( btnIndex < liGroupSize){
					  li.style.left = (currentLeft - 800) + 'px';
				  }else{
					  li.style.left = (currentLeft - (200*(liLastList-1) + 100)) + 'px';
				  }
			}
			preImgElement.style.opacity = "1";
			preImgElement.style.cursor = "pointer";
			if(btnIndex == liGroupSize){
				obj.style.opacity = "0.5";
				obj.style.cursor = "unset";
			}
		}
		
	}

</script>


</head>
<body>

	
	
	<header><%@ include file="header.jsp" %></header>
	
	<section>
		<div class="section_wrap">
		   
	       <div class="TitleText">
	           <div class="TitleCourseNum">${courseList.size()}코스</div>
	           <h1><strong>${content.title}</strong></h1>
	           <div class="TitleText_address">
	           		<p>${content.nickName } ${content.sigunguname}</p>
	           		<p>코스 총거리: ${distanceAll}km</p>
	           </div>
	
	           <div class="PostBtn">
	               	<button id="likeimg">
	               		<c:choose>
						    <c:when test="${mylikeNum == 0}">
						        <img src="https://korean.visitkorea.or.kr/resources/images/sub/ico_post01.png" onclick="likeclick(${content.contentid}, 0)">
						    </c:when>
						    <c:otherwise>
						    	<img src="https://korean.visitkorea.or.kr/resources/images/sub/ico_post01_on.png" onclick="likeclick(${content.contentid}, 1)">
						    </c:otherwise>
						</c:choose>
	               		${likeNum}
               		</button>
	               	<button><img src="https://korean.visitkorea.or.kr/resources/images/sub/ico_post07.png" style="width:24px;">${content.view_num}</button>
	           </div>
	       </div>
		   
		   <!-- 상세내용  -->
	       <div class="DetailText">${content.overview }</div>
	        
		   <!-- 지도  -->
           <div id ="map"></div>
          
           <div class="course_wrap">
           		<div style="position:relative;">
	           		<ul class="course_info">
	           			<c:forEach var="item" items="${courseList}" varStatus="loop">
	           			<li>
	       				<c:choose>
	       					<c:when test="${loop.index==0}">
	       						<div class="course_num course_num_before">${item.num}</div>
	       					</c:when>
	       					<c:otherwise>
	       						<div class="course_num">${item.num}</div>
	       					</c:otherwise>
	       				</c:choose>
	           				<div class="course_img" id="${item.subcontentid}" onclick="clickSight(this); clickSlidebar(this)">
	           					<img src="${item.firstimage}">
	           					<c:choose>
	           						<c:when test="${loop.index==0}">
	           							<div class="course_img_click">${item.subtitle}</div>
	           						</c:when>
	           						<c:otherwise>
	           							<div>${item.subtitle}</div>
	           						</c:otherwise>
	           					</c:choose>
	           				</div>
	           			</li>
	           			</c:forEach>
	           		</ul>
           			<img class="clickBtn click_pre" onclick="preBtn(this)" src="https://korean.visitkorea.or.kr/resources/images/sub/btn_cos_prev.png">
           			<img class="clickBtn click_next" onclick="nextBtn(this)" src="https://korean.visitkorea.or.kr/resources/images/sub/btn_cos_next.png">
           		</div>
           		<div class="course_datail">
           			<div class="course_datail_title">
           				<p>${courseList[0].num}</p>
           				<p>${courseList[0].subtitle}</p>
           			</div>
           			<div class="course_datail_address">
           				<p>${courseList[0].address}</p>
           			</div>
           			<div class="course_datail_img">
           				<img src="${imglist[0].imgurl}">
           				<img src="${imglist[1].imgurl}">
           				<img src="${imglist[2].imgurl}">
           			</div>
           		</div>
           </div>
	            
		   <!-- 여행톡 박스 -->
	       <div class="TravleTalkBox" id="TravleTalkBox"><%@ include file="reviewTalk.jsp" %></div>
	
	    </div>
	</section>
	
	<footer><%@ include file="footer.jsp" %></footer>
	
	<!-- 지도 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4fc029ee2d2a91a9e32e696683e2d3fb"></script>
	<script>
		// 위도 및 경도의 합 초기화
		var sumLat = 0;
		var sumLng = 0;
		
		// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
		let latlng = ${courseListjson};
		console.log(latlng[0].mapx);
		var linePath = [];
		for(let i=0; i<latlng.length; i++){
			var item = new kakao.maps.LatLng(latlng[i].mapy, latlng[i].mapx);
			sumLat += parseFloat(latlng[i].mapy);
		    sumLng += parseFloat(latlng[i].mapx);
			linePath.push(item);
		}
	
		// 중심 좌표 계산
		var centerLat = (sumLat / linePath.length).toFixed(10);
		var centerLng = (sumLng / linePath.length).toFixed(10);
		
		console.log(centerLat);
		console.log(centerLng);
		
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(centerLat, centerLng), // 지도의 중심좌표
	        level: 10 // 지도의 확대 레벨
	    };  
	
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		
		// 지도에 표시할 선을 생성합니다
		var polyline = new kakao.maps.Polyline({
		    path: linePath, // 선을 구성하는 좌표배열 입니다
		    strokeWeight: 5, // 선의 두께 입니다
		    strokeColor: 'rgb(255,51,51)', // 선의 색깔입니다
		    strokeOpacity: 0.9, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    strokeStyle: 'solid' // 선의 스타일입니다
		});
		
		// 지도에 선을 표시합니다 
		polyline.setMap(map);  
		
		
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = [];
		for(let i=1; i<=30; i++){
			let str = "https://korean.visitkorea.or.kr/resources/images/sub/icon_map_num"+i+".png";
			imageSrc.push(str);
		}
		    
		for (var i = 0; i < latlng.length; i ++) {
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 
		    // 마커 이미지를 생성합니다    
		   var markerImage = new kakao.maps.MarkerImage(imageSrc[i], imageSize); 
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        position: linePath[i], // 마커를 표시할 위치
		        image : markerImage // 마커 이미지 
		    });
		 	// 마커가 지도 위에 표시되도록 설정합니다
		    marker.setMap(map);  
		 	
		 	
		    let detailpath = "";
		    console.log(latlng[i].contenttypeid);
		    
			if(latlng[i].contenttypeid == "12" || latlng[i].contenttypeid == "14" || latlng[i].contenttypeid == "28" || latlng[i].contenttypeid == "39"){
				detailpath = "${path}/sightsDetail";
			}else if(latlng[i].contenttypeid == "15" && latlng[i].cat2 == "A0207"){
				detailpath = "${path}/festivalDetail";
			}else if(latlng[i].contenttypeid == "15" && latlng[i].cat2 == "A0208"){
				detailpath = "${path}/eventDetail";
			}else if(latlng[i].contenttypeid == "25"){
				detailpath = "${path}/courseDetail";
			}
		 	
		 	
		 	
		 	// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    var content = '<div class="customoverlay">' 
				        + '  <a href="'+detailpath+'?contentId='+latlng[i].subcontentid+'" >'
				        + '    <span class="title">'+latlng[i].subtitle+'</span>' 
				        + '  </a>' 
				        + '</div>';
		    // 커스텀 오버레이가 표시될 위치입니다 
		    var position = new kakao.maps.LatLng(latlng[i].mapy, latlng[i].mapx);  

		    // 커스텀 오버레이를 생성합니다
		    var customOverlay = new kakao.maps.CustomOverlay({
		        map: map,
		        position: position,
		        content: content,
		        yAnchor: 1 
		    });

		}
		
		

	</script>
	
	
	
	
	
</body>
</html>