<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록페이지</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="${path}/resources/javascript/adminJoin.js"></script>
<link href="${path}/resources/css/adminJoin.css" rel="stylesheet" />
</head>
<body>

	<header><%@ include file="header.jsp" %></header>

	<section>
		<div class="joinwrap">
			<!-- 이미지 -->
			<div class="joinimg">
				<img class="img1" alt="joinimg" src="${path}/resources/images/backgroundcolor2.jpg"
					alt="joinimg">
			
			<h2>새로운 시작, 새로운 도전!<br>
			한국관광공사의 가족이 되신 걸 환영합니다.</h2>
				<img alt="" class="img2" src="${path}/resources/images/hello.png">
			</div>
			<div class="formwrap">
			<b>Add Member</b>
			<form action="${path}/insertAdmin" method="post">

				<!-- 아이디 -->
				<div class="joinContents">
					<label for="userid"></label> 
					<img class="icon" alt=""src="https://cdn.icon-icons.com/icons2/3138/PNG/512/profile_user_avatar_person_icon_192481.png">
					<input id="userid" type="text" name="userid" placeholder="ID : 영문 대소문자와 숫자를 포함하여 4~12자리로 입력하세요.">
					<button type="button" id="checkid">중복확인</button>
				</div>
				
				<div class="confirm" id="confirmid" style="font-size: 13px;"></div>

				<!-- 닉네임 -->
				<div class="joinContents">
					<label for="nickname"></label> 
					<img class="icon" alt=""src="https://cdn.icon-icons.com/icons2/1642/PNG/512/ididentitycarddriverlicense_109689.png">
					<input id="nickname" type="text" name="nickname"placeholder="사원번호 입력">
				</div>
				<!-- 비밀번호 -->
				<div class="joinContents">
					<label for="pw"></label> 
					<img class="icon" alt=""src="https://cdn.icon-icons.com/icons2/4066/PNG/512/locker_safe_lock_password_secure_protection_safety_security_shield_icon_258626.png">
					<input id="pw" type="password" name="pw" placeholder="PW : 영문,숫자,특수문자 포함 8자~16자리로 입력하세요."> 
					<i class="fa fa-eye fa-lg" id="showPw"></i>
				</div>
				<div class="joinContents">
					<label for="checkpw"></label> 
					<img class="icon" alt=""src="https://cdn.icon-icons.com/icons2/4066/PNG/512/locker_safe_lock_password_secure_protection_safety_security_shield_icon_258626.png">
					<input id="checkpw" type="password" name="checkpw" placeholder="비밀번호 재입력"> 
					<i class="fa fa-eye fa-lg" id="showPw"></i>
				</div>
				<div class="confirm" id="confirmpw" style="font-size: 13px;"></div>

				<div class="btnBox">
				<button id="registerbtn" type="button">가입</button>
				<button id="cancelbtn" type="button">취소</button>
				</div>
				<!-- 결과 메세지 창 -->
				<div id="resultMessage" style="font-size: 13px;"></div>
			</form>
			</div>
		</div>
		
	</section>

	<footer><%@ include file="footer.jsp" %></footer>
</body>
</html>