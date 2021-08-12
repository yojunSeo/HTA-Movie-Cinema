<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
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
	<div class="container">
		<main>
			<h3 class="mt-5 mb-3">${LOGINED_USER.name }님의 예매내역 </h3>
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
								<tr class="text-center" id="${booking.BOOKINGCODE }" data-screen-code=${booking.SCREENCODE }>
									<td>${booking.BOOKINGCODE }</td>
									<td class="text-start">${booking.MOVIENAME }</td>
									<td>${booking.BRANCHNAME }(${booking.ROOMNAME })</td>
									<td><span id="screen-date"><fmt:formatDate value="${booking.SCHEDULEDATE }" pattern="yyyy-MM-dd"/></span> (<fmt:formatDate value="${booking.STARTTIME }" pattern="HH:mm"/> ~ <fmt:formatDate value="${booking.ENDTIME }" pattern="HH:mm"/>)</td>
									<td><fmt:formatDate value="${booking.BOOKINGDATE }" pattern="yyyy/MM/dd"/></td>
									<td><fmt:formatNumber>${booking.TOTALPRICE }</fmt:formatNumber> 원</td>
									<c:choose>
										<c:when test="${today gt booking.ENDTIME and booking.STATUS eq 'Y'}">
											<c:choose>
												<c:when test="${booking.REVIEWSTATUS eq 'Y' }">
													<td><button class="btn btn-sm btn-outline-primary">리뷰수정</button></td>
												</c:when>
												<c:otherwise>
													<td><button class="btn btn-sm btn-outline-success">리뷰작성</button></td>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<td></td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${today lt booking.STARTTIME }">
											<td><button class="btn btn-sm btn-outline-danger">예매취소</button></td>
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
		</main>
	</div>
	 
	 <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
      crossorigin="anonymous"></script>          
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script type="text/javascript">
	$(function(){
				
		var reviewModal = new bootstrap.Modal(document.getElementById("review-modal"), {
			keyboard: false
		});
		
		$('#booking-table tbody td').on('click', '.btn', function(){
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
			}
			
		});
		
		// 모달창에서 삭제버튼을 눌렀을때 실행되야한다.
		
	})
	</script>
