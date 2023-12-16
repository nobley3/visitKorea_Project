<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>축제/행사 리스트</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="${path}/resources/css/SpotList.css" rel="stylesheet"/>

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
	<div class="tablewrap">
    <h2>[축제/행사 리스트]</h2>

    <table border="1">
        <tr>
            <th>순번</th>
            <th>Title</th>
            <th>Address</th>
        </tr>
        <c:forEach var="Fspot" items="${eventspots}">
            <tr>
                <td>${Fspot.rownum}</td>
                <td style="display: none;">${Fspot.contentid}</td>
                <td style="display: none;">${Fspot.contenttypeid}</td>
                <td>${Fspot.title}</td>
                <td>${Fspot.address}</td>
                <td><input type="checkbox" name="checkbox" value="${Fspot.contentid}:${Fspot.contenttypeid}" class="spotCheckbox" ${not empty Fspot.ck ? 'checked' : ''}></td>
            </tr>
        </c:forEach>
    </table>
    
    <button id="confirmbtn">축제/행사 <br>확인</button>
    </div>
    
    <div class="tablewrap">
    <h2>[체크된 축제/행사 리스트]</h2>
    <table border="1" id="selectedFestival">
        <tr>
            <th>contentid</th>
            <th>순번</th>
            <th>Title</th>
            <th>Address</th>
        </tr>
        
        <tbody id="selectedFestivalList"></tbody>
         
    </table>
    <button id="deletebtn">축제/행사 <br> 삭제</button>
    </div>
    </section>
    
    
    <footer><%@ include file="footer.jsp" %></footer>
    
    
    
    <script type="text/javascript">
    $(document).ready(function(){
        
        $.ajax({
            type: "GET",
            url: "/tour/selectedF",
            success : function(selectedSpots){
                showCheckedList(selectedSpots);  
            },
            error:function(err){
                console.log(err);
            }
        });
        
        $("#confirmbtn").click(function(){
        	
            let spotCheckboxes = $("input[type='checkbox']:checked");
            let selectedSpots = [];
            
            spotCheckboxes.each(function(){
            	
                let values = $(this).val().split(":")
                let row = $(this).closest('tr');
                
                selectedSpots.push({
                    contentid: values[0],
                    contenttypeid: values[1],
                    rownum: row.find('td:eq(0)').text(),  
                    title: row.find('td:eq(3)').text(),    
                    address: row.find('td:eq(4)').text() 
                });
            });
            
            
            $.ajax({
                type:"post",
                url: "/tour/confirmFlist",
                contentType: 'application/json',
                data: JSON.stringify(selectedSpots),
                success:function(data){
                    alert(" 축제/행사가 성공적으로 저장되었습니다.");
                    showCheckedList(selectedSpots);
                    location.reload();
                },
                error:function(err){
                    alert("오류가 발생했습니다.");
                    console.log(err);
                }
            });
        });

        $("#deletebtn").click(function(){
        	
        	let Checkboxes = $("input[name='selectedCheckbox']:checked");
        	let selectedSpotList  = [];
        	
        	for(let i=0;i<Checkboxes.length;i++){
        		let ck = Checkboxes[i];
        		let deleteItem  = ck.value;
        		selectedSpotList.push( deleteItem);
        	}
        	
            $.ajax({
           	 
           	 type: "POST",
                url: "/tour/deleteSelectedSpots",
                contentType: 'application/json',
                data: JSON.stringify(selectedSpotList),
                success: function (data) {
		            alert("여행지가 성공적으로 삭제되었습니다.");
		            location.reload(); // 페이지 새로고침
		           console.log(selectedSpotList);
		        },
		        error:function(err){
		        	 alert("dugodwl오류가 발생했습니다.");
                    console.log(err);
		        }
		      
            });
        });
        
        
        function showCheckedList(selectedSpots){
            let selectedFestivalList = $("#selectedFestivalList"); //tbody
            selectedFestivalList.empty();
            
            $.each(selectedSpots,function(index,Fspot){ //table
                let row = $("<tr>");
                row.append($("<td>").text(Fspot.contentid));
                row.append($("<td>").text(Fspot.rownum));
                row.append($("<td>").text(Fspot.title));
                row.append($("<td>").text(Fspot.address));
                row.append($("<td>").html("<input type='checkbox' name='selectedCheckbox' value='" + Fspot.contentid +"'>"));
                selectedFestivalList.append(row);
            });
        }
    });
    </script>
</body>
</html>
