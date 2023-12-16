<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    .contentList_img{
    	position: relative;
    }
    .content_subImg{
    	position: absolute;
    	top:0;
    	left:0;
    	width: 140px;
        height: 94px;
    	margin:10px;
        z-index: 1;
        background-color: rgb(0,0,0,0.65);  
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        color: #fff;
        font-size: 14px;
        text-align: center;
        cursor: pointer;
    }
    .content_mainImg{
        width: 140px;
        height: 94px;
        padding: 10px;
    }
    .contentList_sub{
        display: flex;
        flex-direction: row; /* 내용을 세로로 정렬 */
    }
    .contentList_text{
    	width:435px;
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
	 		url: "/tour/courselist",
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
		let str4 = "<h1>#여행코스 "+content+"</h1>";
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
		let distance = data.distanceAll;
		let str1 = "";
		for(let i=0; i<item.length; i++){
			str1 += "<li>";
			str1 += "	<form action=\"/tour/courseDetail\" method=\"get\">";
			str1 += "	<input type=\"hidden\" id=\"contentIdInput\" name=\"contentId\" value=\""+item[i].contentid+"\">";
			str1 += "	<ul class=\"contentList\">";
			str1 += "		<li class=\"contentList_img\">";
			str1 += "			<img class=\"content_mainImg\" src=\""+item[i].firstimage+"\">";
			str1 += "			<div class=\"content_subImg\" onclick = \"detail(this)\">";
			str1 += "				<p>코스 총 거리</p>";
			str1 += "				<p style=\"font-size:21px;\">"+distance[i]+"km</p>";
			str1 += "			</div>";
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
	
	
	
	// 상세페이지로 이동
	function detail(obj){
	    let form = obj.closest('form'); // 클릭한 요소에서 가장 가까운 form태그 요소 선택하기
	    form.submit(); // 값 전송
	}
	
	
	
	

	
</script>

</head>

<body>
	
	<header><%@ include file="header.jsp" %></header>
	
	<section>
		<div class="section_wrap">
	        <div class="titleArea" id="titleArea">
	            <h1>#여행코스 #전체</h1>
	        </div>
	        <div class="titleContent">
	            <div class="titleContent_cnt" id="titleContent_cnt">
	                <h3>총<span style="color: #0a97cd;">${totalcnt}</span>건</h3>
	            </div>
	            <div class="titleContent_sort">
	                <p class="titleContent_sort_click" id="sort1" onclick="titleContentClick(this); currentPageList(1,0);">최신순</p>
	                <p id="sort3" onclick="titleContentClick(this); currentPageList(1,0);">인기순</p>
	            </div>
	        </div>
	        <div class="listWrap">
	            <ul id="listSubWrap">
	            <c:forEach var="item" items="${contentList}"  varStatus="loop">
	                <li>
	                	<form action="/tour/courseDetail" method="get">
	                	<input type="hidden" id="contentIdInput" name="contentId" value="${item.contentid}">
	                    <ul class="contentList">
	                        <li class="contentList_img">
	                            <img class="content_mainImg" src="${item.firstimage}" >
	                            <div class="content_subImg" onclick = "detail(this)">
	                            	<p>코스 총 거리</p>
	                            	<p style="font-size:21px;">${distanceAll[loop.index]}km</p>
	                            </div>
	                        </li>
	                        <li class="contentList_sub">
	                        	<div class="contentList_text">
	                        		<h3 onclick = "detail(this)">${item.title}</h3>
		                            <p>${item.nickName} ${item.sigunguname}</p>
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
       	
        
		
		
    </section>
    
    <footer><%@ include file="footer.jsp" %></footer>
</body>
</html>