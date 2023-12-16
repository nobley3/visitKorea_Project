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
        margin:0;
        padding:0;
        text-decoration: none;
        list-style : none;
    }
    section{
    	margin: 0 auto;    
        width: 940px;
        padding-top : 130px;       
    }

    /* 전체 공간 */
    .mypagewrap {
        margin: 0 auto;
    }
   
   	/* 마이페이지 메인 링크 */
    .mypageTitle{      
        position: relative;
        padding-right: 20px;
    }
    .mypageTag{
    	display: flex;
        color: #666666;
        width: 135px;
        height: 40px;
    }
    .mypageTag img{
    	width: 30px;
		height: 28px;	
		padding-right: 5px;
    }
    .mypageTag h4{
    	font-size: 20px;
    	letter-spacing: -1px;
    	line-height: 45px;
    }
   
    /* Q&A */
    .mypageTitle h2 {
        overflow: hidden;
        font-weight: 800;
        color: #333;
        font-size: 36px;
        letter-spacing: -1px;    
    }
    
    /*지도로 보기*/
    .question {
        position: absolute;
        bottom: 5px;
        right: 340px;
        color: #fff;
        background: #13294b;
        font-size: 14px;
        padding: 0 15px;
        height: 30px;
        line-height: 30px;
        text-decoration: none;
    }
    .btn {
        position: absolute;
        right: 373px;
        bottom: 10px;
    }
    .btn button {
        background: #b5b5b5;
        border-radius: 50px;
        width: 100px;
        color: #fff;
        font-weight: 700;
        font-size: 12.5px;
        line-height: 28px;
        letter-spacing: -1px;
        text-align: left;
        cursor: pointer;
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
   
    /* 리스트 표출 */
	.questionList {
        width: 600px;
        display: flex;
        flex-direction: row;
        border-bottom: 1px solid #e6e6e6;
        padding: 20px 0;
    }
    .questionList li{
    	text-align: center;
    	font-size: 20px;
    	height: 30px;
   		line-height: 30px;
    }
    .questionList li:nth-child(1) {
		width: 70px;
	}
	.questionList li:nth-child(2) {
		width: 290px;
		text-align: left;
		font-weight: 800;
		cursor: pointer;
	}
	.questionList li:nth-child(2):hover {
		text-decoration: underline;
	}
	.questionList li:nth-child(3) {
		width: 120px;
		color: #666666;
		font-size: 18px;
	}
	.questionList li:nth-child(4) {
		width: 120px;
		color: #666666;
		font-size: 18px;
	}
	.questionList a{
		color: black;
	}
    
   
	/* 페이징 */
	.page_grp{
		padding: 10px 0;
        text-align: center;
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: center;
	}
	.page_num{
		border: 1px solid #13294b;
		width: 30px;
        height: 30px;
        margin: 0 5px;
        line-height: 30px;
        cursor: pointer;
	}
	.page_click{
		background-color: #13294b;
		color: #fff;
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
	
	
	// 현재 페이지 리스트 변화 ajax
	function currentPageList(currentPage){
		$.ajax({
	 		type:"GET" ,
	 		url: "${path}/mypageQAlist",
	 		data: "currentPage=" + currentPage,
	 		success : function( data){
	 			currentList(data);
	 			pageList(data);
	 		},
	 		error: function(){
	 			alert( "error");
	 		}
	 	});	
	}
	
	// 현재 페이지 리스트 변화
	function currentList(data){
		$(".questionListWrap").empty();
		
		let item = data.myqalist;
		let paging = data.handler;
		
		let str="";
		if(item.length == 0 ){
			str += "<div class=\"questionList\" style=\"padding:20px; width:560px;\">등록된 문의가 없습니다.</div>";
		}else{
			for(let i = paging.startList-1; i< paging.endList; i++){
				str += "<ul class=\"questionList\">";
				str += "	<li>"+(i+1)+"</li>";
				str += "	<li>"+item[i].qatitle+"</li>";
				str += "	<li>"+item[i].qawritedate+"</li>";
				if(item[i].answer == 0){
					str += "<li>답변대기</li>";
				}else{
					str += "<li>답변완료</li>";
				}
				str += "</ul>";
			}
		}
		$(".questionListWrap").append(str);
		
	}
	
	// 현재 페이지 그룹 변화
	function pageList(data){
		$("#page_grp").empty();
		let item = data.handler;
		let str="";
		
		if(item.currentGrp > 1){
			str += "<div class=\"page_num\" onclick=\"currentPageList("+(item.grpStartPage-1)+")\"><<</div>";
		}
		for(let i = item.grpStartPage; i<= item.grpEndPage; i++){
			if(i == item.currentPage){
				str += "<div class=\"page_num page_click\" onclick=\"currentPageList("+i+")\">"+i+"</div>";
			}else{
				str += "<div class=\"page_num\" onclick=\"currentPageList("+i+")\">"+i+"</div>";
			}
		}
		if(item.currentGrp != item.lastGrp){
			str += "<div class=\"page_num\" onclick=\"currentPageList("+(item.grpEndPage+1)+")\">>></div>";
		}
		
		$("#page_grp").append(str);
		
	}
	
	// 해당 문의하기 글 페이지 이돌
	function updatepage(qacode){
		
	}
</script>

 
</head>
<body>

	<header><%@ include file="header.jsp" %></header>
	
	<section>
		<div class="mypagewrap">
			<div class="mypageTitle"> 
	                <a class="mypageTag" href="${pageContext.request.contextPath}/mypage.do">
		                <img src="https://korean.visitkorea.or.kr/resources/images/sub/ico_tit_list5.png">
		    			<h4>마이페이지</h4>
	                </a>
	                <h2>Q&A</h2>
	                <a class="question" href="${path }/mypageQAregister" >질문등록</a>
	                <span class="btn" style="display: none;">
	                	<button type="button" onclick="layerPopup.layerShow('positionPop');">내 위치 OFF</button>
	                </span>
	         </div>
	         
	         <div class="viewClick">
                <div class="leftBox">
                    <div class="smallBox">
                        <strong>총<span>${myqalist.size()}</span>건</strong>
                    </div>
                    <div class="questionListWrap">
                    	<c:choose>
                    		<c:when test="${myqalist.size() == 0}">
                    			<div class="questionList" style="padding:20px; width:560px;">등록된 문의가 없습니다.</div>
                    		</c:when>
                    		<c:otherwise>
                    			<c:forEach var="item" items="${myqalist}" varStatus="loop" begin="${handler.startList-1}" end="${handler.endList-1}">
					                 <ul class="questionList">
				                         <li>${loop.index+1}</li>
				                         <li><a href="${path}/mypageQAupdate?qacode=${item.qacode}">${item.qatitle }</a></li>
				                         <li>${item.qawritedate }</li>
				                         <c:choose>
				                         	<c:when test="${item.answer == 0 }">
				                         		<li>답변대기</li>
				                         	</c:when>
				                         	<c:otherwise>
				                         		<li>답변완료</li>
				                         	</c:otherwise>
				                         </c:choose>
					                  </ul>
		                 		</c:forEach>
                    		</c:otherwise>
                    	</c:choose>
                    
                    
                    
                    
                    
                    
                    
                 		
                 	</div>
                 	
	                <!-- 페이징 -->
                    <div class="page_grp" id="page_grp">
                    	<c:if test="${handler.currentGrp > 1}">
			       			<div class="page_num"><<</div>
			       		</c:if>
			       		<c:forEach var="item" begin="${handler.grpStartPage}" end="${handler.grpEndPage}">
			       			<c:choose>
							    <c:when test="${item == handler.grpStartPage}">
							        <div class="page_num page_click" onclick="currentPageList(${item})">${item}</div>
							    </c:when>
							    <c:otherwise>
							        <div class="page_num" onclick="currentPageList(${item})">${item}</div>
							    </c:otherwise>
							</c:choose>
			       		</c:forEach>
                    	<c:if test="${handler.currentGrp != handler.lastGrp}">
			       			<div class="page_num" onclick="currentPageList(${handler.grpEndPage+1})">>></div>
			       		</c:if> 
                    </div>
                 </div>
                 
                 
                 <ul class="rightBox">
                    <li>
                        <a class="rightList" href="${pageContext.request.contextPath}/mypagelike.do">좋아요</a>
                    </li>
                    <li>
                        <a class="rightList" href="${pageContext.request.contextPath}/mypagecourse.do">코스</a>
                    </li>
                    <li>
                        <a class="rightList" href="${pageContext.request.contextPath}/mypagetalk.do">댓글</a>
                    </li>
                    <li>
                        <a class="rightList rightList_click" href="${pageContext.request.contextPath}/mypageQA.do">Q&A</a>
                    </li>
                </ul>
              </div>
		</div>
    </section>
	

	<footer><%@ include file="footer.jsp" %></footer>

</body>
</html>