<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<title>스토어 상세-HMC</title>
</head>
<body>
	<div class="container">

		<header>
			<%@ include file="../common/header.jsp" %>
		</header>

		<main class="mt-5">
			
			<!-- 상품정보출력 -->
			<div class="row justify-content-center">
				<div class="col-5">
					<img src="../resources/images/store/product/${product.imageFileName}" style="width:100%; height: auto;">
				</div>
				<div class="col-5 mt-3">
					<table class="table" style="width:80%">
						<tr>
							<td class="fs-3" colspan="2">${product.name}</td>
						</tr>
						<tr>
							<c:choose>
								<c:when test="${product.discountRate eq 0}">
									<td></td><td><span class="fs-4" id="price" data-price="${product.price}"><strong>
										<fmt:formatNumber value="${product.price}"/>
									</strong></span></td>
								</c:when>
								<c:otherwise>
									<td><span style="color:#FF243E;"><b>${product.discountRate}%</b></span></td>
									<td><span class="fs-4" id="price" data-price="${product.discountPrice}"><strong>
										<fmt:formatNumber value="${product.discountPrice}"/>
									</strong></span> <small><del>
										<fmt:formatNumber value="${product.price}"/>
									</del></small> </td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<td><strong>구성품</strong></td><td>${product.memo }</td>
						</tr>
						<tr>
							<td><strong>구매제한</strong></td><td>제한없음</td>
						</tr>
						<tr>
							<td><strong>유효기간</strong></td><td>2년</td>
						</tr>
						<tr>
							<td><strong>사용가능 영화관</strong></td><td>모든 영화관</td>
						</tr>
					</table>
					<form id="form" class="from-group mt-3" method="get" action="purchase" style="width:80%;">
						<div class="row">
							<div class="input-group">
								<span class="input-group-text">수량</span>
								<input class="form-control text-center" type="number" min="0" max="5" id="amount" name="amount" value="1" />
							</div>
							<div class="text-end mt-3">
								<span>총 상품금액 : </span><span class="fs-4 fw-bold" style="color:#FF243E;" id="totalPrice"></span>
								<input class="form-control" type="hidden" id="total-price" name="totalPrice" value="">
								<input class="form-control" type="hidden" id="product-code" name="productCode" value="${product.code}">
							</div>
						</div>
						<div class="row justify-content-around mt-3">
							<button id="present" type="button" class="btn col-5 p-2" style="background-color: black; color: white">선물하기</button>
							<button id="buy" type="button" class="btn col-5 p-2" style="background-color: #FF243E; color: white">구매하기</button>
						</div>
					</form>
				</div>
			</div>
			<!-- 상품정보 출력 끝 -->
			
			<!-- 유의사항 탭 -->
			<div class="row justify-content-center mt-5">
				<div class="col-10">
					<nav>
						<div class="nav nav-tabs " id="nav-tab" role="tablist">
							<button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" >사용방법</button>
							<button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" >유의사항</button>
						</div>
					</nav>
					<div class="tab-content mt-3" id="nav-tabContent">
						<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
						<span>
							사용방법<br/>
							- 구성 : 2D일반관람권 2매 + 스위트콤보 교환권 1매<br/>
							- 유효기간 : 구매일 ~ 24개월(관람일 기준)<br/>
							- 영화관람권은 2D 일반영화에만 적용 가능합니다.<br/>
							  (스페셜관 및 좌석에 적용 불가/ 영화관람권은 L.point적립 불가, 관람권 사용 시 VIP 승급금액은 관람권 판매금액으로 반영)<br/>
							- 팝콘 : 오리지널맛 제공(시즈닝 변경 시 금액 추가) / 음료 : 탄산음료 제공(기타 음료 및 사이즈 변경 시 금액 추가)<br/>
							- 매점 교환권의 경우 아래 사용불가 영화관을 확인해주시기 바랍니다.<br/><br/>
							
							사용불가 영화관<br/>
							ㆍ서울/강원: 강동, 남원주, 브로드웨이, 장안, 중랑, 춘천<br/>
							ㆍ경기/인천: 부천역, 양주고읍, 영종하늘도시, 오산(원동), 평택비전<br/>
							ㆍ대전/충청: 서산, 충주, 당진<br/>
							ㆍ전라/광주: 광주광산, 익산모현, 충장로<br/>
							ㆍ경북/대구: 대구범어, 대구현풍, 상주, 영주, 프리미엄구미센트럴, 프리미엄만경, 프리미엄안동, 프리미엄칠곡<br/>
							ㆍ경남/부산/울산: 거창, 마산(합성동), 사천, 엠비씨네(진주), 통영, 프리미엄경남대, 프리미엄진주, 프리미엄해운대<br/>
							ㆍ제주: 서귀포, 제주삼화, 제주아라<br/><br/>
							
							※ 사용불가 영화관은 롯데시네마 사정에 의해 변경될 수 있습니다.<br/>
						</span>
						</div>
						<div class="tab-pane fade mt-3" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
						<span>
							취소/환불<br/>
							- 스토어 상품의 취소기한은 구매일로부터 70일 입니다.<br/>
							- 구매취소는 취소기한 내 마이 > 예매/구매내역에서만 가능합니다.(현장취소 불가)<br/>
							- 구매하신 상품은 부분환불 및 현금환불이 되지 않습니다.<br/>
							- 패키지 상품 중 1장이라도 사용한 경우 환불이 불가합니다.<br/><br/>
							
							기타<br/>
							- 상품 확인은 마이 > 쿠폰함에서 가능합니다.<br/>
							- 영화관람권은 롯데시네마 홈페이지, 모바일 웹/앱에서 사용가능하며, 매점교환권은 롯데시네마 스위트샵 (매점)에서 쿠폰 제시 후 사용가능합니다.<br/>
							- 선물한 상품은 마이 > 결제내역 > 구매/선물내역 메뉴에서 30일 내 1회 재발송가능합니다. (단, 받는 사람 번호는 변경 불가)<br/>
							- 본 관람권은 기재된 유효기간까지 (관람일 기준) 사용할 수 있습니다.<br/><br/>
							
							- 유효기간 만료 시 고객센터(1544-8855)를 통해 발급일로부터 5년까지 연장할 수 있으며, 1회 연장 시 단위는 3개월입니다. <br/>
							※고객센터: 1544-8855<br/>
						</span>
						</div>
					</div>					
				</div>
			</div>
			<!-- 유의사항 탭 끝 -->

		<!-- 선물 시 받는사람 입력을 위한 모달창 -->
		<div class="modal fade" id="form-present-modal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg">
				<div class="modal-content">
					<div class="modal-header row" >
						<div class="col-11  text-center">
							<h5 class="modal-title fw-bold" id="exampleModalLabel">선물하기</h5>						
						</div>
						<div class="col-1">
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
					</div>
					<div class="modal-body">
						<div class="row border-bottom">
							<div class="col-12">
								<table class="table">
									<colgroup>
										<col width="20%">
										<col width="45%">
										<col width="35%">
									</colgroup>
									<tr>
										<td>
											<img src="../resources/images/store/product/${product.imageFileName}" style="width:100%;">
										</td>
										<td class="align-middle">
											<span class="fs-4 fw-bold">${product.name}</span><br/>
											<span>총 수량 : <a id="modal-amount"></a> 개</span>
										</td>
										<td class="align-middle text-end">
											<span class="text-end">총 합계 : <a id="modal-total-price" class="fs-4 fw-bold"></a>원 </span> 
										</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="row">
							<form id="form-present" method="post" action="present">
									<input type="hidden" id="form-amount" name="amount">
									<input type="hidden" id="form-total-price" name="totalPrice">
									<input type="hidden" id="form-product-code" name="productCode" value="${product.code}">
									<input type="hidden" id="form-gift-recipient-id" name="giftRecipienId">
								<div class="row mt-2">
									<div class="col-3">
										<label class="form-label fw-bold mt-1" for="form-phone">선물 받는 분 연락처</label>
									</div>
									<div class="col-7">
										<input id="form-phone" class="form-control" type="text" name="phone" placeholder="휴대폰번호를 입력(-없이)"
												onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
									</div>
									<div class="col-2">
										<button class="btn btn-secondary" type="button" id="form-user-check">회원확인</button>
									</div>
								</div>
								<div class="row mt-2">
									<div class="col-3">
										<label class="form-label fw-bold mt-1" for="form-presented-user">선물 받는 분 이름</label>
									</div>
									<div class="col-4">
										<input id="form-presented-user" class="form-control" type="text" readonly="readonly" style="background-color:#F2F2F2;" placeholder="선물 받는 분 이름확인">
									</div>
								</div>
								<div class="row mt-2">
									<div class="col-3">
										<label class="form-label fw-bold mt-1" for="form-present-user">선물 하는 분</label>
									</div>
									<div class="col-7">
										<input id="form-present-user" class="form-control" type="text" name="" style="background-color:#F2F2F2;" style="background-color:#F2F2F2;" value="${LOGINED_USER.name}" readonly="readonly">
									</div>								
								</div>
								<div class="row mt-5">
									<div class="form-check mx-3">
										<input class="form-check-input" type="checkbox" value="" id="form-agree">
										<label class="form-check-label fw-bold" for="form-agree">개인정보 수집에 대한 동의</label>
									</div>
								</div>
								<div class="row mt-2">
									<div class="form-floating">
										 <textarea class="form-control" style="height: 130px; background-color:#F2F2F2;" id="floatingTextarea" readonly="readonly">목적 : 스토어 선물하기 발송
수집항목 : 선물 받는분 휴대폰번호
보유기간 : 70일 보관 후 5년간 분리하여 보관
귀하는 동의를 거부할 수 있으나, 이 경우 스토어 선물하기 서비스를 이용하실 수 없습니다.</textarea>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="modal-footer row">
						<div class="col-12 text-center">
							<button type="button" class="btn btn-secondary" id="btn-post-present">선물하기</button>
						</div>
					</div>
				</div>
		</div>
		</div>

		</main>
		
		<div id="data-div" data-is-present="${isPresent}" data-present-amount="${amount}"></div>
		<footer>
			<%@ include file="../common/footer.jsp" %>
		</footer>

	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

	<script>
		$(function() {
			var unitPrice = $("#price").data("price");
			var amount;
			var totalPrice;
			
			// 디폴트 수량으로 총금액 초기화
			amount = $("#amount").val();
			totalPrice = new Number(amount*unitPrice).toLocaleString();
			$("#totalPrice").empty().text(totalPrice+' 원');
			
			// 선물일경우 get으로 넘어온 수량으로 총금액 초기화
			if($("#data-div").data("is-present") == 'Y') {
				presentAmount = $("#data-div").data("present-amount");
				$("#amount").val(presentAmount);
				totalPrice = new Number(presentAmount*unitPrice).toLocaleString();
				
				$("#totalPrice").empty().text(totalPrice+' 원');
				modalshow();
			}
			
			// 수량을 변동할 경우 총 금액 변동
			$("#amount").change(function() {
				amount = $("#amount").val();
				totalPrice = new Number(amount*unitPrice).toLocaleString();
				
				$("#totalPrice").empty().text(totalPrice+' 원');
			})	
			
			// 구매하기 클릭시 유효성 검사
			$("#buy").click(function() {
				
				// 수량 유효성 체크
				if($("#amount").val() < 1) {
					alert("수량은 1개이상이어야합니다.");
					$("#amount").focus();
					return;
				}
				
				$("#total-price").val(amount*unitPrice);
				
				 document.getElementById("form").submit();
			})

			
			// 선물하기 클릭시 모달 출력
			$("#present").click(function() {
				modalshow();				
			})
			
			// 모달 출력 시 form 값 넣어주기
			function modalshow() {
				if($("#amount").val() < 1) {
					alert("수량은 1개이상이어야합니다.");
					$("#amount").focus();
					return;
				}
				
				var presentModal = new bootstrap.Modal(document.getElementById("form-present-modal"), {
					keyboard: false
				})
				
				if($("#data-div").data("is-present") != 'Y') {
					window.location.href='present?code='+$("#product-code").val()+'&amount='+amount;
				}
				
				amount = $("#amount").val();
				var totalPriceLocale = new Number(amount*unitPrice).toLocaleString();
				
				$("#modal-total-price").text(totalPriceLocale);
				$("#modal-amount").text(amount);
				presentModal.show();
			}
			
			// 모달창에서 받는 사람의 전화번호로 유저 조회해서 form 값에 입력
			$("#form-user-check").click(function() {
				
				var phone = $("#form-phone").val();
				if(phone.length != 11) {
					alert("휴대폰 번호 입력 양식 확인 (-없이 11자리 숫자)")
					return;
				}
				var modifyPhone = phone.substr(0,3) + '-' + phone.substr(3,4) + '-' + phone.substr(7,4);
				$.getJSON("json/usercheck?phone=" + modifyPhone)
					.done(function(user) {
						$("#form-presented-user").val(user.name);
						$("#form-gift-recipient-id").val(user.id);
					})
					.fail(function() {
						$("#form-presented-user").val("검색된 사용자 없음");
					})				
			})
			
			// 모달창에서 선물하기 클릭시 유효성 체크 후 결제화면으로 이동
			$("#btn-post-present").click(function() {

				// 선물 받는 사람이 제대로 검색되었는지 확인
				if($("#form-presented-user").val() == "검색된 사용자 없음") {
					alert("선물 받는 분을 확인해주세요.");
					return;
				}
				
				// 개인정보 이용동의 체크 확인
				if(!$("#form-agree").is(':checked')) {
					alert("개인정보 제공 동의 후 진행 가능합니다.");
					$("#form-agree").focus();
					return;
				}
				
				$("#form-amount").val(amount);
				$("#form-total-price").val(amount*unitPrice);
				
				$("#form-present").submit();
				
			})
			
		})
	</script>
</body>
</html>