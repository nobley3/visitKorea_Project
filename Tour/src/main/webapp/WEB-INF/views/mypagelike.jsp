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

<style>
	
    *{
        padding: 0;
        margin:0;
        text-decoration: none;
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
	
	
    section{
        padding-top : 130px;  
        position: relative; 
    }

	/* 전체 공간 */
    .mypageLikewrap {
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
    
    /* 즐겨찾기 */
    .mypageTitle h2 {
        overflow: hidden;
        font-weight: 800;
        color: #333;
        font-size: 36px;
        letter-spacing: -1px;    
    }

    /*지도로 보기*/
    .map {
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
	.favList {
        width: 600px;
        display: flex;
        flex-direction: row;
        
        border-bottom: 1px solid #e6e6e6;
        padding: 20px 0;
    }
	.picture {
        position: relative;
        cursor: pointer;
    }
    .picture img{
    	width: 140px;
    	height: 94px;
    }
	.trip {
        color: #fff;
        font-size: 14px;
        position: absolute;
        top:0;
        left:0;
        z-index:1;
        background: #13294b;
        padding: 5px;
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
    
    /* 지도 */
    #map{
    	width:  800px;
    	height: 700px;
    	margin: 0 auto;
    	z-index: 2;
    	
    	position: absolute;
	    top: 60px;
	    right: 0;
	    
	    visibility: hidden;
	    
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
    
    
    
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

	
	// 스크롤 이벤트 감지
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
		let subMenus = document.querySelectorAll(".subMenu");
		for(let i=0; i<subMenus.length; i++){
			subMenus[i].style.display = "none";
		}
		
		// 모달창 뒷 배경 없애기 
		document.getElementById("hidden_section").style.display = "none";
	}
	
	
	// 좋아요 삭제
	function deleteLike(contentid){
		if(confirm("정말 삭제하시겠습니까?")){
			alert("삭제되었습니다.");
			$.ajax({
		 		type:"post" ,
		 		url: "${path}/deletemylike",
		 		data: "contentid=" + contentid,
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
	 		url: "/tour/mypagelikelist",
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
		$("#favList").empty();
		
		let item = data.contentList;
		let paging = data.handler;
		let str="";
		
		if(item.length == 0 ){
			str += "<ul class=\"favList\">";
			str += "	<li class=\"txt_area\">좋아요를 누른 게시물이 없습니다.</li>";
			str += "</ul>";
		}else{
			for(let i = paging.startList-1; i< paging.endList; i++){
				str += "<ul class=\"favList\">";
				str += "	<li class=\"picture\">";
				str += "		<div class=\"trip\">"+item[i].contenttypename+"</div>";
				str += "		<img src=\""+item[i].firstimage+"\">";
				str += "	</li>";
				str += "	<li class=\"txt_area\">";
				str += "		<h3>"+item[i].title+"</h3>";
				str += "		<p>"+item[i].nickname+" "+item[i].sigunguname+"</p>";
				str += "		<button class=\"more_btn\" onclick=\"modalBtn(this)\"></button>";
				str += "		<ul class=\"subMenu\">";
				str += "			<li class=\"delete\"><span>삭제</span></li>";
				str += "		</ul>";
				str += "	</li>";
				str += "</ul>";
			}
		}
		
		
		$("#favList").append(str);
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
	
	let mapIndex = 0;
	function mapView(){
		let mapDiv = document.getElementById("map");
		if(mapIndex == 0){
			mapDiv.style.visibility = "visible";
			mapIndex = 1;
		}else{
			mapDiv.style.visibility = "hidden";
			mapIndex = 0;
		}
	}
	
</script>

</head>
<body>

	<header><%@ include file="header.jsp" %></header>
	
	<section>
        <div class="mypageLikewrap">
            <div class="mypageTitle"> 
                <a class="mypageTag" href="${pageContext.request.contextPath}/mypage.do">
	                <img src="https://korean.visitkorea.or.kr/resources/images/sub/ico_tit_list5.png">
	    			<h4>마이페이지</h4>
                </a>
                
                <h2>좋아요</h2>
                <a class="map" onclick="mapView()">지도로 보기<div id="map"></div></a>
                <span class="btn" style="display: none;">
                	<button type="button" onclick="layerPopup.layerShow('positionPop');">내 위치 OFF</button>
                </span>
            </div>
            
            <div class="viewClick">
                <div class="leftBox">
                    <div class="smallBox">
                        <strong>총<span>${listsize}</span>건</strong>
                    </div>
                    
                    <div id="favList">
                    	<c:choose>
							<c:when test="${contentList.size() == 0}">
								<ul class="favList">
									<li class="txt_area">좋아요를 누른 게시물이 없습니다.</li>
								</ul>
							</c:when>
							<c:otherwise>
								<c:forEach var="item" items="${contentList}" begin="${handler.startList-1}" end="${handler.endList-1}">
				                    <ul class="favList">
				                        <li class="picture" onclick="pageDetail('${item.contenttypeid}', '${item.cat2}', '${item.contentid}' )">
				                            <div class="trip">${item.contenttypename}</div>
				                            <img src="${item.firstimage}">
				                         </li>
				                         <li class="txt_area">
				                         	<h3  onclick="pageDetail('${item.contenttypeid}', '${item.cat2}', '${item.contentid}')">${item.title}</h3>
				                            <p>${item.nickname} ${item.sigunguname}</p>
				                            <button class="more_btn" onclick="modalBtn(this)"></button>
				                            
				                            <!-- 모달창 -->
				                            <ul class="subMenu">
				                                <li class="delete" onclick="deleteLike('${item.contentid}')"><span>삭제</span></li>
				                            </ul>
				                         </li>
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
                        <a class="rightList rightList_click" href="${pageContext.request.contextPath}/mypagelike.do">좋아요</a>
                    </li>
                    <li>
                        <a class="rightList" href="${pageContext.request.contextPath}/mypagecourse.do">코스</a>
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
		
		
		
		
    </section>
    
    
    <footer><%@ include file="footer.jsp" %></footer>
    
    
    
    
    
    <!-- 지도 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4fc029ee2d2a91a9e32e696683e2d3fb"></script>
	<script>
	
		// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
		let latlng = ${likeListjson};
		var linePath = [];
		for(let i=0; i<latlng.length; i++){
			var item = new kakao.maps.LatLng(latlng[i].mapy, latlng[i].mapx);
			linePath.push(item);
		}
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng('36.5', '127.6'), // 지도의 중심좌표
	        level: 13 // 지도의 확대 레벨
	    };  
	
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		
		
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
		    var content = "<div class=\"customoverlay\">"
				        + "  <a onclick=\"pageDetail('"+latlng[i].contenttypeid+"','"+latlng[i].cat2+"','"+latlng[i].contentid+"')\">"
				        + "    <span class=\"title\">"+latlng[i].title+"</span>"
				        + "  </a>" 
				        + "</div>";

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