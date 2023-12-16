<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Sans:wght@100&family=Orbit&display=swap"
    rel="stylesheet">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
  <!-- SWIPER 외부 라이브러리 연결-->
  <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
  <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />


  <style>
    * {
      margin: 0;
      padding: 0;
    }

    a {
      text-decoration: none;
      color: inherit;
    }

    section {
      position: relative;
    }

    .showbg1 {
      /* 연보라색 백그라운드 이미지 */
      height: 660px;
      width: 100%;
      background-color: rgb(206, 220, 255);
      z-index: -1;
    }

    .showbg2 {
      /* 흰색 백그라운드 이미지 */
      height: 240px;
      width: 100%;
      background-color: white;
      z-index: -1;
    }

    .showbg3 {
      /* 회색 백그라운드 이미지 */
      width: 100%;
      height: 580px;
      background-color: #f4f5f7;
      z-index: -1;
    }
    .showbg4{
    	height: 800px;
    }

    .sectionWrap {
      /*내용 들어가는 div*/
      position: absolute;
      margin-left: 25%;
      top: 130px;
      width: 985px;
      /*border: 1px solid gray;*/
    }

    .title {
      /*대한민국 구석구석 지역 정보 div*/
      margin: 100px 0px 0px 10px;
      width: 50%;
      height: 150px;
    }

    .title h2 {
      /*대한민국 구석구석 지역 정보 텍스트*/
      margin-top: 25px;
      font-weight: 800;
      font-size: 30px;
    }

    .title p {
      font-size: 28px;
      font-weight: 500;
    }

    .locationBox {
      /*지역 가장 큰 div*/
      position: relative;
      margin: 0 auto;
      display: flex;
      height: 50px;
    }

    .locationBtn {
      /*지역 버튼*/
      height: 35px;
      width: 50px;
      border: 1px solid transparent;
      border-radius: 30px;
      text-align: center;
      line-height: 35px;
      margin: 5px 10px;
      cursor: pointer;
    }

    .locationBtn.active {
      /*지역 버튼 클릭 후*/
      height: 35px;
      width: 60px;
      border: 1px solid transparent;
      background-color: #333;
      color: white;
      border-radius: 20px;
      text-align: center;
      line-height: 35px;
      margin: 5px 10px;
      font-weight: bold;
    }

    .locationSubBox {
      /*지역 버튼 클릭*/
      display: flex;
      position: relative;
      margin: 0 auto;
      height: 50px;
    }

    .locationLogoWrap {
      /*지역 로고 버튼 랩*/
      margin: 8px 0px 0px 10px;
      display: flex;
      width: 100%;
      height: 50px;
    }

    .locationLogoBox {
      /*지역 로고 박스*/
      margin-left: 10px;
      width: 50px;
      height: 50px;
    }

    .locationLogoIcon {
      /*지역 로고 아이콘*/
      width: 45px;
      height: 45px;
      border-radius: 30px;
      background-color: white;
      text-align: center;

    }

    .locationLogoIcon img {
      width: 40px;
      height: 40px;
      border-radius: 30px;
      margin-top: 2px;
    }

    .locationLogoName {
      /*지역 */
      height: 50px;
      line-height: 45px;
    }

    .locationLogoName strong {
      line-height: 1.5;
      font-size: 30px;
    }

    #locationnametop {
      line-height: 35px;
    }

    .swiperWrapper {
      /* 축제 행사 지역 싸고 있는 div */
      /*border: 1px solid darkgoldenrod;*/
      position: relative;
      margin: 15px 0px 0px 10px;
      display: flex;
      justify-content: space-between;
      height: 300px;
      width: 940px;
    }

    .swiperBox {
      /* 축제 행사 지역 박스 */
      width: 300px;
      height: 270px;
      border: 1px solid black;
      background-color: white;
      border-radius: 5px;
    }

    .swiperBox:hover {
      /* 축제 행사 지역 박스 마우스 올렸을 시 */
      border: 2px solid black !important;
    }

    .prefaceFlagBox {
      /* 축제 행사 지역 말풍선 박스*/
      position: relative;
      width: 300px;
      height: 60px;
    }

    .prefaceFlag {
      transform: translate(25px, 15px);
      position: absolute;
      width: 70px;
      height: 30px;
      border: 1px solid #333;
      background-color: #333;
      border-radius: 15px 13px 13px 0;
      color: white;
      letter-spacing: -2px;
      padding-left: 10px;
      padding-top: 5px;
      margin-top: 8px;
    }

    .swiperCommentBox {
      /* 축제 행사 지역 내용*/
      position: relative;
      width: 300px;
      height: 170px;
    }

    .swiperCommentBox strong {
      /* 축제 행사 지역 타이틀*/
      width: 255px;
      height: 35px;
      /*border: 1px solid black;*/
      position: absolute;
      text-overflow: ellipsis;
      overflow: hidden; /* 추가 */
  	  white-space: nowrap; /* 추가: 줄 바꿈 방지 */
      font-size: 22px;
      margin: 20px 25px;
    }

    .swiperCommentBox p {
      /* 축제 행사 지역 내용*/
      /*border: 1px solid black;*/
      width: 250px;
      height: 45px;
      position: absolute;
      font-size: 16px;
      margin: 70px 26px;
    }

    .swiperDetailBox {
      /* 자세히보기 박스 */
      position: relative;
      width: 300px;
      height: 35px;
    }

    .swiperDetailBox a {
      /* 자세히보기 박스 링크 */
      transform: translate(200px);
      position: absolute;
      color: gray;
    }

    .hotplaceTitle {
      /* 핫플 div */
      margin-top: 50px;
      width: 100%;
      height: 30px;
    }

    .hotplaceTitle h3 {
      /* 우리 지역 핫플이 궁금해? */
      font-size: 25px;
      margin-left: 6.5px;
    }

    .hotplaceDiv {
      /* 추천 여행지, 추천 맛집 div */
      width: 940px;
      margin-top: 35px;
    }

    .hotplaceNameDiv {
      /* OO 추천 여행지, 추천 이름 div */
      /*border: 1px solid black;*/
      display: flex;
      width: 940px;
      height: 50px;
    }
    
    
    .hotrestNameDiv {
      /* OO 추천 맛집, 추천 이름 div */
      /* border: 1px solid black; */
      display: flex;
      width: 940px;
      height: 50px;
    }
    

    .hotplaceName {
      /* OO -> 텍스트 넣는 div */
      height: 50px;
      margin-right: 10px;
      font-size: 15px;
      line-height: 40px;
    }

    .hotplaceName strong {
      /* OO 텍스트 */
      font-size: 22.5px;
      line-height: 50px;
    }

    #locationnamesub1 {
      /* OO 추천 여행지 박스 */
      font-size: 25px;
      line-height: 15px;
    }

    #locationnamesub2 {
      /* OO 추천 맛집 */
      font-size: 25px;
      line-height: 15px;
    }

    #locationnamesub3 {
      /* OO 축제·행사 어디까지 가봤니? 박스 */
      font-size: 25px;
      line-height: 15px;
    }

    .hotplaceDiv h4 {
      /* 추천 여행지, 추천 맛집 텍스트 */
      line-height: 2.3;
      width: 400px;
      font-size: 22px;
    }

    .recommendlocationWrap {
      /* 추천 여행지 감싼 div */
      /* 상, 우, 하, 좌로 굴러감*/
      display: unset;
      margin: 5px 0 15px 0;
      width: 980px;
      height: 220px;
      /*border: 1px solid darkorchid;*/
    }
    
    
   .recommendrestWrap {
      /* 추천 맛집 감싼 div */
      /* 상, 우, 하, 좌로 굴러감*/
      display: unset;
      margin: 5px 0 15px 0;
      width: 980px;
      height: 220px;
      /*border: 1px solid darkorchid;*/
    }

    .recommendWrapBox {
      /* 추천 여행지, 추천 맛집 각각 1개 박스 div */
      width: 220px;
      height: 220px;
      border: 1px solid gray;
      border-radius: 10px;
      margin-right: 10px; 
      float: left;
    }

    .recommendImg {
      /* 추천 여행지, 추천 맛집 이미지 div */
      width: 220px;
      height: 150px;
      border-radius: 10px 10px 0 0;
    }

    .recommendImg img {
      /* 추천 여행지, 추천 맛집 이미지 url */
      width: 220px;
      height: 150px;
      border-radius: 10px 10px 0 0;
    }

    .recommendDetail {
      /* 추천 여행지, 추천 맛집 이름과 설명 div */
      width: 220px;
      padding-top: 10px;
      height: 58px;
      background-color: white;
      border-radius: 0 0 10px 10px;
      text-align: center;
    }

    .recommendDetail strong {
      /* 추천 여행지, 추천 맛집 제목 */
      overflow: hidden;
      white-space: nowrap;
      text-overflow: ellipsis;
      /*border: 1px solid black;*/
      height: 25px;
      display: block;
      width: 220px;
      color: #333;
    }

    .recommendDetail p {
      /* 추천 여행지, 추천 맛집 지역 설명 */
      font-size: 13px;
      color: #666;
      margin-top: 3px;
    }

    .dateWrap {
      /* 축제·행사 어디까지 가봤니? 전체 감싸는 div */
      margin-top: 50px;
      /*border: 1px solid pink;*/
      width: 100%;
      height: 690px;
    }

    .Title {
      /* 핫플 div */
      margin-top: 50px;
      width: 100%;
      height: 30px;
      border: 1px solid darkorchid;
    }

    .FestivalNameDiv {
      /* OO 추천 여행지, 추천 이름 div */
      margin: 20px 0px 15px 0px;
      display: flex;
      width: 100%;
      /*border: 1px solid gold;*/
      height: 50px;
      padding-top: 40px;
    }

    .FestivalName {
      /* OO -> 텍스트 넣는 div */
      height: 50px;
      /*border: 1px solid slateblue;*/
      margin-right: 10px;
      line-height: 45px;
    }

    .FestivalName strong {
      font-size: 23px;
      line-height: 52px;
    }

    .FestivalDiv h4 {
      /* 추천 여행지, 추천 맛집 텍스트 */
      line-height: 2.3;
      width: 400px;
      font-size: 22px;
    }

    .FestivalDateDiv {
      /* 추천 여행지, 추천 맛집 텍스트 */
      margin-top: 20px;
      margin-bottom: 15px;
      width: 100%;
      /*border: 1px solid gray;*/
      height: 120px;
    }


    .DateLine {
      /* Date 라인 */
      width: 940px;
      border: 1px solid #f0f0f0;
      height: 0px;
    }

    .Line1 {
      margin-top: 15px;
    }


    .DateBox {
      /* Date 감싼 div 박스 */
      width: 940px;
      height: 80px;
    }


    .DateDivWrap {
      width: 880px;
      height: 80px;
    }

    .DateDiv {
      /* Date 감싼 제일 큰 div 박스 */
      margin-left: 10px;
      width: 960px;
      /*border: 1px solid red;*/
      height: 80px;
      display: flex;
    }

    .DateBtnDiv {
      margin-left: 10px;
      width: 15px;
      height: 80px;
      /*border: 1px solid saddlebrown;*/
    }

    .DateBtnDiv img {
      margin-left: 2px;
      width: 10px;
      height: 18px;
      margin-top: 30px;
    }

    .DateSelectDiv {
      margin-left: 10px;
      width: 890px;
      height: 80px;
      /*border: 1px solid darkgreen;*/
      display: flex;
      justify-content: space-between;
    }

    .DateNum {
      /*날짜 숫자 감싸는 div*/
      width: 40px;
      height: 40px;
      /*border: 1px solid red;*/
      border-radius: 10px 10px 0 0;
      text-align: center;
      line-height: 40px;
    }

    .DateNum p {
      font-size: 16px;
    }

    .DateDayWeek {
      /*요일 감싸는 div*/
      width: 40px;
      height: 35px;
      /*border: 1px solid blue;*/
      border-radius: 0 0 10px 10px;
      text-align: center;
      line-height: 35px;
    }


    .DateDayWeek p {
      font-size: 16px;
    }

    .DateEachCircle {
      width: 40px;
      height: 80px;
      border: 1px solid black;
      border-radius: 10px;
    }

    .DateEachCircle:hover {
      width: 40px;
      height: 80px;
      background-color: lightgray;
      opacity: 60;
      border-radius: 10px;
    }


    .DateEachCircle:nth-child {
      line-height: 30px;
    }



    #datepicker {
      /* 달력 감싸는 div */
      width: 35px;
      height: 70px;
      /*border: 1px solid darkgoldenrod;*/
      text-align: center;
      line-height: 90px;
    }



    .PosterBigWrap {
      /* 포스터 전체 div */
      margin: 15px 0px 0px 10px;
      position: absolute;
      width: 945px;
      height: 520px;
      /*border: 1px solid black;*/
    }


    .DirectBtnWrap {
      /* 바로가기 버튼 랩 div */
      width: 940px;
      height: 70px;
      /*border: 1px solid darkolivegreen;*/
    }


    .DirectBtn {
      margin: 0 auto;
      width: 280px;
      height: 45px;
      border: 1px solid #333;
      border-radius: 30px;
      margin-top: 35px;
      text-align: center;
      font-size: 16px;
      line-height: 45px;
    }


    .swiper-container {
        display: flex; /* Flexbox 컨테이너로 설정 */
        width: 880px;
        height: 500px;
        /*border: 1px solid black;*/
        overflow: hidden;
        margin: 0 auto;
    }



    .swiper-slide {
        /* 포스터 감싸는 개별 박스 */
        margin-right: 25px;
        position: relative;
        width: 275px;
        height: 500px;
        /*border: 1px solid springgreen;*/
        text-align: center;
        overflow: hidden;
        /* background-position: center;
        background-size: 275px 500px;
        background-size: cover; */
      }


    .swiper-button-prev {
      /* 이전 버튼 */
      margin-left: -10px;
      width: 30px;
      height: 30px;
      background: url(https://korean.visitkorea.or.kr/resources/images/main/btn_slide02.png) no-repeat;
    }



    .swiper-button-next {
      /* 이후 버튼 */
      margin-right: -10px;
      width: 30px;
      height: 30px;
      background: url(https://korean.visitkorea.or.kr/resources/images/main/btn_slide03.png) no-repeat;
    }


    .swiper-button-next::after,
    .swiper-button-prev::after {
      display: none;
    }



    .swiper-slide .PosterInnerBox {
      /* 이미지 슬라이드 상세 내용 div */
      margin-top: 30px;
      position: absolute;
      width: 100%;
      height: 100px;
      color: white;
    }


    .swiper-slide .PosterInnerBox strong {
      /* 이미지 슬라이드 상세 제목 */
      display: inline-block;
      width: 275px;
      height: 26px;
      font-size: 23px;
      margin-top: 10px;
      /*border: 1px solid orange;*/
      white-space: nowrap; /* 추가: 텍스트가 한 줄에서만 나오도록 설정 */
  	  overflow: hidden; /* 추가: 넘치는 텍스트를 감추도록 설정 */
      text-overflow: ellipsis;
    }


	.swiper-slide .PosterInnerBox span{
		margin-top: 20px;
	}


    .PosterInnerBox {
      /* 포스터 호버시 나타나는 박스 */
      position: absolute;
      width: 100%;
      height: 250px;
    }


    .swiper-slide .PosterInnerBox {
      /* 포스터 감싸는 개별 박스 호버 시 나타나는 이미지 */
      background-color: black;
      width: 100%;
      height: 250px;
      bottom: -250px;
      opacity: 0.7;
      transition: .5s;
      color: white;
    }


    .swiper-slide:hover .PosterInnerBox {
      /* 이미지 슬라이드 올라오기 */
      bottom: 0;
    }


    .PosterInnerDirectDiv {
      /* 바로가기 버튼 감싼 div */
      position: absolute;
      top: 130px;
      width: 100%;
      height: 100px;
    }


    .PosterDirectBtn {
      /* 바로가기 버튼 div */
      margin: 0 auto;
      margin-top: 15px;
      line-height: 60px;
      width: 60px;
      height: 60px;
      border: 1px solid white;
      border-radius: 50%;
      color: white;
      font-size: 13px;
    }


    .PosterInnerDirectDiv a {
      /* a 링크 밑줄 없애기 */
      text-decoration-line: none;
    }


    .scrollbarBigWrap {
      /* 로딩바, 스와이퍼 스크롤바를 감싼 큰 랩  */
      position: absolute;
      width: 880px;
      height: 15px;
      /*border: 1px solid black;*/
      margin-left: 30px;
    }


    .scrollbarWrap {
      /* 로딩바, 스와이퍼 스크롤바를 감싼 랩  */
      position: absolute;
      width: 750px;
      height: 15px;
      margin-top: 2.5px;
      /*border: 1px solid pink;*/
    }


    .loading-bar {
      /* 기본 로딩바 */
      width: 100%;
      height: 5px;
      background-color: lightgray;
      border-radius: 5px;
      overflow: hidden;
      position: absolute;
      bottom: 0;
    }

    .progress-bar {
      /* 스와이퍼 스크롤바 */
      width: 0;
      height: 5px;
      background-color: #666;
      border-radius: 3px;
      transition: width 0.3s ease-in-out;
    }


    .slidedisplay{
      /* 현재 슬라이드 표시  */
      margin-top: 4.5px;
      position: absolute;
      text-align: center;
      right: 0px;
      width: 100px;
      height: 15px;
      /*border: 1px solid darkorange;*/
    }


    .slidedisplay span{
      line-height: 14px;
      font-size: 18px;
    }


    .gj-datepicker-md [role=right-icon] {
      right: 7px;
      top: 30px;
    }


    .gj-textbox-md {
      border-bottom: none;
    }



    #totalSlide {
      color: #666 !important;
    }



  </style>

</head>

<body>

	<header><%@ include file="header.jsp" %></header>	
  <section>

    <div class="showbg1">



    </div>


    <div class="showbg2">


    </div>


    <div class="showbg3">


    </div>
    
    <div class="showbg4">


    </div>


    <div class="sectionWrap"> <!-- bigwrap 안에 내용 넣기 div -->



      <div class="title">
        <h2>대한민국 구석구석 지역 정보</h2>
        <p>어디까지 알고 있니?</p>
      </div>



      <div class="locationBox">


        <div class="locationBtn active" onclick="locationclick(event, 0)">서울</div>
        <div class="locationBtn" onclick="locationclick(event, 1)">부산</div>
        <div class="locationBtn" onclick="locationclick(event, 2)">대구</div>
        <div class="locationBtn" onclick="locationclick(event, 3)">인천</div>
        <div class="locationBtn" onclick="locationclick(event, 4)">광주</div>
        <div class="locationBtn" onclick="locationclick(event, 5)">대전</div>
        <div class="locationBtn" onclick="locationclick(event, 6)">울산</div>
        <div class="locationBtn" onclick="locationclick(event, 7)">세종</div>
        <div class="locationBtn" onclick="locationclick(event, 8)">경기</div>
        <div class="locationBtn" onclick="locationclick(event, 9)">강원</div>
        <div class="locationBtn" onclick="locationclick(event, 10)">충북</div>
        <div class="locationBtn" onclick="locationclick(event, 11)">충남</div>
        <div class="locationBtn" onclick="locationclick(event, 12)">전북</div>
        <div class="locationBtn" onclick="locationclick(event, 13)">전남</div>
        <div class="locationBtn" onclick="locationclick(event, 14)">경북</div>
        <div class="locationBtn" onclick="locationclick(event, 15)">경남</div>
        <div class="locationBtn" onclick="locationclick(event, 16)">제주</div>


      </div>



      <div class="locationSubBox"> <!-- 17개 지역 감싼 div -->


        <div class="locationLogoWrap">

          <div class="locationLogoBox">
            <div class="locationLogoIcon"><img id="locationLogoImg"
                src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=57761821-2056-4a2c-849a-7c4d00c1c623" alt="">
            </div>
          </div>


          <div class="locationLogoName" id="locationnametop"><strong>서울</strong></div>


        </div>


      </div>


      <div class="swiperWrapper"> <!-- 축제 공연행사 지역 내용 감싼 div -->

        <div class="swiperBox">
          <div class="prefaceFlagBox">
            <div class="prefaceFlag">지역명소</div>
          </div>
          <div class="swiperCommentBox" id="tourarea">
            <strong>${tour.title}</strong>
            <p>${tour.overview}</p>
          </div>
          <div class="swiperDetailBox">
            <a href="">자세히보기</a>
          </div>
        </div>



        <div class="swiperBox">
          <div class="prefaceFlagBox">
            <div class="prefaceFlag">체험여행</div>
          </div>
          <div class="swiperCommentBox" id="culturalarea">
            <strong>${cultural.title}</strong>
            <p>${cultural.overview}</p>
          </div>
          <div class="swiperDetailBox">
            <a href="">자세히보기</a>
          </div>
        </div>


        <div class="swiperBox">
          <div class="prefaceFlagBox">
            <div class="prefaceFlag">문화공간</div>
          </div>
          <div class="swiperCommentBox" id="attractionarea">
            <strong>${attraction.title}</strong>
            <p>${attraction.overview}</p>
          </div>
          <div class="swiperDetailBox">
            <a href="">자세히보기</a>
          </div>
        </div>

     
      </div>


      <div class="hotplaceTitle"> <!-- 시군구 홈페이지 div -->
        <h3>우리 지역 핫플이 궁금해?</h3>
      </div>



      <div class="hotplaceDiv"> <!-- 우리 지역 추천 여행지, 추천 맛집 감싼 div -->



        <div class="hotplaceNameDiv">
          <div class="hotplaceName" id="locationnamesub1"><strong>서울</strong></div>
          <h4>추천 여행지</h4>
        </div>

        <div class="recommendlocationWrap">
			<!-- 추천 지역  -->
       
		</div>
        

        <div class="hotrestNameDiv">
          <div class="hotplaceName" id="locationnamesub2"><strong>서울</strong></div>
          <h4>추천 맛집</h4>
        </div>


        <div class="recommendrestWrap">
			
			<!-- 추천 맛집  -->


        </div>



        <div class="dateWrap">


          <div class="FestivalNameDiv">
            <div class="FestivalName" id="locationnamesub3"><strong>서울</strong></div>
            <h4>축제·행사 어디까지 가봤니?</h4>
          </div>


          <div class="DateDivWrap">


            <div class="DateDiv">


              <div class="DateBtnDiv" onclick="prevDate()"><img
                  src="https://cdn.visitkorea.or.kr/resources/images/submain/btn_calendar_prev.png" alt=""></div>


			<c:forEach var="item" begin="1" end="14" step="1">
			
              <div class="DateSelectDiv">

                <div class="DateEachCircle">
                  <div class="DateNum">
                  </div>
                  <div class="DateDayWeek">
                  </div>
                </div>

              </div>
              
			</c:forEach>

              <div class="DateBtnDiv" onclick="nextDate()"><img
                  src="https://cdn.visitkorea.or.kr/resources/images/submain/btn_calendar_next.png" alt=""></div>
              <div id="datepicker"></div>
            
            </div>







            <div class="PosterBigWrap">


              <div class="swiper-container">

                <div class="swiper-button-prev" onclick="prevProgress()"></div>


                <div class="swiper-wrapper">
                  <!-- 추가적인 슬라이드 -->
                  
                  
                 
                    

                </div>


              </div>
              
              
              <div class="swiper-button-next" onclick="updateProgressBar()"></div>

            <!-- 스크롤바랩 감싸기 -->
            <div class="scrollbarBigWrap">
                
            <div class="scrollbarWrap">
              <div class="loading-bar">
                <div class="progress-bar" id="progressBar"></div>
                </div>
              </div>

            <div class="slidedisplay">
                <span id="currentSlide"></span>
                <span id="totalSlide"></span>
                </div>

            </div>


	        <div class="DirectBtnWrap">
	          <a href="">
	            <div class="DirectBtn"><strong>축제·행사달력</strong> 바로가기 <img
	                src="https://cdn.visitkorea.or.kr/resources/images/submain/btn_shortcut.png" alt=""></div>
	          </a>
	        </div>



            </div>


            <!-- 여기까지 복사 완료 -->

            <div class="PosterBtnWrap">
              <div class="PosterNextBtn" onclick="updateProgressBar()"> <!-- 포스터 다음 버튼 -->

              </div>
            </div>


          </div>


        </div>


      </div>



    </div>





  </section>

	<footer><%@ include file="footer.jsp" %></footer>
</body>


<script>


	window.addEventListener("load", function(){
			  
			  ajaxData("서울특별시") ;
			  
	});
	
	
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

 
	
	
    // 초기 날짜를 설정
    let currentDate = new Date();


    // 오늘 일자 불러오기
    let today = currentDate.getDate();
    console.log(today);


    //현재 1, 2, 3월... 불러오기
    let month = currentDate.getMonth() + 1;
    console.log(month);


    //date객체의 오늘 요일 구하기, (월요일 뜸)
    let weekday = ['일', '월', '화', '수', '목', '금', '토'];
    console.log(weekday[currentDate.getDay()]);


    // 3개월까지의 날짜 노출시키기 위한 총 변수 횟수
    let nextcnt=0;
    let prevcnt=0;



    document.querySelectorAll('.DateEachCircle').forEach(function (element) {


            element.querySelector('.DateNum').innerHTML = '<p>' + currentDate.getDate() +'</p>';
            element.querySelector('.DateDayWeek').innerHTML = '<p>' + weekday[currentDate.getDay()] + '</p>';


            currentDate.setDate(currentDate.getDate() + 1);
            
    });




    function nextDate() {

        //이전에 표시된 일자, 요일 정보 지우기
        document.querySelector('.DateNum').innerHTML = '';
        document.querySelector('.DateDayWeek').innerHTML = '';

            document.querySelectorAll('.DateEachCircle').forEach(function (element) {

            element.querySelector('.DateNum').innerHTML = '<p>' + currentDate.getDate() +'</p>';
            element.querySelector('.DateDayWeek').innerHTML = '<p>' + weekday[currentDate.getDay()] + '</p>';

            currentDate.setDate(currentDate.getDate() + 1);

            });

    }


    function prevDate() {

        //이전에 표시된 날짜 정보 -28 하기
        currentDate.setDate(currentDate.getDate() - 28);


        document.querySelector('.DateNum').innerHTML = '';
        document.querySelector('.DateDayWeek').innerHTML = '';


        document.querySelectorAll('.DateEachCircle').forEach(function (element) {

            element.querySelector('.DateNum').innerHTML = '<p>' + currentDate.getDate() +'</p>';
            element.querySelector('.DateDayWeek').innerHTML = '<p>' + weekday[currentDate.getDay()] + '</p>';

            currentDate.setDate(currentDate.getDate() + 1);

        });

    }

  
    
 /*

    let imgCnt =  6;  //6 총 이미지수 
   // alert( imgCnt);
    let realIndex =  3; // 버튼이 클릭되면 1씩 증가하는 변수
   
    // 계산 
    let slideCnt  = imgCnt- 3 +1 ;     //  6-3+1 ,  프로그래스바에 적용될 %값을 위한 슬라이드 변화 개수 
    let progress =  (10 / slideCnt)*10 ;
    let progresstot= progress ;
    
    //alert( realIndex);
    //alert( imgCnt);
    //alert( slideCnt);
    //alert( progress);
    
          
    
    //console.log(realIndex);    ㄴ   
    document.getElementById('currentSlide').innerHTML = realIndex;
    document.getElementById('totalSlide').innerHTML =  ' / ' + imgCnt;

    
    //로드된 기본 화면에서의 기본 슬라이드 갯수 + 총 슬라이드 갯수
    progressBar.style.width = progresstot + "%";
     



  //클릭 시 프로그래스 바 업데이트됨
  function updateProgressBar() {

    realIndex++;  //4

    
    progresstot += progress;    // 25
    //alert(progresstot );
    let progressBar = document.getElementById('progressBar'); 
    progressBar.style.width = progresstot +'%';


    document.getElementById('currentSlide').innerHTML = realIndex + ' / ';
    document.getElementById('totalSlide').innerHTML =  imgCnt;

  }


 


  function prevProgress() {
        realIndex--;
        progresstot -= progress; 

        // 로드된 기본 화면에서의 기본 슬라이드 갯수 + 총 슬라이드 갯수
        let progressBar = document.getElementById('progressBar');
        progressBar.style.width = progresstot + '%';

        document.getElementById('currentSlide').innerHTML = realIndex + ' / ';
        document.getElementById('totalSlide').innerHTML = imgCnt;
    }

 

*/

    $(function () {
          $("#datepicker").datepicker();
       
          
    });

	

	let posterImgLength = document.getElementById('posterImg').getAttribute('src').length;
	console.log(posterImgLength);
	
	


	function ajaxData(  index){
		
		$.ajax( {
			 type:"get",
			 url: "/tour/locationpageD?area="+index,
			 success: function ( data){
				 console.log( data);
				 displayData(data);
				 
			 }		 
		})
	}


	function displayData ( name){		/*지역명소, 체험여행, 문화공간 title*/
		 console.log( name);	
		 
		
		 //지역명소
		 let tourarea  ='';
		 let culturalarea ='';
		 let attractionarea ='';
		 
		if(name.tour.overview != null){
			tourarea  = '<div class="swiperCommentBox"> <strong>' + name.tour.title + '</strong> <p>' + name.tour.overview + '</p></div>';
			culturalarea = '<div class="swiperCommentBox"> <strong>' + name.cultural.title + '</strong> <p>' + name.cultural.overview + '</p> </div>';
			attractionarea = '<div class="swiperCommentBox"> <strong>' + name.attraction.title + '</strong> <p>' + name.attraction.overview + '</p> </div>';
		}else{
			tourarea  = '<div class="swiperCommentBox"> <strong>' + name.tour.title + '</strong>';
			culturalarea = '<div class="swiperCommentBox"> <strong>' + name.cultural.title + '</strong></div>';
			attractionarea = '<div class="swiperCommentBox"> <strong>' + name.attraction.title + '</strong></div>';
		}
		 
		$("#tourarea").html( tourarea);	
		$("#culturalarea").html( culturalarea);	
		$("#attractionarea").html( attractionarea);
		
		
		// 여행지 
		
		let result  = toHtml( name);
		 $(".recommendlocationWrap").html(   result );
		 
		// 맛집
		
		let result1 = toHtml1( name);
		 $(".recommendrestWrap").html( result1);
		
		//alert("result1" + result1); 맛집 데이터 들어왔는지
		
		
		// 포스터
		let result2 = toHtml2 (name);
		$(".swiper-wrapper").html( result2);
		
		 
	}


  function toHtml( sight){		/* 추천 관광지 */
	  //console.log("kkkkkkkk"+ sight );
	  
	  let sights = sight.sights;
	  
	  //console.log( sights.length);
	  let result ="";
	  
	  for( let i=0 ; i< sights.length ; i++){
		  
		  let  recommend  = sights[i];
		  
		  result  += '<div class="recommendlocationWrap">';
		  result  += ' <div class="recommendWrapBox" onclick="pageDetail(\''+recommend.contenttypeid+'\',\''+recommend.cat2+'\',\''+ recommend.contentid+'\')"> ';
		  result  += ' <div class="recommendImg"> <img src="' + recommend.sights  + '" alt=""></div> ';
          result  += '  <div class="recommendDetail"> ';
          result  += '  <strong>' + recommend.title + '</strong>';
          result  += ' <p>' + recommend.address + '</p> </div>  </div>';
          result  += '</div>'
	  
	  }

	   //alert( result);
	  
	  return result;
  }
  
  
  
	  function toHtml1 ( name) {		/* 추천 맛집 */
		  
		  
		  let restaurant = name.restaurant;
		  //console.log( restaurant.length);
		  let result = "";
		  
		  for(let i=0; i < restaurant.length; i++) {
			  
			  let  recommend  = restaurant[i];
			  
			  result  += '<div class="recommendrestWrap">';
			  result  += ' <div class="recommendWrapBox" onclick="pageDetail(\''+recommend.contenttypeid+'\',\''+recommend.cat2+'\',\''+ recommend.contentid+'\')"> ';
			  result  += ' <div class="recommendImg"> <img src="' + recommend.restaurant  + '" alt=""></div> ';
	          result  += '  <div class="recommendDetail"> ';
	          result  += '  <strong>' + recommend.title + '</strong>';
	          result  += ' <p>' + recommend.address + '</p> </div>  </div>';
	          result  += '</div>'
  
		  }
		  
		  //alert(result);
		  return result;
		  
	  }
	  
	  
	  
	  function toHtml2 (name) {		/* 포스터 */
		  
		  let poster =  name.poster;
		  console.log( poster.length);	/* 키값을 가지고 옴 */
		  
		  let result = "";
		  
		  for(let i=0; i < poster.length; i++) {
			  
			  let festival = poster[i];
			  
			  result += '<div class="swiper-slide">';
			  result += '<img id="posterImg" src="' + festival.firstimage  + '" alt="">';
			  result += '<div class="PosterInnerBox">';
			  result += '<strong>' + festival.title + '</strong>';
			  result += '<br>';
			  result += '<span>' + festival.address + '</span>';
			  result += '<br>';
			  result += '<em>' + festival.eventstartdate + '~' + festival.eventenddate + '</em>';
			  
			  
			  result += '<div class="PosterInnerDirectDiv">';
			  result += '<a href="">';
			  result += '<div class="PosterDirectBtn"> 바로가기 </div>';
		  	  result += '</a>';
		  	  result += '</div>';
		  	  
		  	  result += '</div>';
		  	  result += '</div>'
		  }
		  
		  //alert(result);
		  return result;
		  
	  }
	  
	  

  function locationclick(event, i) {
	  
        let btns = document.querySelectorAll(".locationBtn");

        btns.forEach(function (btn, i) {
          if (event.currentTarget == btn) {
            btn.classList.add("active");
          } else {
            btn.classList.remove("active");
          }
        });


        let nametop = ['서울특별시', '부산', '대구', '인천', '광주', '대전', '울산', '세종시', '경기도',
          '강원특별자치도', '충청북도', '충청남도', '전라북도', '전라남도', '경상북도', '경상남도',
          '제주도'];


        let namesub = ['서울', '부산', '대구', '인천', '광주', '대전', '울산', '세종', '경기',
          '강원', '충북', '충남', '전북', '전남', '경북', '경남',
          '제주'];
        
        
        let areas = [
            { name: "서울특별시", action: function() { window.location.href = "http://localhost:8090/tour/locationpage?area=서울특별시"; } },
            { name: "부산광역시", action: function() { ajaxData("부산광역시"); } }, ////window.location.href = "http://localhost:8090/location/locationpage?area=부산광역시"; //ajaxData("부산광역시");  }
            { name: "대구광역시", action: function() { ajaxData("대구광역시"); } },
            { name: "인천광역시", action: function() { ajaxData("인천광역시"); } },
            { name: "광주광역시", action: function() { ajaxData("광주광역시"); } },
            { name: "대전광역시", action: function() { ajaxData("대전광역시"); } },
            { name: "울산광역시", action: function() { ajaxData("울산광역시"); } },
            { name: "세종특별자치시", action: function() { ajaxData("세종특별자치시"); } },
            { name: "경기도", action: function() { ajaxData("경기도"); } },
            { name: "강원도", action: function() { ajaxData("강원특별자치도"); } },
            { name: "충청북도", action: function() { ajaxData("충청북도"); } },
            { name: "충청남도", action: function() { ajaxData("충청남도"); } },
            { name: "전라북도", action: function() {  ajaxData("전라북도"); } },
            { name: "전라남도", action: function() { ajaxData("전라남도"); } },
            { name: "경상북도", action: function() { ajaxData("경상북도"); } },
            { name: "경상남도", action: function() { ajaxData("경상남도"); } },
            { name: "제주특별자치도", action: function() { ajaxData("제주특별자치도"); } },
          ];

        
		areas[i].action();
		
        
        let IconImg = ["https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=57761821-2056-4a2c-849a-7c4d00c1c623",
          "https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=2e2c353e-d6ad-4bcd-871a-44bfed7eec5d",
          "https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=57695e09-a09e-45dc-9470-e3a7662b06d2",
          "https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=658e7901-671d-4e1f-8681-6d2d2d80e8ac",
          "https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=2472b57b-f046-4b1e-91d0-e9bfe9b8d186",
          "https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=1a20fbd3-fa3c-4e0c-a038-c2407837cf96",
          "https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=3618dff8-eee8-42f9-8e27-dd9dd224b7e8",
          "https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=6763a465-9e10-4084-8e4f-3f27f7d4c1e3",
          "https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=250bcbcb-2d07-4428-9feb-3ff45dff87d6",
          "https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=e9002f25-cd2c-4a9c-be7f-846d3f5d6d0a",
          "https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=82c445a6-3916-4f90-b861-b2d86339e5f5",
          "https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=71a09fad-7d9c-4ad0-91bb-ae0d12c8a534",
          "https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=12683218-ee21-486a-a0b7-eaa60756eda8",
          "https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=6eb8a831-28ef-4308-94e9-b1fef946ee6d",
          "https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=a72584fc-a423-4c50-9a5a-5521391fc16b",
          "https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=64dad790-011f-41cc-9a41-051425cf5bdf",
          "https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=4f1f8482-2e95-491e-946d-4ebd372b483c"];

        
        //해당 지역의 정보를 받아와서 변수에 설정
        
        let selectNametop = areas[i].name;
        let selectIconImg = IconImg[i];
        
        
        
        // 기타 DOM 요소 변경
        document.querySelector("#locationnametop").innerHTML = "<font size = 15px> <strong>" + selectNametop + "</strong> </font>";
        document.querySelector("#locationnamesub1").innerHTML = "<font size = 12px> <strong>" + namesub[i] + "</strong> </font>";
        document.querySelector("#locationnamesub2").innerHTML = "<font size = 12px> <strong>" + namesub[i] + "</strong> </font>";
        document.querySelector("#locationnamesub3").innerHTML = "<font size = 12px> <strong>" + namesub[i] + "</strong> </font>";

  
        document.getElementById("locationLogoImg").src = selectIconImg;

        
      }
      
      
  	var swiper = new Swiper('.swiper-container', { /* 이미지 슬라이드 */
		slidesPerView: 3,
		spaceBetween: 10,
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		}
	});

      
  	
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


</html>