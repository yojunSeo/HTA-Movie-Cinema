<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<title>가격-HMC</title>
<style type="text/css">
	
	.banner {
		position: relative;
		width:100vw;
		margin-left: calc(-49vw + 50%);
		padding-right: 15px;
		padding-left: 15px;
		margin-right: auto;
	}
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
			<%@ include file="../common/header.jsp" %>
		</header>
		<main class="mt-5 mb-5" >
			<table class="table table-borderless banner" style="color:#FFFFFF; background-image: url(../resources/images/branch/thater_room.png); background-repeat: no-repeat; width:98vw; height:280px;">
				<colgroup>
					<col width="15%">
					<col width="60%">
					<col width="15%">
				</colgroup>
				<tr>
					<td></td>
					<td class="text-end">
						<c:choose>
							<c:when test="${empty LOGINED_USER}">	<!-- 로그인이 안되어 있을때 -->
								<button id="btn-my-theater" class="btn btn-outline-secondary">
									<img alt="" src="../resources/images/branch/unfavorite.png" width="30px">
									나의 영화관 등록
								</button>
							</c:when>
							<c:when test="${LOGINED_USER.favoriteBranch1 == branchCode || LOGINED_USER.favoriteBranch2 == branchCode || LOGINED_USER.favoriteBranch3 == branchCode}">
								<!-- 로그인 되어있고 나의 영화관 일때 -->
								<span class="p-3 mt-2">
									<img alt="" src="../resources/images/branch/favorite.png" width="30px">
									나의 영화관
								</span>
							</c:when>
							<c:otherwise>
								<!-- 로그인 되어 있고 나의 영화관이 아닐때 -->
								<button id="btn-my-theater" class="btn btn-outline-secondary">
									<img src="../resources/images/branch/unfavorite.png" width="30px">
									나의 영화관 등록
								</button>
							</c:otherwise>
						</c:choose>
			  		</td>
			  		<td></td>
			  	</tr>
				<tr>
					<td></td>
					<td class="align-middle text-center" style="">
					<h2>${branchDetail.name }</h2>
					</td>
					<td></td>
				</tr>
			</table>
			
			<!-- 탭 구현 -->
			<div class="row fs-6 justify-content-center text-center" style="display: flex;">
				<div class="col-4 p-2 tab">
					<a href="detail?code=${branchCode}" class="btn">지점상세</a>
				</div>
				<div class="col-4 p-2 tab" >
					<a href="timetable?code=${branchCode}" class="btn">상영시간표</a>
				</div>
				<div class="col-4 p-2 tab_selected">
					<a href="price?code=${branchCode}" class="btn">가격</a>
				</div>
			</div>
		
			
			<div class="row mt-5">
			
			<h3>영화 관람료</h3>
			
				<div class="col-4 offset-1 mt-3">
				<ul>
					<li><h4>2D</h4></li>
				</ul>
					<table class="table table-striped text-center" >
							<colgroup>
								<col width="30%">
								<col width="35%">
								<col width="35%">
							</colgroup>
							<thead>
								<tr>
									<th>구분</th>
									<th>월~목</th>
									<th>금~일, 공휴일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>일반석</th>
									<td colspan="2">12,000</td>
								</tr>
								<tr>
									<th>커플석</th>
									<td colspan="2">26,000(2인요금)</td>
								</tr>
								<tr>
									<th>프리미엄석</th>
									<td colspan="2">15,000</td>
								</tr>
								<tr>
									<th>장애인석</th>
									<td colspan="2">6,000</td>
								</tr>
							</tbody>
					</table>
				</div>

				<div class="col-4 offset-1 mt-3">
				<ul>
					<li><h4>3D</h4></li>
				</ul>
					<table class="table table-striped text-center">
							<colgroup>
								<col width="30%">
								<col width="35%">
								<col width="35%">
							</colgroup>
							<thead>
								<tr>
									<th>구분</th>
									<th>월~목</th>
									<th>금~일, 공휴일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>일반석</th>
									<td colspan="2">14,000</td>
								</tr>
								<tr>
									<th>장애인석</th>
									<td colspan="2">7,000</td>
								</tr>
							</tbody>
					</table>
				</div>
			</div>
			
			<div class="row justify-content-center mt-5 mb-3">
				<h3>요금제</h3>
				<div class="col-12 p-3 mt-2" style="background-color:#F2F2F2;">
					<span>
					• <strong>청소년 요금  만7세~ 만18세</strong> : 초등학생~고등학생(학생증, 교복, 청소년증, 의료보험증, 주민등록 등/초본, 그 외 청소년 확인 가능 서류) <strong>지참시 20% 할인</strong><br/>
					• <strong>48개월 미만</strong>의 경우 증빙원(예 : 의료보험증, 주민등록 초/등본 등) 지참 시에만 무료 관람 가능
					</span>
				</div>
			</div>
			
			<div class="row justify-content-center mt-5">
				<h3>우대적용</h3>
				<div class="col-12 p-3 mt-2" style="background-color:#F2F2F2;">
					<span>
					• <strong>국가유공자</strong> : 현장에서 국가유공자증을 소지한 본인 외 동반 1인까지 적용<br/>
					• <strong>장애인</strong> : 현장에서 복지카드를 소지한 장애인(중증:1급~3급까지 동반 1인까지 적용 / 경증:4급~6급은 본인에 한함)<br/>
					• <strong>경로</strong> : 만65세 이상 본인에 한함(신분증 확인)<br/>
					• <strong>미취학아동</strong> : 부모 동반한 만4세~ 만6세까지 본인(의료보험증, 주민등록 초/등본 확인)<br/>
					• <strong>소방종사자</strong> : 공무원증을 소지하거나 정복을 입은 소방관 본인
					</span>
				</div>
			</div>
			
			
		</main>

		<footer>
			<%@ include file="../common/footer.jsp" %>
		</footer>

	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

	<script>
		
	</script>
</body>
</html>