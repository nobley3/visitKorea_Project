<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TourKorea</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<style>
* {
	margin: 0px;
	padding: 0px;
}

/* 여행톡톡 큰 박스 */
	.TravleTalkBox { 
		width: 940px;
		margin: 0 auto;
	}
	.TravelTitle {
		height: 40px;
	}
	.TravelTitle h3 {
		font-size: 24px;
		padding: 0 0 0 12px;
	}
	.TravelCommentBox { /* 여행톡톡 댓글 틀 박스 */
		position: relative;
		width: 930px;
		height: 150px;
		background-color: #f7f7f7;
		margin: 0 auto;
		margin-left: 5px;
	}
	.TravelCommentBox input { /* 여행톡톡 댓글 박스 */
		border: 1px solid #e5e5e5;
		margin: 10px 10px 10px;
		height: 80px;
		width: 880px;
		font-size: 15px;
		margin-left: 15px;
		background-color: white;
		padding: 0 10px;
	}
	.regbtn { /* 여행톡톡 등록 버튼 */
		position: absolute;
		margin-top: 5px;
		margin-left: 843px;
		width: 73px;
		height: 33px;
		background-color: #13294b;
		color: white;
		font-size: 17px;
		font-weight: 700;
		cursor: pointer;
	}
	.goodcommentbox { /*댓글창 가장 큰 박스*/
		width: 940px;
		display: flex;
	}
	.reviewprofilebox { /*프로필 박스*/
		width: 80px;
	}
	.goodcommentbigbox { /*내용 포함 큰 박스*/
		width: 880px;
	}
	.reviewprofile { /*프로필*/
		width: 60px;
		height: 60px;
		border-radius: 30px;
		border: 1px solid #666;
		margin-left: 5px;
		margin-top: 15px;
	}
	.reviewprofile img { /*프로필 이미지 사이즈*/
		width: 60px;
		height: 60px;
		border-radius: 30px;
		border: none;
	}
	.commentbox { /*댓글 박스*/
		width: 860px;
		height: 30px;
		margin-top: 10px;
		display: flex;
	}
	.commentbox input{
		width: 600px;
		font-size: 15px;
		height: 25px;
		border: none;
    	line-height: 10px;
	}
	.commentbox button{
		cursor: pointer;
	}
	#update-ok, #modify-ok{
		border: none;
		margin-left: 10px;
		width: 50px;
		background-color: white;
	}	
	.namedatebox { /*이름 날짜 박스*/
		width: 860px;
		height: 20px;
		display: flex;
	}
	.namebox {
		font-size: 15px;
		color: #707070;
		width: 100px;
		height: 20px;
	}
	.nameline {
		height: 20px;
	}
	.datebox {
		font-size: 15px;
		color: #707070;
		width: 100px;
		height: 20px;
	}
	.commentgood {
		width: 860px;
		height: 30px;
		display: flex;
   		align-items: center;
	}
	.commentgood button {
		background-color: white;
		border: none;
		width: 80px;
		height: 15px;
		margin-left: 10px;
		cursor: pointer;
	}
	.commentgood button.btn1{
		z-index: 999;
		background: url(https://korean.visitkorea.or.kr/resources/images/sub/btn_reply_01.png) no-repeat;
	}
	.commentgood button.btn1.active{
		z-index: 999;
		background: url(https://korean.visitkorea.or.kr/resources/images/sub/btn_reply_01.png) no-repeat;
		background-position: 0 -15px;
	}
	.commentgood button.btn2 {
		z-index: 999;
		background: url(https://korean.visitkorea.or.kr/resources/images/sub/btn_reply_02.png) no-repeat;
	}
	.modifydel {
		width: 860px;
		height: 30px;
		display: flex;
   		align-items: center;
	}
	.modifydel button{
		border: 1px solid #e5e5e5;
		background-color: white;
		width: 80px;
		height: 20px;
		cursor: pointer;
		margin-right: 10px;
	}
	
	
	
	/* 답글 창 */
	.replyTable{
		width: 840px;
		margin: 10px 0 0 75px;
		padding: 5px 0;
		border-collapse: collapse;
		display: none;
	}
	.replyTable thead tr:first-child{
		text-align: end;
		position: relative;
	}
	.replyTable img{
		width: 15px;
		height: 15px;
		position: absolute;
		top: -14px;
		right: 130px;
		cursor: pointer;
	}
	.replyList{
		margin-top : 5px;
	}
	.replyList td{
		padding: 10px 5px;
	}
	.replynum{
		font-size: 15px;
		font-weight:700;
		border-bottom: 1px solid #e5e5e5;
		width: 35px;
    	text-align: center;
	}
	.replytext{
		width: 500px;
		font-size: 15px;
		border-bottom: 1px solid #e5e5e5;
	}
	.replytext input{
		border : 1px solid #e5e5e5;
		display: block;
		width: 100%;
		height: 30px;
		font-size: 15px;
	}
	.replyinfonick{
		width: 120px;
		border-bottom: 1px solid #e5e5e5;
		text-align: center;
	}
	.replywriteday{
		width: 100px;
		border-bottom: 1px solid #e5e5e5;
		text-align: center;
	}
	.replyBtn{
		width: 120px;
		text-align: center;
		display: inline-block;
	}
	.replyBtn button{
		margin-right: 10px;
		cursor: pointer;
	}
	
	
	.replyBoxreg td:first-child{
		background-color: #f7f7f7;
		padding: 5px;
	}
	.replyBoxreg input{
		border: 1px solid #e5e5e5;
		background-color: white;
		display: inline-block;
		width: 630px;
		height: 30px;
		margin-right: 10px;
		
		
	}
	
	.replyBoxreg button{
		background-color: #13294b;
		display: inline-block;
		width: 50px;
		height: 30px;
		color: white;
	    font-size: 12px;
	    font-weight: 700;
	    cursor: pointer;
	}
	
</style>

<script>
	//리뷰 섹션	
	// 리뷰 입력창에서 로그인 판별
	function inputclick(){
		let userId = '<%= session.getAttribute("userId")%>'; // 세션에 저장된 userId값 가져오기
			if (userId == 'null') {
				alert("로그인이 필요한 서비스입니다.");
				window.location.href = "${path}/loginform";
		    }
	}
	
	
	function reviewregister(contentid) {
		let comment = $("#comment").val();
		$.ajax({
			type: "POST",
			dataType: "text",
			url: "${path}/reviewregister",
			data: "comment="+comment+"&contentid="+contentid,
			success: function(data) {
				window.location.reload();
			},
			error: function() {
				alert("error");
			}
		});
		
		
	}
	
	// 리뷰 삭제
	function reviewdelete(reviewcode) {
		
	    if(!confirm('댓글이 영구적으로 삭제됩니다. 정말 삭제하시겠습니까?')){
	        return false;
	    }
		
	    alert("삭제되었습니다.");
		$.ajax({
			type:"DELETE",
			dataType:"text",
			url:"${path}/reviewdelete/"+reviewcode,
			success:function(data){
				window.location.reload();
			},
			error:function(){
				alert("error");
			}
		});
	}
	
	
	//수정클릭시  확인버튼보여주기, readOnly해제
	function reviewupdate(obj){
		// 현재 버튼을 기준으로 아이템박스 찾기 ( row )
		let item  =  obj.parentElement.parentElement.parentElement;
		
		let inputbox = item.querySelector("#content");
		inputbox.readOnly = false;
		
		//확인버튼 보여주기
		item.querySelector("#update-ok" ).style.display = "inline-block";
		item.querySelector("#modify-ok").style.display = "inline-block";
		//수정하기 위해서   readOnly 해제하기
		item.querySelector("#content" ).readOnly = false;
	
		inputbox.style.border = "0.1px solid lightgray";
		inputbox.style.borderRadius = "10px";
	}
	
	//수정 확인
	function updatesend(reviewcode, obj){
		// 현재 버튼을 기준으로 아이템박스 찾기 ( row )
		let item  =  obj.parentElement.parentElement;
		
		item.querySelector("#content" ).readOnly;
		
		let content   = item.querySelector("#content" ).value;
		let comment = {reviewcode: reviewcode, content: content};
		let comments = JSON.stringify(	comment);
		
		//업데이트 버튼 클릭 시 변경 내용 노출
		$.ajax({
			type:"PUT",
			data: comments,
			contentType: "application/json",
			url:"${path}/reviewupdate",
			success: function(data) {
				window.location.reload();
			},
			error: function() {
				alert("error");
			}
		});    	
	}
	
	// 수정 취소
	function back() {
		 window.location.reload();
	}
	
	// 리뷰 좋아요
	function changeimg(reviewcode, a) {
		//let good = document.querySelector(".commentgood button.btn1");
		a.classList.toggle("active");
	}
	
	
	
	
	// 답글 조회
	function selectReply(parentcode, tableId, tbodyId){
		let tableElement = document.getElementById(tableId);
		tableElement.style.display = "block";
		
		$.ajax({
			type: "POST",
			url: "${path}/replyselect",
			data: "parentcode="+parentcode,
			success: function(data) {
				$(".replyTableTbody").empty();
				replyToHtml(data, tbodyId);
			},
			error: function() {
				alert("error");
			}
		});
	}
	
	function replyToHtml(data, tbodyId){
		let userId = '<%= session.getAttribute("userId")%>'; // 세션에 저장된 userId값 가져오기
		
		let item = data.replylist;
		let str="";
		for(let i=0; i<item.length; i++){
			str += "<tr class=\"replyList\">";
			str += "	<td class=\"replynum\">"+(i+1)+"</td>";
			str += "	<td class=\"replytext\">"+item[i].content+"</td>";
			str	+= "	<td class=\"replyinfonick\">"+item[i].nickname+"</td>";
			str	+= "	<td class=\"replywriteday\">"+item[i].writeday+"</td>";
			str	+= "	<td class=\"replyBtn\">";
			if(userId == item[i].userid){
				str	+= "		<button onclick=\"replyupdateform('"+item[i].parentcode+"','"+item[i].reviewcode+"', this)\">수정</button>";
				str	+= "		<button onclick=\"replydelete('"+item[i].parentcode+"', '"+item[i].reviewcode+"', this)\">삭제</button>";
			}
			str	+= "	</td>";
			str	+= "</tr>";
		}
		$("#" + tbodyId).append(str);
	}
	
	// 답글 닫기
	function replyTableClose(id){
		$(".replyTableTbody").empty();
		let tableElement = document.getElementById(id);
		tableElement.style.display = "none";
	}
	
	// 답글 등록
	function replyRegister(parentcode, contentid, obj){
		let tdElement = obj.parentElement;
		let inputElement = tdElement.querySelector('input');
		let content = inputElement.value;
		
		
		let tableElement = obj.closest('table');
		let tableId = tableElement.id;
		let tbodyElement = tableElement.querySelector("tbody");
		let tbodyId = tbodyElement.id;
		
		$.ajax({
			type: "POST",
			url: "${path}/replyregister",
			data: "parentcode="+parentcode+"&content="+content + "&contentid="+contentid,
			success: function(data) {
				$(".replyTableTbody").empty();
				inputElement.value="";
				selectReply(parentcode , tableId, tbodyId);
			},
			error: function() {
				alert("error");
			}
		});
		
	}
	
	// 답글 삭제
	function replydelete(parentcode, reviewcode, obj) {
		
	    if(!confirm('답글이 영구적으로 삭제됩니다. 정말 삭제하시겠습니까?')){
	        return false;
	    }
	    
	    let tableElement = obj.closest('table');
		let tableId = tableElement.id;
		let tbodyElement = tableElement.querySelector("tbody");
		let tbodyId = tbodyElement.id;
		
	    
	    alert("삭제되었습니다.");
		$.ajax({
			type:"DELETE",
			dataType:"text",
			url:"${path}/reviewdelete/"+reviewcode,
			success:function(data){
				$(".replyTableTbody").empty();
				selectReply(parentcode , tableId, tbodyId);
			},
			error:function(){
				alert("error");
			}
		});
		
	}
	
	// 답글 수정
	function replyupdateform(parentcode, reviewcode, obj){
		let trElement = obj.closest('tr');
		let tdElement = trElement.querySelector(".replytext");
		let content = tdElement.textContent;
		
		tdElement.textContent = ""; // td안에 있는 텍스트 제거
		let inputElement = document.createElement("input");
	    inputElement.type = "text"; // 또는 다른 input 타입 설정 가능
	    inputElement.value = content; 
	    tdElement.appendChild(inputElement);
	    
	    let tdBtnElement = trElement.querySelector(".replyBtn");
	    while (tdBtnElement.firstChild) {
	    	tdBtnElement.removeChild(tdBtnElement.firstChild);
	    }
	    
	    let buttonElement = document.createElement("button");
	    buttonElement.textContent = "확인"; // 버튼에 표시할 텍스트 설정
	    buttonElement.onclick = function(){replyupdate(parentcode, reviewcode, this)}; // 버튼에 함수달기
	    tdBtnElement.appendChild(buttonElement); // 버튼을 tdBtnElement에 추가
	    
	    let buttonElement2 = document.createElement("button");
	    buttonElement2.textContent = "취소"; // 버튼에 표시할 텍스트 설정
	    buttonElement2.onclick = function(){replyBack(parentcode, reviewcode, this)}; // 버튼에 함수달기
	    tdBtnElement.appendChild(buttonElement2); // 버튼을 tdBtnElement에 추가
	}
	
	
	function replyupdate(parentcode, reviewcode, obj){
		
		if(confirm("수정하시겠습니까?")){
			let trElement = obj.closest('tr');
			let tdElement = trElement.querySelector(".replytext");
			let inputElement = tdElement.querySelector("input");
			let content = inputElement.value;
			
			let tableElement = obj.closest('table');
			let tableId = tableElement.id;
			let tbodyElement = tableElement.querySelector("tbody");
			let tbodyId = tbodyElement.id;
			
			
			//업데이트 버튼 클릭 시 변경 내용 노출
			$.ajax({
				type:"post",
				url:"${path}/replyupdate",
				data: "reviewcode="+reviewcode+"&content="+content,
				success: function(data) {
					$(".replyTableTbody").empty();
					selectReply(parentcode , tableId, tbodyId);
				},
				error: function() {
					alert("error");
				}
			}); 
		}
	}
	
	function replyBack(parentcode, reviewcode, obj){
		
		let tableElement = obj.closest('table');
		let tableId = tableElement.id;
		let tbodyElement = tableElement.querySelector("tbody");
		let tbodyId = tbodyElement.id;
		
		$(".replyTableTbody").empty();
		selectReply(parentcode , tableId, tbodyId);
		
	}

</script>

</head>


<body>



	 		<!-- 여행톡 박스 -->
	        <div class="TravleTalkBox" id="TravleTalkBox">
				<!-- 제목-->
				<div class="TravelTitle">
					<h3>여행톡</h3>
				</div>
	
				<div class="TravelCommentBox">
					<div>
						<c:choose>
							<c:when test="${sessionScope.userId == null }">
								<input type="text" id="comment" onclick="inputclick()" placeholder="로그인 후 소중한 댓글을 남겨주세요.">
							</c:when>
							<c:otherwise>
								<input type="text" id="comment" onclick="inputclick()" placeholder="소중한 댓글을 남겨주세요.">
							</c:otherwise>
						</c:choose>
					</div>
					<div>
						<button class="regbtn" onclick="reviewregister('${content.contentid}')">등록</button>
					</div>
				</div>
	
				<c:forEach var="comment" items="${reviewlist}" varStatus="loop">
					<!--  row  -->
					<div class="goodcommentbox">
						<div class="reviewprofilebox">
							<div class="reviewprofile"><img src="${comment.profileurl}"></div>
						</div>
						<div class="goodcommentbigbox">
							<div class="commentbox">
								<input type="text"  id="content" onfocus="inputclick()" value="${comment.content}" readOnly >
								<input type="hidden" value="${comment.reviewcode}" readOnly> 
								<button id="update-ok" style="display: none;" onclick="updatesend(${comment.reviewcode}, this)">확인</button>
								<button id="modify-ok" style="display:none;" onclick="back()">취소</button>
							</div>
							<div class="namedatebox">
								<div class="namebox">${comment.nickname}</div>
								<div class="datebox">${comment.writeday}</div>
							</div>
							
							<div class="commentgood" id='commentgood'>
								<button type="button" class="btn1" onclick="changeimg(${comment.reviewcode}, this)">
									<img class="goodbtn" alt="">하트
								</button>
								<button type="button" class="btn2" onclick="selectReply('${comment.reviewcode}', 'replyBox${loop.index}', 'tbody${loop.index}')">답댓</button>
							</div>
							
							
							<c:if test="${sessionScope.userId == comment.userid}">
								<div class="modifydel">
									<button onclick="reviewupdate(this)">수정</button>
									<button onclick="reviewdelete('${comment.reviewcode}')">삭제</button>
								</div>
							</c:if>
						</div>
					</div>
					
					<!-- 답글 리스트 및 등록 버튼 -->
					<table class="replyTable" id="replyBox${loop.index}">
						<thead>
							<tr>
								<th colspan="5">
									<img onclick="replyTableClose('replyBox${loop.index}')" src="https://korean.visitkorea.or.kr/resources/images/curation/btn_pop_close.png">
								</th>
							</tr>
						</thead>
						<tbody class="replyTableTbody" id="tbody${loop.index}"></tbody>
						<tfoot>
							<tr><td colspan="5" style="height: 10px;"></td></tr>
							<tr class="replyBoxreg">
								<td colspan="4">
									<c:choose>
										<c:when test="${sessionScope.userId == null }">
											<input onclick="inputclick()" placeholder="로그인 후 답글을 입력하세요.">
										</c:when>
										<c:otherwise>
											<input onclick="inputclick()" placeholder="답글을 입력하세요.">
										</c:otherwise>
									</c:choose>
									<button onclick="replyRegister('${comment.reviewcode}', '${content.contentid}', this)">등록</button>
								</td>
							</tr>
						</tfoot>
					</table>
					
				</c:forEach>
			</div>
			


</body>

</html>