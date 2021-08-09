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
					<div class="row" id="schedule-kind">
						<div class="col-4 text-light text-center border-end border-secondary" style="background-color: #000000"><p class="my-2"><small class="fw-bold">예매정보</small></p></div>
						<div class="col-4 text-light text-center border-end border-secondary" style="background-color: #000000"><p class="my-2"><small class="fw-bold">할인/적립</small></p></div>
						<div class="col-4 text-light text-center" style="background-color: #000000"><p class="my-2"><small class="fw-bold">결제수단</small></p></div>
					</div>
					<div class="row" style="background-color:#FFFFFF">
						<!-- 예매정보 -->
						<div class="col-4 border-end border-secondary" style="height: 600px">
							<div id="booking-info">
								<img class="mt-3 offset-3" src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202107/17616_104_1.jpg" width="150px" height="230px">
								<p class="mx-2"><span class='badge rounded-pill mx-3' data-movie-grade="${schedule.movieGrade }">12</span>${schedule.movieName }</p>
								<p class="mx-5"><span class="large">일시 : </span><span class="fw-bold"><fmt:formatDate value="${schedule.scheduleDate }" pattern="yyyy-MM-dd"/> / </span><span><fmt:formatDate value="${schedule.startTime }" pattern="HH:mm"/> ~ <fmt:formatDate value="${schedule.endTime }" pattern="HH:mm"/></span></p>
								<p class="mx-5"><span class="large">영화관 : </span><span>${schedule.branchName } / ${schedule.roomName }</span></p>
								<p class="mx-5"><span class="large">인원 : </span><span>${seatCnt } 명</span></p>
								<p class="mx-5"><span class="large" data-seat-code="${param.seats }">좌석 : </span><span>${seats }</span></p>
							</div>
						</div>
						<!-- 쿠폰/적립포인트 -->
						<div class="col-4 border-end border-secondary" style="height: 600px">
							<p>보유 쿠폰
								<select id="user-coupon" class="mt-2">
									<option value="" selected disabled > 선택하세요.</option>
									<option value="" > 사용안함</option>
									<c:forEach var="coupon" items="${coupons }">
										<option value="${coupon.PUBLISHEDCODE }"> ${coupon.COUPONNAME }</option>
									</c:forEach>
								</select>
							</p>
							<p>보유 포인트 : <span class="text-danger fw-bolder big" id="user-point">${user.point } </span> point</p>
							<p class="mb-0">사용 포인트 :
								<input class="text-center" type="number" name="userPoint" id="used-point" value="0" style="width: 100px">
								point
							</p>
							<small>* 포인트는 100단위로만 사용가능합니다!</small>
							<p class="mt-5 text-center">------------할인 적용 내역------------</p>
							<p class="mx-5">쿠폰 할인 : <strong class="text-danger" id="coupon-discount">0</strong> 원</p>
							<p class="mx-5">포인트 할인 : <strong class="text-danger" id="point-discount">0</strong> 원</p>
						</div>
						<!-- 결제수단 및 결제 -->
						<div class="col-4" style="height: 600px" id="payment" data-booking-info="${schedule.movieName } / ${seatCnt}인">
							<p class="mt-5">예상 적립포인트 : <strong>0</strong> point</p>
							<p>현재 등급 : <span class="large badge rounded-pill">${user.grade }</span></p>
							<p>결제 후 예상 등급 : <span class="large badge rounded-pill"></span></p>
							<p style="height: 250px"></p>
							<button class="btn btn-outline-secondary" style="background-color: #FFFFFF; width: 390px; height: 50px" ><span class="large fw-bold">취소하기</span></button>
							<button class="btn btn-outline-danger mt-2" style="background-color: #FF243E; width: 390px; height: 50px" ><span class="large text-white fw-bold">결제하기</span></button>
						</div>
					</div>
					<div class="row" style="background-color: #000000" id="booking-total">
						<div class="col-4">
						<p class="text-white text-center fw-bold" style="background-color: #000000">
							상품금액 : <strong class="text-warning" id="base-price" data-base-price="${price }"><fmt:formatNumber>${price }</fmt:formatNumber></strong> 원
						</p>
						</div>
						<div class="col-4">
						<p class="text-white text-center fw-bold mb-2" style="background-color: #000000">
							할인금액 : <strong class="text-warning" id="discount-price">0</strong> 원
						</p>
						</div>
						<div class="col-4">
						<p class="text-white text-center fw-bold mb-2" style="background-color: #000000">
							결제금액 : <strong class="text-danger" id="total-price"><fmt:formatNumber>${price }</fmt:formatNumber></strong> 원
						</p>
						</div>		
					</div>
				</div>
			</div>
		</div>
	</main>
	<form action="book/success" method="post" id="booking-form">
		<input type="hidden" name="exceptGrade" value="" />
		<input type="hidden" name="scheduleCode" value="${schedule.scheduleCode }" />
		<input type="hidden" name="seatCode" value="${param.seats }" />
		<input type="hidden" name="basePrice" value="${price }" />
		<input type="hidden" name="disCountPrice" value="" />
		<input type="hidden" name="totalPrice" value="" />
		<input type="hidden" name="savedPoint" value="" />
		<input type="hidden" name="usedPoint" value="" />
		<input type="hidden" name="usedCoupon" value="" />
	</form>
	<footer>
		<%@ include file="../common/footer.jsp" %>
	</footer>

</div>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script>
$(function(){
	var basePrice = parseInt($('#base-price').data('base-price')); 
	var discountPrice = parseInt($('#discount-price').text());
	var totalPrice = parseInt($('#total-price').text());
	
	pointAndGrade();
	changeDiscountPrice();
	changeTotalPrice();
	
	var mgrade = $('#booking-info p:first span').data('movie-grade');
	var movieGrade;
	var gradeClass;
	if(mgrade == "12세이상관람가"){
		movieGrade = 12;
		gradeClass = "bg-warning";
	}else if(mgrade == "15세이상관람가"){
		movieGrade = 15;
		gradeClass = "bg-success";
	}else if(mgrade == "전체관람가"){
		movieGrade = "All";
		gradeClass = "bg-info";
	}else{
		movieGrade = "19";
		gradeClass = "bg-danger";					
	}
	
	$('#booking-info p:first span').text(movieGrade);
	$('#booking-info p:first span').addClass(gradeClass);
	
	var ugrade = $('#payment p:eq(1) span').text();
	changeUserGradeColor(ugrade);	
	
	// 쿠폰 사용하기
	$('#user-coupon').on('change', function(){
		var couponCode = $('#user-coupon').val();
		$('#booking-form :input:eq(8)').val(couponCode);
		var seats = $('#booking-info p:last span').data('seat-code');
		$.ajax({
			type:"GET",
			url:"book/rest/coupon",
			data:{price:basePrice,code:couponCode,seats:seats},
			dataType:"json"
		}).done(function(discountPrice){
			$('#coupon-discount').text(discountPrice);
			changeDiscountPrice();
			changeTotalPrice();
			
		});
	});
		
	// 포인트 사용제한
	$('#used-point').on('change', function(){
		var userPoint = parseInt($('#user-point').text());
		var usedPoint = parseInt($('#used-point').val());
		var couponDiscount = parseInt($('#coupon-discount').text());
		var pointDiscount = parseInt($('#point-discount').text());
		// 사용포인트 보유포인트보다 많이 사용못하게
		if(usedPoint > userPoint){
			alert('보유 포인트보다 많은 포인트를 사용하실 수 없습니다.');
			$('#used-point').val(0);
			$('#used-point').focus();
			return false;
		}
		// 사용포인트 - 면 안됨
		if(usedPoint < 0){
			alert('포인트는 0점 이상 사용하실 수 있습니다.');
			$('#used-point').val(0);
			$('#used-point').focus();
			return false;
		}
		// 사용포인트 100단위로 사용 
		if(usedPoint%100 != 0){
			alert('포인트는 100 point 단위로만 사용가능합니다.');
			$('#used-point').val(0);
			$('#used-point').focus();
			return false;			
		}
		
		// 할인금액에 반영
		$('#point-discount').text(usedPoint);
		changeDiscountPrice();
		// 총금액도 변경
		changeTotalPrice();
	})
	
	// 할인금액 변경하기
	function changeDiscountPrice(){
		$('#discount-price').text("");
		var couponDiscount = parseInt($('#coupon-discount').text());
		var pointDiscount = parseInt($('#point-discount').text());
		$('#booking-form :input:eq(7)').val(pointDiscount);
		discountPrice =  couponDiscount + pointDiscount;
		$('#discount-price').text(discountPrice.toLocaleString());
	}
	
	// 총금액 변경하기
	function changeTotalPrice(){
		$('#total-price').text("");
		totalPrice = basePrice - discountPrice;
		if(totalPrice < 0){
			alert("결제금액보다 더 많은 할인을 적용할 수 없습니다!");
			$('#used-point').val(0);
			$('#used-point').focus();
			$('#point-discount').text(0);
			changeDiscountPrice();
			$('#total-price').text((basePrice-parseInt($('#coupon-discount').text())).toLocaleString());
			return false;
		}
		$('#booking-form :input:eq(4)').val(discountPrice);
		$('#booking-form :input:eq(5)').val(basePrice - discountPrice);
		$('#total-price').text(totalPrice.toLocaleString());
		pointAndGrade();
	}
	
	$('#payment .btn-outline-danger').on('click', function(){
		//iamport();
		var msg = '결제가 완료되었습니다.';
    	alert(msg);
    	$('#booking-form').submit();
	});
	$('#payment .btn-outline-secondary').on('click', function(){
		var confirmValue = confirm("결제를 취소하고 상영스케줄페이지로 돌아가시겠습니까?");
		if(confirmValue){
			location.href = "schedule/branch";
		}
		return false;
	});
	
	// 예상 포인트와 예상 등급 산정하기
	function pointAndGrade(){
		var totalPrice = basePrice - discountPrice;
		$.ajax({
			type:"GET",
			url:"book/rest/point",
			data:{price:totalPrice},
			dataType:"json"
		}).done(function(result){
			var savePoint = result.savePoint;
			var expectGrade = result.expectGrade;
			var gradeColor = result.gradeColor;
			$('#payment p:eq(0) strong').text(savePoint);
			$('#payment p:eq(2) span').text(expectGrade);
			$('#payment p:eq(2) span').addClass(gradeColor);
			$('#booking-form :input:eq(0)').val(expectGrade);
			$('#booking-form :input:eq(6)').val(savePoint);
		})
	}
	
	// 결제진행
	function iamport(){
		var payname = $('#payment').data('booking-info');
		var payPrice = basePrice - discountPrice;
		//가맹점 식별코드
		IMP.init('imp11307855');
		IMP.request_pay({
		    pg : 'kakao',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : payname , //결제창에서 보여질 이름
		    amount : payPrice //실제 결제되는 가격
		}, function(rsp) {
		    if ( rsp.success ) {
		    	var msg = '결제가 완료되었습니다.';
		    	alert(msg);
		    	$('#booking-form').submit();
		    } else {
		    	var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    	alert(msg);
		    }
		});
	}
	
	function changeUserGradeColor(ugrade){
		var gradeColor = "bg-dark";
		if(ugrade == "BRONZE"){
			gradeColor = "bg-success";
		}else if(ugrade == "SILVER"){
			gradeColor = "bg-secondary";
		}else if(ugrade == "GOLD"){
			gradeColor = "bg-warning";
		}else if(ugrade == "PLATINUM"){
			gradeColor = "bg-primary";
		}
		$('#payment p:eq(1) span').addClass(gradeColor);
	}
	
})
</script>
</body>
</html>