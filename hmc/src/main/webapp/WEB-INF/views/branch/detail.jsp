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

		<main class="mt-5">
			<table class="table table-borderless banner" style="color:#FFFFFF; background-image: url(../resources/images/branch/thater_room.png); background-repeat: no-repeat; width:98vw; height:280px;">
				<colgroup>
					<col width="15%">
					<col width="60%">
					<col width="15%">
				</colgroup>
				<tr>
					<td></td>
					<td class="text-end">
					<button class="btn btn-outline-secondary">
						<img alt="" src="../resources/images/branch/favorite.png" width="30px">
						<img alt="" src="../resources/images/branch/unfavorite.png" width="30px">
						 나의 지점 등록
					</button>
			  		</td>
			  		<td></td>
			  	</tr>
				<tr>
					<td></td>
					<td class="align-middle text-center" style="">
					<h2>${branchDetail.branchName}</h2>
					</td>
					<td></td>
				</tr>
			</table>
			
			<!-- 탭 구현 -->
			<div class="row fs-6 justify-content-center text-center" style="display: flex;">
				<div class="col-4 p-2 tab_selected">
					<a href="detail?code=${branchDeatil.code}" class="btn">지점상세</a>
				</div>
				<div class="col-4 p-2 tab" >
					<a href="timetable?code=${branchDeatil.code}" class="btn">상영시간표</a>
				</div>
				<div class="col-4 p-2 tab">
					<a href="price?code=${branchDeatil.code}" class="btn">가격</a>
				</div>
			</div>
			
			<div class="row mt-5 p-5" style="background-color:#F2F2F2;">
				${branchDetail.branchInfo}
			</div>
			
			<div class="row mt-5">
				<h3 class="mt-3"><i class="bi bi-info-circle"></i> 영화관 정보</h3>
				
				<table class="table table-borderless mt-3" style="width: 600px">
					<colgroup>
						<col width="20%">
						<col width="*">
						<col width="15%">
						<col width="*%">
					</colgroup>
					<tr>
						<th>총상영관수</th><td>${branchDetail.totalRoom} 개관</td>
						<th>총좌석수</th><td><fmt:formatNumber value="${branchDetail.totalSeat}"/> 석</td>
					</tr>
					<tr>
						<th>영화관위치</th><td colspan="3">${branchDetail.address} <td>
					</tr>
				</table>
			</div>
			
			<div class="row mt-5">
				
				<h3 class="mt-3"><i class="bi bi-info-circle"></i> 보유시설</h3>
				
				<div class="row mt-3">
				
				
				<c:if test="${facility[0] eq 1}">
						<div class="card" style="width: 140px;">
							<img src="../resources/images/facility/armchair.png" class="card-img-top" alt="sweet">
							<div class="card-body">
								<p class="card-text">프리미엄석</p>
							</div>
						</div>
				</c:if>
				<c:if test="${facility[1] eq 1}">
						<div class="card" style="width: 140px;">
							<img src="../resources/images/facility/sofa.png" class="card-img-top" alt="couple">
							<div class="card-body">
								<p class="card-text">커플석</p>
							</div>
						</div>
				</c:if>
				<c:if test="${facility[2] eq 1}">
						<div class="card" style="width: 140px;">
							<img src="../resources/images/facility/disabled.png" class="card-img-top" alt="disabled">
							<div class="card-body">
								<p class="card-text">장애인석</p>
							</div>
						</div>
				</c:if>
				<c:if test="${facility[4] eq 1}">
						<div class="card" style="width: 140px;">
							<img src="../resources/images/facility/3d.png" class="card-img-top" alt="3d">
							<div class="card-body">
								<p class="card-text">3D 상영관</p>
							</div>
						</div>
				</c:if>
				<c:if test="${facility[3] eq 1}">
						<div class="card" style="width: 140px;">
							<img src="../resources/images/facility/theater.png" class="card-img-top" alt="nomal">
							<div class="card-body">
								<p class="card-text">일반 상영관</p>
							</div>
						</div>
				</c:if>
				</div>
			</div>
			
			<div class="row mt-5">
				<h3 class="mt-3"><i class="bi bi-info-circle"></i> 주차안내</h3>
				<div class="col-10">
					${branchDetail.parkingInfo}
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