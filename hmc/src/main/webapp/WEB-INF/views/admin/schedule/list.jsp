<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
<title>상영스케줄 조회-HMC</title>
</head>
<body>
   <div class="container">

      <header>
      </header>

      <main>
         <div class="mt-3">
			<h2 class="fw-lighter">상영스케줄 조회/변경/삭제</h2>
			<a href="screen/list">스크린영화</a>
			<a href="register">스캐줄등록</a>
		</div>
		<div class="row mb-2">
				<div class="col-12">
					<form id="form-search" class="form-inline justify-content-end" method="get" action="list">
						<input type="hidden" name="no" value="" />
						<input type="hidden" name="page" value="${pagination.pageNo }">
						<select class="form-control mr-4" name="opt" id="branch">
							<option selected disabled> 영화관</option>
							<c:forEach var="branch" items="${branchs }">
								<option value="${branch.code }"> ${branch.name }</option>
							</c:forEach>
						</select>
						<select class="form-control mr-4" name="opt" id="room">
							<option selected disabled> 상영관</option>
							<option> 1관</option>
							<option> 2관</option>
							<option> 3관</option>
						</select>
						<select class="form-control mr-4" name="opt" id="movie">
							<option selected disabled> 영화</option>
							<c:forEach var="movie" items="${movies }">
								<option value="${movie.code }"> ${movie.movieName }</option>
							</c:forEach>
						</select>
						<input type="date" class="form-control mr-2" name="screenDate" value="" id="date">
						<button type="button" class="btn btn-outline-primary" onclick="submitForm()">조회</button>
					</form>
				</div>
			</div>
		<!-- 상영스케줄 테이블 시작 -->
		<div class="row">
		<table class="table table-hover">
			<colgroup>
				<col width="3%">
				<col width="10%">
				<col width="10%">
				<col width="*%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="*%">
				<col width="7%">
				<col width="7%">
			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox" id="checkbox-all-selected"></th>
					<th class="text-center">영화관</th>
					<th class="text-center">상영관</th>
					<th class="text-center">영화</th>
					<th class="text-center">상영일자</th>
					<th class="text-center">시작</th>
					<th class="text-center">종료</th>
					<th class="text-center">예매</th>
					<th class="text-center"></th>
					<th class="text-center"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="schedule" items="${schedules }" >
					<tr>
						<td><input type="checkbox" id="checkbox-all-selected"></td>
						<td class="text-center">${schedule.branchName }</td>
						<td class="text-center">${schedule.roomName }</td>
						<td class="text-center">${schedule.movieName }</td>
						<td class="text-center"><fmt:formatDate value="${schedule.scheduleDate }" pattern="yyyy-MM-dd"/></td>
						<td class="text-center"><fmt:formatDate value="${schedule.startTime }" pattern="HH:mm"/></td>
						<td class="text-center"><fmt:formatDate value="${schedule.endTime }" pattern="HH:mm"/></td>
						<td class="text-center">${schedule.emptySeat }/${schedule.totalSeat }</td>
						<td class="text-center"><button class="btn btn-outline-warning btn-sm">수정</button></td>
						<td class="text-center"><button class="btn btn-outline-danger btn-sm">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="text-right">
			<button class="btn btn-outline-secondary btn-sm" id="btn-remove-all-row">전체 삭제</button>
			<button class="btn btn-outline-secondary btn-sm" id="btn-remove-checked-row">선택 삭제</button>
		</div>
		</div>
		<c:if test="${pagination.totalRows gt 0 }">
			<div class="row mb-2">
				<div class="col-12">
					<ul class="pagination justify-content-center">
						<li class="page-item ${pagination.pageNo le 1 ? 'disabled' : ''}">
							<a class="page-link" href="list?page=${pagination.pageNo - 1 }">이전</a>
						</li>
						<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
							<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
								<a class="page-link" href="list?page=${num }">${num }</a>
							</li>
						</c:forEach>
						<li class="page-item ${pagination.pageNo ge pagination.totalPages ? 'disabled' : ''}">
							<a class="page-link" href="list?page=${pagination.pageNo + 1 }">다음</a>
						</li>
					</ul>
				</div>
			</div>
		</c:if>
      </main>

      <footer>
      </footer>

   </div>
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

   <script>
      
   </script>
</body>
</html>