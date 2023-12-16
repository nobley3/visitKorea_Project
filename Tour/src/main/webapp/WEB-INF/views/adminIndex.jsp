<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>관리자메인페이지</title>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}
section{
	background-color: #f2ecfd;
	padding-top: 130px;
    padding-bottom: 50px;
} 
button {
	width: 350px;
	height: 125px;
	border-radius: 10px;
	border: none;
	border: 2px solid #ededed;
	background-color: white;
	margin-top: 40px;
	margin-right: 40px;
	border: 1px solid #c7b0f7;
}

button>a{
font-size: 20px;
}
.adminBox {
position:relative;
	width: 680px;
	height:700px;
	border-radius: 10px;
	background-color:#f7f7f7;
	box-shadow:0 8px 20px rgba(35,0,77,.2);
	display: flex;
    flex-direction: column;
    align-items: flex-end; 
}
 .buttonContainer{
 position:absolute;
 top:17px;
 left:20px;
  
  display: flex;
    flex-direction: column;
    align-items: center;
    
 }
 .adminBox img{
 width: 200px;

 } 
.boxWrap{
	display: flex;
	justify-content: center;

}
.h2box{
display: flex;
justify-content: center;
margin-bottom: 20px;
} 

.mainicon svg{
	width: 80%;
    height: 100%;
}
.mainlogo{
margin-left: 100px;
} 

</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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

</script>
</head>

<body>

<header><%@ include file="header.jsp" %></header>
<section>
<div class="h2box">
	 <h2 class="mainlogo">
                <a class="mainicon" href="/main/main.do">
                    <svg id="icon1" version="1.1" xmlns="http://www.w3.org/2000/svg"
                        xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="510px" height="86px"
                        viewBox="0 0 510 86" style="enable-background:new 0 0 510 86;" xml:space="preserve">
                        <path class="text-path"
                            d="M483.7,49.5h-39.2c-0.9,0-1.7,0.7-1.7,1.7c0,0.9,0.7,1.7,1.7,1.7h28.3v17c0,0.9,0.8,1.7,1.7,1.7c5.8,0,10.4-4.7,10.4-10.4V50.6C484.8,50,484.3,49.5,483.7,49.5z M453,41.3c3.3,3.8,8,5.4,13.7,5.4h1.8c0.9,0,1.7-0.7,1.7-1.7c0-0.9-0.7-1.7-1.7-1.7h0c-4.6,0-9.4-2.4-9.4-7.7V20.8c0-0.9-0.8-1.7-1.7-1.7h-8.7c-0.9,0-1.7,0.8-1.7,1.7v14.7c0,5.4-4.8,7.7-9.4,7.7h0c0,0-18.7,0-18.7,0c4.8-2,10.7-6.4,10.7-15.6v-6.8c0-0.9-0.8-1.7-1.7-1.7h-33.7c-0.9,0-1.7,0.7-1.7,1.7c0,0.9,0.7,1.7,1.7,1.7h23.3v5.2c0,15.3-7.7,15.6-7.7,15.6h-24.5c-0.9,0-1.7,0.7-1.7,1.7c0,0.9,0.7,1.7,1.7,1.7h19.7v23.2c0,0.9,0.8,1.7,1.7,1.7c5.8,0,10.4-4.7,10.4-10.4V46.6h22.3C445,46.6,449.7,45,453,41.3z M483.1,19.1h-8.7c-0.9,0-1.7,0.8-1.7,1.7v8.1h-4c-0.9,0-1.7,0.7-1.7,1.7s0.7,1.7,1.7,1.7h4v12.7c0,0.9,0.8,1.7,1.7,1.7h8.7c0.9,0,1.7-0.8,1.7-1.7V20.8C484.8,19.9,484.1,19.1,483.1,19.1z M467.1,0H351.6c-23.1,0-42,18.3-43,41.2H272C271,18.3,252.1,0,229,0c-23.7,0-43,19.3-43,43c0,23.7,19.3,43,43,43c23.1,0,42-18.3,43-41.2h36.6c1,22.9,19.9,41.2,43,41.2h115.5c23.7,0,43-19.3,43-43C510.1,19.3,490.8,0,467.1,0z M229,82.3c-21.7,0-39.3-17.6-39.3-39.3c0-21.7,17.6-39.3,39.3-39.3c21.7,0,39.3,17.6,39.3,39.3C268.3,64.7,250.7,82.3,229,82.3z M467.1,82.3H351.6c-21.7,0-39.3-17.6-39.3-39.3c0-21.7,17.6-39.3,39.3-39.3h115.5c21.7,0,39.3,17.6,39.3,39.3C506.4,64.7,488.7,82.3,467.1,82.3z M347.5,41.3c3.3,3.8,8,5.4,13.7,5.4h1.8c0.9,0,1.7-0.7,1.7-1.7c0-0.9-0.7-1.7-1.7-1.7h0c-4.6,0-9.4-2.4-9.4-7.7V20.8c0-0.9-0.8-1.7-1.7-1.7h-8.7c-0.9,0-1.7,0.8-1.7,1.7v14.7c0,5.4-4.8,7.7-9.4,7.7h0c-0.9,0-1.7,0.7-1.7,1.7c0,0.9,0.7,1.7,1.7,1.7h1.8C339.4,46.6,344.1,45,347.5,41.3z M377.6,19.1h-8.7c-0.9,0-1.7,0.8-1.7,1.7v8.1h-4c-0.9,0-1.7,0.7-1.7,1.7s0.7,1.7,1.7,1.7h4v12.7c0,0.9,0.8,1.7,1.7,1.7h8.7c0.9,0,1.7-0.8,1.7-1.7V20.8C379.3,19.9,378.5,19.1,377.6,19.1z M254.8,43.3h-18c4.8-2,10.7-6.4,10.7-15.7v-6.8c0-0.9-0.8-1.7-1.7-1.7h-33.7c-0.9,0-1.7,0.7-1.7,1.7c0,0.9,0.7,1.7,1.7,1.7h23.3v5.2c0,15.3-7.7,15.7-7.7,15.7h-24.5c-0.9,0-1.7,0.7-1.7,1.7c0,0.9,0.7,1.7,1.7,1.7h19.7v23.2c0,0.9,0.8,1.7,1.7,1.7c5.8,0,10.4-4.7,10.4-10.4V46.6h19.7c0.9,0,1.7-0.7,1.7-1.7C256.4,44,255.7,43.3,254.8,43.3z M378.1,49.5h-39.2c-0.9,0-1.7,0.7-1.7,1.7c0,0.9,0.7,1.7,1.7,1.7h28.3v17c0,0.9,0.8,1.7,1.7,1.7c5.8,0,10.4-4.7,10.4-10.4V50.6C379.3,50,378.8,49.5,378.1,49.5z"
                            stroke="undefined" stroke-width="1"></path>
                        <path class="text-path"
                            d="M66.2,35.2c0-3.3-1.4-6.2-4.2-8h4.1c0.8,0,1.5-0.7,1.5-1.5c0-0.8-0.7-1.5-1.5-1.5h-7.4v-4c0-0.6-0.5-1.1-1.1-1.1H53c-0.6,0-1.1,0.5-1.1,1.1v4h-7.4c-0.8,0-1.5,0.7-1.5,1.5c0,0.8,0.7,1.5,1.5,1.5h4.2c-2.7,1.8-4.2,4.7-4.2,8c0,5.4,3.9,9.8,10.9,9.8C62.4,45.1,66.2,40.7,66.2,35.2z M51.2,35.2c0-3.8,1.5-6.8,4.2-6.8c2.7,0,4.2,3.1,4.2,6.8c0,3.8-1.5,6.8-4.2,6.8C52.7,42.1,51.2,39,51.2,35.2z M35.4,19.6H31c-0.6,0-1.1,0.5-1.1,1.1v10.4h-4.2V21.1c0-0.6-0.5-1.1-1.1-1.1h-4.4c-0.6,0-1.1,0.5-1.1,1.1v21.8c-0.6,0.2-1.3,0.5-2.1,0.6c-0.9,0.2-1.9,0.3-3.1,0.3h-7V24.3H14c0.8,0,1.5-0.7,1.5-1.5c0-0.8-0.7-1.5-1.5-1.5H1c-0.6,0-1.1,0.5-1.1,1.1v23.4c0,0.6,0.5,1.1,1.1,1.1h12.6c1.3,0,2.4-0.1,3.3-0.4c0.9-0.3,1.6-0.6,2.2-1.1v15c0,0.6,0.5,1.1,1.1,1.1H22c2.1,0,3.7-1.6,3.7-3.7V35.1h4.2v25.9c0,0.6,0.5,1.1,1.1,1.1h1.8c2.1,0,3.7-1.6,3.7-3.7V20.7C36.5,20.1,36,19.6,35.4,19.6z M78.5,59H57.8v-9.6c0-0.6-0.5-1.1-1.1-1.1h-4.8c-0.6,0-1.1,0.5-1.1,1.1v11.5c0,0.6,0.5,1.1,1.1,1.1h26.6c0.8,0,1.5-0.7,1.5-1.5C80,59.7,79.3,59,78.5,59z M119,51h1.4c2.5,0,4.5-2,4.5-4.4V20.7c0-0.6-0.5-1.1-1.1-1.1H119c-0.6,0-1.1,0.5-1.1,1.1v29.1C117.9,50.5,118.4,51,119,51z M168.8,36h-5.3c0.5-0.6,0.9-1.6,1.2-3c0.3-1.4,0.5-2.6,0.5-3.8v-6.9c0-0.6-0.5-1.1-1.1-1.1h-27.3c-0.8,0-1.5,0.7-1.5,1.5c0,0.8,0.7,1.5,1.5,1.5h21.4v5.2c0,1.2-0.1,2.4-0.2,3.5c-0.1,1.2-0.3,2.2-0.7,3.1H132c-0.8,0-1.5,0.7-1.5,1.5c0,0.8,0.7,1.5,1.5,1.5h14.7v7.7h-10.1c-0.8,0-1.5,0.7-1.5,1.5c0,0.8,0.7,1.5,1.5,1.5h21.5v11.3c0,0.6,0.5,1.1,1.1,1.1h1.4c2.5,0,4.5-2,4.5-4.4v-9.9c0-0.6-0.5-1.1-1.1-1.1h-10.3v-7.7h15c0.8,0,1.5-0.7,1.5-1.5C170.3,36.6,169.6,36,168.8,36z M84,30.3h-5.5v-9.6c0-0.6-0.5-1.1-1.1-1.1h-4.8c-0.6,0-1.1,0.5-1.1,1.1v29.1c0,0.6,0.5,1.1,1.1,1.1H74c2.5,0,4.5-2,4.5-4.4V33.3H84c0.8,0,1.5-0.7,1.5-1.5C85.5,31,84.8,30.3,84,30.3z M124.8,59h-21.7V48.6c0-0.6-0.5-1.1-1.1-1.1h-4.8c-0.6,0-1.1,0.5-1.1,1.1v12.3c0,0.6,0.5,1.1,1.1,1.1h27.6c0.8,0,1.5-0.7,1.5-1.5C126.3,59.7,125.6,59,124.8,59z M111.8,38.5V22.3c0-0.6-0.5-1.1-1.1-1.1H90.9c-0.6,0-1.1,0.5-1.1,1.1v19.6c0,0.6,0.5,1.1,1.1,1.1h16.4C109.8,42.9,111.8,41,111.8,38.5z M104.8,40h-8V24.2h8V40z"
                            stroke="undefined" stroke-width="1">
                        </path>
                    </svg>
                </a>
            </h2>
</div>
	<div class="boxWrap">
		 
		<div class="adminBox">
			 
			 <div class="buttonContainer">
            <img src="resources/images/addmember.png" alt="Add Member">
             <img src="resources/images/Destination.png" alt="Travel Destination">
              <img src="resources/images/Festival.png" alt="Festival/Event">
               <img src="resources/images/Itinerary.png" alt="Itinerary">
             </div>
            <button>
                <a href="${path}/admin.regi">Add Member</a>
            </button>
           
            <button>
                <a href="${path}/spotlist">Travel Destination</a>
            </button>
           
            <button>
                <a href="${path}/festivalList">Festival/Event</a>
            </button>
           
            <button>
                <a href="${path}/courseList">Itinerary</a>
            </button>
       
		</div>
	</div>
	</section>
	
	<footer><%@ include file="footer.jsp" %></footer>
</body>
</html>