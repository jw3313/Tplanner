<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Tplanner Test</h1>
	
	<form action="data.inc" method="get">
		<input type="text" name="word" id="word"/>
		<input type="submit" id="btn"/>
	</form>	
	<div id="map" style="width:800px;height:600px;"></div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=100b54d0c5ac11ce0da7bf27762ce365&libraries=services"></script>
	<script>
		var positions = ${json};
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = {
	        center : new daum.maps.LatLng(${ar[0].mapy}, ${ar[0].mapx}), // 지도의 중심좌표
	        level : 4
	    // 지도의 확대 레벨
	    };
	 
	    var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	    var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다 
	    var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
	 
	    // 마커를 표시할 위치와 title 객체 배열입니다 
	    /*
	    var positions = [ {
	        title : "카카오",
	        latlng : new daum.maps.LatLng(33.450705, 126.570677)
	    }, {
	        title : "제주공항",
	        latlng : new daum.maps.LatLng(33.5066211, 126.492810)
	    }, {
	        title : "테마파크",
	        latlng : new daum.maps.LatLng(33.2906595, 126.322529)
	    }, {
	        title : "수목원",
	        latlng : new daum.maps.LatLng(33.4696849, 126.493305)
	    } ]; */
	    
	    
	    /*var Json = new Object();
	    for(var i=0; i<${fn:length(ar)}; i++){
	    	Json.title = "${ar[i].areacode}";
	    	Json.latlng = new daum.maps.LatLng(${ar[i].mapy}, ${ar[i].mapx});
	    	positions.push(Json);
	    }*/
	    
	 
	    // 마커 이미지의 이미지 주소입니다
	    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
	 
	    for (var i = 0; i < positions.length; i++) {
	 
	        // 마커 이미지의 이미지 크기 입니다
	        var imageSize = new daum.maps.Size(12, 17);
	 
	        // 마커 이미지를 생성합니다    
	        var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
	 
	        // 마커를 생성합니다
	        var marker = new daum.maps.Marker({
	            map : map, // 마커를 표시할 지도
	            position : positions[i].latlng, // 마커를 표시할 위치
	            title : positions[i].title,
	            image : markerImage
	        // 마커 이미지 
	        });
	    }
	 
	    var linePath;
	    var lineLine = new daum.maps.Polyline();
	    var distance;
	 
	    for (var i = 0; i < positions.length; i++) {
	        if (i != 0) {
	            linePath = [ positions[i - 1].latlng, positions[i].latlng ] //라인을 그리려면 두 점이 있어야하니깐 두 점을 지정했습니다
	        }
	        ;
	        lineLine.setPath(linePath); // 선을 그릴 라인을 세팅합니다
	 
	        var drawLine = new daum.maps.Polyline({
	            map : map, // 선을 표시할 지도입니다 
	            path : linePath,
	            strokeWeight : 2, // 선의 두께입니다 
	            strokeColor : '#db4040', // 선의 색깔입니다
	            strokeOpacity : 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	            strokeStyle : 'solid' // 선의 스타일입니다
	        });
	 
	        distance = Math.round(lineLine.getLength());
	        displayCircleDot(positions[i].latlng, distance);
	    } 
	    }
	 /*
	    function displayCircleDot(position, distance) {
	        if (distance > 0) {
	            // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
	            var distanceOverlay = new daum.maps.CustomOverlay(
	                    {
	                        content : '<div class="dotOverlay">거리 <span class="number">'
	                                + distance + '</span>m</div>',
	                        position : position,
	                        yAnchor : 1,
	                        zIndex : 2
	                    });
	 
	            // 지도에 표시합니다
	            distanceOverlay.setMap(map);
	        }
	    }
	    */
	</script>

</body>
</html>