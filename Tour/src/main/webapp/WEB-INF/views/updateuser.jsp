<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>TourKorea</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="${path}/resources/javascript/tourJoinupdate.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="${path}/resources/css/tourJoinupdate.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

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

</script>

</head>
<body>
	<header><%@ include file="header.jsp"%></header>

<section>
		<h1>개인정보 수정</h1>
		<p>수정하실 개인정보를 입력해주시기 바랍니다.</p>


		<div class="joinwrap">
			<!-- 이미지 -->
			<div class="joinimg">
				<img alt="joinimg" src="${path}/resources/images/modify.png"
					alt="joinimg">
			</div>
			<div class="formwrap">
				<b>Personal Information</b>
				<!-- 아이디 -->
				<form action="${path}/updateUser" method="post">
					<div class="joinContents">
						<label for="userid"></label> <img class="icon" alt=""
							src="https://cdn.icon-icons.com/icons2/3138/PNG/512/profile_user_avatar_person_icon_192481.png">
						<input type="text" readonly="readonly" value="${user.userid}" />
						
					</div>
					<!-- 닉네임 -->
					<div class="joinContents">
						<label for="nickname"></label> 
						<img class="icon" alt=""
						src="https://cdn.icon-icons.com/icons2/1642/PNG/512/ididentitycarddriverlicense_109689.png">
						<input type="text" id="nickname"name="nickname" value="${user.nickname}"/>
						<button type="button" id="checkNickname">중복확인</button>
						<br>
					</div>
					<div class="confirm" id="confirmnickname" style="font-size: 13px;"></div>
				

					<!-- 비밀번호 -->
					<div class="joinContents">
						<label for="pw"></label> <img class="icon" alt=""
							src="https://cdn.icon-icons.com/icons2/4066/PNG/512/locker_safe_lock_password_secure_protection_safety_security_shield_icon_258626.png">
						<input id="pw" type="password" name="pw"
							placeholder="영문,숫자,특수문자 포함 8자~16자">
							<i class="fa fa-eye fa-lg" id="showPw"></i>
					</div>
					<div class="joinContents">
						<label for="checkpw"></label> <img class="icon" alt=""
							src="https://cdn.icon-icons.com/icons2/4066/PNG/512/locker_safe_lock_password_secure_protection_safety_security_shield_icon_258626.png">
						<input id="checkpw" type="password" name="checkpw"
							placeholder="비밀번호 재입력"> <i class="fa fa-eye fa-lg"
							id="showPw"></i>
					</div>
					<div class="confirm" id="confirmpw" style="font-size: 13px;"></div>
				
				<!-- 이메일 -->
				<div class="joinContents2">
					<img class="icon" alt=""
						src="https://cdn.icon-icons.com/icons2/629/PNG/512/email-outlined-envelope-back-symbol_icon-icons.com_57846.png">
					<input id="email" type="text" class="email" placeholder="이메일 입력">
					<span>@</span> <input id="emailD" type="text" class="emailD"
						placeholder="직접입력"> <select class="email" id="emaillist">
						<option value="type">직접 입력</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="google.com">google.com</option>
						<option value="kakao.com">kakao.com</option>
					</select>
				</div>
				<!-- 회원가입 -->
				<div>
					<button type="submit" id="modifybtn">수정</button>
					<button type="button" id="cancelbtn">취소</button>
				</div>
				</form>
				<!-- 결과 메세지 창 -->
				<div id="resultMessage" style="font-size: 13px;"></div>

			</div>
		</div>

	</section>
	<footer><%@ include file="footer.jsp"%></footer>
	
	<script type="text/javascript">
	
	$(document).ready(function(){
		
		
		
	});

	
	</script>
</body>
</html>