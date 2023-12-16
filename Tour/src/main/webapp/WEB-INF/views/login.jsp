<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TourKorea</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<style>

		*{
			padding:0;
			margin:0;
			text-decoration: none;
		}

		section{
			padding-top:200px;
			padding-bottom: 200px;
		}
		
        section h1 {
            font-weight: 800;
            font-size: 50px;
            text-align: center;
            margin-bottom: 40px; 
            letter-spacing: 30px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            color: #13294b;
        }

       .login_wrap {
            height: 500px;
            width: 500px;
            padding: 20px;
            border: 1px solid #13294b;
            border-radius: 50px;
            box-shadow: 0px 0px 13px rgba(19, 41, 75, 0.6);
            margin: 0 auto;
        }

        .login-container {
            width: 400px;
            position: relative;
            margin: 50px auto;
            margin-bottom: 0px;
        }
        
        .capsWrap{
        	width : 380px;
        	height: 21px;
        	text-align: center;
        	margin : 0 auto;
        	margin-bottom: 20px;
        }
        
		/*아이디, 비밀번호 입력하는 밑줄 클릭 전*/
        .input-field {
            width: 371px;
            height: 40px;  
            margin-left:7px;        
            margin-top: 5px;           
            margin-bottom: 20px;
            padding: 6px;
            border: none;
            border-bottom: 2px solid gray;
            outline: none;
            font-size: 16px;      
        }

		/*아이디, 비밀번호 입력하는 밑줄 클릭 후*/
        .input-field:focus {
            border-bottom: 2px solid black;
        }

		/*비밀번호 눈모양 표시*/
        .eye-icon {
            position: absolute;
            right: 20px;
            top: 70%;
            transform: translateY(-50%);
            cursor: pointer;
        }


		/* 로그인 버튼 섹션 */
        #loginButton {	
        	display: block;
        	width: 380px;
		    height: 50px;	   	  
		    background-color: skyblue;
		    border: 0px;
		    border-radius: 10px;
		    margin: 0 auto;
		    box-sizing: border-box;
		    font-size: 25px;
		    font-weight: 600;
		    color: white;
		}
		.orLine{
			width: 35px;
			text-align: center;
			margin: 15px auto;
			
			position: relative;
		}
		.orLine:before, .orLine:after{
			content:"";
			display: inline-block;
			position: absolute;
			top: 50%;
			width: 160px;
		    height: 1px;
		    background-color: #13294b; /* 선의 색상 설정 */
		}
		.orLine:before{
			left:-170px;
		}
		.orLine:after{
			right:-170px;
		}

        .img_wrap {
        	margin: 0 auto;
		    width: 380px;
		    height: 50px;	
		    border-radius: 10px;
		    overflow: hidden;
		    box-sizing: border-box;
		    
		    background-color: #fee500;
		    display:flex;
		    justify-content: center;
		    align-items: center;
		}
		.img_wrap button{
			display: block;
			width: 280px;
		    height: 30px;
		}
		.img_wrap img {
		    width: 280px;
		    height: 30px;
		    object-fit: cover;
		    box-sizing: border-box;
		}
		
       

        /* 회원가입 */
        .signWrap{
	        width: 380px;
	        margin: 0 auto;
	        margin-top: 60px;
        	display: flex;
        	justify-content: space-between;
        }
        .signWrap span{
        	display: block;
       	}
		.signup-link a{
			color: black;
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

	// 로그인버튼 클릭시 동작되는 함수
	function login(){
		let id = document.getElementById("id").value;
		let pw = document.getElementById("pw").value;
		
		// 로그인 요청을 Ajax로 전송
	    $.ajax({
	        type: "POST",
	        url: "${path}/login", // 로그인 처리를 수행하는 컨트롤러의 URL
	        data: "id="+id+"&pw="+pw,
	        success: function (data) {
	        	
	            if (data == "1") {
	                // 로그인 성공 시 원하는 페이지로 리다이렉트 또는 필요한 작업 수행
	                let previousPage = sessionStorage.getItem("previousPage");
			        // 이전 페이지가 존재하면 해당 페이지로 리다이렉트, 없으면 홈페이지로 이동
			        window.location.href = previousPage || "${path}/home";
			      
			        //window.history.back() ;
	                //window.location.href = "${path}/home"; // 성공 시 이동할 페이지
	            } else {
	                // 로그인 실패 시 에러 메시지 출력 또는 필요한 작업 수행
	                alert("아이디와 비밀번호를 확인하세요.");
	                let id = document.getElementById("id").value = '';
	        		let pw = document.getElementById("pw").value = '';
	            }
	        },
	        error:function(){
				alert("요청실패");
			}
	    });
	}
	
	
	
	
	
	
</script>

</head>
<body>
	
	<header><%@ include file="header.jsp" %></header>
	
	<section>
		<h1>로그인</h1>
		<div class="login_wrap">
		    <div class="login-container">
		        <input type="text" id="id" class="input-field" placeholder="아이디">
		        <input type="password" name="pw" id="pw" class="input-field" placeholder="비밀번호">
		        <div class="eye-icon-container">
		            <i id="togglePassword" class="eye-icon far fa-eye"></i>
		        </div>
		    </div>
		    
		    <div class="capsWrap">
		    	<div id="caps-msg" class="caps-lock-message" style="color: red; display: none;">Caps Lock이 켜져 있습니다.</div>
		    </div>
		    
		    <div class="btn-container">
		    	<button id="loginButton" onclick="login()">로그인</button>
		    	<div class="orLine">또는</div>
		        <div class="img_wrap">
		            <button onclick="kakaoLogin();" style="background: none; border: none; padding: 0; cursor: pointer;">
		                <img src="${path}/resources/images/카카오로그인.png" alt="카카오로그인">        
		            </button>
		        </div>
		        <div class="signWrap">
		        	<span class="signup-link"><a href="${path}/tourjoin_form">회원가입</a></span>
		        	<span class="forgot-link">ID/PW 찾기</span>
		        </div>
	    	</div>
		</div>
	</section>
	
	<footer><%@ include file="footer.jsp" %></footer>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
    Kakao.init("8409e3ef23d3aa24592484f08ad587c4");
    console.log(Kakao.isInitialized()); // sdk 초기화 여부 판단

 	// 카카오로그인
    function kakaoLogin() {    	
        Kakao.Auth.login({
            success: function (response) {
                Kakao.API.request({
                    url: "/v2/user/me",
                    success: function (response) {                    	
                    	// 카카오 로그인 성공시 
                    	// form화면에 hidden 으로 저장 
                    	// submit  =>  controller 요청 ( 데이타베이스 등록 ); 
                        document.getElementById("user_kakao").value = response.id;
                        document.getElementById("nickname").value = response.properties.nickname;
                        document.getElementById("profile_image").value = response.properties.profile_image;
                        document.getElementById("kakaoForm").submit();
                    
                    },
                    fail: function (error) {
                        console.log(error);
                    },
                });
            },
            fail: function (error) {
                console.log(error);
            },
        });
    }
	
 	
    
	//비밀번호 보이기/가리기 토글 기능
	$(document).ready(function () {
	    $('#togglePassword').click(function () {
	        let pwField = $('#pw');
	        let type = pwField.attr('type');
	        if (type === 'password') {
	            pwField.attr('type', 'text');
	            $('#togglePassword').removeClass('far fa-eye').addClass('far fa-eye-slash');
	        } else {
	            pwField.attr('type', 'password');
	            $('#togglePassword').removeClass('far fa-eye-slash').addClass('far fa-eye');
	        }
	    });
	
	    // Caps Lock 감지
	    $('#pw').on('keydown', function (e) {
	        let capsLockOn = (e.getModifierState && e.getModifierState('CapsLock')) ||
	            (e.originalEvent.getModifierState && e.originalEvent.getModifierState('CapsLock'));
	
	        if (capsLockOn) {
	            $('#caps-msg').show();
	        } else {
	            $('#caps-msg').hide();
	        }
	    });
	});
</script>

	<form id="kakaoForm" action="${path}/login/kakao" method="post">
	    <input type="hidden" name="user_kakao" id="user_kakao">
	    <input type="hidden" name="nickname" id="nickname">
	    <input type="hidden" name="profile_image" id="profile_image">
	</form>
	
</body>
</html>
