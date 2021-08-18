<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<title>관리자-지점관리-HMC</title>
</head>
<body>
	<div class="container-fluid">


		<main class="mt-5">
		<div class="row">
			<div class="col-2">
				<%@include file ="../sidebar.jsp"%>
			</div>
			
			<div class="col-8">
				<h3>지점 정보 수정</h3>
				
				<div class="row mt-5">
					<form id="branch-form" action="modify" method="post">
						<input type="hidden" name="code" value="${branch.code}">
						<div class="row mt-3">
							<div class="col-2">
								<label class="form-label" for="form-name"><strong>지점이름</strong></label>
							</div>
							<div class="col-3">
								<input id="form-name" name="name" class="form-control" type="text" value="${branch.name}" readonly="readonly">
							</div>
							<div class="col-2">
								<label class="form-label" for="form-status"><strong>지점상태</strong></label>
							</div>
							<div class="col-2 form-check form-switch">
								<input id="form-status" name="status" class="form-check-input" type="checkbox"
								${branch.status eq "Y" ? "value='Y' checked" : ""}>
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-2">
								<label class="form-label" for="form-address"><strong>주소</strong></label>
							</div>
							<div class="col-8">
								<input id="form-address" name="address" class="form-control" type="text" value="${branch.address}">
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-2">
								<label class="form-label" for="form-latitude"><strong>위도</strong></label>
							</div>
							<div class="col-3">
								<input id="form-latitude" name="latitude" class="form-control" type="number" value="${branch.latitude}">
							</div>
							<div class="col-2">
								<label class="form-label" for="form-longitude"><strong>경도</strong></label>
							</div>
							<div class="col-3">
								<input id="form-longitude" name="longitude" class="form-control" type="number" value="${branch.longitude}">
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-12">
								<input id="form-all-facility" name="facility" type="hidden" value="${branch.facility}">
								<div class="row">
									<label class="form-label" for="form-facility"><strong>보유시설</strong></label>
								</div>
								<div id="form-facility" class="form-check">
									<c:forEach var="facility" items="${facilityList}" varStatus="status">
										<div class="form-check form-check-inline">
											<input id="form-check-${status.count}" class="form-check-input" type="checkbox" value="${facility.identyNum}" 
												${checkFacility[status.count] eq 1 ? "checked" : ""}>
											<label class="form-check-label" for="form-check-${status.count}">${facility.facility}</label>
										</div>				
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-12">
								<div class="row">
									<label class="form-label" for="form-info"><strong>지점소개</strong></label>
									<textarea id="form-info" name="info" rows="10" class="form-control">${branch.info}</textarea>
								</div>
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-12">
								<div class="row">
									<label class="form-label" for="form-parking-info"><strong>주차안내</strong></label>
									<textarea id="form-parking-info" name="parkingInfo" rows="15" class="form-control">${branch.parkingInfo}</textarea>
								</div>
							</div>
						</div>
						<div class="row justify-content-end mt-3">
							<div class="col-2 text-end">
								<button id="btn-submiit" class="btn btn-primary" type="button">수정하기</button>
							</div>
						</div>
						<div class="row" style="height:50px;">
						</div>
					</form>
				</div>
			</div>
		</div>
			


		</main>


	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

	<script>
		$(function() {
			
			$(".form-check-input").change(function() {
				var elthis = $(this);
				if(elthis.prop("checked")) {
					var allFacililtyValue = $("#form-all-facility").val();
					var thisFacilityValue = elthis.val();
					var finalValue = Number(allFacililtyValue) + Number(thisFacilityValue);
					$("#form-all-facility").val(finalValue);
				} else {
					var allFacililtyValue = $("#form-all-facility").val();
					var thisFacilityValue = elthis.val();
					$("#form-all-facility").val(allFacililtyValue - thisFacilityValue);
				}
			})
			
			$("#btn-submiit").click(function() {
				$("#branch-form").submit();
			})
		})
	</script>
</body>
</html>