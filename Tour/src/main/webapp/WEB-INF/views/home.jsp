<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>TourKorea</title>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/tourMainSection.css" rel="stylesheet"/> 
<link href="${path}/resources/css/mainSlide.css" rel="stylesheet"/> 
<script src="${path}/resources/javascript/common.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


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



$(document).ready(function() {
	  // 문서가 로드되면 실행되는 코드
	  if (navigator.geolocation) {
	    navigator.geolocation.getCurrentPosition(successCallback, errorCallback);
	  } else {
	    console.error("Geolocation is not supported by this browser.");
	  }
	});
	
	function successCallback(position) {
	  // 위치 정보를 성공적으로 가져왔을 때 실행되는 함수
	  const latitude = position.coords.latitude;
	  const longitude = position.coords.longitude;

	  $.ajax({
	 		type:"post" ,
	 		url: "/tour/homelocation",
	 		data: "latitude=" + latitude+"&longitude="+longitude,
	 		success : function( data){
	 		},
	 		error: function(){
	 			alert( "error");
	 		}
	 	});	
	}

	function errorCallback(error) {
	  // 위치 정보를 가져오는 데 실패했을 때 실행되는 함수
	  console.error("Error getting location:", error.message);
	}

</script>
</head>
<body>

	<header><%@ include file="header.jsp" %></header>
	
	
	<!-- 슬라이드전체 -->
  <div class="slideWrap">
    <!-- 텍스트전체 -->
    <div class="textBox">
      <div class="textsmallBox">
        <ul class="textList">
          <li>
            <div class="slideTitle">
              <em></em>
              <strong style="color:#3d3d3d"></strong>
              <a href="#">자세히 보기</a>
            </div>
            <!-- 텍스트추가 -->
          </li>
          
           
        </ul>
      </div>
    </div>

    <!-- 이미지 전체 -->
    <div class="imgBox">
      <div class="imgsmallBox">
        <div class="imgList">
          <div class="imgSlide" >
             
          </div> 
        </div>
      </div>
    </div>
    <!-- 페이지 전체 -->
    <div class="pagingBox">

      <div class="pagingBarBox">
        <span class="bar"></span>
      </div>

      <div class="pagingNum">
        <span class="firstNum">01</span>
        /
        <span class="secondNum"></span>
      </div>

      <div class="pagingBtn">
        <div class="btnpreNum" tabindex="0" role="button" aria-label="Previous slide">이전</div>
        <div class="btnnexNum" tabindex="0" role="button" aria-label="Next slide">다음</div>
        <div class="btnAuto">
            <button class="btnPlay">재생</button>
            <button class="btnStop">멈춤</button>
        </div>
      </div>
    </div>
  </div>
	
	
	<section>
	<!-- 섹션 -->
    <!-- 핫플콕콕 -->
    <div class="mainContentsBox">
        <div class="kokBox">
            <h2>
                <a href="">
                    "DaTa Lab 여행콕콕"
                    <span>빅데이터 기반 AI 추천 여행지 및 코스를 알려드려요.</span>
                </a>
            </h2>
            <div class="contentWrap">
                <ul class="tabBar">
                    <li class="menu1">
                        <a href="">
                            <span>핫플콕콕</span>
                        </a>
                    </li>
                    <li class="menu2">
                        <a href="">
                            <span>AI콕콕 플래너</span>
                        </a>
                    </li>
                </ul>
                <div class="menu1Contents">
                    <p>관광 빅데이터 정보로 분석한 지역별 핫한 여행지와 맛집을 소개합니다.</p>
                    <div class="areaBar">
                        <ul class="areaWrap">
                            <li>
                                <button type="button" class="allA">전국</button>
                            </li>
                            <li>
                                <button type="button">서울</button>
                            </li>
                            <li> <button type="button">인천</button></li>
                            <li> <button type="button">대전</button></li>
                            <li> <button type="button">대구</button></li>
                            <li> <button type="button">광주</button></li>
                            <li> <button type="button">부산</button></li>
                            <li> <button type="button">울산</button></li>
                            <li> <button type="button">세종</button></li>
                            <li> <button type="button">경기</button></li>
                            <li> <button type="button">강원</button></li>
                            <li> <button type="button">충북</button></li>
                            <li> <button type="button">충남</button></li>
                            <li> <button type="button">경북</button></li>
                            <li> <button type="button">경남</button></li>
                            <li> <button type="button">전북</button></li>
                            <li> <button type="button">전남</button></li>
                            <li> <button type="button">제주</button></li>
                        </ul>
                    </div>
                    <div class="hotPoto">
                        <ul>
                            <li>
                                <div>
                                    <a href="#">
                                        <div class="kokimgWrap"></div>
                                        <strong class="stitle"></strong>
                                    </a>
                                    <button type="button" class="likebtn" id="likebtn">좋아요</button>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <a href="#">
                                        <div class="kokimgWrap">

                                        </div>
                                        <strong></strong>
                                    </a>
                                    <button type="button" class="likebtn" id="likebtn">좋아요</button>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <a href="#">
                                        <div class="kokimgWrap">

                                        </div>
                                        <strong></strong>
                                    </a>
                                    <button type="button" class="likebtn" id="likebtn">좋아요</button>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <a href="#">
                                        <div class="kokimgWrap">

                                        </div>
                                        <strong></strong>
                                    </a>
                                    <button type="button" class="likebtn" id="likebtn">좋아요</button>
                                </div>
                            </li>
                        </ul>

                    </div>
                    <div class="recomBox">
                        <button type="button">
                            오늘의
                            <strong>핫플콕콕</strong>
                            추천
                        </button>
                        <a href="#">더보기</a>
                    </div>
                </div>
                
            </div>
        </div>
        <div class="eventContentsBox">
            <div class="eInnerBox">
                <div class="eLeftC">
                   <a href="#">
                    <img src="http://tong.visitkorea.or.kr/cms/resource/40/3035040_image2_1.jpg" alt="다양한 신상 여행지가 가득! 가볼래-터 11월호 ">
                   </a>
                </div>
                <div class="eRightC">
                    <a href="#" class="ecTitle">
                        오늘의 축제/공연/행사 소식
                        <span class="btnmore">더보기</span>
                    </a>
                    <ul class="eBoard">
                        <li >
                            <a href="#" title="가을 매력이 가득한 여행을 떠나요 로 이동">
                                <em class="boardtitle">찾아가고 싶은 가을섬</em>
                                가을 매력이 가득한 여행을 떠나요
                            </a>
                        </li>
                        <li>
                            <a href="#" title="맛보고 즐기고! 목포 렛츠겟잇 로 이동">
                                <em style="color: #f57373;">축제 |</em>
                                맛보고 즐기고! 목포 렛츠겟잇
                            </a>
                        </li>
                        <li>
                            <a href="#" title="‘2023 대한민국 숙박세일 페스타’ 로 이동">
                                <em style="color: #f57373;">공연ㅣ</em>
                                ‘2023 대한민국 숙박세일 페스타’ 
                            </a>
                        </li>
                        <li>
                            <a href="#" title="‘포레스티 캠페인’ 참여하세요! 로 이동">
                                <em style="color: #f57373;">행사ㅣ</em>
                                ‘포레스티 캠페인’ 참여하세요!
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
    
	
	</section>
	<footer><%@ include file="footer.jsp" %></footer>
	
	
	
	
	<script src="${path}/resources/javascript/toursection.js"></script>
	<script type="text/javascript">
  
  
  //let imgcnt=0;
  $(document).ready(function(){
	  
	  /*메인슬라이드 (축제/공연)*/
	  $.ajax({
          type: "GET",
          url: "/tour/selectedF",
          success: function(selectedSpots) {
        	 // console.log( "ㅇㄹㅇㄹㅇ" +selectedSpots);
             //let firstimage = selectedSpots[0].firstimage;
        	 //console.log(firstimage);
        	 
        	 let firstimage = "";
        	 let title ="";
        	 $.each(selectedSpots,function(index,Fspot){
        		 
        		 title +=  
        			 "<li>" + 
        			 "<div>" + 
        			 "<em>" + "대한민국구석구석" + "</em>" + 
        			 "<strong style='color:#3d3d3d'>" + Fspot.title + "</strong>"+ 
        			 "<a href='#'>자세히 보기</a>"+ 
        			 "</div>" + 
        			 "</li>";
        			 
        		 firstimage += 
        			    "<div  class='imgSlide'>" +
        			    "<a href='#'>" +
        			    "<img src='" + Fspot.firstimage + "' alt='Spot Image' style='margin-right: 0px'>" +
        			    "</a>" +
        			    "</div>";
        		 
        		 
        	 });
        	 
        	 $(".imgList").html(firstimage);
        	 $(".slideTitle").html(title);
        	 updateNumbers(1, selectedSpots.length);
        	 
        	 // 총 갤러리 이미지수 
        	 //imgcnt   = selectedSpots.length;
          },
          error: function(err) {
              console.log(err);
          }
           
      });
	  
	  //페이징넘버
	  function updateNumbers(current, total) {
		  document.querySelector('.firstNum').textContent = String(current).padStart(2, '0');
		  document.querySelector('.secondNum').textContent = String(total).padStart(2, '0');
		}
	  
	  
	  
	  
	  /*여행콕콕(여행지)*/
	  $.ajax({
		    type: "GET",
		    url: "/tour/selectedSpot",
		    success: function (selectedSpots) {
		        $.each(selectedSpots, function (index, spot) {
		            console.log(spot.firstimage);
		            // 이미지를 각 li 요소에 추가
		            let firstimage = "<div class='kokimgWrap' style='background-image: url(" + spot.firstimage + ")'><a href='#'><img src=''></a></div>";
		            let title = "<strong class='stitle'>"+spot.title+"</strong>"
		            $(".hotPoto ul li").eq(index).find(".kokimgWrap").html(firstimage+title);
		            
		        });
		    },
		    error: function (err) {
		        console.log(err);
		    }
		});
	  
  });
  </script>
</body>
</html>
