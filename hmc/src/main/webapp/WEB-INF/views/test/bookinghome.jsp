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
	<h2>현재 예매가능한 스케줄</h2>
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
					<th>상영시간</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="schedule" items="${schedules }">
					<tr>
						<td>${schedule.BRANCHNAME }</td>
						<td>${schedule.ROOMNAME }</td>
						<td>${schedule.MOVIENAME }</td>
						<td><fmt:formatDate value="${schedule.SCHEDULEDATE }" pattern="yyyy/MM/dd" /></td>
						<td><fmt:formatDate value="${schedule.STARTTIME }" pattern="HH:mm"/> ~ <fmt:formatDate value="${schedule.ENDTIME }"  pattern="HH:mm"/></td>
						<td><a class="btn btn-primary" href="testBooking?scheduleCode=${schedule.SCHEDULECODE }">예매</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	<h2>내 예매내역</h2>
		<table class="table">
			<colgroup>
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="*">
				<col width="15%">
				<col width="15%">
			</colgroup>
			<thead>
				<tr>
					<th>예매번호</th>
					<th>영화</th>
					<th>영화관</th>
					<th>상영일자/시간</th>
					<th>인원</th>
					<th>가격</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="booking" items="${bookings }">
					<tr>
						<td>${booking.BOOKINGCODE }</td>
						<td>${booking.MOVIENAME }</td>
						<td>${booking.BRANCHNAME } / ${booking.ROOMNAME }</td>
						<td>[<fmt:formatDate value="${booking.SCHEDULEDATE }" pattern="yyyy/MM/dd" />] <fmt:formatDate value="${booking.STARTTIME }" pattern="HH:mm"/> ~ <fmt:formatDate value="${booking.ENDTIME }"  pattern="HH:mm"/></td>
						<td>${booking.COUNT } 명</td>
						<td>${booking.TOTALPRICE }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="mb-3 text-end">
			<a class="btn btn-primary" href="testSchedule">스케줄등록</a>
		</div>
	
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

</script>
</body>
</html>