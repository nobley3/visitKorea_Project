<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
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
        margin: 0;
        padding: 0;
        text-decoration: none;
        list-style: none;
    }
    section{
    	padding-top: 140px;
    }
    .section_wrap{
    	margin: 0 auto;  
    	width: 940px;
    	margin: 0 auto;
    }
    
    /* 마이페이지 메인 링크 */
    .myqaTitle{      
        position: relative;
        padding-right: 20px;
        display:flex;
    }
    .myqaTag{
    	display: flex;
        color: #666666;
        width: 135px;
        height: 40px;
    }
    .myqaTag img{
    	width: 30px;
		height: 28px;	
		padding-right: 5px;
    }
    .myqaTag h4{
    	font-size: 20px;
    	letter-spacing: -1px;
    	line-height: 45px;
    }
    .myqaTitle input{
    	display: block;
    	width:600px;
    	font-weight: 800;
	    color: #333;
	    font-size: 36px;
	    letter-spacing: -1px;
	    border: 1px solid #bbb;
	    padding: 0 5px;
    }
    .myqaTitle h3{
	    color: #666666;
	    font-size: 20px;
	    line-height: 42px;
	    font-weight: 400;
    }
    .myqaTitle h3:before{
    	content:"|";
    	margin: 0 10px;
    	font-weight: 300;
    }
    
    .myqasubtitle{
    	width: 600px;
    	display: flex;
    	justify-content: space-between;
    	align-items: end;
    }
    .QAreg{
    	font-weight: 800;
	    color: #333333;
	    font-size: 36px;
	    letter-spacing: -1px;
    }
    .myqasubtitle button{
    	cursor: pointer;
    }
    .myqasubtitle button{
    	display: block;
    	width: 100px;
    	padding: 5px 0;
	    text-align: center;
	    font-size: 16px;
	    color: #fff;
	    background: #a9a9a9;
	    border: 1px solid #818181;
	    box-sizing: border-box;
	    font-weight: 800;
    }
	
	
	/* 리스트 박스 + 메뉴 박스 */
    .viewClick {
        margin-top: 24px;
        display: flex;
    }

	/* 리스트 박스 */
    .leftBox {
        width: 600px;
        border-top: 1px solid #767676;
    }
    .leftBox h3{
    	margin-top: 20px;
	    padding-bottom: 10px;
	    font-size: 18px;
	    color: #333333;
    }
    .leftBox span{
    	font-size: 14px;
    	color: #ff3333;
    }
    .leftBox input{
    	width: 100%;
    	height: 40px;
    	padding: 10px;
    	box-sizing: border-box;
    	border: 1px solid #cccccc;
    	font-size: 20px;
    }
    .leftBox textarea{
    	width: 100%;
    	height: 120px;
    	padding: 10px;
	    box-sizing: border-box;
	    border: 1px solid #cccccc;
	    resize: none; /* 크기 조절 기능 비활성화 */
	    font-size: 20px;
    }
    .fileuploadBox{
    	padding: 9px 15px;
	    border: 1px solid #cccccc;
	    background-color: #f7f7f7;
	    display: flex;
	    align-items: center;
    }
    .fileuploadBox p:nth-child(1){
    	color: #333;
    	border: 1px solid #cccccc;
    	background-color: #e5e5e5;
	    font-size: 14px;
	    text-align: center;
	    line-height: 28px;
	    padding: 0 10px;
	    margin-right: 15px;
    }
    .fileuploadBox p:nth-child(2){
	    color: #666;
	    font-size: 14px;
	    line-height: 30px;
    }
    .btnWrap{
    	display: flex;
    	justify-content: center;
    }
    .btnWrap button{
    	display: block;
	    width: 150px;
	    margin: 20px;
	    padding: 10px 10px;
	    text-align: center;
	    font-size: 16px;
	    color: #fff;
	    background: #13294b;
	    border: 1px solid #13294b;
	    box-sizing: border-box;
	    font-weight: 800;
	    cursor: pointer;
    }
    .btnWrap button:nth-child(1){
    	background: white;
    	color: black;
    }
    
    
    /* 오른쪽 메뉴바 */
    .rightBox{
    	margin-left: 40px;
    	width: 300px;
    	height: 170px;
    	background: #f7f7f7;
    	padding: 10px 20px 30px 0;
    }

    .rightBox li{
    	width: 100%;
        padding-top: 20px;
        font-size: 16px;
        font-weight: 800;
    }
    .rightList{
        display: block;
        padding-left: 20px;
        color: #666;
    }
    .rightList_click{
        background: url(https://korean.visitkorea.or.kr/resources/images/sub/ico_mypagemenu.png) 0 0 no-repeat;
        background-size: 4px 100%;
        color: #333;
    }
    .rightList:hover {
        background: url(https://korean.visitkorea.or.kr/resources/images/sub/ico_mypagemenu.png) 0 0 no-repeat;
        background-size: 4px 100%;
        color: #333;
    }
</style>

<script>
	function deleteqa(qacode){
		if(confirm("정말 삭제하시겠습니까?")){
			alert("삭제되었습니다.");
			$.ajax({
		 		type:"post" ,
		 		url: "${path}/myQAdelete",
		 		data: "qacode=" + qacode,
		 		success : function( data){
		 			window.location.href="${path}/mypageQA.do";
		 		},
		 		error: function(){
		 			alert( "error");
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
	
		<div class="section_wrap">
			<div class="myqaTitle"> 
                <a class="myqaTag" href="${path}/mypage.do">
	                <img src="https://korean.visitkorea.or.kr/resources/images/sub/ico_tit_list5.png">
	    			<h4>마이페이지</h4>
                </a>
                <h3>Q&A</h3>
		    </div>
		    
		    <div class="myqasubtitle">
		    <h2 class="QAreg">질문수정</h2>
		    <button onclick="deleteqa('${item.qacode}')">삭제</button>
		    </div>
		    
		    <div class="viewClick">
		    	<form action="${path}/myQAupdate" method="post">
		    		<input type="hidden" name="qacode" value="${item.qacode }">
			    	<div class="leftBox">
			    		<h3>제목 <span>(필수)</span></h3>
			    		<input name="qatitle" value="${item.qatitle }">
			    		<h3>내용 <span>(필수)</span></h3>
			    		<textarea name="qacontent">${item.qacontent }</textarea>
			    		<h3>파일첨부</h3>
			    		<div class="fileuploadBox">
			    			<p>파일첨부</p>
			    			<p>* 파일첨부는 최대 1개 까지 가능합니다.</p>
			    		</div>
			    		<div class="btnWrap">
				    		<button type="reset">취소</button>
				    		<button type="submit">수정</button>
			    		</div>
			    	</div>
		    	</form>
		    	
		    	<ul class="rightBox">
                    <li>
                        <a class="rightList" href="${path}/mypagelike.do">좋아요</a>
                    </li>
                    <li>
                        <a class="rightList" href="${path}/mypagecourse.do">코스</a>
                    </li>
                    <li>
                        <a class="rightList" href="${path}/mypagetalk.do">댓글</a>
                    </li>
                    <li>
                        <a class="rightList rightList_click" href="${path}/mypageQA.do">Q&A</a>
                    </li>
                </ul>
		    	
		    
		    
		    
		    
		</div>
		
		
		
	</section>
	
	<footer><%@ include file="footer.jsp" %></footer>
</body>
</html>