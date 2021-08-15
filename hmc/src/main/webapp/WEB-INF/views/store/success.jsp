<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<title>스토어결제완료-HMC</title>
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
						<div class="col-12 text-center" style="background-color:black">
							<p style="color:white;" class="fs-5 fw-bold">결제완료</p>
						</div>
					</div>
					<div class="row" style="" >
						<div class="col-12 text-center" style="background-color:white; height:320px;">
							<p class="fs-1 fw-bold">결제 완료되었습니다.</p>
						</div>
						<div class="col-12 text-center" style="background-color:white; height:400px;">
							<p class="fs-5 fw-bold">적립 및 지급포인트 : <span style="color:red">${plusPoint}</span></p>
							<c:if test="${beforeGrade ne afterGrade}">
								<p class="fs-5 fw-bold">축하합니다. 구매 실적이 달성되어 등급이 업그레이드 되었습니다.</p>
								<span id="badge-before-grade" class="badge rounded-pill">${beforeGrade}</span> --> <span  id="badge-after-grade" class="badge rounded-pill">${afterGrade }</span>
							</c:if>
						</div>
					</div>
					
				</div>
			</div>
			<div id="data-div" data-total-price="${totalPrice}" data-amount="${amount}"></div>

		</main>

		<footer>
			<%@ include file="../common/footer.jsp" %>
		</footer>
	

	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

	<script>
		$(function() {
			
			// 등급 뱃지 색 부여
			var beforeGrade = $("#badge-before-grade").text();
			var afterGrade = $("#badge-after-grade").text();
			
			if(beforeGrade == "NOMAL") {
				$("#badge-before-grade").addClass("bg-dark");
			} else if(beforeGrade == "BRONZE") {
				$("#badge-before-grade").addClass("bg-success");
			} else if(beforeGrade == "SILVER") {
				$("#badge-before-grade").addClass("bg-secondary");
			} else if(beforeGrade == "GOLD") {
				$("#badge-before-grade").addClass("bg-warning");
			} else if(beforeGrade == "PLATINUM") {
				$("#badge-before-grade").addClass("bg-primary");
			}
			
			if(afterGrade == "NOMAL") {
				$("#badge-after-grade").addClass("bg-dark");
			} else if(afterGrade == "BRONZE") {
				$("#badge-after-grade").addClass("bg-success");
			} else if(afterGrade == "SILVER") {
				$("#badge-after-grade").addClass("bg-secondary");
			} else if(afterGrade == "GOLD") {
				$("#badge-after-grade").addClass("bg-warning");
			} else if(afterGrade == "PLATINUM") {
				$("#badge-after-grade").addClass("bg-primary");
			}
		})
	</script>
</body>
</html>