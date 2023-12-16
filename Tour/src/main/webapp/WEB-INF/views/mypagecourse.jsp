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
        padding-top : 130px; 
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
    /* 모달 창*/
    .modal_window{
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
    
    /* 전체 공간 */
    .mypagewrap {
    	margin: 0 auto;    
        width: 940px;
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
   
    /* 코스 */
    .mypageTitle h2 {
        overflow: hidden;
        font-weight: 800;
        color: #333;
        font-size: 36px;
        letter-spacing: -1px;    
    }
    
    /*지도로 보기*/
    .course {
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
        cursor: pointer;
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
   
    /* 배너 */
    .banner{
        margin: 30px 0;
        width: 600px;
        height: 265px;
        background-image: url(https://korean.visitkorea.or.kr/resources/images/sub/banner_mplist_mcos.gif);
	    background-size: cover;
	    background-position: center;
	    background-repeat: no-repeat;
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
    .area{
    	position: absolute;
    	width: 100%;
        height: 96%;
        top: 0;
        left: 0;
        color: #fff;
        background-color: rgba(0,0,0,0.6);  
        
        display: flex;
        align-items: center;
    }
    .area span{
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
    }
    .delete{
    	background: url(https://korean.visitkorea.or.kr/resources/images/sub/ico_sprite_pop.png) 4% 58.8% / 14% auto no-repeat;
   		cursor: pointer;
   	}
   	.delete span{
   		margin-left: 30px;
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
	
	// 코스만들기 모달창
	function createCourse(){
		// 모달 윈도우 흐릿한 배경
		document.getElementById("hidden_section").style.display = "block";
		let element = document.querySelector('.modal_window');
		element.style.display = "block";
	}
	
	function modalClose(){
		// 클릭되었던 모달창 제거
		let element = document.querySelector('.modal_window');
		element.style.display = "none";
		
		let subMenus = document.querySelectorAll(".subMenu");
		for(let i=0; i<subMenus.length; i++){
			subMenus[i].style.display = "none";
		}
		
		// 모달창 뒷 배경 없애기 
		document.getElementById("hidden_section").style.display = "none";
	}
	
	// 생성된 코스 삽입
	function insertCourse(){
		let courseName = document.getElementById('modal_input').value;
		
		$.ajax({
	 		type:"post" ,
	 		url: "/tour/insertmycourse",
	 		data: "courseName=" + courseName,
	 		success : function( data){
	 			window.location.reload();
	 		},
	 		error: function(){
	 			alert( "error");
	 		}
	 	});	
	}
	
	// 코스 삭제
	function deleteCourse(coursecode){
		if(confirm("정말 삭제하시겠습니까?")){
			alert("삭제되었습니다.");
			$.ajax({
		 		type:"post" ,
		 		url: "${path}/deletemycourse",
		 		data: "coursecode=" + coursecode,
		 		success : function( data){
		 			window.location.reload();
		 		},
		 		error: function(){
		 			alert( "error");
		 		}
		 	});	
		}else{
			alert("취소되었습니다.");
			window.location.reload();
		}
		
	}
	
	// 현재 페이지 리스트 변화 ajax
	function currentPageList(currentPage){
		
		$.ajax({
	 		type:"GET" ,
	 		url: "/tour/mypagecourselist",
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
		$("#courseList").empty();
		
		let item = data.courseList;
		let paging = data.handler;
		let distance = data.distanceAll;
		let listimage = data.listimage;
		let str="";
		
		if(item.length == 0) {
			str += "<ul class=\"courseList\">";
			str += "	<li class=\"txt_area\">생성된 코스가 없습니다.</li>";
			str += "</ul>";
		}else{
			for(let i = paging.startList-1; i< paging.endList; i++){
				str += "<form action=\"/tour/mypagecoursedetail\" method=\"get\">";
				str += "<input type=\"hidden\" id=\"courseInput\" name=\"coursecode\" value=\""+item[i].coursecode+"\">";
				str += "<ul class=\"courseList\">";
				str += "	<li class=\"picture\" onclick=\"detailpage(this)\">";
				str += "		<img src=\""+listimage[i]+"\">";
				str += "		<span class=\"area\">";
				str += "			<span>코스 총거리 "+distance[i]+"km</span>";
				str += "		</span>";
				str += "	</li>";
				str += "	<li class=\"txt_area\">";
				str += "		<h3 onclick=\"detailpage(this)\">"+item[i].coursename+"</h3>";
				if(item[i].coursecontent == null){
					str += "		<p></p>";
				}else{
					str += "		<p>"+item[i].coursecontent+"</p>";
				}
				str += "		<button type=\"button\" class=\"more_btn\" onclick=\"modalBtn(this)\"></button>";
				str += "		<ul class=\"subMenu\">";
				str += "			<li class=\"delete\" onclick=\"deleteCourse('"+item[i].coursecode+"')\"><span>삭제</span></li>";
				str += "		</ul>";
				str += "	</li>";
				str += "</ul>";
				str += "</form>";
			}
		}
		$("#courseList").append(str);
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
	
	// 코스 만들기 상세페이지
	function detailpage(obj){
		let form = obj.closest('form'); // 클릭한 요소에서 가장 가까운 form태그 요소 선택하기
	    form.submit(); // 값 전송
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
	                <h2>코스</h2>
	                <div class="course" onclick="createCourse()">코스만들기</div>
	                <!-- <a class="course" href="" >코스만들기</a> -->
	                <span class="btn" style="display: none;">
	                	<button type="button" onclick="layerPopup.layerShow('positionPop');">내 위치 OFF</button>
	                </span>
	         </div>
         	 <div class="banner"><a href=""></a></div>
         	 
         	 <div class="viewClick">
                <div class="leftBox">
                    <div class="smallBox">
                        <strong>총<span>${listsize}</span>건</strong>
                    </div>
                 
                 	<div id="courseList">
                 	<c:choose>
                 		<c:when test="${courseList.size() == 0}">
                 			<ul class="courseList">
                 				<li class="txt_area">생성된 코스가 없습니다.</li>
                 			</ul>
                 		</c:when>
                 		<c:otherwise>
                 			<c:forEach var="item" items="${courseList}" begin="${handler.startList-1}" end="${handler.endList-1}" varStatus="loop">
		                 		<form action="/tour/mypagecoursedetail" method="get">
				                 	<input type="hidden" id="courseInput" name="coursecode" value="${item.coursecode}">
				                 	<ul class="courseList">
					                 	<li class="picture" onclick="detailpage(this)">
					                 		<img src="${listimage[loop.index]}">
				                        	<span class="area">
				                            	<span>코스 총거리 ${distanceAll[loop.index]}km</span>
				                            </span>
				                         </li>
				                         <li class="txt_area">
				                         	<h3 onclick="detailpage(this)">${item.coursename}</h3>
				                            <p>${item.coursecontent}</p>
				                            <button type="button" class="more_btn" onclick="modalBtn(this)"></button>
				        
				                            <!-- 모달창 -->
				                            <ul class="subMenu">
				                                <li class="delete" onclick="deleteCourse('${item.coursecode}')"><span>삭제</span></li>
				                            </ul>
				                         </li>
					                  	</ul>
					                 </form>
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
		</div>
		
		<!--  모달 윈도우 -->
		<div class="hidden_section" id="hidden_section" onclick="modalClose()"></div>
		<div class="modal_window">
			<div class="modal_courseTitle">
				<p>코스만들기</p>
				<img onclick="modalClose()" src="https://korean.visitkorea.or.kr/resources/images/common/btn_w_close_32x32.png">
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