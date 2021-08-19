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
	width: 100vw;
	margin-left: calc(-50vw + 50%);
	
}
p.info {
	font-size: 17px;
}
span.info {
	font-size: 17px;
}
.box1 {
	background-color: #FF243E;
	width: 100vw;
	margin-left: calc(-50vw + 50%);
	height: 350px;	
}

.box2 {
	margin-top: 100px;

	width: 1280px;
	height: 400px;
	padding: 20px;
	background-color: #FFFFFF;
	background-position: center;
	background-size: cover;
	backgroudd-repeat: no-repeat;
}

.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
    border: none;
    outline: none;
    color: #000000;
    backgrone-color: #FFFFFF;
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

		<header><%@ include file="../common/header.jsp"%></header>

		<main>
			<%@include file="main.jsp" %>
			<h3 class="mt-5 mb-3 mx-3">예매 / 리뷰 정보 </h3>
			<table class="table table-hover" id="booking-table">
				<colgroup>
					<col width="10%"/>
					<col width="*%"/>
					<col width="15%"/>
					<col width="*%"/>
					<col width="15%"/>
					<col width="8%"/>
					<col width="8%"/>
					<col width="8%"/>
				</colgroup>
				<thead>
					<tr class="text-center">
						<th>예매번호</th>
						<th>영화</th>
						<th>예매정보</th>
						<th>상영시간</th>
						<th>예매일시</th>
						<th>결제금액</th>
						<th>리뷰</th>
						<th>예매취소</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty bookings }">
							<tr class="text-center">
									<td colspan="8">예매내역이 존재하지 않습니다.</td>
								</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="booking" items="${bookings }">
								<tr class="text-center" id="${booking.BOOKINGCODE }" data-schedule-code=${booking.SCHEDULECODE } data-screen-code=${booking.SCREENCODE }>
									<td class="bookInfo">${booking.BOOKINGCODE }</td>
									<td class="text-start bookInfo">${booking.MOVIENAME }</td>
									<td class="bookInfo">${booking.BRANCHNAME }(${booking.ROOMNAME })</td>
									<td class="bookInfo"><span id="screen-date"><fmt:formatDate value="${booking.SCHEDULEDATE }" pattern="yyyy-MM-dd"/></span> (<fmt:formatDate value="${booking.STARTTIME }" pattern="HH:mm"/> ~ <fmt:formatDate value="${booking.ENDTIME }" pattern="HH:mm"/>)</td>
									<td class="bookInfo"><fmt:formatDate value="${booking.BOOKINGDATE }" pattern="yyyy/MM/dd"/></td>
									<td class="bookInfo"><fmt:formatNumber>${booking.TOTALPRICE }</fmt:formatNumber> 원</td>
									<c:choose>
										<c:when test="${today gt booking.ENDTIME and booking.STATUS eq 'Y'}">
											<c:choose>
												<c:when test="${booking.REVIEWSTATUS eq 'Y' }">
													<td><button class="btn btn-sm btn-outline-primary review">리뷰수정</button></td>
												</c:when>
												<c:otherwise>
													<td><button class="btn btn-sm btn-outline-success review">리뷰작성</button></td>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<td></td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${today lt booking.STARTTIME }">
											<c:choose>
												<c:when test="${booking.STATUS eq 'Y' }">
													<td><button class="btn btn-sm btn-outline-danger">예매취소</button></td>
												</c:when>
												<c:otherwise>
													<td>취소됨</td>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<td></td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<!-- 예약 모달 시작 -->
			<div class="modal fade" id="booking-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header bg-dark text-white">
						<h5 class="modal-title" id="exampleModalLabel">예매정보</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
					<div class="row" id="booked-info">
						<div class="col-6">
							<div class="offset-2">
								<img class="mt-3" src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202108/17652_103_1.jpg" width="220px" height="300px">
								<p class="mx-2 info fw-bold"><span class="badge rounded-pill mx-1">15</span><span>더 수어사이드 스쿼드</span></p>
								<p class="fs-5">2021-08-18 (18:00 ~ 20:40)</p>
								<p class="fs-5">왕십리점 (3관) [D3/D4]</p>
							</div>
						</div>
						<div class="col-5 border border-2 border-secondary">
							<p class="text-center"><strong class="fs-5">[ 결제정보 ]</strong></p>
							<p class="info mb-0"><strong>- 사용쿠폰</strong></p>
							<p class="fs-6 mt-0">BRONZE 등급 5000원 할인 쿠폰</p>
							<p class="info mb-0"><strong>- 사용포인트</strong></p>
							<p class="fs-6 mt-0"><span>3000</span> point</p>
							<p class="info mb-0"><strong>- 적립포인트</strong></p>
							<p class="fs-6 mt-0"><span>350</span> point</p>
							<p class="info mb-0"><strong>- 결제금액</strong></p>
							<p class="fs-6 mt-0"><span class="fw-bold">30,000</span> 원</p>
							<p class="info mb-0"><strong>- 할인금액</strong></p>
							<p class="fs-6 mt-0"><span class="fw-bold text-warning">4,000</span> 원</p>
							<p class="info mb-0"><strong>- 총 결제금액</strong></p>
							<p class="fs-6 mt-0"><span class="fw-bold text-danger">26,000</span> 원</p>
						</div>
					</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">확인</button>
					</div>
				</div>
				</div>
			</div>
			<!-- 예약 모달 종료 -->
			<!-- 리뷰 모달 시작 -->
			<div class="modal fade" id="review-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">관람하신 영화의 리뷰를 남겨주세요!</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
					<!-- 리뷰 폼 -->
						<form id="review-form">
							<input type="hidden" name="reviewCode" id="review-code" />
							<input type="hidden" name="screenCode" id="screen-code" />
							<input type="hidden" name="bookingCode" id="booking-code" />
							<div class="row px-2 mb-2">
								<label class="form-control-label mb-2"><strong>관람영화</strong></label>
								<input type="text" class="form-control" id="review-movie" name="movie" value="블랙위도우" readonly="readonly">
							</div>
							<div class="row px-2 mb-2">
								<label class="form-control-label mb-2"><strong>관람일시</strong></label>
								<input type="date" class="form-control" id="review-date" name="date" value="2021-08-10" readonly="readonly">
							</div>
							<div class="row px-2 mb-2">
								<label class="mb-3"><strong>평점</strong></label>
								<div class="form-check">
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="score" value="5" checked="checked">
										<label class="form-check-label">5</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="score" value="4">
										<label class="form-check-label">4</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="score" value="3">
										<label class="form-check-label">3</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="score" value="2">
										<label class="form-check-label">2</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="score" value="1">
										<label class="form-check-label">1</label>
									</div>
								</div>
							</div>
							<div class="row px-2">
								<textarea rows="5" class="form-control" id="review-content" name="content" placeholder="리뷰 내용"></textarea>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-dark" data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn text-white" id="review-submit" style="background-color: #FF243E">등록</button>
						<button type="button" class="btn text-white btn-secondary" id="review-delete" hidden>삭제</button>
					</div>
				</div>
				</div>
			</div>
			<!-- 페이징 -->
			<c:if test="${pagination.totalRows gt 0 }">
				<div class="row mb-2">
					<div class="col-12">
						<ul class="pagination justify-content-center">
							<li class="page-item ${pagination.pageNo le 1 ? 'disabled' : ''}">
								<a class="page-link" href="booking?page=${pagination.pageNo - 1 }">이전</a>
							</li>
							<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
								<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
									<a class="page-link" href="booking?page=${num }">${num }</a>
								</li>
							</c:forEach>
							<li class="page-item ${pagination.pageNo ge pagination.totalPages ? 'disabled' : ''}">
								<a class="page-link" href="booking?page=${pagination.pageNo + 1 }">다음</a>
							</li>
						</ul>
					</div>
				</div>
			</c:if>
		</main>
		<footer><%@ include file="../common/footer.jsp"%></footer>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

	<script>
	$(function(){
		
		var reviewModal = new bootstrap.Modal(document.getElementById("review-modal"), {
			keyboard: false
		});
		
		var bookingModal = new bootstrap.Modal(document.getElementById("booking-modal"), {
			keyboard: false
		});
		
		$('#booking-table tbody').on('click', '.bookInfo', function(){
			var scheduleCode = $(this).closest('tr').data('schedule-code');
			var bookingCode = $(this).closest('tr').attr('id');
			$.ajax({
				type:"GET",
				url:"rest/booking/modal",
				data:{scheduleCode:scheduleCode,bookingCode:bookingCode},
				dataType:"json"
			}).done(function(result){
				var schedule = result.schedule;
				var booking = result.booking;
				var bookedDetail = result.bookDetail;
				console.log(schedule)
				console.log(booking)
				console.log(bookedDetail)
				$('#booking-modal #booked-info img').attr('src', schedule.poster);
				var gradeInfo = getMovieGrade(schedule.movieGrade);
				$('#booking-modal #booked-info > div:first p:first').empty();
				$('#booking-modal #booked-info > div:first p:first').append("<span><span class='badge rounded-pill mx-1 "+gradeInfo.gradeClass+"'>"+gradeInfo.movieGrade+"</span><span>"+schedule.movieName+"</span>");
				var infoText1 = schedule.scheduleDate + " (" + schedule.startTime + " ~ " + schedule.endTime + ")";
				$('#booking-modal #booked-info > div:first p:eq(1)').text(infoText1);
				var infoText2;
				if(bookedDetail){
					var infoText2 = schedule.branchName + " (" + schedule.roomName + ") " + bookedDetail.BOOKEDSEAT;
				}else{
					var infoText2 = schedule.branchName + " (" + schedule.roomName + ") ";
				}
				$('#booking-modal #booked-info > div:first p:eq(2)').text(infoText2);
				if(bookedDetail){
					$('#booking-modal #booked-info > div:eq(1) > p:eq(2)').text(bookedDetail.COUPONNAME);
					$('#booking-modal #booked-info > div:eq(1) > p:eq(4) span').text(bookedDetail.USEDPOINT);
					$('#booking-modal #booked-info > div:eq(1) > p:eq(6) span').text(bookedDetail.SAVEDPOINT);
				}else{
					$('#booking-modal #booked-info > div:eq(1) > p:eq(2)').text('이전');
					$('#booking-modal #booked-info > div:eq(1) > p:eq(4) span').text('이전');
					$('#booking-modal #booked-info > div:eq(1) > p:eq(6) span').text('이전');
				}
				$('#booking-modal #booked-info > div:eq(1) > p:eq(8) span').text(booking.price);
				$('#booking-modal #booked-info > div:eq(1) > p:eq(10) span').text(booking.discountPrice);
				$('#booking-modal #booked-info > div:eq(1) > p:eq(12) span').text(booking.totalPrice);
				bookingModal.show();
			})
		})
		
		$('#booking-table tbody td').on('click', '.review', function(){
			var bookingCode = $(this).closest('tr').attr('id');
			var screenCode = $(this).closest('tr').data('screen-code');
			var movieName = $(this).closest('tr').children().eq(1).text();		
			var screenDate = $(this).closest('tr').children().has('span').find('#screen-date').text();		
			
			if($(this).hasClass('btn-outline-success')){
			$("#screen-code").val(screenCode);
			$("#booking-code").val(bookingCode);
			$("#review-movie").val(movieName);
			$("#review-date").val(screenDate);
			$(":radio[name=score]").eq(0).prop("checked", true);
			$("#review-content").val("");
			$("#review-submit").text("등록");
			$("#review-delete").prop('hidden', true);
			
			}else if($(this).hasClass('btn-outline-primary')){
				$("#screen-code").val(screenCode);
				$("#booking-code").val(bookingCode);
				$("#review-movie").val(movieName);
				$("#review-date").val(screenDate);
				
				$.getJSON('rest/user/review', function(reviews){
					$.each(reviews, function(index, review){
						if(review.bookingCode == bookingCode){
							var reviewContent = review.content;
							var reviewScore = review.score;
							$('#review-code').val(review.code);
							$(':radio[value='+reviewScore+']').prop('checked', true)
							$("#review-content").val(reviewContent);
							$("#review-submit").text("수정");
							$("#review-delete").prop('hidden', false);
						}
					})
				});
			}
			reviewModal.show();
		})
		
		function getMovieGrade(grade){
			var movieGrade;
			var gradeClass;
			console.log(grade)
			if(grade == "12세이상관람가"){
				movieGrade = 12;
				gradeClass = "bg-warning";
			}else if(grade == "15세이상관람가"){
				movieGrade = 15;
				gradeClass = "bg-success";
			}else if(grade == "전체관람가"){
				movieGrade = "All";
				gradeClass = "bg-info";
			}else{
				movieGrade = "19";
				gradeClass = "bg-danger";					
			}
			var result = {movieGrade:movieGrade , gradeClass:gradeClass}
			console.log(result)
			return result;
		}
		
		// 모달창에서 등록/수정 버튼을 클릭했을 때 실행된다.
		$("#review-submit").click(function() {
			var status = $("#review-submit").text();
			if(status == "수정"){
				$.ajax({
					type: "POST",
					url: "rest/review/modify",
					data: $("#review-form").serialize(),
					dataType: 'json',
					complete: function() {
						reviewModal.hide();
					}
				});
				alert("리뷰가 수정되었습니다.");
				location.href = "booking";
				
			}else if(status == "등록"){
				$.ajax({
					type: "POST",
					url: "rest/review/register",
					data: $("#review-form").serialize(),
					dataType: 'json',
					complete: function() {
						reviewModal.hide();
					}
				})
				alert("리뷰가 등록되었습니다.");
				location.href = "booking";
			}
			
		});
		
		// 모달창에서 삭제버튼을 눌렀을때 실행되야한다.
		$('#review-delete').on('click', function(){
			var reviewCode = $('#review-code').val();
			$.ajax({
				type: "GET",
				url: "rest/review/delete",
				data: {reviewCode:reviewCode},
				dataType: 'json',
				complete: function() {
					reviewModal.hide();
				}
			})
			alert("리뷰가 삭제되었습니다.");
			location.href = "booking";
		});
		
		$('#booking-table tbody td').on('click', '.btn-outline-danger', function(){
			var confirmValue = confirm('예매를 취소하시겠습니까?\n \n* 예매로 인해 적립된 포인트가 사라집니다. \n* 예매취소로 인한 등급변경이 존재하는 경우,\n  등급변경으로지급된 쿠폰과 포인트가 회수됩니다.');
			if(!confirmValue){
				return false;
			}
			var bookingCode = $(this).closest('tr').attr('id');
			location.href = "cancelBooking?bookingCode="+bookingCode;
		});
		
		// 회원정보가 성공적으로 변경되었을때 실행할 alert창
		var urlParams = new URLSearchParams(window.location.search);
		var userchangeMyInfo = urlParams.get('changeMyInfo');
		if(userchangeMyInfo != null){
			alert("회원정보가 변경되었습니다.");
			location.href = "home";
		}
	});
		
		
		
	</script>
</body>
</html>