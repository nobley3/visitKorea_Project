<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        }
        
        /* 위에 있는 박스 */
        .contents{
            width: 940px;
            position: relative;
            margin:0 auto; 
            display: flex;     
            padding-bottom: 15px;  
        }
		
		.contents img{
			width: 30px;
			height: 28px;	
		}
		
		.contents h2{
			font-size: 36px;
			padding-top: 7px;
			font-weight: 800;
			color: #333333;
			letter-spacing: -2px;
		}

        /* 밑에 있는 박스 */
        .mypage_wrap {
            padding:50px 0 100px;
            background: #f3f5f7;
            height: 500px;
            display: flex;
            justify-content: center;
            align-items: center;
        }


        /* 왼쪽 전체 */
        .profileBox {
            position: relative;
            width: 340px;
            height: 450px;
            background-color: #022c6c;
            border-radius: 5px;         
            margin-right: 30px; 
            color: white;       
            display: flex; 
            flex-direction: column; 
            align-items: center;
            overflow: visible; 
        }

        /* 모달창 흰 점 세 개짜리 버튼 클릭하면 개인정보 변경, 로그아웃, 회원탈퇴 보임 */
        .view { /*더보기 버튼 */
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
            color: white;
            writing-mode: vertical-rl;  /*세로로 표시되도록 설정*/
            position: absolute;
            top: 30px; 
            right: 20px;
        }
        .profileBox ul{
            background-color: white;
        	z-index: 1;
        	display: none;
        	position: absolute;
            top: 65px;
            right: 31px;
            color: #333333;
            font-weight: 700;
            font-size: 13px;
            letter-spacing: -0.5px;
            line-height: 35px;
            padding: 10px 20px 10px 20px;
            
        }
        .profileBox ul a{
        	color: black;
        	padding-left:30px;
        } 
        .btn_info01{
        	background: url(https://korean.visitkorea.or.kr/resources/images/travelsubscribe/ico_sprite_mypg.png) 0px -3px / 25px auto no-repeat;
        }
        .btn_logout{
        	background: url(https://korean.visitkorea.or.kr/resources/images/travelsubscribe/ico_sprite_mypg.png) 1px -70px / 22px auto no-repeat;
        }
        .btn_out{
        	background: url(https://korean.visitkorea.or.kr/resources/images/travelsubscribe/ico_sprite_mypg.png) 0px -92px / 20px auto no-repeat;
        }



		/* 프로필 이미지 */
        .profileImg {
       		margin-top: 35%;
            width: 80px;
            height: 80px;
            background-size: cover;
            display: flex;
            justify-content:center;
            align-items:center;
            position: relative;
        }
		.profileImg>img{
        	width: 80px;
        	height: 80px;
        	border-radius: 50%;
        }
        .profileImg_social {
            position: absolute;
            bottom: 0px; 
            right: 0px;
            width: 25px;
            height: 25px;
        }
        
        /* 반가워요! */
        .profileBox p {
            padding: 27px 0 10px;
            font-size: 20px;
            font-weight: 300;
            color: white;
            line-height: 22px;
            letter-spacing: -0.8px;
        }
		
		/* ㅇㅇㅇ 님 (닉네임) */
        .nickname {
            display: block;
            font-weight: 800;
            font-size: 30px;
            color: #fff;
            letter-spacing: -1.5px;
            line-height: 33px;
            margin-bottom: 5px; 
        }
		
		/* 프로필 이미지 설정 */
		.setting {
            position: relative;
            top: 70px; 
        }
		.setting a {
            display: block;
            color: #fff;
            font-size: 18px;
            letter-spacing: -0.6px;
            line-height: 20px;
        }
        .setting img {
            vertical-align: middle; /* 이미지를 텍스트 중앙에 정렬 */
        }
        
		
		/* 오른쪽 박스 */
		.myPage {
            width: 570px;
            height: 450px;
            box-sizing: border-box;  /* 수정: 내부 여백을 포함한 크기 지정 */
        }

        .myPage h3{
            padding-bottom: 20px;
		    font-size: 27px;
		    font-weight: 800;
		    letter-spacing: -1px;
		    color: black;
        }
		
		.activeBox {
			width: 570px;
			height: 400px;
            background-color: white;
            box-shadow: 0px 0px 24px 0px rgba(170, 173, 176, 0.2);
            border-radius: 10px;  
            position: relative; 
        }
		.activeBox li {
            width: 50%; 
            height: 200px;
            box-sizing: border-box;
            text-align: center;
            position:absolute;
            
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
		.activeBox_icon1{
			top : 0;
			left : 0;
		}
		.activeBox_icon2{
			top : 0;
			right : 0;
		}
		.activeBox_icon3{
			top : 200px;
			left : 0;
		}
		.activeBox_icon4{
			top : 200px;
			right : 0;
		}
	
		.activeBox a{
			width: 60px;
			height: 60px;
			display: block;
			position: relative;
		}
		.icon1{
        	background: url(https://korean.visitkorea.or.kr/resources/images/travelsubscribe/icon_mapage_active.png) 50% 0 / 100% auto no-repeat;
        }
        .icon2{
        	background: url(https://korean.visitkorea.or.kr/resources/images/travelsubscribe/icon_mapage_active.png) 50% 20% / 100% auto no-repeat;
        }
        .icon3{
        	background: url(https://korean.visitkorea.or.kr/resources/images/travelsubscribe/icon_mapage_active.png) 50% 60% / 100% auto no-repeat;
        }
        .icon4{
        	background: url(https://korean.visitkorea.or.kr/resources/images/travelsubscribe/icon_mapage_active.png) 50% 80% / 100% auto no-repeat;
        }
		.activeBox em{
			display: block;
			box-sizing: border-box;
			width: 26px;
			height: 26px;
			background-color: #4765cf;
			border-radius: 50%;
			position: absolute;
			left: 40px;
            top: -8px;
            color: #fff;
			font: 13px/1.4 NotoSansKR,NotoSansJP,"돋움",Dotum,AppleGothic,Sans-serif;
            text-align: center;
			font-size: 12px;
            font-weight: bold;
            line-height: 26px;
		}
		.activeBox span{
			display: block;
            font-size: 18px;
            letter-spacing: -0.8px;
            color: #333333;
            margin-top: 10px;
		}
	</style>
    
    <script>
        function toggleOptions() {
            /*let ulElement = document.querySelector('.profileBox ul');*/
            let ulElement = document.querySelector('.profileBox ul');
            if (ulElement.style.display === 'none' || ulElement.style.display === '') {
                ulElement.style.display = 'block';
            } else {
                ulElement.style.display = 'none';
            }
        }
        function showOptions() {
            let ulElement = document.querySelector('.profileBox ul');
            ulElement.classList.add('show');
        }

        function hideOptions() {
            let ulElement = document.querySelector('.profileBox ul');
            ulElement.classList.remove('show');
        }
        
        function deletesend(userId){
        	
        	if(confirm("정말로 탈퇴하시겠습니까?")){
        		alert("탈퇴되었습니다");
        		$.ajax({
        			type: "post",
        			url: "${path}/userdelete",			 
        			data: "userId=" + userId,
        			success: function(data){
        				window.location.href="/tour/home";
        			},
        			error: function(){
        				alert("요청실패");
        			}
        		});
        	}else{
        		alert("취소되었습니다.");
        		window.location.reload();
        	}
    		
    	}
        

    </script>
    
    
</head>
<body>


	<header><%@ include file="header.jsp" %></header>
	
	 <section>
        <div class="contents">
        	<img src="https://korean.visitkorea.or.kr/resources/images/sub/ico_tit_list5.png">
            <h2>마이페이지</h2>
        </div>
        
        <div class="mypage_wrap">    
            <div class="profileBox">
                <button type="button" title="open" class="view" onclick="toggleOptions()">&#8226;&#8226;&#8226;</button>
                <!-- 모달창 -->
                <ul class="btn">
                    <li class="btn_info01"><a href="${path}/userupdateform">개인정보 변경</a></li>
                    <c:choose>
                    	<c:when test="${user.section eq '01'}">
                    		<li class="btn_logout"><a href="${path}/logout">로그아웃</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="btn_logout" onclick="kakaoLogout();"><a href="${path}/logout">로그아웃</a></li>
                    	</c:otherwise>
                    </c:choose>
                    <li class="btn_out" onclick="deletesend('${user.userid}')"><a href="#">회원탈퇴</a></li>
                </ul>  
	               
                <!-- 프로필이미지 -->
                <div class="profileImg">
                    <img src="${user.profileurl}">
                   	<c:if test="${user.section eq '02'}">
                   		<div class="profileImg_social">
	                        <img src="https://korean.visitkorea.or.kr/resources/images/sub/ico_kakao.png" alt="카카오톡">
	                    </div>
                   	</c:if>
                </div>
                
                <p>반가워요!</p>
                <strong class="nickname">${user.nickname}님</strong>
                
                <form name="form" id="form">
                    <div class="setting">
                        <input type="file" id="upload" name="upload" accept="image/*" onchange="fileChange(this)"
                            style="display: none;">
                        <a href="javascript:;" id="update">프로필 이미지 설정
                        	<img src="https://korean.visitkorea.or.kr/resources/images/travelsubscribe/btn_profile_arw.png" alt="프로필이미지">
                        </a>
                        <label for="upload" class="btnUpload"></label>
                    </div>
                </form>
            </div>
            
            <div class="myPage">
             
                <h3>나의활동</h3>
                     
				<ul class="activeBox">
					<li class="activeBox_icon1">
						<a href="${path}/mypagelike.do" class="icon1"><em>${likesize}</em></a>
						<span>좋아요</span>
					</li>
					<li class="activeBox_icon2">
						<a href="${path}/mypagetalk.do" class="icon2"><em>${reviewsize}</em></a>
						<span>여행톡</span>
					</li>
					<li class="activeBox_icon3">
						<a href="${path}/mypagecourse.do" class="icon3"><em>${coursesize}</em></a>
						<span>코스</span>
					</li>
					<li class="activeBox_icon4">
						<a href="${path}/mypageQA.do" class="icon4"><em>${qasize}</em></a>
						<span>Q&A</span>
					</li>
				</ul>
           
        	</div>
        </div>
    </section>
	
	<footer><%@ include file="footer.jsp" %></footer>
		        				
	<script>
	 	// 카카오로그아웃
	    function kakaoLogout() {
	        if (Kakao.Auth.getAccessToken()) {
	            Kakao.API.request({
	                url: "/v1/user/unlink",
	                success: function (response) {
	                    console.log(response);
	                },
	                fail: function (error) {
	                    console.log(error);
	                },
	            });
	            Kakao.Auth.setAccessToken(undefined);
	        }
	    }
	</script>	        				
		        				
</body>
</html>