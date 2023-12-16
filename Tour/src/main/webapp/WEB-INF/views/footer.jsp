<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>TourKorea</title>
<link href="${path}/resources/css/tourMainFooter.css" rel="stylesheet"/>     
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
</head>
<body>

  <footer>
   <div class="SYJfooterNotice">
			<div class="innerBox">
				<div class="NoticeSlideWrap">
					<ul class="newsList">						 
					  					  
					</ul>
				</div>
				<div class="footerPlaywrap">
					<button type="button" class="footerPlaybtn"  >재생</button>
					<button type="button" class="footerStopbtn" >정지</button>
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
        <div class="SYJfooterBox">
            <div class="SYJfootersnsList">
                <strong class="Stitle">대한민국 구석구석을 SNS에서 만나보세요!</strong>
                <ul class="SYJfooterUL">
                    <li><a href="http://blog.naver.com/korea_diary/" target="_blank" title="새창">
                            <span class="SnsIcon iconB"></span>
                            <em class="SnsName">블로그</em>
                        </a>
                    </li>
                    <li><a href="http://post.naver.com/korea_diary" target="_blank" title="새창">
                            <span class="SnsIcon iconP"></span>
                            <em class="SnsName">포스트</em>
                        </a></li>
                    <li><a href="https://www.facebook.com/9suk9suklive" target="_blank" title="새창">
                            <span class="SnsIcon iconF"></span>
                            <em class="SnsName">페이스북</em>
                        </a></li>
                    <li><a href="https://twitter.com/kor_visitkorea" target="_blank" title="새창">
                            <span class="SnsIcon iconT"></span>
                            <em class="SnsName">트위터</em>
                        </a></li>
                    <li><a href="https://story.kakao.com/#ch/visitkorea/" target="_blank" title="새창">
                            <span class="SnsIcon iconKS"></span>
                            <em class="SnsName">카카오스토리</em>
                        </a></li>
                    <li><a href="https://www.instagram.com/kto9suk9suk/" target="_blank" title="새창">
                            <span class="SnsIcon iconI"></span>
                            <em class="SnsName">인스타<br>그램</em>
                        </a></li>
                    <li><a href="https://band.us/@koreadiary" target="_blank" title="새창">
                            <span class="SnsIcon iconNB"></span>
                            <em class="SnsName">네이버<br>밴드</em>
                        </a></li>
                </ul>
            </div>
            <div class="SYJfooterInfo">
                <div class="SYJfooterBanner">
                    <span>
                        <a href="#">
                        <img src="resources/images/img1.png" alt="">
                        </a>
                    </span>
                    <span>
                        <a href="#">
                        	<img src="resources/images/img2.png" alt=""></a>
                    </span>
                    <span>
                        <a href=" "><img src="resources/images/img3.png"
                                alt=""></a>
                    </span>
                    <span>
                        <a href=" "><img
                                src="resources/images/img4.png"
                                alt=""></a>
                    </span>
                    <span>
                        <a href=" "><img src="resources/images/img5.png"
                                alt=""></a>
                    </span>
                    <ul class="SYJfooterInfoBox">
                        <li><a href="" class="footerPersonalInfo">프로젝트 팀원 :</a></li>
                        <li><a href="">조은경</a></li>
                        <li><a href="">이윤</a></li>
                        <li><a href="">서예진</a></li>
                        <li><a href="">문나정</a></li>
                        <li><a href="">이윤정</a></li>
                        <li><a href="">One-Piece</a></li>
                    </ul>
                    <ul class="SYJfooterAddress">
                        <li>
                            <span>우) 04038</span>
                            <span>서울 마포구 양화로 122 3층, 4층</span>
                            TEL : 02-2231-6412
                        </li>
                        <li>에이콘아카데미</li>
                        <li>자바(JAVA)웹개발자 양성과정(IoT융합)</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="SYJfooterLogo">

            <span class="SYJfooterSmallLogo">
                <img src="https://cdn.visitkorea.or.kr/resources/images/common/logo_foot.png" alt="한국관광공사">
            </span>
            <ul class="SYJfooterLogoList">
                <li>
                    <a href="https://api.visitkorea.or.kr/#/" target="_blank" title="새창">
                        <img src="https://korean.visitkorea.or.kr/resources/images/common/logo_foot_api.png?v=20230601001"
                            alt="TourAPI 4.0">
                    </a>
                </li>
                <li>
                    <a href="http://www.wa.or.kr/board/list.asp?search=total&SearchString=%B4%EB%C7%D1%B9%CE%B1%B9%20%B1%B8%BC%AE%B1%B8%BC%AE&BoardID=0006"
                        target="_blank" title="새창">
                        <img src="	https://cdn.visitkorea.or.kr/resources/images/common/logo_foot_wa.png"
                            alt="과학기술정보통신부 웹 접근성 품질인증 마크">
                    </a>
                </li>
                <li>
                    <a href="https://kto.visitkorea.or.kr/kor.kto" target="_blank" title="새창">
                        <img src="	https://cdn.visitkorea.or.kr/resources/images/common/logo_foot_gg.png" alt="한국관광공사">
                    </a>
                </li>
                <li>
                    <a href="https://www.mcst.go.kr/kor/main.jsp" target="_blank" title="새창">
                        <img src="	https://cdn.visitkorea.or.kr/resources/images/common/logo_foot_mg.png" alt="문화체육관광부">
                    </a>
                </li>
            </ul>
        </div>
  </footer>
  
  
  
  
  <script type="text/javascript">
  
  
  //let imgcnt=0;
  $(document).ready(function(){
	  
	  let currentSlide = 0;
	  let slideHeight = 65; // 슬라이드 아이템의 높이
	  let slideCount; // 슬라이드의 총 개수
	  let slideInterval; // 슬라이드 타이머

	  
	  
	  function startSlideShow() {
		  console.log("자동 슬라이드 쇼가 시작되었습니다.");
		  if (slideInterval) {
		        clearInterval(slideInterval); // 기존 타이머 정지
		    }		  
	        slideInterval = setInterval(function() {
	            if(currentSlide < slideCount - 1) {
	                currentSlide++;
	            } else {
	                currentSlide = 0;
	            }
	            $(".newsList").animate({top: -(slideHeight * currentSlide)}, 300);
	        }, 3000); // 3초 간격으로 자동 슬라이드
	        
	    }

	  function stopSlideShow() {
		  console.log("자동 슬라이드 쇼가 정지되었습니다.");
	        clearInterval(slideInterval);
	        
	    }

		
	  
	  
	  /*푸터(여행코스)*/
		$.ajax({
	  		 type: "GET",
	         url: "/tour/selectedC",
	         success: function(selectedSpots) {
	        	 //console.log( selectedSpots );
	        	 
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
	        	 slideCount = $(".newsList li").length;
	        	 startSlideShow(); 
	        	 
           },
           error: function(err) {
               console.log(err);
           }
		});
	  
	  
		 $(".btnNex").click(function() {
		        if(currentSlide < slideCount - 1) {
		            currentSlide++;
		            $(".newsList").animate({top: -(slideHeight * currentSlide)}, 300);
		        } else {
		            currentSlide = 0;
		            $(".newsList").animate({top: 0}, 300);
		        }
		    });

		    $(".btnPre").click(function() {
		        if(currentSlide > 0) {
		            currentSlide--;
		            $(".newsList").animate({top: -(slideHeight * currentSlide)}, 300);
		        } else {
		            currentSlide = slideCount - 1;
		            $(".newsList").animate({top: -(slideHeight * currentSlide)}, 300);
		        }
		    }); 
	   
		    
		 // '재생' 버튼 클릭 이벤트
		    $(".footerPlaybtn").click(function() {
		    	console.log(" 버튼 클릭됨"); 
		        startSlideShow();
		        $(".footerStopbtn").show();
		        $(".footerPlaybtn").hide();
		    });

		    // '정지' 버튼 클릭 이벤트
		    $(".footerStopbtn").click(function() {
		    	console.log("정지 버튼 클릭됨"); 
		        $(".footerStopbtn").hide();
		        $(".footerPlaybtn").show();
		        stopSlideShow();
		        
		    });

		    
		    
	  
	  
  });
  </script>
</body>
</html>
