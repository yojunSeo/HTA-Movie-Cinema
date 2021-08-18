<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<title>스토어결제-HMC</title>
<style type="text/css">
	.paper {
		position: relative;
		width:100vw;
		height:900px;
		margin-left: calc(-50vw + 50%);
		margin-right: auto;
		background-color:#444444;
	}

</style>
</head>
<body>
	<div class="container">

		<header>
			<%@ include file="../common/header.jsp" %>
		</header>

		<main class="mt-5">
			<div class="row paper justify-content-center">
				<div class="col-8">
					<div class="row mt-5">
						<div class="col-3 text-center" style="background-color:black">
							<p style="color:white;" class="fs-5 fw-bold">상품정보</p>
						</div>
						<div class="col-5 text-center" style="background-color:black">
							<p style="color:white;" class="fs-5 fw-bold">결제수단</p>
						</div>
						<div class="col-4 text-center" style="background-color:black">
							<p style="color:white;" class="fs-5 fw-bold">결제하기</p>
						</div>
					</div>
					<div class="row" style="height:500px;">
						<div class="col-3 text-center" style="background-color:white">
							<img class="mt-3" src="../resources/images/store/product/${product.imageFileName}" style="width:70%;">
							<div class="text-start mx-2">
								<span class="fs-5 fw-bold" id="product-name">${product.name}</span><br/>
								<span>${product.memo}</span>
								<p class="">수량 : ${amount} 개</p>
								<p>
							</div>
						</div>
						<div class="col-5" style="background-color:#F2F2F2">
							<div class="row mt-3 mb-1">
								<div class="col-5 offset-1" style="font-size:20px;">
									<span>포인트/할인</span>
								</div>
							</div>
							<div class="row">
								<div class="col-4 offset-1 p-2 text-center border-bottom" style="background-color:white; font-size:20px;">
									<button id="is-use-point" class="btn fw-bold" style="width:100%; height:100%;">포인트 사용</button>
								</div>
							</div>
							<div id="box-point-use" class="row" style="display:none;" data-user-point="${LOGINED_USER.point}">
								<div class="row">
									<div class="col-10 offset-1" style="background-color:white">
										<p><span>보유 포인트 </span> <span style="font-size:20px; color: #FF243E; font-weight:bold;">${LOGINED_USER.point} P </span> </p>
									</div>
								</div>
								<div class="row">
									<div class="col-10 offset-1 pb-3" style="background-color:white">
										<span>사용 포인트 </span> 
										<input id="point" class="text-center" type="number" min="0" max="${LOGINED_USER.point}" step="100" style="width:140px;" placeholder="100원 단위 입력">
										<button id="point-apply" class="btn btn-secondary">적용</button> 
										<button id="point-apply-all" class="btn btn-warning">모두사용</button> 
									</div>
								</div>
							</div>
							
							<div class="row mt-5 mb-1">
								<div class="col-5 offset-1" style="font-size:20px;">
									<span>결제수단</span>
								</div>
							</div>
							<div class="row">
								<div id="box-kakao" class="col-3 offset-1 p-2 text-center border" style="background-color:white; font-size:20px;">
									<button id="btn-kakao" type="button" class="btn" style="width:100%; height:100%;">
										<img src="../resources/images/store/kakao_pay.png" width="80px">
									</button>
								</div>
								<div id="box-naver" class="col-3 p-2 text-center border" style="background-color:white; font-size:20px;">
									<button id="btn-naver" type="button" class="btn" style="width:100%; height:100%;">
										<img src="../resources/images/store/naver_pay.png" width="80px">
									</button>
								</div>
							</div>
						
						</div>
						<div class="col-4 text-center" style="background-color:white">
						</div>
					</div>
					<div class="row" style="height:220px;">
						<div class="col-3" style="background-color:white">
							<c:if test="${not empty giftRecipien}">
								<div class="row" style="background-color:#2E2E2E; color:white;">
									<div class="col-12 text-center">
										<p style="color:white;" class="fs-5 fw-bold">선물 받는 분</p>
									</div>
								</div>
								<div class="row mt-3">
									<a>이름 : ${giftRecipien.name}</a>
									<a>연락처 : ${giftRecipien.phone }</a>
								</div>
							</c:if>
						</div>
						<div class="col-5 text-center" style="background-color:#F2F2F2">
						</div>
						<div class="col-4" style="background-color:white">
							<div class="row border-bottom" style="background-color:#2E2E2E; height:50px; color:white;">
								<div class="col-4 mt-3 text-center">
									<span class="">상품금액</span>
								</div>
								<div class="col-8 p-2 text-end">
									<span class="fs-4 fw-bold"><fmt:formatNumber value="${totalPrice}"/></span> 원
								</div>
							</div>
							<div class="row border-bottom" style="background-color:#2E2E2E; height:50px; color:white;">
								<div class="col-4 mt-3 text-center">
									<span class="">할인금액</span>
								</div>
								<div class="col-8 p-2 text-end">
									<span class="fs-4 fw-bold">- <a id="discount-price">0</a></span> 원
								</div>
							</div>
							<div class="row" style="background-color:#2E2E2E; height:50px; color:white;">
								<div class="col-4 mt-3 text-center">
									<span class="">결제금액</span>
								</div>
								<div class="col-8 p-2 text-end">
									총 <span id="total-payment" class="fs-4 fw-bold" style="color:#EADC41;">0</span> 원
								</div>
							</div>
							<div class="row" style="height:70px;">
								<button id="btn-pay" type="button" style="background-color:#FF243E; color:white;"><strong>결제하기</strong></button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="data-div" data-total-price="${totalPrice}" data-amount="${amount}" data-buyer-name="${LOGINED_USER.name}" data-buyer-phone="${LOGINED_USER.phone }"></div>

		</main>

		<footer>
			<%@ include file="../common/footer.jsp" %>
		</footer>
		
		<form id="form-success" action="success" method="post">
			<input id="form-give-user" name="giveUser" type="hidden" value="${LOGINED_USER.id}">
			<input id="form-receive-user" name="receiveUser" type="hidden" value="${giftRecipien.id}">
			<input id="form-product-code" name="productCode" type="hidden" value="${product.code}">
			<input id="form-product-price" name="unitPrice" type="hidden" value="${product.price}">
			<input id="form-amount" name="amount" type="hidden" value="${amount}">
			<input id="form-price-payment" name="pricePayment" type="hidden" value="">
			<input id="form-method-payment" name="methodPayment" type="hidden" value="">
			<input id="form-point-used" name="pointUsed" type="hidden" value="">
		</form>

	</div>
	<!-- 카카오페이(import통해서) -->
  	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
  	<!-- 네이버페이 -->
  	<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

	<script>
		$(function() {
			
			var userPoint = $("#box-point-use").data("user-point");
			var totalPrice = $("#data-div").data("total-price");
			var paymentPrice = totalPrice;
			var paymentMethod;
			var inputPoint;
			
			$("#total-payment").text(new Number(paymentPrice).toLocaleString());
			
			// 포인트 사용 클릭시
			$("#is-use-point").click(function() {
				$("#box-point-use").show();
			})
			
			// 포인트 적용 클릭시
			$("#point-apply").click(function() {
				inputPoint = $("#point").val();
				
				if(inputPoint%100 != 0) {
					alert("포인트는 100원 단위로 사용가능합니다.");
					$("#point").val(inputPoint - (inputPoint%100));
					inputPoint = $("#point").val();
				}
				
				if(inputPoint > totalPrice) {
					alert("포인트사용은 상품금액을 초과할 수 없습니다.");
					$("#point").val(totalPrice - (totalPrice%100));
					inputPoint = $("#point").val();
				}
				
				if(userPoint < inputPoint) {
					alert("보유포인트 이상 사용할 수 없습니다.");
					$("#point").val(userPoint - (userPoint%100));
					inputPoint = $("#point").val();
				}
				
				$("#discount-price").text(inputPoint);
				paymentPrice = totalPrice-inputPoint;
				$("#total-payment").text(new Number(paymentPrice).toLocaleString());
			})
			
			// 포인트 모두 적용 클릭시
			$("#point-apply-all").click(function() {
				
				if(userPoint > totalPrice) {
					inputPoint = totalPrice - (totalPrice%100);
				} else {
					inputPoint = userPoint - (userPoint%100);
				}
				
				$("#point").val(inputPoint);
				$("#discount-price").text(inputPoint);
				paymentPrice = totalPrice-inputPoint;
				$("#total-payment").text(new Number(paymentPrice).toLocaleString());
			})
			
			// 카카오 버튼 클릭 시
			$("#btn-kakao").click(function() {
				paymentMethod = "KakaoPay";
				$("#btn-kakao").css("outline","7px solid #FF243E");
				$("#btn-naver").css("outline","none");
			})
			
			// 네이버 버튼 클릭 시 
			$("#btn-naver").click(function() {
				paymentMethod = "NaverPay";
				$("#btn-naver").css("outline","7px solid #FF243E");
				$("#btn-kakao").css("outline","none");
			})
			
			// 결제하기 클릭시
			$("#btn-pay").click(function() {
				if(!paymentMethod) {
					alert("결제수단을 선택하세요");
					return;
				}
				
				if(paymentMethod == "KakaoPay") {
					kakaoPay("kakao");
				} else if(paymentMethod == "NaverPay") {
					naverPay("naver");
				}
			})
			
			// 카카오페이로 결제
			function kakaoPay(method) {
				var IMP = window.IMP;
				var productName = $("#product-name").text();
				var buyerName = $("#data-div").data("buyer-name");
				var buyerPhone = $("#data-div").data("buyer-phone");;
				
				IMP.init('imp16244476');
				IMP.request_pay({
					pg: 'kakao', 
					pay_method: 'card',
					merchant_uid: 'merchant_' + new Date().getTime(),
					name: productName,
					
					//결제창에서 보여질 이름
					amount: paymentPrice,	//가격
					buyer_name: buyerName,
					buyer_tel: buyerPhone
				}, function (rsp) {
					if (rsp.success) {
						var msg = '결제가 완료되었습니다.';
						alert(msg);
						submitSuccess();
					} else {
						var msg = '결제에 실패하였습니다.';
						msg += '에러내용 : ' + rsp.error_msg;
						alert(msg);
					}
				});
			}
			
			// 네이버페이로 결제
			function naverPay() {
				alert("결제 수단 중비중입니다. 자동 결제 처리 합니다.");
				
				/*
					네이버 페이의 경우 가맹점 등록 후 테스트 진행을 해야하는 번거로움이 있으며,
					가맹점 등록도 네이버담당자의 승인이 필요하여, 포트폴리오 수준에서 구현이 어려울것으로 사료됨.
					어찌하여 가맹점 인증키를 부여받은 후에도 테스트 ID 한개에서만 결제 테스트가 가능하니, 결제과정에서 실제 금액이 지불될 우려가 있음
				*/
				submitSuccess();
			}
			
			// 결제 완료 페이지로 제출
			function submitSuccess() {
				
				
				$("#form-price-payment").val(paymentPrice);
				$("#form-point-used").val(inputPoint);
				if(!inputPoint) $("#form-point-used").val(0); 
				$("#form-method-payment").val(paymentMethod);

				
				$("#form-success").submit();
			}
		})
	</script>
</body>
</html>