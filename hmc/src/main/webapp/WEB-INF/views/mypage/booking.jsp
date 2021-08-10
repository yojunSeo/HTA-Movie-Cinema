<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<title>마이페이지-HMC</title>
</head>
<style type = "text/css">
html, body {
	width: 100%;
	height: 100%;
}

.box {
	background-color: #FF243E;
	width: 100vw;
	margin-left: calc(-50vw + 50%);
	height: 350px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.box2 {
	margin-top: 100px;
	margin-left: 220px;
	width: 1280px;
	height: 400px;
	padding: 20px;
	background-color: #FFFFFF;
	background-position: center;
	background-size: cover;
	backgroudd-repeat: no-repeat;
/* 	border: 3px solid black; */
}

.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
    border: none;
    outline: none;
    color: #000000;
    backgrone-color: #FFFFFF;
}
span.large{
        font-size: 18px;
      }

.nav-tabs, .nav-item .nav-link {
	border: none;
	outline: none;
}
.nav-link, .nav-link:hover {
	color: #000000;
}
.nav-link.active {
	font-weight : bold;
}
.dropdown-item, .dropdown-item:hover {
	color: #000000;
	border: none;
	outline: none;
	background-color: #FFFFFF;
}
.dropdown-item.active {
	font-weight : bold;
	color: #000000;
	background-color: #FFFFFF;
}
</style>  
<body>
	<div class="container">
		<main>
			<h3 class="mt-5 mb-3">${LOGINED_USER.name }님의 예매내역 </h3>
			<table class="table table-hover" id="booking-table">
				<colgroup>
					<col width="15%"/>
					<col width="*%"/>
					<col width="*%"/>
					<col width="20%"/>
					<col width="15%"/>
					<col width="8%"/>
					<col width="8%"/>
				</colgroup>
				<thead>
					<tr class="text-center">
						<th>예매번호</th>
						<th class="text-start">영화</th>
						<th>예매정보</th>
						<th>예매일시</th>
						<th>결제금액</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty bookings }">
							<tr class="text-center">
									<td colspan="5">예매내역이 존재하지 않습니다.</td>
								</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="booking" items="${bookings }">
								<tr class="text-center" id="${booking.BOOKINGCODE }" data-screen-code=${booking.SCREENCODE }>
									<td>${booking.BOOKINGCODE }</td>
									<td class="text-start">${booking.MOVIENAME }</td>
									<td class="text-start">${booking.BRANCHNAME }(${booking.ROOMNAME }) <fmt:formatDate value="${booking.STARTTIME }" pattern="HH:mm"/> ~ <fmt:formatDate value="${booking.ENDTIME }" pattern="HH:mm"/></td>
									<td><fmt:formatDate value="${booking.BOOKINGDATE }" pattern="yyyy/MM/dd HH시mm분"/></td>
									<td>${booking.TOTALPRICE } 원</td>
									<td><button class="btn btn-sm btn-outline-success">리뷰작성</button></td>
									<td><button class="btn btn-sm btn-outline-danger">예매취소</button></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<!-- ***********************모달시작******************************** -->
			<div class="modal fade" id="review-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header" id="schedule-detail-head" style="background-color: #666666">
								<p class="modal-title text-white fw-bold" id="exampleModalLabel">리뷰를 작성해주세요.</p>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form action="post" id="review-form">
								<input type="hidden" name="screenCode" value="넘넘 재밌어용~~~"/>
								<textarea rows="5" cols="60">
								</textarea>
								</form>
							</div>
							<div class="modal-footer" id="schedule-detail-footer">
								<button type="button" class="btn btn-dark" data-bs-dismiss="modal">취소</button>
								<button type="button" id="go-booking" class="btn text-white" style="background-color: #FF243E" >작성완료</button>
							</div>
						</div>
				</div>
			</div>
			<!-- ***********************모달끝******************************** -->
		</main>
	</div>
	 
	 <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
      crossorigin="anonymous"></script>          
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script type="text/javascript">
	$(function(){
		
		// 스케줄 선택했을때 모달 띄우면서 정보 확인 후 좌석창으로 이동
		var todoModal = new bootstrap.Modal(document.getElementById("review-modal"), {
			keyboard: false
		})
		
		$('#booking-table tbody').on('click', '.btn-outline-success' ,function(){
			var bookingCode = $(this).closest('tr').attr('id');
			var screenCode = $(this).closest('tr').data('screen-code');
			var movieName = $(this).closest('tr').
			// 스크린 정보 가져가서 정보 받아와서 모달 띄우기
			//var result = getMovieGrade(grade);
			//var movieGrade = result.movieGrade;
			//var gradeClass = result.gradeClass;
			
/* 			$('#schedule-detail-head').empty();
			$header = "<p class='modal-title text-white fw-bold' id='exampleModalLabel'><span class='badge rounded-pill "+gradeClass+" mx-3'>"+movieGrade+"</span>"+schedule.movieName+"</p>";
			$header += "<button type='button' class='btn-close' data-bs-dismiss='modal' aria-label='Close'></button>";
			$('#schedule-detail-head').append($header);
			
			$('#schedule-detail').empty();
			$detail = "<p><span class='big fw-bolder'>날짜</span> : "+schedule.scheduleDate+"</p>";
			$detail += "<p><span class='big fw-bolder'>지점</span> : "+schedule.branchName+"</p>";
			$detail += "<p><span class='big fw-bolder'>상영관</span> : "+schedule.roomName+"</p>";
			$detail += "<p><span class='big fw-bolder'>상영시간</span> : "+schedule.startTime+" ~ "+schedule.endTime+"</p>";
			$detail += "<p><span class='big fw-bolder'>잔여좌석</span> : <span class='text-danger big fw-bolder'>"+schedule.emptySeat+"</span> / "+schedule.totalSeat+"</p>";
			$detail += "<p><span class='badge rounded-pill "+gradeClass+" mx-3'>"+movieGrade+"</span> 본 영화는 "+grade+" 영화입니다.</p>";
			$('#schedule-detail').append($detail);
			
			$('#schedule-detail-footer').empty();
			$footer = "<button type='button' class='btn btn-dark' data-bs-dismiss='modal'>취소</button>";
			$footer += "<button type='button' id='go-booking' class='btn text-white' style='background-color: #FF243E' data-schedulecode="+schedule.scheduleCode+" >인원/좌석 선택</button>";
			$('#schedule-detail-footer').append($footer);
			 */
			todoModal.show();
				
		});
	})
	</script>
</body>
</html>