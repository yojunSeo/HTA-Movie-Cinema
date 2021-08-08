<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>샘플 애플리케이션</title>
</head>
<body>
<div class="container my-3">
<h1>### 채은 테스트 페이지 ###</h1>
	<h2>Step1. 영화 스케줄 등록 테스트</h2>
		<form id="form-movie" method="post" action="testSchedule">
			<div class="mb-3">
				<label class="form-label">영화</label>
				<select name="screenCode">
					<option value="" selected disabled> 선택하세요</option>
					<c:forEach var="movie" items="${movies }">
           	 			<option value="${movie.code }">${movie.movieName }</option>
					</c:forEach>
        		</select>
			</div>
			<div class="mb-3">
				<label class="form-label">영화관</label>
				<input type="text" class="form-control" name="branchCode"  value="BR000001 왕십리점"/>
			</div>
			<div class="mb-3">
				<label class="form-label">상영관</label>
				<select name="roomCode">
        			<option value="" selected disabled> 선택하세요</option>
        			<c:forEach var="room" items="${rooms }">
        				<option value="${room.code }">${room.name }</option>
        			</c:forEach>
        		</select>
			</div>
			<div class="mb-3">
				<label class="form-label">상영일자</label>
				<input type="date" class="form-control" name="scheduleDate" />
			</div>
			<div class="mb-3">
				<label class="form-label">상영시간</label>
				<input type="datetime-local" class="form-control" name="startTime"/>
			</div>
			<div class="mb-3 text-end">
				<button type="submit" class="btn btn-primary">등록</button>
			</div>
		</form>
	<h2>현재 스케줄</h2>
		<table class="table">
			<colgroup>
				<col width="15%">
				<col width="15%">
				<col width="*">
				<col width="15%">
				<col width="15%">
				<col width="15%">
			</colgroup>
			<thead>
				<tr>
					<th>영화관</th>
					<th>상영관</th>
					<th>영화</th>
					<th>상영일자</th>
					<th>시작시간</th>
					<th>종료시간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="schedule" items="${schedules }">
					<tr>
						<td>${schedule.BRANCHNAME }</td>
						<td>${schedule.ROOMNAME }</td>
						<td>${schedule.MOVIENAME }</td>
						<td><fmt:formatDate value="${schedule.SCHEDULEDATE }" pattern="yyyy/MM/dd" /></td>
						<td><fmt:formatDate value="${schedule.STARTTIME }" pattern="HH:mm"/></td>
						<td><fmt:formatDate value="${schedule.ENDTIME }"  pattern="HH:mm"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="mb-3 text-end">
				<a class="btn btn-primary" href="testBookingHome">예매하러가기</a>
		</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

</script>
</body>
</html>