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
					<form class="from-group mt-3" method="post" action="payment" style="width:80%;">
						<div class="row">
							<div class="input-group">
								<span class="input-group-text">수량</span>
								<input class="form-control text-center" type="number" min="1" max="5" id="amount" name="amount" value="1" />
							</div>
							<div class="text-end mt-3">
								<span>총 상품금액  </span><span class="fs-4 fw-bold" style="color:#FF243E;" id="totalPrice"><fmt:formatNumber value="${product.discountPrice}"/> 원 </span>
							</div>
						</div>
						<div class="row justify-content-around mt-1">
							<a href="../store/" class="btn col-5" style="background-color: #444444; color: white">취소하기</a>
							<button id="buy" class="btn col-5" style="background-color: #FF243E; color: white">구매하기</button>
						</div>
					</form>
				</div>
			</div>
			
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


		</main>

		<footer>
			<%@ include file="../common/footer.jsp" %>
		</footer>

	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

	<script>
		$(function() {
			
			$("#amount").change(function() {
				var amount = $("#amount").val();
				var unitPrice = $("#price").data("price");
				var totalPrice = new Number(amount*unitPrice).toLocaleString();
				
				$("#totalPrice").empty().text(totalPrice+' 원');
				
			})	
			
			$("#buy").click(function() {
				
			})
			
		})
	</script>
</body>
</html>