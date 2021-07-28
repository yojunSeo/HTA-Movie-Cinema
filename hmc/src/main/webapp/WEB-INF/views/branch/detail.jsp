<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<title>영화관상세-HMC</title>
<style type="text/css">
	
	.tab {
		border-width: 0px 0px 2px 0px;
		border-style: solid;
		border-color: #FF243E;
	}
	.tab_selected {
		border-width: 2px 2px 0px 2px;
		border-style: solid;
		border-color: #FF243E;
		font-weight: bold;
		color: #FF243E;
	}	
</style>
</head>
<body>
	<div class="container">

		<header>
		</header>

		<main class="mt-5">
			<table class="table table-borderless" style="color:#FFFFFF; background-image: url(../resources/images/branch/thater_room.jpg); background-repeat: no-repeat; width:100%; height:200px;">
				<tr><td class="text-end">
					<button class="btn btn-outline-secondary">
						<img alt="" src="../resources/images/branch/favorite.png" width="30px">
						<img alt="" src="../resources/images/branch/unfavorite.png" width="30px">
						 나의 지점 등록
					</button>
			  	</td></tr>
				<tr>
					<td class="align-middle text-center" style="">
					<h2>지점 이름</h2>
					</td>
				</tr>
			</table>
			
			<!-- 탭 구현 -->
			<div class="row fs-6 justify-content-center text-center" style="display: flex;">
				<div class="col-4 p-2 tab_selected">
					<a href="detail" class="btn">지점상세</a>
				</div>
				<div class="col-4 p-2 tab" >
					<a href="timetable" class="btn">상영시간표</a>
				</div>
				<div class="col-4 p-2 tab">
					<a href="price" class="btn">가격</a>
				</div>
			</div>
			
			
			<div class="row mt-5 p-5" style="background-color:#F2F2F2;">
				<div style="font-style:italic; font-size: 30px">
				<p>전세계 어디에서도 느껴 볼 수 없는 <strong>19,000watts</strong> 사운드 시스템<br /></p>
				<p>롤링스톤즈가 고집한 최상의 파워앰프 <strong>E/V P3000</strong> 전세계 최초 영화관 사용<br /></p>
				</div>
				<div style="text-decoration: underline;">
				<h4>사당역 7번 출구와 바로 이어지는 탁월한 교통망</h4>
				</div>
			</div>
			
			<div class="row mt-5">
				<h3 class="mt-3"><i class="bi bi-info-circle"></i> 영화관 정보</h3>
				
				<table class="table table-borderless" style="width: 600px">
					<colgroup>
						<col width="20%">
						<col width="*">
						<col width="15%">
						<col width="*%">
					</colgroup>
					<tr>
						<th>총상영관수</th><td>5개관</td>
						<th>총좌석수</th><td>15000석</td>
					</tr>
					<tr>
						<th>영화관위치</th><td colspan="3">서울시 서울구 서울동 서울역 4번출구 서울빌딩 9층<td>
					</tr>
				</table>
			</div>
			
			<div class="row mt-5">
				
				<h3 class="mt-3"><i class="bi bi-info-circle"></i> 보유시설</h3>
				
				<h4 class="mt-3">OOO지점 보유시설</h4>
				<div class="row mt-1">
					<div class="card" style="width: 140px;">
						<img src="../resources/images/facility/armchair.png" class="card-img-top" alt="sweet">
						<div class="card-body">
							<p class="card-text">스위트룸</p>
						</div>
					</div>
					<div class="card" style="width: 140px;">
						<img src="../resources/images/facility/sofa.png" class="card-img-top" alt="couple">
						<div class="card-body">
							<p class="card-text">커플석</p>
						</div>
					</div>
					<div class="card" style="width: 140px;">
						<img src="../resources/images/facility/disabled.png" class="card-img-top" alt="disabled">
						<div class="card-body">
							<p class="card-text">장애인석</p>
						</div>
					</div>
					<div class="card" style="width: 140px;">
						<img src="../resources/images/facility/3d.png" class="card-img-top" alt="3d">
						<div class="card-body">
							<p class="card-text">3D 상영관</p>
						</div>
					</div>
					<div class="card" style="width: 140px;">
						<img src="../resources/images/facility/theater.png" class="card-img-top" alt="nomal">
						<div class="card-body">
							<p class="card-text">3D 상영관</p>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row mt-5">
				<h3 class="mt-3"><i class="bi bi-info-circle"></i> 주차안내</h3>
				<div class="col-10">
					<strong>주차안내</strong>
					<ul>
						<li>영화관 내 지하 주차장 이용</li>
						<li>만차 시 영화관 건물 건너편 '구산타워' 뒤 공용 주차장 이용(10분당 500원, 일요일, 공휴일 무료 주차)</li>
					</ul>
					<strong>주차확인</strong>
					<ul>
						<li>매표소에서 영화티켓 제시 후 주차할인 인증 가능. 출차시 정산</li>
					</ul>
					<strong>주차요금</strong>
					<ul>
						<li>주차 요금은 입차시간을 기준으로 합니다.</li>
						<li>영화 관람시 3시간 무료 (미인증시 시간당 6,000원, 10분당 1,000원 부과)</li>
						<li>주말 및 공휴일에는 주차장이 혼잡할 수 있으니, 가급적이면 대중교통을 이용 바랍니다. (4,7호선 총신대입구(이수)역 7번 출구)</li>
					</ul>
				</div>
			</div>
			
			
			
		</main>

		<footer>
		</footer>

	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

	<script>
		
	</script>
</body>
</html>