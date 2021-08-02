<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<title>영화관-HMC</title>

</head>

<body>
	<div class="container">

		<header>
			<%@ include file="../common/header.jsp" %>
		</header>

		<main class="mt-5">
			<h2><i class="bi bi-camera-reels"></i> 전체극장</h2>
			
			<div class="row mt-5 justify-content-center">
				<div class="col-7">
					<ul class="list-group list-group-horizontal">
						<li class="box text-center list-group-item flex-fill" id="list1" data-branch-code="sample">사당점</li>
						<li class="box text-center list-group-item flex-fill" id="list2">왕십리점</li>
						<li class="box text-center list-group-item flex-fill">양화대교점</li>
						<li class="box text-center list-group-item flex-fill">강남역점</li>
						<li class="box text-center list-group-item flex-fill">서울역점</li>
					</ul>
					<ul class="list-group list-group-horizontal">
						<li class="box text-center list-group-item flex-fill">영화관지점</li>
						<li class="box text-center list-group-item flex-fill">영화관</li>
						<li class="box text-center list-group-item flex-fill">영화관지점</li>
						<li class="box text-center list-group-item flex-fill">영화관</li>
						<li class="box text-center list-group-item flex-fill">영화관지점</li>
					</ul>
				</div>
			</div>
			
			<div class="row justify-content-center">
				<div class="col-7 mt-5" id="map" style="width:600px;height:450px;"> </div>
			</div>
		</main>

		<footer>
			<%@ include file="../common/footer.jsp" %>
		</footer>

	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f0915828113d78ed08996429fa5a404a"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f0915828113d78ed08996429fa5a404a&libraries=LIBRARY"></script>

	<script>
	
	$(function() {
		
		// 실제에선 배열로 처리
		var iwContent = '<div style="padding:10px;">Hello World! <br>'	+
						'<a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a>' +
						'<a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a><br/>' +
						'<a href="/hmc/branch/detail" style="color:red" target="_blank">상세페이지</a>' +
						'</div>' // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwPosition = new kakao.maps.LatLng(37.477041, 126.982026); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
		
		$(".list-group-item").click(function() {
			$(".list-group-item").removeClass("list-group-item-dark");
			$(this).addClass('list-group-item-dark');
			
			var branchCode = $(this).data('branch-code');
			  
			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker); 
			
			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			var mapTypeControl = new kakao.maps.MapTypeControl();
		});
	
		var mapContainer = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var mapOptions = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.522463, 126.974842), //지도의 중심좌표.
			level: 9 //지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(mapContainer, mapOptions); // 지도를 생성합니다
		 
		// 마커를 표시할 위치와 title 객체 배열입니다 
		var positions = [
		    {
		        title: '사당점', 
		        latlng: new kakao.maps.LatLng(37.477041, 126.982026)
		    },
		    {
		        title: '왕십리점', 
		        latlng: new kakao.maps.LatLng(37.563197, 127.035868)
		    },
		    {
		        title: '양화대교점', 
		        latlng: new kakao.maps.LatLng(37.537036, 126.898140)
		    },
		    {
		        title: '서울역점',
		        latlng: new kakao.maps.LatLng(37.550988, 126.972766)
		    }
		];

		// 마커 이미지의 이미지 주소입니다
		// 나의 영화관용 마커 이미지
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		    
		for (var i = 0; i < positions.length; i ++) {
		    
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
		}

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
	});
	</script>
</body>
</html>