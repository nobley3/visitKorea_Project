<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TourKorea</title>
<style>
	* {
		margin: 0;
		padding: 0;
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
	
	section {
		padding-top: 130px;
		position: relative; 
	}
	
	/* 전체 공간 */
	.mypagewrap {
		margin: 0 auto;
		width: 940px;
	}
	
	/* 마이페이지 메인 링크 */
	.mypageTitle {
		position: relative;
		padding-right: 20px;
	}
	
	.mypageTag {
		display: flex;
		color: #666666;
		width: 135px;
		height: 40px;
	}
	
	.mypageTag img {
		width: 30px;
		height: 28px;
		padding-right: 5px;
	}
	
	.mypageTag h4 {
		font-size: 20px;
		letter-spacing: -1px;
		line-height: 45px;
	}
	
	/* 여행톡 */
	.mypageTitle h2 {
		overflow: hidden;
		font-weight: 800;
		color: #333;
		font-size: 36px;
		letter-spacing: -1px;
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
	
	/* 댓글 / 답글 버튼 */
	.fav_btn {
		position: absolute;
		top: 13px;
		right: 0;
		color: #767676;
		background: none;
	}
	
	.reviewbtn {
		overflow: hidden;
		display: inline-block;
		font-size: 16px;
		line-height: 22px;
		color: #666666;
		border: none;
		background-color: transparent;
		cursor: pointer;
		background: none;
	}
	
	.reviewclick {
		color: #000;
		font-weight: 700;
	}
	
	.reviewbtn:first-child:after {
		content: "ㅣ";
		width: 1px; /* 세로선의 너비 */
		height: 100%; /* 버튼의 높이에 맞게 설정 */
		margin: 0 10px 0 13px;
		font-weight: 500;
		color: #666666;
	}
	
	/* 댓글,답글 리스트 */
	.reviewList {
		width: 600px;
		display: flex;
		flex-direction: row;
		border-bottom: 1px solid #e6e6e6;
		padding: 20px 0;
	}
	/* 이미지부분 */
	.picture {
		display: flex;
		flex-direction: row;
		justify-content: center;
		padding: 0 10px;
		cursor: pointer;
	}
	
	.picture div {
		position: relative;
		width: 50px;
		height: 50px;
	}
	
	.picture img {
		display: block;
	}
	
	.profileImg {
		width: 50px;
		height: 50px;
		border-radius: 100%;
	}
	
	.profileImg_social {
		width: 16px;
		height: 16px;
		border-radius: 100%;
		position: absolute;
		bottom: -2px;
		right: 0;
	}
	
	/* 텍스트 부분 */
	.txt_area {
		width: 488px;
		padding: 0 20px;
		position: relative;
	}
	
	.txt_area h3 {
		font-weight: bold;
		font-size: 20px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		cursor: pointer;
	}
	
	.txt_area h3:hover {
		text-decoration: underline;
	}
	
	.txt_area p {
		font-size: 16px;
		color: #333333;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		padding: 10px 0;
	}
	
	.date {
		color: #333;
		font-size: 14px;
		position: relative;
	}
	
	.nickName {
		display: inline-block;
		vertical-align: top;
		line-height: 20px;
		color: #333333;
		font-style: normal;
	}
	
	.nickName:after {
		content: "ㅣ";
		width: 1px; /* 세로선의 너비 */
		height: 100%; /* 버튼의 높이에 맞게 설정 */
		margin-left: 3px;
		font-weight: 500;
		color: #707070;
	}
	
	.date span {
		display: inline-block;
		vertical-align: top;
		line-height: 20px;
		color: #707070;
	}
	
	.more_btn {
		position: absolute;
		top: 0;
		right: 0;
		width: 20px;
		height: 20px;
		background:
			url(https://korean.visitkorea.or.kr/resources/images/sub/btn_dot2.png)
			0 0 no-repeat;
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
	
	.subMenu li {
		padding: 5px;
	}
	
	.delete {
		background:
			url(https://korean.visitkorea.or.kr/resources/images/sub/ico_sprite_pop.png)
			4% 58.8%/14% auto no-repeat;
		cursor: pointer;
	}
	
	.delete span {
		margin-left: 30px;
	}
	
	/* 페이징 */
	.page_grp {
		padding: 10px 0;
		text-align: center;
		display: flex;
		flex-direction: row;
		align-items: center;
		justify-content: center;
	}
	
	.page_num {
		border: 1px solid #13294b;
		width: 30px;
		height: 30px;
		margin: 0 5px;
		line-height: 30px;
		cursor: pointer;
	}
	
	.page_click {
		background-color: #13294b;
		color: #fff;
	}
	
	/* 오른쪽 메뉴바 */
	.rightBox {
		margin-left: 40px;
		width: 300px;
		height: 170px;
		background: #f7f7f7;
		padding: 10px 20px 30px 0;
	}
	
	.rightBox li {
		width: 100%;
		padding-top: 20px;
		font-size: 16px;
		font-weight: 800;
	}
	
	.rightList {
		display: block;
		padding-left: 20px;
		color: #666;
	}
	
	.rightList_click {
		background:
			url(https://korean.visitkorea.or.kr/resources/images/sub/ico_mypagemenu.png)
			0 0 no-repeat;
		background-size: 4px 100%;
		color: #333;
	}
	
	.rightList:hover {
		background:
			url(https://korean.visitkorea.or.kr/resources/images/sub/ico_mypagemenu.png)
			0 0 no-repeat;
		background-size: 4px 100%;
		color: #333;
	}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
		let subMenus = document.querySelectorAll(".subMenu");
		for(let i=0; i<subMenus.length; i++){
			subMenus[i].style.display = "none";
		}
		
		// 모달창 뒷 배경 없애기 
		document.getElementById("hidden_section").style.display = "none";
	}
	
	
	// 리뷰 삭제
	function deletereview(reviewcode){
		if(confirm("정말 삭제하시겠습니까?")){
			alert("삭제되었습니다.");
			$.ajax({
		 		type:"post" ,
		 		url: "${path}/deletemyreview",
		 		data: "reviewcode=" + reviewcode,
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
	
	// 댓글 답글 클릭 시 스타일 변화
	function reviewClick(obj, parentcode){
		let elements = document.querySelector(".reviewclick"); // 
		elements.classList.remove("reviewclick"); // 클래스 제거
		
		obj.classList.add('reviewclick'); // 선택된 요소에 클래스 추가
		
		currentPageList(1, parentcode);
	}
	
	
	// 현재 페이지 리스트 변화 ajax
	function currentPageList(currentPage, parentcode){
		
		$.ajax({
	 		type:"GET" ,
	 		url: "/tour/mypagereviewlist",
	 		data: "currentPage=" + currentPage +"&parentcode=" + parentcode,
	 		success : function( data){
	 			currentList(data ,parentcode);
	 			pageList(data, parentcode);
	 		},
	 		error: function(){
	 			alert( "error");
	 		}
	 	});	
	}
	
	// 현재 페이지 리스트 변화
	function currentList(data, parentcode){
		$("#reviewListBox").empty();
		
		let item = data.reviewlist;
		let paging = data.handler;
		let user = data.user;
		
		$(".smallBox strong span").empty();
		let str2 = item.length;
		$(".smallBox strong span").append(str2);
		
		let str="";
		if(item.length == 0 ){
			str += "<ul class=\"reviewList\">";
			if(parentcode == 0){
				str += "	<li class=\"txt_area\">등록된 댓글이 없습니다.</li>";
			}else{
				str += "	<li class=\"txt_area\">등록된 답글이 없습니다.</li>";
			}
			str += "</ul>";
		}else{
			for(let i = paging.startList-1; i< paging.endList; i++){
				str += "<ul class=\"reviewList\">";
				str += "	<li class=\"picture\" onclick=\"pageDetail('"+item[i].contenttypeid+"','"+item[i].cat2+"','"+item[i].contentid+"' )\">";
				str += "		<div>";
				str += "			<img class=\"profileImg\" src=\""+user.profileurl+"\">";
				if(user.section == '02'){
					str += "			<img class=\"profileImg_social\" src=\"https://korean.visitkorea.or.kr/resources/images/sub/ico_kakao.png\" alt=\"카카오\">";
				}
				str += "		</div>";
				str += "	</li>";
				str += "	<li class=\"txt_area\">";
				str += "		<h3  onclick=\"pageDetail('"+item[i].contenttypeid+"','"+item[i].cat2+"','"+item[i].contentid+"' )\">"+item[i].title+"</h3>";
				str += "		<p>"+item[i].content+"</p>";
				str += "		<button class=\"more_btn\" onclick=\"modalBtn(this)\"></button>";
				str += "		<div class=\"date\">";
				str += "			<em class=\"nickName\">"+user.nickname+"</em>";
				str += "			<span>"+item[i].writeday+"</span>";
				str += "		</div>";
				str += "		<ul class=\"subMenu\">";
				str += "			<li class=\"delete\" onclick=\"deletereview('"+item[i].reviewcode+"')\"><span>삭제</span></li>";
				str += "		</ul>";
				str += "	</li>";
				str += "</ul>";
			}
		}
		$("#reviewListBox").append(str);
	}
	
	// 현재 페이지 그룹 변화
	function pageList(data, parentcode){
		$("#page_grp").empty();
		let item = data.handler;
		let str="";
		
		if(item.currentGrp > 1){
			str += "<div class=\"page_num\" onclick=\"currentPageList("+(item.grpStartPage-1)+","+parentcode+")\"><<</div>";
		}
		for(let i = item.grpStartPage; i<= item.grpEndPage; i++){
			if(i == item.currentPage){
				str += "<div class=\"page_num page_click\" onclick=\"currentPageList("+i+","+parentcode+")\">"+i+"</div>";
			}else{
				str += "<div class=\"page_num\" onclick=\"currentPageList("+i+","+parentcode+")\">"+i+"</div>";
			}
		}
		if(item.currentGrp != item.lastGrp){
			str += "<div class=\"page_num\" onclick=\"currentPageList("+(item.grpEndPage+1)+","+parentcode+")\">>></div>";
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
	
</script>
</head>
<body>

	<header><%@ include file="header.jsp"%></header>

	<section>
		<div class="mypagewrap">
			<div class="mypageTitle">
				<a class="mypageTag"
					href="${pageContext.request.contextPath}/mypage.do"> <img
					src="https://korean.visitkorea.or.kr/resources/images/sub/ico_tit_list5.png">
					<h4>마이페이지</h4>
				</a>
				<h2>여행톡</h2>
			</div>

			<div class="viewClick">
				<div class="leftBox">
					<div class="smallBox">
						<strong>총<span>${reviewsize}</span>건</strong>
						<div class="fav_btn">
							<button class="reviewbtn reviewclick" id="comment" onclick="reviewClick(this, 0)">댓글</button>
							<button class="reviewbtn " id="reply" onclick="reviewClick(this, 1)">답글</button>
						</div>
					</div>

					<div id="reviewListBox">
						<c:choose>
							<c:when test="${reviewlist.size() == 0}">
								<ul class="reviewList">
									<li class="txt_area">등록된 댓글이 없습니다.</li>
								</ul>
							</c:when>
							<c:otherwise>
								<c:forEach var="item" items="${reviewlist }">
									<ul class="reviewList">
										<li class="picture" onclick="pageDetail('${item.contenttypeid}', '${item.cat2}', '${item.contentid}' )">
											<div>
												<img class="profileImg" src="${user.profileurl}">
												<c:if test="${user.section eq '02'}">
													<img class="profileImg_social"
														src="https://korean.visitkorea.or.kr/resources/images/sub/ico_kakao.png"
														alt="카카오">
												</c:if>
											</div>
										</li>
										<li class="txt_area">
											<h3 onclick="pageDetail('${item.contenttypeid}', '${item.cat2}', '${item.contentid}' )">${item.title }</h3>
											<p>${item.content }</p>
											<button class="more_btn" onclick="modalBtn(this)"></button>
											<div class="date">
												<em class="nickName">${user.nickname}</em> <span>${item.writeday }</span>
											</div> 
											
											<!-- 모달창 -->
											<ul class="subMenu">
												<li class="delete" onclick="deletereview('${item.reviewcode}')"><span>삭제</span></li>
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
						<c:forEach var="item" begin="${handler.grpStartPage}"
							end="${handler.grpEndPage}">
							<c:choose>
								<c:when test="${item == handler.grpStartPage}">
									<div class="page_num page_click"
										onclick="currentPageList(${item}, 0)">${item}</div>
								</c:when>
								<c:otherwise>
									<div class="page_num" onclick="currentPageList(${item}, 0)">${item}</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${handler.currentGrp != handler.lastGrp}">
							<div class="page_num"
								onclick="currentPageList(${handler.grpEndPage+1}, 0)">>></div>
						</c:if>
					</div>


				</div>


				<ul class="rightBox">
					<li><a class="rightList"
						href="${pageContext.request.contextPath}/mypagelike.do">좋아요</a></li>
					<li><a class="rightList"
						href="${pageContext.request.contextPath}/mypagecourse.do">코스</a></li>
					<li><a class="rightList rightList_click"
						href="${pageContext.request.contextPath}/mypagetalk.do">댓글</a></li>
					<li><a class="rightList"
						href="${pageContext.request.contextPath}/mypageQA.do">Q&A</a>
					</li>
				</ul>
			</div>
		</div>
		
		<!--  모달 윈도우 -->
		<div class="hidden_section" id="hidden_section" onclick="modalClose()"></div>
	</section>

	<footer><%@ include file="footer.jsp"%></footer>

</body>
</html>