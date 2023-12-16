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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
	*{
       margin: 0;
       padding: 0;
       list-style: none;
       text-decoration: none;
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
    .modal_window{
    	border: 1px solid #767676;
    	width : 115px;
    	position: absolute;
        top: 40px;
        right: 10px;
        z-index:1;
        background-color: white;
        box-shadow: 3px 3px 0px rgba(0, 0, 0, 0.2);
        display:none;
    }
    .modal_window div{
    	padding: 10px;
    	display: flex;
    	flex-direction: row;
    	cursor: pointer;
    }
    .modal_window div img{
    	width: 15px;
    	height: 18px;
    	cursor: pointer;
    }
    .modal_window div p{
    	font-size:12px;
    	color: #333333;
    	padding-left: 5px;
    	line-height: 18px;
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
    
    
    /* section */
    section{
        position: relative;
        padding-top: 90px;
    }
    .section_wrap{
        width: 940px;
        margin: 0 auto;
    }
    
    
    .titleArea{
        padding: 20px 0;
    }
    .titleArea h1{
    	font-size : 35px;
   	}
    
    .titleContent{
    	border-top : 1px solid #999999;
    	border-bottom: 1px solid #e6e6e6;
        display: flex;
        flex-direction: row;
        justify-content: space-between; /* 양쪽 끝으로 정렬 */
        width: 600px;
        padding: 10px 0;
    }
    .titleContent_sort{
        color : #666666;
        display: flex;
        flex-direction: row;
        justify-content: flex-end;
    }
    .titleContent_sort_click{
    	color: #000000;
    	font-weight: 800;
    }
    .titleContent_sort p{
    	cursor: pointer;
    }
    .titleContent_sort p::after{
        content: "ㅣ";
        margin : 0 10px;
        color : #666666;
        cursor: auto;
        font-weight: 500;
    }
    .titleContent_sort p:last-child::after{
        content: "";
        margin : 0;
    }

	/* 내용 리스트 */
	.listWrap{
        display: flex;
        flex-direction: row;
        justify-content: space-between; 
    }
    
    /* 관광지 리스트 */
    .contentList{
        display: flex;
        flex-direction: row;
        border-bottom: 1px solid #e6e6e6;
        width: 600px;
    }
    .contentList_imgBox{
    	position: relative;
    }
    .content_mainImg{
        width: 140px;
        height: 94px;
        padding: 10px;
        cursor: pointer;
    }
    .progress{
    	position: absolute;
    	width:48px;
    	font-size: 14px;
	    font-weight: 800;
    	text-align:center;
	    top: 10px;
	    left: 10px;
	    color: white;
	    letter-spacing: -1px; /* 자간 */
	    padding: 5px;
    }
    .contentList_sub{
        display: flex;
        flex-direction: row; /* 내용을 세로로 정렬 */
    }
    .contentList_text{
    	width:350px;
    	padding-top: 15px;
    	line-height: 25px;
    }
    .contentList_text h3{
    	cursor : pointer;
    	margin-bottom: 5px;
    	white-space: nowrap;         /* 텍스트를 한 줄로 표시 */
		overflow: hidden;            /* 초과된 부분을 감추기 */
		text-overflow: ellipsis;     /* 줄임말로 표시 */
    }
    .contentList_moreWrap{
	    width: 90px;
    	position: relative;
    }
    .more_btn{
        width: 14px;
        height: 16px;
        position: absolute;
        top: 15px;
        right: 10px;
        cursor: pointer;
        padding: 0 5px 5px 5px;
    }

	/* 지역배너 */
    .titleContent_list{
    	background-color: #f7f7f7;
        width: 300px;
        height: 240px;
    	padding-top: 15px;
    }
    .titleContent_list_sort{
        display: flex;
        flex-direction: row;
        justify-content: center;
    }
    .titleContent_list_sort_text{
    	border-radius : 35px;
        padding: 5px 10px;
        margin : 5px;
        cursor: pointer;
        font-size: 14px;
        font-weight: 700;
        color: #666666;
    }
    .titleContent_click{
    	background-color: #57667e;
    	color: white;
    	border-radius: 35px;
    }
    
    /* 페이지 번호 */
    .page_grp{
     	width: 600px;
     	display: flex;
        flex-direction: row;
        justify-content: center; /* 수평 가운데 정렬 */
    	align-items: center; /* 수직 가운데 정렬 */
    	padding: 20px 0;
    }
    .page_num{
     	border: 1px solid #333333;
     	width: 32px;
     	height: 32px;
     	text-align: center;
     	line-height: 32px;
     	margin-left: 5px;
     	cursor: pointer;
    }
    
    .page_click{
	    background-color: #13294b;
	    color: #fff;
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
	
	// 현재 클릭한 정렬 스타일 변화
	function titleContentClick(obj){
		let element = document.querySelector(".titleContent_sort_click");// 
		element.classList.remove("titleContent_sort_click"); // 클래스명 제거
		
		let element2 = obj; // 선택된 요소
	    element2.classList.add("titleContent_sort_click"); // 선택된 요소에 클래스 추가
	}
	
	// 현재 선택되어 있는 정렬 아이디 값
	function titleContentClickId(){
		let element = document.querySelector(".titleContent_sort_click"); // 클래스명이 있는 요소를 가져옴
		let sortId = element.id; // 아이디 값을 가져옴  
		return sortId ;
	}
	
	// 페이지 리스트 변화 ajax
	function currentPageList(currentPage, sidoCode){
		
		// 정렬 기준 별로 가져오는 데이터 다르게 하기
		let sortId = titleContentClickId();
		
		$.ajax({
	 		type:"GET" ,
	 		url: "/tour/eventlist",
	 		data: "currentPage=" + currentPage+"&sidoCode="+sidoCode+"&sortId="+sortId,
	 		success : function( data){
	 			titleClick(sidoCode); // 현재 지역 스타일 변경 클래스 추가
	 			titAreaToHtml(); // titleArea 선택된 지역명 변화
	 			titCotToHtml(data); // titleContent_cnt 전체 수 변화
	 			cotListToHtml(data); // listSubWrap 리스트 내용 변화
	 			pageToHtml(data, sidoCode); // 페이지수에 따른 리스트 변화
	 			pageClick(currentPage); // 현재 페이지 스타일 변경 클래스 추가
	 		},
	 		error: function(){
	 			alert( "error");
	 		}
	 	});	
	}
	
	// titleArea 선택된 지역명 변화
	function titAreaToHtml(){
		$("#titleArea").empty();
		let element = document.querySelector(".titleContent_click"); // 클래스가 "titleContent_click"인 엘리먼트 선택
		let content = element.textContent; // 엘리먼트의 내용을 가져옴
		let str4 = "<h1>#공연/행사 "+content+"</h1>";
		$("#titleArea").append(str4);
	}
	
	// 현재 지역 스타일 변경 클래스 추가
	function titleClick(num){
		let elements = document.querySelectorAll(".titleContent_click");
		for (let i = 0; i < elements.length; i++) {
		    elements[i].classList.remove("titleContent_click");
		}
		let element = document.getElementById("title"+num); // 요소를 선택
		element.classList.add("titleContent_click"); // 클래스 추가
	}
	
	// titleContent_cnt 전체 수 변화
	function titCotToHtml(data){
		$("#titleContent_cnt").empty();
		let item = data.totalcnt;
		let str = "<h3>총<span style=\"color: #0a97cd;\">"+item+"</span>건</h3>";
		$("#titleContent_cnt").append(str);
	}	
	
	// listSubWrap 리스트 내용 변화
	function cotListToHtml(data){
		$("#listSubWrap").empty();
		
		let item = data.contentList;
		let currentDate = data.currentDate;
		let str1 = "";
		for(let i=0; i<item.length; i++){
			str1 += "<li>";
			str1 += "	<form action=\"/tour/eventDetail\" method=\"get\">";
			str1 += "	<input type=\"hidden\" id=\"contentIdInput\" name=\"contentId\" value=\""+item[i].contentid+"\">";
			str1 += "	<ul class=\"contentList\">";
			str1 += "		<li class=\"contentList_imgBox\">";
			if(item[i].firstimage == null){
				str1 += "			<img class=\"content_mainImg\" src=\"https://korean.visitkorea.or.kr/resources/images/common/no_img_01.png\" onclick = \"detail(this)\">";
			}else{
				str1 += "			<img class=\"content_mainImg\" src=\""+item[i].firstimage+"\" onclick = \"detail(this)\">";
			}
			if(item[i].eventstartdate > currentDate){
				str1 += "			<div style=\"background-color:#13294b;\" class=\"progress\">진행전</div>";
			}else if(item[i].eventstartdate <= currentDate && currentDate <= item[i].eventenddate){
				str1 += "			<div style=\"background-color:red;\" class=\"progress\">진행중</div>";
			}else{
				str1 += "			<div style=\"background-color:#888888;\" class=\"progress\">종료</div>";
			}
			str1 += "		</li>";
			str1 += "		<li class=\"contentList_sub\">";
			str1 += "			<div class=\"contentList_text\">";
			str1 += "				<h3 onclick = \"detail(this)\">"+item[i].title+"</h3>";
			str1 += "				<p>"+item[i].nickName + " ";
			if(item[i].sidoCode != 8){
				str1 += item[i].sigunguname +"</p>";
			}else{
				str1 += "</p>";
			}
			str1 += "				<p>["+item[i].eventstartdate+" ~ "+item[i].eventenddate+"]</p>";
			str1 += "			</div>";
			str1 += "			<div class=\"contentList_moreWrap\">";
			str1 += "				<img class=\"more_btn\" src=\"https://korean.visitkorea.or.kr/resources/images/sub/btn_dot2.png\" onclick = \"imgClick(this)\">";
			str1 += "				<div class=\"modal_window\">";
			str1 += "					<div>";
			str1 += "						<img src=\"https://korean.visitkorea.or.kr/resources/images/sub/ico_post05.png\">";
			str1 += "						<p onclick=\"courseModal('"+item[i].contentid+"')\">코스에 담기</p>";
			str1 += "					</div>";
			str1 += "				</div>";
			str1 += "			</div>";
			str1 += "		</li>";
			str1 += "	</ul>";
			str1 += "	</form> ";
			str1 += "</li>";
		}
		$("#listSubWrap").append(str1);
	}
	
	// 페이지수에 따른 리스트 변화
	function  pageToHtml(data, sidoCode){
		$("#page_grp").empty();
		
		let item2 = data.handler;
		let str2 = "";
		if(item2.currentGrp > 1){
			str2 += "<div class=\"page_num\" onclick=\"currentPageList("+(item2.grpStartPage-1)+","+sidoCode+")\"> << </div>";
		}
		for(let i = item2.grpStartPage; i <= item2.grpEndPage ; i++){
			str2 += "<div class=\"page_num\" id=\"page"+i+"\" onclick=\"currentPageList("+i+","+sidoCode+")\">"+i+"</div>";
		}
		if(item2.currentGrp != item2.lastGrp){  
			str2 += "<div class=\"page_num\" onclick=\"currentPageList("+(item2.grpEndPage+1)+","+sidoCode+")\"> >> </div>";
		} 
		$("#page_grp").append(str2);
	}
	
	// 현재 페이지 스타일 변경 클래스 추가
	function pageClick(num){
		let element = document.getElementById("page"+num); // 요소를 선택
		element.classList.add("page_click"); // 클래스 추가
	}
	
	// 더보기 버튼 클릭
	function imgClick(obj){
		// 모달 윈도우 흐릿한 배경
		document.getElementById("hidden_section").style.display = "block";
		let parentElement = obj.parentElement; // 클릭한 부모 요소 가져오기
	    let modalElement = parentElement.querySelector(".modal_window");
		
	    if (modalElement.style.display == "none" || modalElement.style.display == '') {
    		modalElement.style.display = "block";
	    } else {
	    	modalElement.style.display = "none";
	    }
	}
	
	// 모달창
	function modalClose(){
		// 클릭되었던 모달창 제거
		let elements = document.querySelectorAll('.modal_window');
		for(let i=0; i<elements.length; i++){
			elements[i].style.display = "none";
		}
		// 클릭되었던 코스 모달창 제거
		$(".modal_window_course").empty();
		
		// 클릭되었던 코스추가 모달창 제거
		let element =  document.querySelector('.modal_window_addcourse');
		element.style.display = "none";
		
		// 모달창 뒷 배경 없애기 
		document.getElementById("hidden_section").style.display = "none";
	}
	
	
	// 상세페이지로 이동
	function detail(obj){
	    let form = obj.closest('form'); // 클릭한 요소에서 가장 가까운 form태그 요소 선택하기
	    form.submit(); // 값 전송
	}
	
	// 코스에 담기
	function courseModal(contentId){
		let userId = '<%= session.getAttribute("userId")%>'; // 세션에 저장된 userId값 가져오기
		alert(userId);
		alert(contentId);
   		if (userId == 'null') {
   			alert("로그인이 필요한 서비스입니다.");
   			window.location.href = "${path}/loginform";
   	    }else{
   	    	$.ajax({
   		 		type:"GET" ,
   		 		url: "${path}/mycourselist",
   		 		//data: "contentId=" + contentId,
   		 		success : function( data){
   		 			// 클릭되었던 모달창 제거
   		   			let elements = document.querySelectorAll('.modal_window');
   		   			for(let i=0; i<elements.length; i++){
   		   				elements[i].style.display = "none";
   		   			}
   		   			
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
	
	// 코스추가
	function addcourse(){
		let element1 = document.querySelector('.modal_window_course');
		element1.style.display = "none";
		//$(".modal_window_course").empty();
		let element2 = document.querySelector('.modal_window_addcourse');
		element2.style.display = "block";
	}
	
	// 코스추가 닫기
	function addcourseClose(){
		let element1 = document.querySelector('.modal_window_course');
		element1.style.display = "block";
		//$(".modal_window_course").empty();
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
	        <div class="titleArea" id="titleArea">
	            <h1>#공연/행사 #전체</h1>
	        </div>
	        <div class="titleContent">
	            <div class="titleContent_cnt" id="titleContent_cnt">
	                <h3>총<span style="color: #0a97cd;">${totalcnt}</span>건</h3>
	            </div>
	            <div class="titleContent_sort">
	                <p class="titleContent_sort_click" id="sort1" onclick="titleContentClick(this); currentPageList(1,0);">최신순</p>
	                <p id="sort2" onclick="titleContentClick(this); currentPageList(1,0);">거리순</p>
	                <p id="sort3" onclick="titleContentClick(this); currentPageList(1,0);">인기순</p>
	            </div>
	        </div>
	        
	        
	        <div class="listWrap">
	            <ul id="listSubWrap">
	            <c:forEach var="item" items="${contentList}"  varStatus="loop">
	                <li>
	                	<form action="/tour/eventDetail" method="get">
	                	<input type="hidden" id="contentIdInput" name="contentId" value="${item.contentid}">
	                    <ul class="contentList">
	                        <li class="contentList_imgBox">
	                            <c:choose>
	                        		<c:when test="${item.firstimage eq null}">
	                        			<img class="content_mainImg" src="https://korean.visitkorea.or.kr/resources/images/common/no_img_01.png" onclick = "detail(this)">
	                        		</c:when>
	                        		<c:otherwise>
	                        			<img class="content_mainImg" src="${item.firstimage}" onclick = "detail(this)">
	                        		</c:otherwise>
	                        	</c:choose>
	                            <!--  jstl 비교 lt(미만), le(이하), gt(초과), ge(이상) -->
	                            <c:choose>
								    <c:when test="${item.eventstartdate gt currentDate}">
								        <div style="background-color:#13294b;" class="progress">진행전</div>
								    </c:when>
								    <c:when test="${item.eventstartdate le currentDate && currentDate le item.eventenddate}">
								        <div style="background-color:red;" class="progress">진행중</div>
								    </c:when>
								    <c:otherwise>
								        <div style="background-color:#888888;" class="progress">종료</div>
								    </c:otherwise>
								</c:choose>
	                        </li>
	                        <li class="contentList_sub">
	                        	<div class="contentList_text">
	                        		<h3 onclick = "detail(this)">${item.title}</h3>
		                            <p>${item.nickName} ${item.sigunguname}</p>
		                            <p>[${item.eventstartdate} ~ ${item.eventenddate}]</p>
	                        	</div>
	                        	<div class="contentList_moreWrap" id="list${loop.index}" >
	                        		<img  class="more_btn" src="https://korean.visitkorea.or.kr/resources/images/sub/btn_dot2.png" onclick = "imgClick(this)">
	                        		<div class="modal_window">
										<div>
											<img src="https://korean.visitkorea.or.kr/resources/images/sub/ico_post05.png">
											<p onclick="courseModal('${item.contentid}')">코스에 담기</p>
										</div>
									</div>
	                        	</div>
	                        </li>            
	                    </ul>
	                    </form> 
	                </li>
	               </c:forEach>
	            </ul> 
	            
	            <ul class="titleContent_list">
	          		<c:forEach var="item" items="${sidoList}" varStatus="loop">
		          		<c:if test="${loop.index % 3 == 0}">
			            	<li>
				                 <ul class="titleContent_list_sort">
		                 </c:if>
		                 			<c:choose>
		                 				<c:when test="${loop.index == 0}">
		                 					<li class="titleContent_list_sort_text titleContent_click" id="title${item.sidoCode}" onclick="currentPageList(1, ${item.sidoCode})">#<span>${item.nickName}</span></li>
		                 				</c:when>
		                 				<c:otherwise>
		                 					<li class="titleContent_list_sort_text" id="title${item.sidoCode}" onclick="currentPageList(1, ${item.sidoCode})">#<span>${item.nickName}</span></li>
		                 				</c:otherwise>
		                 			</c:choose>
				        <c:if test="${loop.index % 3 == 2 or loop.last}">
				                 </ul>
			           		</li> 
			           	</c:if>	 
	           	 	</c:forEach>
	            </ul>
	        
	        </div>
	        
	        <div class="page_grp" id="page_grp">
	        	<c:if test="${handler.currentGrp > 1}">
	       			<div class="page_num"><<</div>
	       		</c:if>
	        	<c:forEach var="item" begin="${handler.grpStartPage}" end="${handler.grpEndPage}">
	        		<c:choose>
					    <c:when test="${item == handler.grpStartPage}">
					        <div class="page_num page_click" id="page${item}" onclick="currentPageList(${item}, 0)">${item}</div>
					    </c:when>
					    <c:otherwise>
					        <div class="page_num" id="page${item}" onclick="currentPageList(${item}, 0)">${item}</div>
					    </c:otherwise>
					</c:choose>
	        	</c:forEach>
	       		<c:if test="${handler.currentGrp != handler.lastGrp}">
	       			<div class="page_num" onclick="currentPageList(${handler.grpEndPage+1},0)">>></div>
	       		</c:if> 
	        </div>
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
</body>
</html>