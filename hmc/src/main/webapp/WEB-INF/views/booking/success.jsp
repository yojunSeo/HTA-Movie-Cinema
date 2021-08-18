<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" >
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
    <style>
      span {
      	font-family: "Nanum Gothic", sans-serif;
        font-size: 17px;
      }
      span.large{
        font-family: "Nanum Gothic", sans-serif;
        font-size: 18px;

      }
      span.big{
        font-family: "Nanum Gothic", sans-serif;
        font-size: 20px;
      }
      p {
        font-family: "Nanum Gothic", sans-serif;
        font-size: 20px;
      }
      span.big{
        font-family: "Nanum Gothic", sans-serif;
        font-size: 20px;
      }
      em{
      	font-family: "Nanum Gothic", sans-serif;
        font-size: 16px;
      }
      p.small{
      font-size: 17px;
      }
	  
      p.a {
        font-weight: 400;
      }
      p.b {
        font-weight: 700;
      }
      p.c {
        font-weight: 800;
      }
      p.d {
        font-weight: bold;
      }
    </style>
<title>좌석선택-HMC</title>
</head>
<body>
	<div class="container-fluid">

	<header>
		<%@ include file="../common/header.jsp" %>
	</header>

	<main>
		<div class="row my-5" style="background-color:#444444; height: 900px">
			<div class="row my-5">
				<div class="col-8 offset-2"  style="background-color:#E2E3E5;height: 600px">
					<div class="row">
						<div class="col-12 text-light text-center border-end border-secondary" style="background-color: #000000"><p class="my-2"><small class="fw-bold">예매완료</small></p></div>
					</div>
					<div class="row" style="background-color:#FFFFFF">
						<!-- 영화정보 -->
						<div class="col-4 border-end border-secondary" style="height: 600px">
							<div id="schedule-info">
								<img class="mt-5 offset-3" src="${schedule.poster }" width="150px" height="230px">
								<p class="mx-5">영화 : ${schedule.movieName }</p>
								<p class="mx-5"><span class="large">일시 : </span><span class="fw-bold"><fmt:formatDate value="${schedule.scheduleDate }" pattern="yyyy-MM-dd"/> / </span><span><fmt:formatDate value="${schedule.startTime }" pattern="HH:mm"/> ~ <fmt:formatDate value="${schedule.endTime }" pattern="HH:mm"/></span></p>
								<p class="mx-5"><span class="large">영화관 : </span><span>${schedule.branchName } / ${schedule.roomName }</span></p>
								<p class="mx-5"><span class="large" >좌석 : </span><span>${seats }</span></p>
							</div>
						</div>
						<div class="col-4 border-end border-secondary" style="height: 600px">
							<div id="booking-info" class="mt-5">
								<p class="mx-5"><span class="large"><strong>예매번호 : </strong> </span><span>${booking.code }</span></p>
								<p class="mx-5"><span class="large"><strong>상품가격 : </strong></span><span>${booking.price }</span></p>
								<p class="mx-5"><span class="large"><strong>할인가격 : </strong></span><span>${booking.discountPrice }</span></p>
								<p class="mx-5"><span class="large"><strong>총 결제금액 : </strong></span><span>${booking.totalPrice }</span></p>
								<p class="mx-5"><span class="large"><strong>${LOGINED_USER.name }님의 현재 등급 :</strong> ${LOGINED_USER.grade } </span></p>
								<p class="mx-5"><span class="large"><strong>적립된 포인트 :</strong> ${book.savedPoint }</span></p>
								<p class="mx-5"><span class="large"><strong>사용한 포인트 :</strong> ${book.usedPoint }</span></p>
								<p class="mx-5"><span class="large"><strong>현재포인트 :</strong> ${LOGINED_USER.point }</span></p>
							</div>
						</div>
						<!-- 예매정보 -->
						<div class="col-4" style="height: 600px">
							<div>
								<p class="mt-5 mx-3"><strong>예매가 완료되었습니다! 감사합니다!</strong></p>
								<p></p>
								<c:if test="${beforeGrade ne LOGINED_USER.grade }">
									<p class="mx-5">축하합니다!!</p>
									<p>${LOGINED_USER.grade } 등급이 되셨습니다!</p>
									<p>축하 쿠폰과 포인트를 지급해드렸으니 </p>
									<p>마이페이지에서 확인해주세요!</p>
								</c:if>
								<p style="height:300px"></p>
								<a href="../../home" class="btn float-end mt-2 text-white" style="background-color: #FF243E; width: 390px; height: 50px"><span class="large">완료</span></a>
							</div>
						</div>
					</div>
					<div class="row" style="background-color: #000000;" >
						<p></p>
					</div>
				</div>
			</div>
		</div>
	</main>

	<footer>
		<%@ include file="../common/footer.jsp" %>
	</footer>

</div>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script>

</script>
</body>
</html>