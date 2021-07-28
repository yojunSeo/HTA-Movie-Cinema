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
	<h2>예매페이지</h2>
	<p>영화 : ${schedule.MOVIENAME }</p>
	<p>상영관 : ${schedule.BRANCHNAME } / ${schedule.ROOMNAME }</p>
	<p>시간 : [<fmt:formatDate value="${schedule.SCHEDULEDATE }" pattern="yyyy/MM/dd" />] <fmt:formatDate value="${schedule.STARTTIME }" pattern="HH:mm"/> ~ <fmt:formatDate value="${schedule.ENDTIME }"  pattern="HH:mm"/></p>
	<form id="form-movie" method="post" action="testBooking?schduleCode=${schedule.SCHEDULECODE }">
			<div class="mb-3">
				<label class="form-label">좌석 :</label>
				<select name="seatCode">
					<option value="" selected disabled> 선택하세요</option>
					<c:forEach var="seat" items="${seats }">
           	 			<option value="${seat.code }"> ${seat.row }${seat.col }(${seat.type })</option>
					</c:forEach>
        		</select>
			</div>
			<div class="mb-3">
				<label class="form-label">결제방식 :</label>
				<select name="paymentWay">
        			<option value="" selected disabled> 선택하세요</option>
        			<option value="카카오페이"> 카카오페이</option>
        			<option value="네이버페이"> 네이버페이</option>
        			<option value="무통장입급"> 무통장입급</option>
        		</select>
			</div>
			<div class="mb-3 text-end">
				<button type="submit" class="btn btn-primary">예매</button>
			</div>
		</form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

</script>
</body>
</html>