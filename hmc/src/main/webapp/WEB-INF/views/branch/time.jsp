<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<title>페이지이름-HMC</title>
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
					<td></td>
			  		</td>
			  	</tr>
				<tr>
					<td></td>
					<td class="align-middle text-center" style="">
					<h2>지점 이름</h2>
					</td>
					<td></td>
				</tr>
			</table>
			
			<!-- 탭 구현 -->
			<div class="row fs-6 justify-content-center text-center" style="display: flex;">
				<div class="col-4 p-2 tab">
					<a href="detail" class="btn">지점상세</a>
				</div>
				<div class="col-4 p-2 tab_selected" >
					<a href="timetable" class="btn">상영시간표</a>
				</div>
				<div class="col-4 p-2 tab">
					<a href="price" class="btn">가격</a>
				</div>
			</div>
			
			<div class="mt-5 border p-3" style="height:1000px;">
				<p class="fs-1"> 여기에 상영시간표 구현해야함</p>
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