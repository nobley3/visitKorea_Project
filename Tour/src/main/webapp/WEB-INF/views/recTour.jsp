<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Noto+Sans:wght@100&family=Orbit&display=swap" rel="stylesheet">
<link href="${path}/resources/css/tourMainFooter.css" rel="stylesheet"/>  
<script src="${path}/resources/javascript/common.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
*{
  margin: 0;
  padding: 0;
}
section{
     padding-top : 30px;
     height: 1400px;
	}

dl, ul, ol, menu, li {
  list-style: none;
}
.back_div{
  background-color: #9bc1fe;
  margin-top: 60px;
  height: 100%;
}

.area_div{
  width: 700px;
  overflow: visible;
  height: 1073px;
  top: 145px;
  bottom: 55px;
  margin: 0 auto;
  position: relative;
  list-style: none;
  padding: 0;
  background-color: white;
  border-radius: 10px;
}
.nj_top{
  height: 165px;
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  padding: 40px 50px 0;
}
.nj_box{
  height: 658px;
  margin-bottom: 25px;
}
.nj_stit{
  display: block;
  height: 16px;
  text-indent: -9999px;
  background: url('http://korean.visitkorea.or.kr/resources/images/curation/cos_stit.png') 0 0 no-repeat;
}
.nj_step{
  position: absolute;
  right: 137px;
  top: 37px;
  display: flex;
  font-size: 16px;
  color: #767676;
  letter-spacing: -0.5px;
}
.nj_step em{
  font-size: 0;
  line-height: 0;
  text-indent: -9999px;
}
.nj_on{
  font-weight: 1000;
  color: #333;
  
}
.nj_on1{
  font-weight: 1000;
  color: #333;
  
}
.nj_on:after {
  content: '';
  display: inline-block;
  height: 2px;
  margin: 0 0 0 15px;
  background: #333;
  width: 55px;
  font-weight: 1000;
}
.nj_step span{
  display: flex;
  align-items: center;
  margin-left: 15px;
}
.nj_top > em {
  display: block;
  margin: 30px 0 8px;
  font-weight: 300;
  font-size: 18px;
  color: #666;
  letter-spacing: -0.6px;
  line-height: 21px;
}
.nj_top h4{
  font-size: 34px;
  line-height: 38px;
  letter-spacing: -2.5px;
  font-weight: 400;
  color: #333;
}
.nj_top h4 strong{
  display: block;
  font-weight: 800;
}
.nj_item_box{
  padding: 0 auto;
}
.nj_cont{
  position: relative;
  top: 210px;
  bottom: 90px;
}
.nj_select_area{
  width: auto;
  padding: 0;
}
.nj_select_area ul{
  display: flex;
  flex-wrap: wrap;
  width: 600px;
  margin: 0 auto;
  height: 280px;
  text-align: center;
}
.nj_select_area li{
  flex: 0 0 calc(33.333% - 10px);
  margin-right: 10px; 
  margin-bottom: 10px; 
  display: flex;
}
/*.nj_select_area label*/
.nj_li_label{
  text-align: center;
  width: 190px;
  height: 35px !important;
  cursor: pointer;
  background-color: #f3f3f3;
  border-radius: 20px 20px 20px 20px;
}
.nj_select_area input[type="radio"], .select_area input[type="checkbox"] {
  position: absolute;
  width: 1px;
  height: 1px;
  /* height: 1px; */
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0,0,0,0);
  border: 0;
}
.nj_select_area span{
  font-size: 13px;
  line-height: 35px !important;
  color: #333;
}
.nj_btn{
  height: 55px;
  padding: 0 20px;
  display: flex;
  justify-content: center;
}
.nj_btn button{
  float: none;
  width: calc(50% - 12px);
  margin: 0 6px;
  border-radius: 3px;
  height: 35px;
  line-height: 33px;
  font-size: 13px;
}
.nj_area_sido{
   width: 600px;
   display: flex;
   flex-wrap: wrap;
}
.nj_area_sido li{
   list-style-type: none;
   flex: 0 0 calc(33.333% - 10px);
   margin-right: 10px; /* 간격 설정 */
   margin-bottom: 10px; /* 아래쪽 간격 설정 */
}
.nj_area_sigun{
   display : none;
   width: 100%;
   margin-top: 205px;
   height: auto;
   border-top: 1px solid rgb(243, 243, 243);
}
.nj_area_btn{
   position: absolute;
   left: 0;
   bottom: 0;
   height: 90px;
   width: 100%;
   padding: 0 50px
}


/*여행 기간*/
.nj_schedule_box{
   width: 700px;
   overflow: visible;
   height: 1073px;
   top: 145px;
   bottom: 55px;
   margin: 0 auto;
   position: relative;
   list-style: none;
   padding: 0;
   display: none;
   background-color: white;
   border-radius: 10px;
}
.nj_schedule_txt{
   width: 600px;
   height: 150px;
   border: 1px solid black;
}
.nj_schedule_list{
   width: 600px;
   border: 1px solid black;
   display: flex;
   flex-wrap: wrap;
}
.nj_schedule_list li{
   list-style-type: none;
}
.nj_tour_box{
   width: 700px;
   overflow: visible;
   height: 1073px;
   top: 145px;
   bottom: 55px;
   margin: 0 auto;
   position: relative;
   list-style: none;
   padding: 0;
   display: none;
   background-color: white;
   border-radius: 10px;
   
}
.nj_tour_random div {
   align-items: center;
   cursor: pointer;
}
.nj_list_box {
   margin-bottom: 10px;
    border: 1px solid rgb(243, 243, 243);
    height: 230px;
    width: 665px;
    display: flex;
    border-radius: 10px;
}
.nj_list_text{
   max-height: 190px;
   overflow: auto;
   width: 150px;
   flex: 1;
   padding: 10px;
}
.nj_placeimg{
   width: 300px;
   height: 200px;
}
.red{
   border: 3px solid red;
}
.nj_schedule_top{
  height: 235px;
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  padding: 40px 50px 0;
}
.nj_schedulestit{
  display: block;
  height: 16px;
  text-indent: -9999px;
  background: url('http://korean.visitkorea.or.kr/resources/images/curation/cos_stit.png') 0 0 no-repeat;
}
.nj_schedulestep{
  position: absolute;
  right: 50px;
  top: 37px;
  display: flex;
  font-size: 16px;
  color: #767676;
  letter-spacing: -0.5px;
}

.nj_schedule_top > em {
  display: block;
  margin: 30px 0 8px;
  font-weight: 300;
  font-size: 18px;
  color: #666;
  letter-spacing: -0.6px;
  line-height: 21px;
}
.nj_schedule_top h4 {
  font-size: 34px;
  line-height: 38px;
  letter-spacing: -2.5px;
  font-weight: 400;
  color: #333;
}
.nj_schedule_top h4 strong {
  display: block;
  font-weight: 800;
}
.nj_schedule_cont{
  height: calc(100% - 325px);
  position: relative;
  top: 235px;
  bottom: 90px;
}
.nj_schedule_travel_period{
  display: flex;
  justify-content: center;
}
.nj_schedule_travel_period li{
  width: 120px;
  margin: 0 15px;
}
.nj_schedule_travel_period input{
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0,0,0,0);
  border: 0;
}
.nj_schedule_travel_period input + label {
  display: block;
  cursor: pointer;
}
.nj_schedule_travel_period input + label span{
  display: block;
  position: relative;
  width: 100%;
  height: auto;
}
.nj_schedule_travel_period input + label span:before {
  content: '';
  position: absolute;
  display: block;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background: url('http://korean.visitkorea.or.kr/resources/images/curation/icon_travel_period.png') 0 0 / 100% auto no-repeat;
}
.nj_schedule_travel_period input:checked + label span:after {
  content: '';
  position: absolute;
  display: block;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  border-radius: 100%;
  box-shadow: 8px 8px 16px 0px rgba(69, 107, 213, 0.3);
  background: rgba(86,127,242,.9) url('http://korean.visitkorea.or.kr/resources/images/curation/icon_travel_period_on.png') 50% 50% no-repeat;
}
.nj_schedule_travel_period input:checked + label em {
  font-weight: 700;
}
.nj_schedule_travel_period li img {
  display: block;
  width: 100%;
}
.nj_schedule_travel_period input.day1 + label span:before {
  background-position: 0 -120px;
}
.nj_schedule_travel_period input.day2 + label span:before {
  background-position: 0 -240px;
}
.nj_schedule_btn{
  position: absolute;
  left: 0;
  bottom: 0;
  height: 90px;
  width: 100%;
  padding: 0 50px;
}
.nj_prev{
  float: left;
  background: #fff;
  color: #929191;
  border: 1px solid #dfe0e2;
  width: 110px;
  border-radius: 5px;
  height: 52px;
  margin: 0;
  position: static;
  text-align: center;
  line-height: 50px;
  box-sizing: border-box;
  font-size: 16px;
  letter-spacing: -0.5px;
}
.nj_next{
  float: right;
  color: #fff;
  background: #333;
  width: 110px;
  border-radius: 5px;
  height: 52px;
  margin: 0;
  position: static;
  text-align: center;
  line-height: 50px;
  box-sizing: border-box;
  font-size: 16px;
  letter-spacing: -0.5px;
  margin-right: 100px;
}
.nj_tour_txt{
  height: 235px;
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  padding: 40px 50px 0;
}
.nj_tour_txt > em {
  display: block;
  margin: 30px 0 8px;
  font-weight: 300;
  font-size: 18px;
  color: #666;
  letter-spacing: -0.6px;
  line-height: 21px;
}
.nj_tour_txt h4 {
  font-size: 34px;
  line-height: 38px;
  letter-spacing: -2.5px;
  font-weight: 400;
  color: #333;
}
.nj_tour_txt h4 strong {
  display: block;
  font-weight: 800;
}
.nj_tour_list{
  overflow: scroll;
  height: calc(100% - 370px);
  position: relative;
  top: 235px;
  bottom: 90px;
  width: 680px;
  margin: 0 auto;
}
.nj_tour_list::-webkit-scrollbar{
  width: 6px;
  height: 6px;
}
.nj_tour_list::-webkit-scrollbar-thumb{
  border-radius: 3px;
  background: #abadac;
}
.nj_tour_list::-webkit-scrollbar-track{
  background: #e5e5e5;
}
.nj_list_text::-webkit-scrollbar{
  width: 6px;
  height: 6px;
}
.nj_list_text::-webkit-scrollbar-thumb{
  border-radius: 3px;
  background: #abadac;
}
.nj_list_text::-webkit-scrollbar-track{
  background: #e5e5e5;
}


.nj_onclick{
	background-color: #9bc1fe;
	font-weight: 900;
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
function showsigu(obj) {
    let value = parseInt(obj.value);
    $('.nj_area_sigun').css("display", "block");
    $.ajax({
        type: "GET",
        url: "/tour/recTour2",
        data: { value: value },
        success: function (data) {
            console.log(data);
            $(".nj_area_sigun").empty();
            console.log(data.length);

            // 그룹을 묶기 위한 ul 요소 생성
            let ul = $("<ul>", { class: "outer" });
            $(".nj_area_sigun").append(ul);
            ul.css({
                'display': 'flex',
                'flex-wrap': 'wrap',
                'width': '600px',
                'margin': '0 auto',
                'text-align': 'center',
                'margin-top': '10px'
            });

            for (let i = 0; i < data.length; i++) {
                let item = data[i];
                let li = $("<li>",{
                	css: {
                		'list-style': 'none',
	                    'flex': '0 0 calc(33.333% - 10px)',
	                    'margin-right': '10px',
	                    'margin-bottom': '10px',
	                    'display': 'flex'
                    }
                	
                });
                let radio = $("<input>", {
                	css: {
                		'position': 'absolute',
	                    'width': '1px',
	                    'height': '1px',
	                    'padding': '0',
	                    'margin': '-1px',
	                    'overflow': 'hidden',
	                    'clip': 'rect(0,0,0,0)',
	                    'border': '0'
                		
                	},
                    type: "radio",
                    id: "s_area" + i,
                    name: "area",
                    value: item.sigungucode
                });
                let label = $("<label>", {
                	css: {
                		'text-align': 'center',
	                    'width': '190px',
	                    'cursor': 'pointer',
	                    'background-color': '#f3f3f3',
	                    'border-radius': '20px 20px 20px 20px',
	                    'height': '35px'
                	},
                    for: "s_area" + i,
                });
                let span = $("<span>", {
                	css: {
                		'font-size': '13px',
	                    'line-height': '35px',
	                    'color': '#333'
                	},
                    text: item.name
                });

                label.append(radio);
                label.append(span);

                li.append(radio);
                li.append(label);
                ul.append(li);

                	
             
                
            }
            
            ul = $("<ul>", { class: "outer" });
            
        }
        
    });
    
}
  function hiddensigu(){
  	
	$('.nj_area_sigun').css("display","none");  
  }
  function areaBtn(){
	  let selectedArea = $("input[name='area']:checked").val();
	  sessionStorage.setItem('selectedArea', selectedArea);
	  $('.area_div').css("display","none");
	  $('.nj_schedule_box').css("display","block");
  }
  function sheduleBtnBefore(){
	  $('.area_div').css("display","block");
	  $('.nj_schedule_box').css("display","none");
  }
 
  let selectPlaces=[];
  function sheduleBtnNext(){
	  let selectedDay = $("input[name='scheduleChk1']:checked").val();
	  sessionStorage.setItem('selectedDay', selectedDay);
	  $('.nj_schedule_box').css("display","none");
	  $('.nj_tour_box').css("display","block");
	  $.ajax({
	        type: "GET",
	        url: "/tour/recTour3",	       
	        success: function (data) {
	            console.log(data);
	            console.log(data.length);
	            let tourRandom = document.querySelector(".nj_tour_random");
	            for(let i=0; i<10; i++){
	            	let item = data[i];
	            	let div = document.createElement("div");
            	    div.setAttribute("data-value", item.contentid);
                    div.classList.add("nj_list_box");
                    div.innerHTML =
                        '<img src="' +
                        item.firstimage +
                        '" alt="Option' +
                        i +
                        '" class="nj_placeimg">' +
                        '<div class="nj_list_text">' +
                        '<span>' +
                        item.title +
                        '</span><br>' +
                        '<span>' +
                        item.address +
                        '</span><br>' +
                        '<span>' +
                        item.overview +
                        '</span>' +
                        '</div>';
                    
                    // 데이터 속성에 정보 저장
                    div.dataset.item = JSON.stringify(item);

                    // 클릭 이벤트 추가
                    //div.addEventListener('click', selecttour , this);
                    div.addEventListener('click',  function(){
                    	
	                    let selectedItem = JSON.parse(this.dataset.item);
	                   	let selectedIndex = selectPlaces.findIndex(item => item.contentid === selectedItem.contentid);
	                   	
	                   	if (selectedIndex === -1) {
	                        // 배열에 없는 경우, 데이터를 배열에 추가
	                        $(this).toggleClass('red');
	                        alert(JSON.stringify(selectedItem));
	                        selectPlaces.push(selectedItem);
	                    } else {
	                        // 배열에 있는 경우, 해당 데이터를 배열에서 제거
	                        $(this).removeClass('red');
	                        selectPlaces.splice(selectedIndex, 1);
	                    }

	                    // 배열에 있는 데이터 출력
	                    for (let i = 0; i < selectPlaces.length; i++) {
	                        console.log(selectPlaces[i]);
	                    }
	                    console.log("---------");
            
                     });
                    tourRandom.appendChild(div);
                   
	            }
	        }
	    });
	  /*
	  $('#submitResult').on('click', function() {
	        if(selectPlaces.length==0){
	        	alert("선택하셍");
	        }else{
	        	for(let i=0; i<selectPlaces.length; i++){
		        	console.log(selectPlaces[i]);
		        }
	        }

		    let selectedArea = sessionStorage.getItem('selectedArea');
	        //console.log(selectPlaces);
	        console.log(JSON.stringify(selectPlaces));
	        let message;
	        let combinedData = {
	        	    selectedArea: selectedArea,
	        	    selectPlaces: selectPlaces
	        	};
	        $.ajax({
	            url: 'http://localhost:8080/recommend',
	            type: 'POST',
	            contentType: 'application/json',
	            dataType: 'json',
	            data: JSON.stringify(combinedData ),
	            success: function (data) {
	                //esultData(data);
	                console.log(data);
	                resultData(data);
	                
	            },
	            error: function (xhr, status, error) {
	                console.error('Error:', error);
	            }
	        });

	    });
	  */
	
  }
  /*
 function resultData( data){
	 
	 let strs="";	 
	 data.forEach(str => strs+=str.contentid +":" );
	 strs  = strs.substring(0,strs.length-1 );
	 alert(strs);

	 
	 let selectedArea = sessionStorage.getItem('selectedArea');
	 let selectedDay = sessionStorage.getItem('selectedDay');
	 
	 let resultList="selectedArea="+selectedArea+"="+"selectedDay="+selectedDay+"="+"contentid="+strs;
	 alert(resultList);
	 $.ajax({
		 url: '/tour/recList',
		 type: "POST",
		 data : "dataList="+resultList  ,
		 success: function ( courseid ) {
		//	 alert( res);
	       // alert( "dfdfdfd" + courseid);
	        
	        window.location.href="/tour/myRecommendCourse/?courseId="+courseid;
			 
	     }
	 });
 }
  */

 
 function tourBtnBefore(){
	 $('.nj_schedule_box').css("display","block");
     $('.nj_tour_box').css("display","none");
 }
  
  function changStyle(obj){
	  let ulElement = obj.closest('ul');
	  let elements = ulElement.querySelectorAll('.nj_onclick');
	  for(let i=0; i<elements.length; i++){
			 let element = elements[i];
			 element.classList.remove('nj_onclick');
		 }
	  
	  let labelElement = obj.querySelector('label');
	  labelElement.classList.add('nj_onclick');
  }

  
</script>
</head>
<body>
<header><%@ include file="header.jsp" %></header>
<section>
<div class="back_div">
  <div class="area_div">
   <div class="nj_box">
    <div class="nj_item_box">
    <div class="nj_top">
      <span class="nj_stit">AI콕콕 플래너</span>
      <span class="nj_step">
        <em>STEP.</em>
        <span class="nj_on">01</span>
        <span>02</span>
        <span>03</span>
      </span>
      <em>이번 여행, 어디로 떠나볼까요?</em>
      <h4>
        <strong>여행을 떠나고 싶은 지역을</strong>
        선택해 주세요.
      </h4>
    </div>
    <div class="nj_cont">
      <div class="nj_select_area">
        <ul>
          <li  onclick="changStyle(this)">
		      <input type="radio" id="area1" name="area" value=1 onclick="hiddensigu()">
		      <label for="area1" class="nj_li_label"><span>서울</span></label>
	      </li>
	      <li onclick="changStyle(this)">
		      <input type="radio" id="area2" name="area" value=2 onclick="hiddensigu()">
		      <label for="area2" class="nj_li_label"><span>인천</span></label>
		  </li>
		  <li onclick="changStyle(this)">
		      <input type="radio" id="area3" name="area" value=3 onclick="hiddensigu()">
		      <label for="area3" class="nj_li_label"><span>대전</span></label>
		  </li>
		  <li onclick="changStyle(this)">
		      <input type="radio" id="area4" name="area" value=4 onclick="hiddensigu()">
		      <label for="area4" class="nj_li_label"><span>대구</span></label>
		  </li>
		  <li onclick="changStyle(this)">
		      <input type="radio" id="area5" name="area" value=5 onclick="hiddensigu()">
		      <label for="area5" class="nj_li_label"><span>광주</span></label>
		  </li>
		  <li onclick="changStyle(this)">
		      <input type="radio" id="area6" name="area" value=6 onclick="hiddensigu()">
		      <label for="area6" class="nj_li_label"><span>부산</span></label>
	      </li>
	      <li onclick="changStyle(this)">
		      <input type="radio" id="area7" name="area" value=7 onclick="hiddensigu()">
		      <label for="area7" class="nj_li_label"><span>울산</span></label>
	      </li>
	      <li onclick="changStyle(this)">
		      <input type="radio" id="area8" name="area" value=8 onclick="hiddensigu()">
		      <label for="area8" class="nj_li_label"><span>세종</span></label>
		  </li>
	      <li onclick="changStyle(this)">
		      <input type="radio" id="area31" name="area" value=31 onclick="showsigu( this)">
		      <label for="area31" class="nj_li_label"><span>경기</span></label>
	      </li>
	      <li onclick="changStyle(this)">
		      <input type="radio" id="area32" name="area" value=32 onclick="showsigu( this)">
		      <label for="area32" class="nj_li_label"><span>강원</span></label>
	      </li>
	      <li onclick="changStyle(this)">
		      <input type="radio" id="area33" name="area" value=33 onclick="showsigu( this)">
		      <label for="area33" class="nj_li_label"><span>충북</span></label>
	      </li>
	      <li onclick="changStyle(this)">
		      <input type="radio" id="area34" name="area" value=34 onclick="showsigu( this)">
		      <label for="area34" class="nj_li_label"><span>충남</span></label>
	      </li>
	      <li onclick="changStyle(this)">
		      <input type="radio" id="area35" name="area" value=35 onclick="showsigu( this)">
		      <label for="area35" class="nj_li_label"><span>경북</span></label>
	      </li>
	      <li onclick="changStyle(this)">
		      <input type="radio" id="area36" name="area" value=36 onclick="showsigu( this)">
		      <label for="area36" class="nj_li_label"><span>경남</span></label>
	      </li>
	      <li onclick="changStyle(this)">
		      <input type="radio" id="area37" name="area" value=37 onclick="showsigu( this)">
		      <label for="area37" class="nj_li_label"><span>전북</span></label>
	      </li>
	      <li onclick="changStyle(this)">
		      <input type="radio" id="area38" name="area" value=38 onclick="showsigu( this)">
		      <label for="area38" class="nj_li_label"><span>전남</span></label>
	      </li>
	      <li onclick="changStyle(this)">
		      <input type="radio" id="area39" name="area" value=39 onclick="hiddensigu()">
		      <label for="area39" class="nj_li_label"><span>제주</span></label>
	      </li>
        </ul>
      </div>
    </div>
    <div class="nj_area_sigun">
  	</div>
  	<!--  <input type="hidden" name="area" value=>-->
    <div class="nj_area_btn">
       <button onclick="areaBtn()" class="nj_next">다음</button>
     </div>
    </div>
    </div>
    </div>
  
<div class="nj_schedule_box">
        <!-- 여행 선택 텍스트 -->
        <div class="nj_schedule_top">
          <span class="nj_schedulestit">AI콕콕 플래너</span>
          <span class="nj_step">
	        <em>STEP.</em>
	        <span class="nj_on1">01</span>
	        <span class="nj_on">02</span>
	        <span>03</span>
     	 </span>
          <em>2박 3일은 2개 지역 선택 가능</em>
          <h4><strong>여행 기간을</strong>선택해 주세요.</h4>                 
        </div>
        <!-- 여행 기간 선택 -->
        <div class="nj_schedule_cont">
           <ul class="nj_schedule_travel_period">
               <li>
                   <input type="radio" id="schedule_1" name="scheduleChk1" value="0">
                   <label for="schedule_1">
                       <span><img src="http://korean.visitkorea.or.kr/resources/images/curation/img_temp.png" alt=""></span>
                       <em>당일여행</em>
                   </label>
               </li>
               <li>
                   <input type="radio" id="schedule_2" class="day1" name="scheduleChk1" value="1">
                   <label for="schedule_2">
                       <span><img src="http://korean.visitkorea.or.kr/resources/images/curation/img_temp.png" alt=""></span>
                       <em>1박 2일</em>
                   </label>
               </li>
               <li>
                   <input type="radio" id="schedule_3" class="day2" name="scheduleChk1" value="2">
                   <label for="schedule_3">
                       <span><img src="http://korean.visitkorea.or.kr/resources/images/curation/img_temp.png" alt=""></span>
                       <em>2박 3일</em>
                   </label>
               </li>
           </ul>
       </div>
       <div class="nj_schedule_btn">
           <button onclick="sheduleBtnBefore()" class="nj_prev">이전</button>
           <button onclick="sheduleBtnNext()" class="nj_next">다음</button>
       </div>
       
</div>
<div class="nj_tour_box">
        <div class="nj_tour_txt">
          <span class="nj_schedulestit">AI콕콕 플래너</span>
          <span class="nj_step">
	        <em>STEP.</em>
	        <span class="nj_on1">01</span>
	        <span class="nj_on1">02</span>
	        <span class="nj_on">03</span>
     	 </span>
     	  <em>관심있는 여행지를 선택해 주세요. (최대 5개 선택 가능)</em>
          <h4><strong>관심 여행지를 기반으로 </strong>추천해드립니다.</h4>                 
        </div>
        <div class="nj_tour_list">
	        <div class="nj_tour_random">
	        </div>
        </div>
        
        <div class="nj_schedule_btn">
           <button onclick="tourBtnBefore()" class="nj_prev">이전</button>
           <button id='submitResult' class="nj_next">추천받기</button>
       </div>
        <!-- 이전 버튼 누르면 이전에 선택했던 데이터 모두 취소 기능 추가해야 함-->
</div>
</div>

</section>
<footer><%@ include file="footer.jsp" %></footer>
</body>
</html>