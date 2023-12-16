<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>여행지도</title>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
		*{
            margin:0;
            padding:0;
       	}

       	.btn_fold {
            border: 0 none;
            background-color: transparent;
            cursor: pointer;          
        }

		/* 전체 */
        section {
            /*width: 100%;
            height: 100%;
            overflow: hidden;  */
            padding-top: 90px;        
        }   

        /* 왼쪽 메뉴창 */
        .map_cont_wrap {
            position: absolute;
            left: 0;
            top: 89px;
            height: calc(100% - 89px);
            display: flex;
            transition: .3s ease-in-out;
            z-index: 10;           
        }

        /* 왼쪽 메뉴창 */
        .map_cont {
            height: 800px;
            background: #fff;
            display: flex;
            box-shadow: 5px 0px 30px 0px rgba(98, 99, 100, 0.3);          
        }

        /* 왼쪽 메뉴창 위쪽 아이콘 부분 */
        .map_depth1 {
            height: 100%;
            width: 405px;
            background: #fff;            
        }

        /* 왼쪽 메뉴창 위쪽 구름 사진 */
        .map_menu.cloud {
            background: url(https://korean.visitkorea.or.kr/resources/images/location/bg_weather_cloud.jpg) no-repeat;           
        }

        /* 왼쪽 메뉴창 위쪽 아이콘 부분 */
        .map_menu .map_tab {
            display: flex;
            flex-wrap: wrap;
            padding: 40px 0 0;   
            justify-content: center;       
        }


        /* 왼쪽 메뉴창 위쪽 아이콘 4개 */
        .map_menu .map_tab li {
            width: 20%;
            text-align: center;
            margin: 0 0 17px;
            list-style: none;           
        }
        .iconImg{
        	background: url(https://korean.visitkorea.or.kr/resources/images/location/icon_depth1_menu.png) no-repeat;
        	width: 36px;
            height: 36px;
            margin: 0 auto 6px;
        }
        .iconText{
         	color: #767676;
            font-size: 14px;
            letter-spacing: -1.5px;     
        }
 		.icon2{
 			background-position: 0 -36px !important;
 		}
 		.icon3{
 			background-position: 0 -72px !important;
 		}
 		.icon4{
 			background-position: 0 -108px !important;
 		}
 		.change{ 
 			background: url(https://korean.visitkorea.or.kr/resources/images/location/icon_depth1_menu_on.png) no-repeat;
 		}
        
        /* 주변여행지 아이콘 (색깔) */
        .map_menu .map_tab li a:before {
            width: 37px;
            background: url(https://korean.visitkorea.or.kr/resources/images/location/icon_depth1_menu_on.png) no-repeat;
        }

        /* 왼쪽 메뉴창 밑부분 전체 */
        .menu_cont {
            height: calc(100% - 117px);
            overflow-y: scroll;
            border-top: 1px solid #e5e6e8;
        }

        /* 왼쪽 메뉴창 밑부분 하나 */
        .list_type1 ul li {
            padding: 15px 20px;
            border-bottom: 1px solid #f4f3f3;
            overflow: hidden;          
        }

        /* 왼쪽 메뉴창 밑부분 이미지 */
        .list_type1 ul li .map_img {
            position: relative;
            float: left;
            width: 90px;
            height: 90px;
            background-position: 50% 50%;
            background-size: cover;
            background-repeat: no-repeat;
            border-radius: 20px;
        }

        /* 왼쪽 메뉴창 밑부분 타이틀 */
        .list_type1 .info {
            margin: 0 0 0 105px;
            position: relative;         
        }

         /* 왼쪽 메뉴창 밑부분 타이틀 */
        .list_type1 ul li .tit {
            display: flex;          
        }

         /* 왼쪽 메뉴창 밑부분 타이틀 */
        .list_type1 ul li .tit a {
            display: inline-block;
            font-size: 20px;
            line-height: 23px;
            font-weight: 700;
            padding-right: 7px;
            letter-spacing: -1px;
            color: #333;
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
            text-decoration: none;          
        }

        /* 왼쪽 메뉴창 열기 닫기 */
        .map_cont_wrap .btn_fold {
            width: 59px;
            height: 104px;
            position: absolute;
            top: 50%;
            right: -59px;
            transform: translateY(-50%);
            z-index: 10;
            background: url(https://korean.visitkorea.or.kr/resources/images/location/btn_fold.png) no-repeat;
            text-indent: -9999px;       
        }
                  
        /* 왼쪽 메뉴창 버튼 닫기*/
        .map_cont_wrap.close   {
            left : -405px;
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
</script>
</head>
<body>
<header><%@ include file="header.jsp" %></header>
<section>
    <!--  펼침메뉴 -->    
    <div class="map_cont_wrap" style="">
        <div class="map_cont">
            <!-- depth1 -->
            <div class="map_depth1">
                <div class="map_menu cloud">               
                    <ul class="map_tab">
                        <li label="tour" class="on">
                            <a onclick="getMarkers('주변 여행지');" title="선택됨"><div class="iconImg icon1" onclick="change(this);"></div></a>
                            <div class="iconText">주변 여행지</div>
                        </li>
                        <li label="food" class="on">
                            <a href="javascript:;" onclick="getMarkers('음식점');"  title="선택됨"><div class="iconImg icon2" onclick="change(this);"></div></a>
                            <div class="iconText">음식점</div>
                        </li>
                        <li label="cafe" class="on">
                            <a href="javascript:;" onclick="getMarkers('카페');"  title="선택됨"><div class="iconImg icon3" onclick="change(this);"></div></a>
                            <div class="iconText">카페</div>
                        </li>
                        <li label="hotel" class="on">
                            <a href="javascript:;" onclick="getMarkers('숙소');"  title="선택됨"><div class="iconImg icon4" onclick="change(this);"></div></a>
                            <div class="iconText">숙소</div>
                        </li>	
                    </ul>                
                </div>
                <div class="menu_cont">
                    <div class="list_type1">
                        <ul id="map_listul">
                        <c:forEach var="item" items="${list}">                       
                            <li>
                                <a href="javascript:;" onclick="openDetail('3b7c0d73-45de-4335-9f30-78c8e98cf8c0','');" style="background-image: url(${item.firstimage});" class="map_img"></a>
                                <div class="info">
                                    <div class="tit">
                                        <a href="javascript:;" onclick="openDetail('3b7c0d73-45de-4335-9f30-78c8e98cf8c0','');"> ${item.title}</a>                                            
                                    </div>                                       
                                </div>
                            </li>
                          </c:forEach>                             
                        </ul>
                    </div>
                </div>
            </div>
            <!-- //depth1 -->
            <!-- depth2 -->	
        </div>
        <button class="btn_fold" type="button">접기</button>
    </div>   
   	<!--  지도영역 -->
    <div id="map" style="width:100%;height:800px;"></div>	
    
    
	
     <input type="hidden"    id="latitude"  value="<%=session.getAttribute("latitude")%>">  
     <input type="hidden"   id="longitude"  value="<%=session.getAttribute("longitude")%>">  
    </section>
    
   
    
    <footer><%@ include file="footer.jsp" %></footer>
    
    
    
    
    
    
    
    
    
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8409e3ef23d3aa24592484f08ad587c4&libraries=clusterer"></script>
	<script>
		
	
	
	
	    let latitude =  document.getElementById("latitude").value ;
	    let longitude =  document.getElementById("longitude").value ;
	    
	    
	 	var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
	        center : new kakao.maps.LatLng(37.5499, 126.9218), // 지도의 중심좌표
	        level : 9 // 지도의 확대 레벨
	    });
	 	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
	        //center: new kakao.maps.LatLng(37.5499076, 126.9218479), // 지도의 중심좌표
	        level: 10 // 지도의 확대 레벨
	    };
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다	
		var imageSrc = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker_pos.png', // 마커이미지의 주소입니다    
		    imageSize = new kakao.maps.Size(25, 25), // 마커이미지의 크기입니다
		    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.	      
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		    markerPosition = new kakao.maps.LatLng(37.5499076, 126.9218479); // 마커가 표시될 위치입니다
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition, 
		    image: markerImage // 마커이미지 설정 
		});
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);  
        $('.map_cont_wrap .btn_fold').click(function(){      
            var contW = $('.map_cont_wrap');
            if(!contW.hasClass('close')){
                $('.map_cont_wrap').addClass('close');
                $(this).text('펼치기');  
            }else{
                $('.map_cont_wrap').removeClass('close');
                $(this).text('접기');
            }
        });    
    // 마커 클러스터러를 생성합니다
    // 마커 클러스터러를 생성할 때 disableClickZoom 값을 true로 지정하지 않은 경우
    // 클러스터 마커를 클릭했을 때 클러스터 객체가 포함하는 마커들이 모두 잘 보이도록 지도의 레벨과 영역을 변경합니다
    // 이 예제에서는 disableClickZoom 값을 true로 설정하여 기본 클릭 동작을 막고
    // 클러스터 마커를 클릭했을 때 클릭된 클러스터 마커의 위치를 기준으로 지도를 1레벨씩 확대합니다
    var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
        minLevel: 10, // 클러스터 할 최소 지도 레벨
        disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
    });
    // 데이터를 가져오기 위해 jQuery를 사용합니다
    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
    function getMarkers(category) {
	    var url = "/tour/getMarkers";
	    if (category) {
	        url += "?category=" + category;
	    }	
	    $.get(url, function (data) {  	    	
	    	console.log("data" + data);    	
	        // 클러스터러에서 기존 마커를 제거합니다
	        clusterer.clear();
	        var imageSrc = 'https://t1.daumcdn.net/mapjsapi/images/2x/marker.png', // 마커이미지의 주소입니다    
	        imageSize = new kakao.maps.Size(35, 40); // 마커이미지의 크기입니다
	        //imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.          
	       //마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	       var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);       
	        // 새로운 데이터로부터 마커를 생성합니다
	        var markers = data.map(function (position) {
	                    return new kakao.maps.Marker({
	                        position: new kakao.maps.LatLng(Number(position.mapY), Number(position.mapX)),
	                    	image: markerImage // 마커이미지 설정
	                    });
	                });        
	     	// 클러스터러에 마커를 추가합니다
	        clusterer.addMarkers(markers);     	
	        // 각 마커에 클릭 이벤트 리스너를 추가합니다
	        markers.forEach(function (marker) {
	            kakao.maps.event.addListener(marker, 'click', function () {
	                filterMarkersWithinRadius(marker);
	            });
	        });       
	     
	       $("#map_listul").empty();      	       	      
		   for( let i=0;  i< data.length ;  i++ ){			   
			   let item=  data[i];			   
			   let line  = "<li><a href='javascript:;'  style='background-image: url("  +  item.firstimage  +  ");'  class='map_img'></a>";
	               line  += " <div class='info'> "; 
	               line  += " <div class='tit'> ";
	               line  += " <a href='javascript:;' >" +item.title +"</a> </div> </div> </li> ";	               	       	      	         
	           $("#map_listul").append( line );           
		   }	     
	    });
	}
    // 마커 클러스터러에 클릭이벤트를 등록합니다
    // 마커 클러스터러를 생성할 때 disableClickZoom을 true로 설정하지 않은 경우
    // 이벤트 헨들러로 cluster 객체가 넘어오지 않을 수도 있습니다
    kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {
        // 현재 지도 레벨에서 1레벨 확대한 레벨
        var level = map.getLevel()-1;
        // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
        map.setLevel(level, {
        	anchor: cluster.getCenter()
        	});
    });    
 	// 클릭된 마커 주변의 마커들을 필터링하여 표시하는 함수
    function filterMarkersWithinRadius(clickedMarker) {
        // 클러스터러에 추가할 마커 배열
        var markersToAdd = [];
        // 필터링할 반경 설정 (단위: m)
        var radius = 1000;
        // 현재 클릭된 마커의 위치를 기준으로 반경 내의 마커 필터링
        var clickedPosition = clickedMarker.getPosition();

        clusterer.getMarkers().forEach(function (clusterMarker) {
            clusterMarker.getMarkers().forEach(function (marker) {
                var markerPosition = marker.getPosition();
                var distance = kakao.maps.geometry.distance(clickedPosition, markerPosition);
                if (distance <= radius) {
                    markersToAdd.push(marker);
                }
            });
        });

        clusterer.clear();
        clusterer.addMarkers(markersToAdd);

        // 지도 중심을 클릭된 마커의 위치로 이동
        map.setCenter(clickedPosition);
        map.setLevel(4); // 혹은 원하는 레벨로 조절
    }
 
	 function change(obj){
		 let ulElement = obj.closest('ul');
		 let elements = ulElement.querySelectorAll('.change');
		 
		 for(let i=0; i<elements.length; i++){
			 let element = elements[i];
			 element.classList.remove('change');
		 }
		 obj.classList.add('change');
		 /*
		 if (obj.classList.contains('change')){
			 obj.classList.remove('change');
		 }else{
		 	obj.classList.add('change');
		 }
		 */
	 }
	</script>
</body>
</html>