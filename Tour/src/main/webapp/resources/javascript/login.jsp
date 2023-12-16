<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * {
            padding: 0;
            margin: 0;
        }   

        h3 {
            font-weight: 400;
            text-align: center;
            margin-bottom: 20px;
        }

        .login_wrap {
            height: 500px;
            width: 500px;
            padding: 20px;
            border: 1px solid black;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            width: 400px;
            position: relative;
            margin-bottom: 30px;
        }

        /* 아이디, 비밀번호 입력하는 밑줄 클릭 전 */
        .input-field {
            width: 371px;
            height: 40px;
            margin-left: 7px;
            margin-top: 5px;
            margin-bottom: 20px;
            padding: 6px;
            border: none;
            border-bottom: 2px solid gray;
            outline: none;
            font-size: 16px;
        }

        /* 아이디, 비밀번호 입력하는 밑줄 클릭 후 */
        .input-field:focus {
            border-bottom: 2px solid black;
        }

        /* 비밀번호 눈모양 표시 */
        .eye-icon {
            position: absolute;
            right: 20px;
            top: 70%;
            transform: translateY(-50%);
            cursor: pointer;
        }

        .btn-container {
            display: flex;
            flex-direction: row;
            align-items: flex-start;
            margin-top: 30px;
            margin-bottom: 20px;
            width: 80%;
            justify-content: space-around;
            position: relative;
           
        }

        .img_wrap {
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    width: 150px;
		    height: 60px;		     
		    margin-top: 10px;
		    margin-bottom: 30px;
		    border-radius: 10px;
		    overflow: hidden;
		    box-sizing: border-box;
		}
		
		
		.img_wrap img {
		    width: 100%;
		    height: 100%;
		    object-fit: cover;
		    box-sizing: border-box;
		}
		
		#loginButton {		   	  
		    border: 0px;
		    border-radius: 5px;
		    background-color: skyblue;
		    display: block;
		    margin: 0 auto;
		    margin-right: 10px; 
		    box-sizing: border-box;
		}
		
		.btn-container #loginButton {
		 	width: 150px;
		    height: 36px; 	
		    margin-right: 10px;
		    margin-top: 20px;
		}
		
        .login-container {
            width: 400px;
            position: relative;
            margin-bottom: 20px;
        }

        /* 회원가입 */
        .signup-link {
            position: absolute;
            top: 100%;
            margin-top: 50px;
            left: 30px;
            transform: translateX(-50%);
        }

        /* ID/PW 찾기 */
        .forgot-link {
            position: absolute;
            top: 100%;
            margin-top: 50px;
            right: -30px;
            transform: translateX(-50%);
        }
        
    </style>
</head>
<body>
<section>
	<h3>로그인</h3>
	
	<div class="login_wrap">
	    <div class="login-container">
	        <input type="text" id="id" class="input-field" placeholder="아이디">
	        <input type="password" name="pw" id="pw" class="input-field" placeholder="비밀번호">
	        <div class="eye-icon-container">
	            <i id="togglePassword" class="eye-icon far fa-eye"></i>
	        </div>
	    </div>
	
	    <div id="caps-msg" class="caps-lock-message" style="color: red; display: none;">Caps Lock이 켜져 있습니다.</div>
	
	    <div class="btn-container">
	        <div class="img_wrap">
	            <button onclick="kakaoLogin();" style="background: none; border: none; padding: 0; cursor: pointer;">
	                <img src="${path}/resources/images/카카오로그인.png" alt="카카오로그인">         
	            </button>
	        </div>
	        <button id="loginButton">로그인</button>
	        <span class="signup-link">회원가입</span>
	        <span class="forgot-link">ID/PW 찾기</span>
	    </div>
	</div>
</section>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
    Kakao.init("8409e3ef23d3aa24592484f08ad587c4");
    console.log(Kakao.isInitialized()); // sdk 초기화 여부 판단

    
    function a(){
    	alert("dfdfd");
    	
    	//
    	// $.ajax();
    	 $.ajax(
    			 {
	   				  url: "",
	   				  type: "get" ,    				 
    			 }
    	);
     	
    }
    
    
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
                     
                    	console.log( response) ;
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

    // 비밀번호 보이기/가리기 토글 기능
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

        // 로그인 버튼 클릭 시 실행될 함수
        $('#loginButton').click(function () {
           	let id = $('#id').val();
            let pw = $('#pw').val();

            // 아이디 또는 비밀번호가 비어있는 경우 경고 메시지 출력
            if (id.trim() === '' || pw.trim() === '') {
                alert('아이디와 비밀번호를 입력하세요.');
                return;
            }

            // 로그인 요청을 Ajax로 전송
            $.ajax({
                type: 'POST',
                url: '${path}/tour', // 로그인 처리를 수행하는 컨트롤러의 URL
                data: {
                    id: id,
                    pw: pw
                },
                success: function (response) {
                    if (response === '1') {
                        // 로그인 성공 시 원하는 페이지로 리다이렉트 또는 필요한 작업 수행
                        window.location.href = '${path}/welcome'; // 성공 시 이동할 페이지
                    } else {
                        // 로그인 실패 시 에러 메시지 출력 또는 필요한 작업 수행
                        alert('로그인 실패');
                    }
                }
            });
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
