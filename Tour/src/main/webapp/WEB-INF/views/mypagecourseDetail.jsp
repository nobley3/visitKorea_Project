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

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aad2fba6dae0bad9267b3e158cc19bd4"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${path}/resources/javascript/common.js"></script>

<style>

	*{
        margin: 0;
        padding: 0;
        text-decoration: none;
        list-style: none;
    }
    section{
    	padding-top: 140px;
    	position: relative;
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
    .section_wrap{
    	margin: 0 auto;  
    	width: 980px;
    	margin: 0 auto;
    }
    
    /* 마이페이지 메인 링크 */
    .mycourseTitle{      
        position: relative;
        padding-right: 20px;
    }
    .mycourseTag{
    	display: flex;
        color: #666666;
        width: 135px;
        height: 40px;
    }
    .mycourseTag img{
    	width: 30px;
		height: 28px;	
		padding-right: 5px;
    }
    .mycourseTag h4{
    	font-size: 20px;
    	letter-spacing: -1px;
    	line-height: 45px;
    }
    .mycourseTitle input{
    	display: block;
    	width:600px;
    	font-weight: 800;
	    color: #333;
	    font-size: 36px;
	    letter-spacing: -1px;
	    border: 1px solid #bbb;
	    padding: 0 5px;
    }
    
    /* 리스트 박스 + 메뉴 박스 */
    .viewClick {
        margin-top: 24px;
        display: flex;
    }

	/* 리스트 박스 */
    .leftBox {
        width: 600px;
    }
    .smallBox {
        position: relative;
        width: 600px;
        padding: 15px 0 13px;
        font-weight: 700;
        border-top: 1px solid #999;
        border-bottom: 1px solid #e6e6e6; 
        
        display: flex;
        justify-content: space-between;
    }

    /*총 0 건*/
    .smallBox strong {
        font-weight: 700;
        font-size: 18px;
        color: #000;
    }

    .smallBox strong span {
        padding: 0 2px;
        color: #0a97cd;
    }
    
    /* 리스트 표출 박스 */
	.courseList {
        width: 600px;
        display: flex;
        flex-direction: row;
        
        border-bottom: 1px solid #e6e6e6;
        padding: 20px 0;
        
    }
    
    /* 리스트 이미지 */
    .picture {
        position: relative;
        cursor: pointer;
    }
    .picture img{
    	width: 140px;
    	height: 94px;
    }
    .number{
    	position: absolute;
    	width: 30px;
        height: 30px;
        top: 0;
        left: 0;
        color: white;
        background-color: #e54645;  
        
        
        font-size: 20px;
        text-align: center;
        vertical-align: middle;
        line-height: 1.5; 
    }
    
    /* 리스트 텍스트 */
    .txt_area {
		width: 420px;
        padding: 0 20px;
        position: relative;
    }
    .txt_area h3{
    	font-weight: bold;
    	font-size: 20px;
    	padding-bottom: 10px;
    	overflow: hidden;
    	text-overflow: ellipsis;
    	white-space: nowrap;
    	cursor: pointer;
    }
    .txt_area h3:hover {
        text-decoration: underline;
    }
    .txt_area p{
        font-size: 14px;
        color: #666666;
        overflow: hidden;
    	text-overflow: ellipsis;
    	white-space: nowrap;
    }
    .more_btn{
    	position: absolute;
    	top: 0;
    	right: 0;
    	width: 20px;
        height: 20px;
    	background: url(https://korean.visitkorea.or.kr/resources/images/sub/btn_dot2.png) 0 0 no-repeat;
    	cursor: pointer;
    	border: none;
        outline: none;
    }

	/* 모달창 */
	.subMenu {
        display: none;
        position: absolute;
        top: 20px;
        right: 5px;
        z-index: 1;
        width: 170px;
        border: 1px solid #767676;
        padding: 5px;
        background: #fff;
        box-shadow: 3px 3px 0px rgba(0, 0, 0, 0.2);
    }
    .subMenu li{
    	padding : 5px;
    	cursor: pointer;
    }
    .delete{
    	background: url(https://korean.visitkorea.or.kr/resources/images/sub/ico_sprite_pop.png) 4% 58.8% / 14% auto no-repeat;
   	}
   	.delete span{
   		margin-left: 30px;
   	}
   	
   	
   	/* 상세내용 텍스트 박스 */
   	.textarea{
   		margin: 30px 0;
   	}
   	.textarea textarea{
   		width: 600px;
   		height: 180px;
   		padding: 0 5px;
   		font-size: 15px;
   		text-align: left;
	    border: 1px solid #ccc;
	    box-sizing: border-box;
   		resize: none; /* textarea 기본 스타일 없애기 */
   	}
   	.textByte{
   		font-size: 16px;
   		text-align: right;
   	}
   	.textByte span{
   		color: #ed5643;
   	}
   	
   	/* 지도 */
   	#map{
   		width: 600px;
   		height: 500px;
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
   	
   	/* 취소, 저장 버튼 */
   	.btnWrap{
   		height: 60px;
   		display: flex;
   		justify-content: center;
   		align-items: center;
   		margin: 20px 0;
   	}
   	.btnWrap button{
   		display: block;
   		margin: 0 10px;
   		width: 135px;
   		height: 40px;
   		text-align: center;
	    font-size: 16px;
   	}
   	.btnWrap button:nth-child(1){
	   	border: 1px solid #bababa;
	   	background: none;
	    color: #000;
   	}
	.btnWrap button:nth-child(2){
	   	border: 1px solid #13294b;
	    background: #13294b;
	    color: white;
    }

	/* 오른쪽 메뉴바 */
    .rightBox{
    	margin-left: 40px;
    	width: 300px;
    	height: 170px;
    	background: #f7f7f7;
    	padding: 10px 20px 30px 0;
    }

    .rightBox li{
    	width: 100%;
        padding-top: 20px;
        font-size: 16px;
        font-weight: 800;
    
    }
    
    .rightList{
        display: block;
        padding-left: 20px;
        color: #666;
    }
    .rightList_click{
        background: url(https://korean.visitkorea.or.kr/resources/images/sub/ico_mypagemenu.png) 0 0 no-repeat;
        background-size: 4px 100%;
        color: #333;
    }
    .rightList:hover {
        background: url(https://korean.visitkorea.or.kr/resources/images/sub/ico_mypagemenu.png) 0 0 no-repeat;
        background-size: 4px 100%;
        color: #333;
    }
	
    
</style>

<script>

	//스크롤 이벤트 감지
	window.addEventListener('scroll', function() {
	    let lastScrollTop = 0; // 이전 스크롤 위치 초기화
	    let currentScrollTop = window.scrollY; // 현재 스크롤 위치 가져오기
	    
	    if (currentScrollTop > lastScrollTop) {
	        // 아래로 스크롤 할 때
	        document.querySelector('header').classList.add('scrolled'); // 스크롤된 상태를 나타내는 클래스 추가
	    } else {
	        // 위로 스크롤 할 때
	        document.querySelector('header').classList.remove('scrolled'); // 스크롤된 상태를 나타내는 클래스 제거
	    }
	    
	    lastScrollTop = currentScrollTop; // 현재 스크롤 위치를 이전 스크롤 위치로 업데이트
	});
	
	// 더보기 모달창
	function modalBtn(obj){
		document.getElementById("hidden_section").style.display = "block";
		let liElement = obj.parentElement;
		let subMenu = liElement.querySelector(".subMenu");
		
		if (subMenu.style.display == "none" || subMenu.style.display == '') {
	       subMenu.style.display = "block";
	    } else {
	       subMenu.style.display = "none";
	    }
	}
	
	function modalClose(){
		// 클릭되었던 모달창 제거
		//let element = document.querySelector('.modal_window');
		//element.style.display = "none";
		
		let subMenus = document.querySelectorAll(".subMenu");
		for(let i=0; i<subMenus.length; i++){
			subMenus[i].style.display = "none";
		}
		
		// 모달창 뒷 배경 없애기 
		document.getElementById("hidden_section").style.display = "none";
	}
	
	// 문서 로드시 작동되는 함수
	window.addEventListener('load', counttext);
	function counttext(){
		let textarea =  document.getElementById('textarea');
		let textareaContent = textarea.value;
		let charCount = textareaContent.length;
		
		$(".textByteCount").text(charCount);
	}

	function deleteCourseList(coursecode, contentid){
		$.ajax({
	 		type:"get" ,
	 		url: "/tour/deletemycourselist",
	 		data: "coursecode=" + coursecode + "&contentid=" + contentid,
	 		success : function( data){
	 			window.location.reload();
	 		},
	 		error: function(){
	 			alert( "error");
	 		}
	 	});	
		
	}
	
	// 상세페이지 이동
	function pageDetail(contenttypeid, cat2, contentId){
		let detailpath = "";
		if(contenttypeid == "12" || contenttypeid == "14" || contenttypeid == "28" || contenttypeid == "39"){
			detailpath = "${path}/sightsDetail";
		}else if(contenttypeid == "15" && cat2 == "A0207"){
			detailpath = "${path}/festivalDetail";
		}else if(contenttypeid == "15" && cat2 == "A0208"){
			detailpath = "${path}/eventDetail";
		}else if(contenttypeid == "25"){
			detailpath = "${path}/courseDetail";
		}
		
		window.location.href = detailpath+"?contentId="+contentId;
	}
</script>


</head>
<body>

	<header><%@ include file="header.jsp" %></header>
	
	<section>
	
		<div class="section_wrap">
			<form action="${path}/updatemycourse" method="post">
				<input type="hidden" name="coursecode" value="${courseDetail.coursecode }">
				<div class="mycourseTitle"> 
	                <a class="mycourseTag" href="${path}/mypage.do">
		                <img src="https://korean.visitkorea.or.kr/resources/images/sub/ico_tit_list5.png">
		    			<h4>마이페이지</h4>
	                </a>
	                <input value="${courseDetail.coursename }" name="coursename">
		         </div>
		         
		         <div class="viewClick">
	                <div class="leftBox">
	                    <div class="smallBox">
	                        <strong>총<span>${courseList.size()}</span>건</strong> 
	                        <strong>코스 총거리:<span>${distanceAll}</span>km</strong>
	                    </div>
	                 
	                 	<div id="courseList">
	                 		<c:choose>
	                 			<c:when test="${courseList.size() == 0}">
	                 				<div class="courseList" style="font-size:18px; font-weight: bold;">
	                 					추가된 코스가 없습니다. 코스를 추가해주세요!
	                 				</div>
	                 			</c:when>
	                 			<c:otherwise>
	                 				<c:forEach var="item"  items="${courseList}" varStatus="loop">
					                 	<ul class="courseList">
						                 	<li class="picture" onclick="pageDetail('${item.contenttypeid}', '${item.cat2}', '${item.contentid}' )">
						                 		<c:choose>
						                 			<c:when test="${item.firstimage == null}">
						                 				<img src="https://korean.visitkorea.or.kr/resources/images/common/no_img_01.png">
						                 			</c:when>
						                 			<c:otherwise>
						                 				<img src="${item.firstimage }">
						                 			</c:otherwise>
						                 		</c:choose>
					                        	<span class="number">${loop.index + 1}</span>
					                         </li>
					                         <li class="txt_area">
					                         	<h3 onclick="pageDetail('${item.contenttypeid}', '${item.cat2}', '${item.contentid}' )">${item.title}</h3>
					                            <p>${item.address}</p>
					                            <button type="button" class="more_btn" onclick="modalBtn(this)"></button>
					        
					                            <!-- 모달창 -->
					                            <ul class="subMenu">
					                                <li class="delete" onclick="deleteCourseList('${item.coursecode}', '${item.contentid}')"><span>삭제</span></li>
					                            </ul>
					                         </li>
					                  	</ul>
			                	   </c:forEach>
	                 			</c:otherwise>
	                 		</c:choose>
	                 		
	                 	</div>
	                 	
	                 	<div class="textarea">
		                 	<textarea id="textarea" name="coursecontent">${courseDetail.coursecontent }</textarea>
		                 	<div class="textByte">현재 글자수 <span class="textByteCount"></span>자 / 최대 글자수 2000자</div>
	                 	</div>
	               	
	               		<!-- 지도  -->
	               		<c:choose>
	               			<c:when test="${courseList.size() == 0}"></c:when>
	               			<c:otherwise>
	               				<div id="map"></div>
	               			</c:otherwise>
	               		</c:choose>
	               		
	               		
	               		<div class="btnWrap">
	               			<button type="reset">취소</button>
	               			<button type="submit">저장</button>
	               		</div>
	               	</div>
               	
               	
	               	<ul class="rightBox">
	                    <li>
	                        <a class="rightList" href="${pageContext.request.contextPath}/mypagelike.do">좋아요</a>
	                    </li>
	                    <li>
	                        <a class="rightList rightList_click" href="${pageContext.request.contextPath}/mypagecourse.do">코스</a>
	                    </li>
	                    <li>
	                        <a class="rightList" href="${pageContext.request.contextPath}/mypagetalk.do">댓글</a>
	                    </li>
	                    <li>
	                        <a class="rightList" href="${pageContext.request.contextPath}/mypageQA.do">Q&A</a>
	                    </li>
	                </ul>
	           	</div>
			</form>
		</div>
		
		<!--  모달 윈도우 -->
		<div class="hidden_section" id="hidden_section" onclick="modalClose()"></div>
	
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
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(centerLat, centerLng), // 지도의 중심좌표
	        level: 13 // 지도의 확대 레벨
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
		 	
		 	// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    var content = '<div class="customoverlay">' 
				        + '  <a href="${pageContext.request.contextPath}/sightsDetail?contentId='+latlng[i].contentid+'" >'
				        + '    <span class="title">'+latlng[i].title+'</span>' 
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