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
							<p style="color:white;" class="fs-5 fw-bold">결제수단&포인트사용</p>
						</div>
						<div class="col-4 text-center" style="background-color:black">
							<p style="color:white;" class="fs-5 fw-bold">결제하기</p>
						</div>
					</div>
					<div class="row" style="height:500px;">
						<div class="col-3 text-center" style="background-color:white">
							<img class="mt-3" src="../resources/images/store/product/${product.imageFileName}" style="width:70%;">
							<div class="text-start mx-2">
								<span class="fs-5 fw-bold">${product.name}</span><br/>
								<span>${product.memo}</span>
								<p class="">수량 : ${amount} 개</p>
								<p>
							</div>
						</div>
						<div class="col-5" style="background-color:#F2F2F2">
							<div>
								<span>보유포인트 : ${LOGINED_USER.point}</span>
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
									<span class="fs-4 fw-bold"><fmt:formatNumber value="${totalPrice }"/> </span> 원
								</div>
							</div>
							<div class="row border-bottom" style="background-color:#2E2E2E; height:50px; color:white;">
								<div class="col-4 mt-3 text-center">
									<span class="">할인금액</span>
								</div>
								<div class="col-8 p-2 text-end">
									<span class="fs-4 fw-bold">- 0</span> 원
								</div>
							</div>
							<div class="row" style="background-color:#2E2E2E; height:50px; color:white;">
								<div class="col-4 mt-3 text-center">
									<span class="">결제금액</span>
								</div>
								<div class="col-8 p-2 text-end">
									총 <span class="fs-4 fw-bold">0</span> 원
								</div>
							</div>
							<div class="row" style="height:70px;">
								<button style="background-color:#FF243E; color:white;"><strong>결제하기</strong></button>
							</div>
						</div>
					</div>
				</div>
			</div>

		</main>

		<footer>
			<%@ include file="../common/footer.jsp" %>
		</footer>

	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

	<script>
		
	</script>
</body>
</html>