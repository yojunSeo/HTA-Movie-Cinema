<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<title>영화관-HMC</title>

<style type="text/css">
.customoverlay {position:relative;bottom:70px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #FF243E url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
</style>


</head>

<body>
	<div class="container">

		<header>
			<%@ include file="../common/header.jsp"%>
		</header>

		<main class="mt-5">
			<h2>전체극장</h2>

			<div class="row justify-content-center">
				<div class="col-3 p-5">
					<ul class="list-group list-group" >
						<c:forEach var="branch" items="${branchList}">
							<li class="btn mt-3 text-center list-group-item fw-bold fs-5" style="border: 1px solid black;"
								data-branch-code="${branch.code }">${branch.name }</li>
						</c:forEach>
					</ul>
				</div>

				<div class="col-7">
					<div class="col-7 mt-5 " id="map"
						style="width: 800px; height: 450px;"></div>
				</div>
			</div>
		</main>

		<footer>
			<%@ include file="../common/footer.jsp"%>
		</footer>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f0915828113d78ed08996429fa5a404a"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f0915828113d78ed08996429fa5a404a&libraries=LIBRARY"></script>

	<script>
		$(function() {

			var mapContainer = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var mapOptions = { //지도를 생성할 때 필요한 기본 옵션
				center : new kakao.maps.LatLng(37.522467, 126.95220), //지도의 중심좌표.
				level : 8 //지도의 레벨(확대, 축소 정도)
			};

			var map = new kakao.maps.Map(mapContainer, mapOptions); // 지도를 생성합니다

			// 마커를 표시할 위치와 title 객체 배열입니다 

			var positions = [];
			$.ajax({
				type : "POST", // 요청방식
				url : "./json/all", // 요청URL
				async : false,
				dataType : "json", // 응답데이터 타입
				success : function(branchList) {
					branchList.forEach(function(branch) {
						positions.push({
							title : branch.name,
							latlng : new kakao.maps.LatLng(branch.latitude, branch.longitude),
							code : branch.code
						});
					})
				}
			})

			
			var selectedBranch = null;

			for (var i = 0; i < positions.length; i++) {
				// 마커를 생성합니다
				addMarker(positions[i]);
			}

			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			var mapTypeControl = new kakao.maps.MapTypeControl();

			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
			// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			
			var iwContent, // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				iwPosition //인포윈도우 표시 위치입니다
				
			$(".list-group-item").click(function(event) {
				
				// 기존 지점 선택을 없애고 현재 선택지점을 표시합니다.
				$(".list-group-item").css("background-color","none").css("color","#black");
				$(this).css("background-color","#FF243E").css("color","#FFFFFF");
				
				position = positions.find(position => position.code === $(this).data('branch-code'));
				
				kakao.maps.event.trigger(position.marker, 'click');
			})
			
			
			function addMarker(position) {
				
				var title = position.title;
				var latlng = position.latlng;
				var code = position.code;
				// 마커 이미지 
				// 나의 영화관용 마커 이미지
				var imageLikeSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
				var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/2018/pc/img/marker_spot.png";
				// 마커 이미지의 이미지 주소입니다
				
				// 마커 이미지의 이미지 크기 입니다
				var imageSize = new kakao.maps.Size(24, 35);

				// 마커 이미지를 생성합니다    
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
				
				// 관심영화관일때 아래의 이미지를 사용합니다.
				//var markerImage = new kakao.maps.MarkerImage(imageLikeSrc, imageSize);
				
				var marker = new kakao.maps.Marker({
					map : map, // 마커를 표시할 지도
					position : latlng, // 마커를 표시할 위치
					title : title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					image : markerImage
					});
					//code : code
				
				position.marker = marker;
					
				kakao.maps.event.addListener(marker, 'click', function() {
					
					var branchCode = code;
					var iwContent;
					
					$.ajax({
						type : "GET", // 요청방식
						url : "./json/branch", // 요청URL
						async : false,
						data: {code: branchCode},
						dataType : "json", // 응답데이터 타입
						success : function(branch) {
							iwContent = '<div class="customoverlay">' +
									    '  <a href="/hmc/branch/detail?code=' + branch.code + '">' +
									    '    <span class="title">' + branch.name + '</span>' +
									    '  </a>' +
									    '</div>';
							iwPosition = new kakao.maps.LatLng(branch.latitude, branch.longitude);
						}
					});
					
					if(selectedBranch != null) {
						selectedBranch.overlay.setMap(null);
					}
					
					// 오버레이를 생성합니다
					var overlay = new kakao.maps.CustomOverlay({
					    position : latlng, 
					    content : iwContent,
					}); 

					// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
					overlay.setMap(map);
					
					selectedBranch = {
							marker : marker,
							overlay : overlay
					};
					
					// 기존 지점 선택을 없애고 현재 선택지점을 표시합니다.
					$(".list-group-item").css("background-color", 'transparent').css("color","black");
					$(".list-group-item:contains('" + position.title + "')").css("background-color","#FF243E").css("color","#FFFFFF");
					
					
				})
				
			}
		});
	</script>
</body>
</html>