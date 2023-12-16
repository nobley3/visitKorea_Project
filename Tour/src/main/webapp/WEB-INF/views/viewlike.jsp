<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/resources/css/tourMainFooter.css" rel="stylesheet"/>  
<script src="${path}/resources/javascript/common.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Sans:wght@100&family=Orbit&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
  section{
	padding-top : 32px;

	}
  div{
    box-sizing: border-box;
  }
  *{
    margin: 0;
    padding: 0;
  }
  li{
    list-style: none;
  }
  .nj_swiper-slide{
    min-height: 700px;
    flex-shrink: 0;
    width: 100%;
    height: 100%;
    position: relative;
  }
  .nj_contents{
    width: auto;
    padding: 0 0 80px;
    margin: 0 auto;
  }
  .nj_cockcock_plan{
    padding: 90px 0 0;
    word-break: keep-all;
  }
  .nj_showcase{
    height: 640px;
    background: url('http://korean.visitkorea.or.kr/resources/images/curation/bg_cockcock_planner.gif') no-repeat;
    text-align: center;
  }
  .nj_inr{
    width: 1284px;
    margin: 0 auto;
    position: relative;
  }
  .nj_inr img{
    vertical-align: middle;
    border: 0 none;
    overflow-clip-margin: content-box;
    overflow: clip;
  }
  .nj_map span{
    display: inline-block;
    text-indent: -9999px;
    position: absolute;
    animation-name: hatch;
    animation-duration: 2s;
    animation-timing-function: ease-in-out;
    transform-origin: 50% 100%;
  }
  .nj_spot1{
    animation-delay: 2s;
    right: 499px;
    top: 314px;
    width: 32px;
    height: 45px;
    background: url('http://korean.visitkorea.or.kr/resources/images/curation/img_planner_spop1.png');
  }
  .nj_spot2{
    animation-delay: 4s;
    right: 306px;
    top: 168px;
    width: 59px;
    height: 82px;
    background: url('https://korean.visitkorea.or.kr/resources/images/curation/img_planner_spop2.png');
  }
  .nj_spot3{
    animation-delay: 6s;
    right: 128px;
    top: 248px;
    width: 32px;
    height: 45px;
    background: url('http://korean.visitkorea.or.kr/resources/images/curation/img_planner_spop3.png');
  }
  .nj_blind{
    overflow: hidden;
    position: absolute;
    top: auto;
    left: -9999px;
    width: 1px;
    height: 1px;
    text-indent: -9999px;
  }
  .nj_tag{
    position: absolute;
    right: 50px;
    top: 97px;
    width: 158px;
  }
  .nj_tag span{
    display: block;
    height: 89px;
  }
  .nj_tag span img{
    vertical-align: middle;
    border: 0 none;
  }
  .nj_tag button{
    animation-iteration-count: 2;
    position: relative;
    height: 39px;
    width: 100%;
    border: 0 none;
    background-color: transparent;
    cursor: pointer;
    animation: wobble-hor-bottom 0.8s both;
  }
  .nj_tag button img{
    vertical-align: middle;
    border: 0 none;
  }
  .nj_tip{
    display: none;
    position: absolute;
    left: -125px;
    top: 130px;
    width: 290px;
    height: 94px;
    letter-spacing: -0.8px;
    font-size: 15px;
    line-height: 19px;
    color: #666;
    padding: 20px 15px 0;
    background: url('http://korean.visitkorea.or.kr/resources/images/curation/bg_planner_tip.png') no-repeat;
    text-align: left;
  }
  .nj_tip em{
    display: inline-block;
    width: 30px;
    margin: 0 0 3px;
    border-radius: 50px;
    height: 16px;
    line-height: 16px;
    color: #fff;
    background: #153ba3;
    font-size: 13px;
    text-align: center;
  }
  .nj_tip p{
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
  }
  
  .nj_btn{
    position: absolute;
    left: 102px;
    top: 371px;
  }
  
  .nj_btn a{
    overflow: hidden;
    display: inline-block;
    width: 200px;
    text-align: left;
    padding-left: 35px;
    background: #416ce6;
    box-sizing: border-box;
    height: 56px;
    line-height: 56px;
    border-radius: 50px;
    color: #fff;
    font-size: 21px;
    letter-spacing: -1px;
    position: relative;
    z-index: 2;
  }
  .nj_btn .nj_pc em{
    z-index: 2;
    position: relative;
  }
  .nj_arw_wrap {
    display: inline-block;
    width: 24px;
    height: 16px;
    z-index: 2;
    position: relative;
    margin-left: 10px;
    transition: transform 500ms ease;
  }  
  .nj_arw_wrap span {
    display: inline-block;
    position: absolute;
    left: 0;
    top: 0;
    width: 24px;
    height: 16px;
    transition: transform 500ms ease, opacity 250ms ease;
    background: url('http://korean.visitkorea.or.kr/resources/images/curation/btn_planner_cos.png');
  } 
  .nj_left {
    transform: translateX(-200%);
    opacity: 0;
  }
  .nj_tab ul{
    display: flex;
    text-align: center;
    width: 1200px;
    margin: 0 auto;
    background: #20356f;
    margin-top: -37px;
  }
  .nj_tab ul li{
    flex: 1 1 30%;
    position: relative;
    list-style: none;
  }
  .nj_tab ul li:hover p{
    color: #fff;
    font-weight: 700;
  }
  .nj_tab ul li:before {
    content: '';
    display: inline-block;
    width: 1px;
    height: 21px;
    position: absolute;
    left: 0;
    top: 26px;
    background: #6a82c4;
  }
  .nj_tab p {
    display: block;
    height: 75px;
    line-height: 75px;
    color: #6a82c4;
    font-size: 20px;
    letter-spacing: -0.8px;
    position: relative;
    cursor: pointer;
  }
  tab ul li p:before {
    content: '';
    display: inline-block;
    width: 30px;
    margin-right: 10px;
    vertical-align: -7px;
    height: 31px;
    background: url('http://korean.visitkorea.or.kr/resources/images/curation/icon_planner_tab.png');
  }
  .nj_plannerTab2{
    width: 1200px;
    margin: 0 auto;
  }
  .nj_plannerTab2 h4{
    padding: 60px 0 30px;
    font-weight: 800;
    font-size: 28px;
    line-height: 31px;
    letter-spacing: -1.5px;
    color: #333;
  }
  .nj_planner_list{
    position: relative;
  }
  .nj_planner_list ul li .nj_img {
    display: block;
    width: 100%;
    height: 285px;
    position: relative;
  }
  .nj_all_del{
    position: absolute;
    right: 0;
    top: -55px;
    font-size: 15px;
    font-weight: 700;
    color: #000;
    border: none;
    cursor: pointer;
  }
  .nj_my_cos{
    display: flex;
    flex-wrap: wrap;
    margin-left: -20px;
    margin: 20px 0 26px;
  }
  .nj_my_cos li{
    position: relative;
    display: flex;
    width: calc(50% - 20px);
    margin: 0 0 30px 20px;
    padding: 20px;
    box-sizing: border-box;
    box-shadow: 3px 4px 18px 0px rgba(69, 70, 72, 0.15);
    border-radius: 5px;
  }
  .nj_my_cos li .nj_img{
    width: 228px;
    height: 290px;
  }
  .nj_my_cos li .nj_img img{
    object-fit: cover;
    width: 100%;
    height: 100%;
    border-radius: 5px;
  }
  .nj_cont{
    width: 322px;
    padding: 0 0 0 20px
  }
  .nj_day{
    display: inline-block;
    width: 65px;
    height: 25px;
    line-height: 25px;
    color: #fff;
    background: #567ff2;
    font-size: 15px;
    letter-spacing: -0.6px;
    text-align: center;
  }
  .nj_cont a {
    display: block;
    margin: 13px 0 7px;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
    font-weight: 700;
    font-size: 18px;
    line-height: 23px;
    letter-spacing: -0.6px;
    color: #333;
  }
  .nj_area {
    display: block;
    font-size: 16px;
    line-height: 20px;
    letter-spacing: -0.5px;
    font-weight: 300;
    color: #666;
  }
  .nj_date {
    display: flex;
    margin: 8px 0 18px;
    font-size: 16px;
    font-weight: 300;
    line-height: 20px;
    color: #666;
  }

  .nj_rate{
    display: flex;
    font-size: 15px;
    font-weight: 300;
    line-height: 16px;
    color: #929090;
  }
  .nj_grade{
    display: flex;
    margin-right: 15px;
  }
  .nj_star{
    margin: 1px 4px 0 0;
    background: url('https://korean.visitkorea.or.kr/resources/images/curation/bg_star.png') no-repeat;
    width: 82px;
    height: 13px;
    position: relative;
  }
  .nj_star span{
    text-indent: -9999px;
    font-size: 0;
    position: absolute;
    background: url('https://korean.visitkorea.or.kr/resources/images/curation/bg_star1.png');
    height: 13px;
  }
  
  .nj_comment:before {
    content: '';
    display: inline-block;
    width: 18px;
    height: 16px;
    margin-right: 5px;
    vertical-align: -2px;
    background: url('https://korean.visitkorea.or.kr/resources/images/curation/icon_planner_comment.png');
  }
  .nj_thumbnail{
    display: flex;
    margin-left: -10px;
    margin-top: 35px;
  }
  .nj_thumbnail span {
    position: relative;
    width: 94px;
    height: 94px;
    border-radius: 5px;
    overflow: hidden;
    margin-left: 10px;
  }
  .nj_thumbnail span img{
    object-fit: cover;
    width: 100%;
    height: 100%;
  }
  .nj_my_cos .nj_delete{
    position: absolute;
    right: 20px;
    text-indent: -9999px;
    width: 23px;
    height: 23px;
    background: url('https://korean.visitkorea.or.kr/resources/images/curation/btn_delete1.png');
    border: 0 none;
  }
  .nj_thumbnail span a {
    display: flex;
    flex-wrap: wrap;
    width: 100%;
    align-content: center;
    justify-content: center;
    font-size: 13px;
    font-weight: 300;
    height: 100%;
    margin: 0;
    position: absolute;
    left: 0;
    top: 0;
    z-index: 5;
    color: #fff;
  }
  .nj_thumbnail span:last-child:after {
    content: '';
    display: block;
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    top: 0;
    background: rgba(0,0,0,.5);
  }
  .nj_thumbnail span a:before {
    content: '';
    display: block;
    width: 100%;
    height: 14px;
    margin: 0 0 5px;
    background: url('https://korean.visitkorea.or.kr/resources/images/curation/btn_plus.png') 50% 0 no-repeat;
  }
  .nj_planner_list{
  	position: relative;
  }
  .nj_no_data{
    text-align: center;
    padding: 0 0 80px;
    margin-left: 450px;
  }
  .nj_no_data:before {
    content: '';
    display: block;
    height: 139px;
    margin: 90px 0 15px;
    background: url("https://korean.visitkorea.or.kr/resources/images/curation/icon_no_data.png") 50% 0 no-repeat;
}
.nj_no_data strong {
    display: block;
    font-size: 22px;
    line-height: 25px;
    font-weight: 700;
    letter-spacing: -1px;
    color: #333;
}
.nj_no_data p {
    padding: 7px 0 0;
    color: #666;
    font-size: 18px;
    letter-spacing: -0.6px;
    line-height: 21px;
}
  
</style>
<script>
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
function mycourse() {
 alert("나의여행코스");	
}
function best30() {
 alert("월간베스트30");	
}

function recTourLink(){
	event.preventDefault();
	let userId = '<%= session.getAttribute("userId")%>'; // 세션에 저장된 userId값 가져오기
	if (userId == 'null') {
		alert("로그인이 필요한 서비스입니다.");
		window.location.href = "${path}/loginform";
    }else{
    	window.location.href = "${path}/recTour";
    }
}
</script>
<body>
<header><%@ include file="header.jsp" %></header>
<section>
<div class="nj_swiper-slide">
  <div class="nj_contents">
   <div class="nj_cockcock_plan">
    <div class="nj_showcase">
      <div class="nj_inr">
        <img src="http://korean.visitkorea.or.kr/resources/images/curation/img_planner_tit.png" class="nj_pc" alt>
        <div class="nj_map">
          <span class="nj_spot1"></span>
          <span class="nj_spot2"></span>
          <span class="nj_spot3"></span>
        </div>
        <div class="nj_blind">
          <h3>AI콕콕 플래너 - 당신이 원하는 여행의 시작 1분이면 끝! 나만을 위한 여행 코스 추천</h3>
        </div>
        <div class="nj_tag">
          <span>
            <img src="http://korean.visitkorea.or.kr/resources/images/curation/img_planner_tag.png" class="nj_pc" alt="#마음대로 편집 가능">
          </span>
        <button type="button">
          <img src="http://korean.visitkorea.or.kr/resources/images/curation/btn_planner_tag.png" class="nj_pc" alt="#BEST 코스 도전">
        </button>
        <div class="nj_tip">
          <div class="nj_pc">
            <em>TIP</em>
            <p>
              코스를 '공개'하면 BEST코스 도전 가능!
              <br>
              비공개하면 나만의 코스로 간직할 수 있어요.
            </p>
          </div>
          <!-- <img src="http://korean.visitkorea.or.kr/resources/images/curation/bg_planner_m_tip.png" class="mo" alt> -->
        </div>
        </div>
        <div class="nj_btn">
          <a href="#" onclick="recTourLink()">
            <div class="nj_pc">
              <em>코스만들기</em>
              
              <span class="nj_arw_wrap">
                <span class="nj_left"></span>
                <span class="nj_right"></span>
              </span>
            </div>
            <img src="http://korean.visitkorea.or.kr/resources/images/curation/btn_planner_m_cos.png" class="mo" alt>
          </a>
        </div>
      </div>
    </div>
    <div class="nj_tab">
      <ul>
        <li>
          <p onclick="mycourse()">나의 여행코스</p>
        </li>
        <li>
          <p onclick="best30()">월간Best30</p>
        </li>
      </ul>
    </div>
    <div class="nj_plannerTab2">
      <h4>나의 여행코스</h4>
      <div class="nj_planner_list">
        <button type="button" class="nj_all_del">전체 코스 삭제</button>
        <ul class="nj_my_cos">
        <c:choose>
		    <c:when test="${empty cList}">
		        <div class="nj_planner_list">
			        <div class="nj_no_data">
			          <strong>아직 제작한 코스가 없어요. 😢</strong>
			          <p>맞춤형 여행 코스 추천 받아보세요.</p>
			        </div>
			      </div>
		    </c:when>
		    <c:otherwise>
		        <c:forEach var="item" items="${cList }">
            <li>
            <a href="${path}/myRecommendCourse/?courseId=${item.courseId}" class="nj_img">
              <img src="${ item.firstImg}">
            </a>
            <div class="nj_cont">
              <span class="nj_day">
                <c:choose>
                    <c:when test="${item.duration == 0}">당일치기</c:when>
                    <c:when test="${item.duration == 1}">1박2일</c:when>
                    <c:when test="${item.duration == 2}">2박3일</c:when>
		        </c:choose>
		       </span>
	              <a href="${path}/myRecommendCourse/?courseId=${item.courseId}">${ item.courseName}</a>
	              <span class="nj_area">${ item.locations}</span>
	              <div class="nj_date">
	                <em>만든날짜 : </em>
	                <span>${ item.createDate}</span>
	              </div>
	             <div class="nj_thumbnail">
	               <span>
	                 <img src="${ item.firstImg}">
	               </span>
	               <span>
	                 <img src="${ item.secondImg}">
	               </span>
	               <span>
	                 <img src="${ item.thirdImg}">
	                 <a href="${path}/myRecommendCourse/?courseId=${item.courseId}">자세히보기</a>
	               </span>
	             </div>
	            </div>
		            <button type="button" class="nj_delete">삭제</button>
		          </li>
		              
		         </c:forEach>
		    </c:otherwise>
		</c:choose>  
        </ul>
        </div>
        <!--  
        <div class="nj_more">
          <button type="button" class="nj_type1">더보기</button>
        </div>
      </div>
        -->
      <!--
      <div class="nj_planner_list">
        <div class="nj_no_data">
          <strong>아직 제작한 코스가 없어요. 😢</strong>
          <p>맞춤형 여행 코스 추천 받아보세요.</p>
        </div>
      </div>
      -->
    <div class="nj_plannerTab3"></div>
  </div>
  </div>
</div>
</div>
</section>
<footer><%@ include file="footer.jsp" %></footer>
</body>
</html>
