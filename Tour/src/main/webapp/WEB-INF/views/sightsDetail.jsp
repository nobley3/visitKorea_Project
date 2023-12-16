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
	
    /* 모달 창*/
    .hidden_section{
    	background-color: rgba(0,0,0, 0.1);
    	width:100%;
    	height:100%;
    	position: absolute;
    	top : 0;
    	left : 0;
    	display : none;
    	opacity: 0.7; /* 투명도를 50%로 설정 */
    }
    /* 모달 윈도우 코스에 담기 */
    .modal_window_course{
    	width: 300px;
    	position: fixed;
    	top: 35%;
    	left: 38%;
    }
    .course_title{
    	display: flex;
    	justify-content: space-between;
    	padding: 15px;
    	background: #13294b;
    	align-items: center;
    }
    .course_title h2{
	    font-weight: 700;
	    color: white;
	    font-size: 16px;
    }
    .course_title p{
    	background: url('https://korean.visitkorea.or.kr/resources/images/common/btn_w_close_32x32.png');
    	background-size: cover;
    	background-position: center;
    	background-repeat: no-repeat;
    	width: 16px;
    	height: 16px;
    	cursor: pointer;
    }
    .course_Box{
    	background-color: white;
    	padding : 0px 10px 10px 10px;
    	
    	 max-height: 300px; /* 원하는 높이로 설정 */
 		 overflow-y: auto; /* 세로 스크롤이 필요한 경우 스크롤을 표시하도록 설정 */
    }
    .course_list{
    	display: flex;
	    justify-content: space-between;
	    align-items:center;
	    padding: 10px 5px;
	    border-bottom: 1px solid #e6e6e6;
    }
	.course_list_tit{
		white-space: nowrap;       /* 텍스트가 줄 바꿈되지 않도록 설정 */
		overflow: hidden;          /* 넘치는 부분은 숨기도록 설정 */
		text-overflow: ellipsis;   /* 생략 부호로 텍스트가 잘릴 때 대체 */
		width: 190px;
	}				
	.course_list_btn{
		padding: 5px 10px;
	    color: white;
	    font-size: 14px;
	    background: #13294b;
	    cursor: pointer;
	}		
	.course_addBtn{
		width: 80px;
		height: 20px;
		margin: 0 auto;
		margin-top: 20px;
		padding: 5px 15px;
	    color: white;
	    font-size: 14px;
	    background: #13294b;
	    text-align: center;
	    line-height: 20px;
	    cursor: pointer;
	}	
    
    /* 코스 추가 모달 윈도우 */
    .modal_window_addcourse{
    	width: 300px;
    	height: 180px;
    	position : fixed;
    	top: 40%;
    	left: 40%;
    	display: none;
    }
    .modal_courseTitle{
    	padding: 15px;
	    background: #13294b;
	    font-weight: 700;
	    color: #fff;
	    font-size: 16px;
	    display: flex;
	    align-items: center;
	    justify-content: space-between;
    }
    .modal_courseTitle img{
    	display: block;
    	width: 16px;
    	height: 16px;
    	cursor: pointer;
    }
    .modal_box{
    	padding: 15px;
    	height: 100px;
    	background: white;
    }
    .modal_input{
    	display: block;
	    width: 100%;
	    margin-top: 10px;
	    margin-bottom: 20px;
	    padding: 10px 5px;
	    border: 0;
	    border-bottom: 1px solid #767676;
	    font-size: 14px;
	    box-sizing: border-box;
    }
    .modal_checkbtn{
    	display: block;
    	border: 0;
    	width: 55px;
    	height: 30px;
    	margin: 0 auto;
    	color: white;
	    font-size: 14px;
	    background: #13294b;
	    text-align: center;
	    line-height: 30px;
	    cursor: pointer;
    }
    



	section{
    	padding-top: 90px;
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
    .TitleText h1 {
        color: black;
        padding: 20px 0;
        font-size: 36px;
    }
    .TitleText p {
        color: #666666;
        font-weight: 500;
        padding-bottom: 15px;
    }
    .PostBtn{ /* 즐겨찾기 조회수 코스에 저장 박스*/
        height: 20px;
        display: flex; 
    	justify-content: flex-end; /* 버튼들을 오른쪽으로 정렬 */
    	padding: 10px 5px 20px 5px;
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

	/*네비게이션 메뉴바*/
    .subnav{ 
    	width: 940px;
        height: 63px;
        display: flex;
        flex-direction: row;
        border-top: 1px solid #e6e6e6;
        border-bottom: 1px solid #e6e6e6;
        margin-bottom: 20px;
        justify-content: center;
        background: white;
        z-index: 1;
        transition: top 0.5s ease; /* transition 속성 추가 */
    }
    .hidden {
	    position:fixed;
	    top: 90px; /* 숨겨진 상태일 때 상단에 위치하도록 설정 */
	}
    .subnav_menu{    
    	width: 25%;
        height: 63px; 
        color: #7e7d7d;
        font-size: 20px;
        font-weight: 500;
        text-align: center; /* 글자 수평 중앙 정렬 */
        line-height: 60px; /* 글자 수직 중앙 정렬 */
        display:flex;
        justify-content: center;
        align-items: center;
        position: relative;
    }
    .subnav_menu::after {
	    content: "|";
	    color : #666;
    	position: absolute;
	    right: 0; /* 오른쪽 끝에 붙이기 */
	    top: 0; /* 수직 중앙 정렬을 위해 상단 여백 조절 */
	    font-weight: 500;
	}
	.subnav_menu:last-child::after {
	    content: "";
	    padding: 0; /* 가상 요소를 제거하기 위해 content와 padding을 설정 */
	}
	.subnav_click{
		color : #333;
		font-weight: bold;
	}
	.subnav_menu label{
		width: 50%;
		height: 80%;
		display : block;
		border-bottom: 5px solid transparent;
		cursor: pointer;
	}
	.subnav_click label{
		border-bottom: 5px solid black;
	}


	/*이미지 박스*/
    .imgBox{   
    	width: 940px;  
    	height: 660px;   
        display: flex;
        overflow: hidden;
        position: relative;
    }
    
    .slide_img{
    	width: 940px;
		height: 660px;
		display: flex;
		background-size: cover; /* 배경 이미지가 부모 요소를 완전히 채우도록 설정 */
  		background-position: center; /* 배경 이미지를 가운데 정렬 */
  		position:absolute;
  		top:0;
    }
    
    .prev, .next{ /* 슬라이드 버튼 */
        position: absolute;
        top: 280px;
        z-index: 1;
    }
    .prev{
        left: 10px;
    }
    .next{
        right: 10px;
    }


	/*상세정보 박스*/
    .DetailBox{  
        width: 940px;
        margin-bottom: 50px;
    }
	.DetailBox h2{
		padding: 31px 0px 9px 0px;
		border-bottom: 2px solid #333;
	}
	.DetailText{ /*상세정보 텍스트*/
	    padding: 35px 0;
	}


	/*지도*/
	.MapView{       /* 지도 view */
        margin-bottom: 25px;
    }
    #map{
       height:350px;
    }

	/* 지도 view 디테일 박스 */
	.MapDetailBox{
		width: 940px;  
        display:flex;
        flex-direction: row;
	}
	.MapDetailBox ul{
		width: 470px;
	}
	.MapDetailBox li{
		display: flex;
		flex-direction: row;
		padding: 5px 0;
		font-weight: 100;
	}
	.MapDetailBox li:before {
	    content: "\2022";  /* Unicode 코드 포인트로 disc를 표현 */
	    font-size: 14px;
    	font-weight: bolder;
	    margin-right: 10px; /* 원하는 간격 설정 */
    }
	.MapDetailBox li strong{
		display: block;
		width:100px;
	}
	.MapDetailBox li span{
		display: block;
		width:353px;
		color: #555555;
	}
	
</style>

<script>

	//스크롤 이벤트 감지
	window.addEventListener('scroll', function() {
	    let lastScrollTop = 0; // 이전 스크롤 위치 초기화
	    let currentScrollTop = window.scrollY; // 현재 스크롤 위치 가져오기
	        // 스크롤 방향 확인
	        if (currentScrollTop > lastScrollTop) {
	        	document.querySelector('header').classList.add('scrolled'); // 스크롤된 상태를 나타내는 클래스 추가
	        	// 스크롤이 180px 이상 될 때만 효과 적용
	    	    if (currentScrollTop > 180) {
	            // 아래로 스크롤할 때
	            document.querySelector('.subnav').classList.add('hidden'); // hidden 클래스 추가하여 subnav 숨김
	    	    }
	        } else {
	            // 위로 스크롤할 때
	            document.querySelector('header').classList.remove('scrolled'); // 스크롤된 상태를 나타내는 클래스 제거
	            document.querySelector('.subnav').classList.remove('hidden'); // hidden 클래스 제거하여 subnav 표시
	        }
	    lastScrollTop = currentScrollTop; // 현재 스크롤 위치를 이전 스크롤 위치로 업데이트
	});
	
	//이미지 슬라이드 버튼
	let imgindex = 0;
	function nextImg() {
		let imageIds = []; // 이미지의 id 값을 저장할 배열
	    // 이미지 요소들의 id 값을 순회하며 배열에 추가
	    let imageContainer = document.querySelector('.imgBox'); // 이미지 컨테이너 요소
	    let divElements = imageContainer.getElementsByTagName('div'); // 이미지 요소들
	    for (let i = 0; i < divElements.length; i++) {
	        imageIds.push(divElements[i].id);
	    }
	    if(imgindex == imageIds.length-1){
	    	imgindex = -1;
		}
	    for(let i=0; i<imageIds.length; i++){
	    	let Image = document.getElementById(imageIds[i]);
	    	let width = -940 * (imgindex+1);
	    	//Image.style.transform = 'translateX(940px)';
	    	Image.style.transform = 'translateX('+width+'px)';
	    	Image.style.transition = 'transform 1s ease';
	    }
	    imgindex++;
	}
	
	function prevImg() {
		let imageIds = []; // 이미지의 id 값을 저장할 배열
	    // 이미지 요소들의 id 값을 순회하며 배열에 추가
	    let imageContainer = document.querySelector('.imgBox'); // 이미지 컨테이너 요소
	    let divElements = imageContainer.getElementsByTagName('div'); // 이미지 요소들
	    for (let i = 0; i < divElements.length; i++) {
	        imageIds.push(divElements[i].id);
	    }
	    if (imgindex == 0) {
	        imgindex = imageIds.length;
	    }
	    imgindex--;
	
	    for (let i = 0; i < imageIds.length; i++) {
	        let Image = document.getElementById(imageIds[i]);
	        let width = -940 * imgindex;
	        Image.style.transform = 'translateX(' + width + 'px)';
	        Image.style.transition = 'transform 1s ease';
	    }
	}
	
	// 메뉴 클릭
	function menuClick(obj){
		let element = obj;
		// 모든 요소에 대한 NodeList 가져오기
	    let elements = document.querySelectorAll('.subnav_menu');
	    // 모든 요소에서 "subnav_click" 클래스 제거
	    for (let i = 0; i < elements.length; i++) {
       		let item = elements[i];
            item.classList.remove("subnav_click");
	    }
	   
	    element.classList.add("subnav_click");  // 선택된 요소에 "subnav_click" 클래스 추가
	    document.querySelector('.subnav').classList.add('hidden');  // 선택된 요소에 "hidden" 클래스 추가
	    
	    let targetId = element.querySelector('label').getAttribute('for'); // 선택된 메뉴의 label의 for 속성값 (대상 섹션 ID) 가져오기
	    let targetSection = document.getElementById(targetId); // 대상 섹션 요소 가져오기
        targetSection.scrollIntoView({ behavior: 'smooth' }); // 부드러운 스크롤 효과와 함께 해당 섹션으로 이동
    }
	
	
	
	
	
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
   		 		data: "contentId=" + contentId+"&mylikeNum="+mylikeNum,
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
	
 	// 모달창
	function modalClose(){
		// 클릭되었던 코스 모달창 제거
		$(".modal_window_course").empty();
		
		// 클릭되었던 코스추가 모달창 제거
		let element =  document.querySelector('.modal_window_addcourse');
		element.style.display = "none";
		
		// 모달창 뒷 배경 없애기 
		document.getElementById("hidden_section").style.display = "none";
	}
	
	
 	// 코스에 담기
	function courseModal(contentId){
		let userId = '<%= session.getAttribute("userId")%>'; // 세션에 저장된 userId값 가져오기
   		if (userId == 'null') {
   			alert("로그인이 필요한 서비스입니다.");
   			window.location.href = "${path}/loginform";
   	    }else{
   	    	$.ajax({
   		 		type:"GET" ,
   		 		url: "${path}/mycourselist",
   		 		success : function( data){
   		   			// 모달창 뒷배경
   		   			document.getElementById("hidden_section").style.display = "block";
   		   			let element = document.querySelector('.modal_window_course');
   		   			element.style.display = "block";
   		   			
   		 			let courselist = data.mycourseList;
   		   			let str = "<div class=\"course_title\">"
   		   					+ "		<h2>코스 선택</h2>"
   		   					+ "		<p onclick=\"modalClose()\"></p>"
   		   					+ "</div> "
   		   					+ "<div class=\"course_Box\">";
   		   			for(let i=0; i<courselist.length; i++){
   		   				str += "		<div class=\"course_list\">";
   		   				str += "			<div class=\"course_list_tit\">"+courselist[i].coursename+"</div>";
   		   				str += "			<div class=\"course_list_btn\" onclick=\"courseselect('"+courselist[i].coursecode+"','"+ contentId+"')\">선택</div>";
   		   				str += "		</div>";
   		   			}
   		   				str += "		<div class=\"course_addBtn\" onclick=\"addcourse()\">코스추가</div>";
   		   				str += "</div>";
   		   			$(".modal_window_course").append(str);
   		 		},
   		 		error: function(){
   		 			alert( "error");
   		 		}
   		 	});	
   	    }
	}
	
	// 코스추가 창
	function addcourse(){
		let element1 = document.querySelector('.modal_window_course');
		element1.style.display = "none";
		let element2 = document.querySelector('.modal_window_addcourse');
		element2.style.display = "block";
	}
	
	// 코스추가 닫기
	function addcourseClose(){
		let element1 = document.querySelector('.modal_window_course');
		element1.style.display = "block";
		let element2 = document.querySelector('.modal_window_addcourse');
		element2.style.display = "none";
	}
	
	// 생성된 코스 삽입
	function insertCourse(){
		let courseName = document.getElementById('modal_input').value;
		$.ajax({
	 		type:"post" ,
	 		url: "${path}/insertmycourse",
	 		data: "courseName=" + courseName,
	 		success : function( data){
	 			window.location.reload();
	 		},
	 		error: function(){
	 			alert( "error");
	 		}
	 	});	
	}
	
	// 코스에 리스트 담기
	function courseselect(coursecode, contentId){
		$.ajax({
	 		type:"post" ,
	 		url: "${path}/insertmycourselist",
	 		data: "coursecode=" + coursecode + "&contentId=" + contentId,
	 		success : function( data){
	 			if(data == 0){
	 				alert("코스에 담겼습니다.");
	 			}else{
	 				alert("이미 담겨 있는 코스입니다.");
	 			}
	 			window.location.reload();
	 		},
	 		error: function(){
	 			alert( "error");
	 		}
	 	});	
	}
	
	
	
	
	
</script>


</head>
<body>

	
	
	<header><%@ include file="header.jsp" %></header>
	
	<section>
		<div class="section_wrap">
	       <div class="TitleText">
	           <h1><strong>${content.title}</strong></h1>
	           <p>${content.nickName } ${content.sigunguname}</p>
	
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
	               	<button><img src="https://korean.visitkorea.or.kr/resources/images/sub/ico_post05.png" onclick="courseModal('${content.contentid}')" style="width:20px;"></button>
	           </div>
	       </div>
	
	       <!-- 네비게이션 메뉴바 -->
           <ul class="subnav">
	           <li class="subnav_menu subnav_click" onclick="menuClick(this)"><label for="imgBox">사진보기</label></li>
	           <li class="subnav_menu" onclick="menuClick(this)"><label for="DetailBox">상세보기</label></li>
	           <li class="subnav_menu" onclick="menuClick(this)"><label for="TravleTalkBox">여행톡</label></li>
           </ul>
	        
	
		   <!-- 이미지 박스 -->
	       <div class="imgBox" id="imgBox">
	            <c:forEach var="item" items="${imglist}" varStatus="loop">
	            	<div class="slide_img" style="background-image:url('${item.imgurl}'); left:${940*loop.index}px;" id="image${loop.index + 1}"></div>
	            </c:forEach>
	            <img class="prev" src="https://korean.visitkorea.or.kr/resources/images/sub/btn_photo_prev.png" onclick="prevImg()">
	            <img class="next" src="https://korean.visitkorea.or.kr/resources/images/sub/btn_photo_next.png" onclick="nextImg()">
	       </div>
	
	
	       <!-- 상세내용 박스 -->
	       <div class="DetailBox" id="DetailBox">
	       		<h2>상세정보</h2>
	            <div class="DetailText">
                    ${content.overview }
	            </div>
				<!-- 지도 -->
	            <div class="MapView">
	            	<div id ="map"></div>
	            </div>
	            
				<!-- 상세내용 -->
				<div class="MapDetailBox">
					<ul>
						<li>
							<strong>문의 및 안내</strong>
							<c:choose>
							    <c:when test="${not empty content.tel}">
							    	<span>${content.tel }</span>
							    </c:when>
							    <c:otherwise>
							        <span>${content.infocenter}</span>
							    </c:otherwise>
							</c:choose>
	                	</li>
	                	<li>
		                	<strong>주소</strong>
		                	<span>${content.address}</span>
	                	</li>
	                	<li>
		                	<strong>주차</strong>
		                	<span>${content.parking}</span>
	                	</li>
					</ul>
					<ul>
						<li>
		                	<strong>홈페이지</strong>
		                	<span>${content.homepage}</span>
		                </li>
		                
		                <li>
		                	<strong>영업시간</strong>
		                	<span>${content.usetime}</span>
		                </li>
		                <li>
		                	<strong>휴일</strong>
		                	<span>${content.restdate}</span>
		                </li>
					</ul>
				</div>
	        </div>
	        
	        
	        
	        <!-- 여행톡 박스 -->
	        <div class="TravleTalkBox" id="TravleTalkBox"><%@ include file="reviewTalk.jsp" %></div>
			
	    </div>
	    
	    
	    <!--  모달 윈도우 -->
		<div class="hidden_section" id="hidden_section" onclick="modalClose()"></div>
		
	    <!-- 코스에 담기 모달 윈도우 -->
		<div class="modal_window_course"></div>
		
		<!-- 코스 추가 모달 윈도우 -->
		<div class="modal_window_addcourse">
			<div class="modal_courseTitle">
				<p>코스만들기</p>
				<img onclick="addcourseClose()" src="https://korean.visitkorea.or.kr/resources/images/common/btn_w_close_32x32.png">
			</div>
			<div class="modal_box">
				<input class="modal_input" id="modal_input" placeholder="코스명을 입력해 주세요.">
				<div class="modal_checkbtn" onclick="insertCourse()">확인</div>
			</div>
		</div>
		
		
	</section>
	
	
	
	<footer><%@ include file="footer.jsp" %></footer>
	
	
	
	
	
	
	<script>
		let mapy = ${content.mapy};
		let mapx = ${content.mapx};
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = { 
		    center: new kakao.maps.LatLng(mapy, mapx), // 지도의 중심좌표
		    level: 4 // 지도의 확대 레벨
		};
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		//마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(mapy, mapx); 
		//마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position: markerPosition
		});
		//마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		//아래 코드는 지도 위의 마커를 제거하는 코드입니다
		//marker.setMap(null);   
	</script>
	
	
	
</body>
</html>