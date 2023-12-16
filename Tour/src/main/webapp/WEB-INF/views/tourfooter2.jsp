<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<link href="${path}/resources/css/tourfooter2.css" rel="stylesheet" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<footer>
		<div class="SYJfooterNotice">
			<div class="innerBox">
				<div class="NoticeSlideWrap">
					<ul class="newsList">						 
					  <li id="courselist"><a></a></li>						  
					</ul>
				</div>
				<div class="footerPlaywrap">
					<button type="button" class="footerPlaybtn" onclick="startSlide()">재생</button>
					<button type="button" class="footerStopbtn" onclick="stopSlide()">정지</button>
				</div>
				<button type="button" class="btnPre">이전</button>
				<button type="button" class="btnNex">다음</button>
				<a href="https://korean.visitkorea.or.kr/notice/news_list.do"
					class="footerPlus"> <span class="more">더보기</span>
				</a>
				<div class="selBox">
					<div class="selmember">
					<select>
					<option value="">관광정보</option>
					<option value="">가이드북</option>
					<option value="">베니키아</option>
					<option value="">고캠핑</option>
					</select>
					<a href="#">이동</a>
					</div>
					<div class="selmember" id="link">
					<select>
					<option value="">유관기관</option>
					<option value="">외교통상부 해외 안전여행</option>
					<option value="">대한민국의 아름다운영토 독도</option>
					<option value="">박물관 길위의 인문학</option>
					</select>
					<a href="#">이동</a>
					</div>
				</div>
			</div>

		</div>
		 
	</footer>
	 <script src="${path}/resources/js/tourfooter2.js"></script> 
	
	<script type="text/javascript">
		
	$(document).ready(function(){
		
		$.ajax({
	  		 type: "GET",
	         url: "/tourAlist/selectedC",
	         success: function(selectedSpots) {
	        	 console.log( selectedSpots );
          	   //showCheckedList(selectedSpots);
          	  
	        	 //let title = selectedSpots[0].title;
	        	 //alert(title);
	        	 
	        	 let title = "";
	        	 $.each(selectedSpots,function(index,Cspot){
	        		 console.log(Cspot.title);
	        		 title += "<li id='courselist'>"+"<a>" + Cspot.title + "</a>"+"</li>";	
	        	 });
	        	 
	        	 //title  ="<li>" + title + "</li>";	        	 
	        	 $(".newsList").append(title); // .innerHTML
	        	 
            },
            error: function(err) {
                console.log(err);
            }
		});
		
		
	});
	
	
	</script>
	
</body>
</html>