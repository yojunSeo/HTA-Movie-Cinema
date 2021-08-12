<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>페이지이름-HMC</title>
</head>
<body>
	<div class="container">

		<header>
			<%@ include file="../common/header.jsp" %>
		</header>

		<main>
			<div class="row mb-3">
               <p class="mt-5 fw-normal fs-4">고객센터</p>
            </div>
            <div class="row mb-2">
            	<div class="col-12 border-bottom border-1 border-secondary">
            	</div>
            </div>
            <div class="row offset-2">
            	<div class="col-4">
            		<a href="../cs/home" class="btn">공지사항</a>
            	</div>
            	<div class="col-4 mt-2">
            		<ul>
						<li class="dropdown">
							<a href="../cs/inqueryForm">1:1문의</a>
							<div class="dropdown-content">
								<a href="myInqueryList" class="mt-3">나의 문의 내역</a>
							</div>
						</li>
					</ul>	
            	</div>
            	<div class="col-4">
            		<a href="../cs/membership" class="btn fw-bold text-danger">멤버십</a>
            	</div>
            </div>
            <div class="row my-2">
            	<div class="col-12 border-bottom border-1 border-dark">
            	</div>
            </div>
            <div class="row my-5">
				<img src="../resources/images/membership/membership.PNG" width=550 height="250"/>
			</div>
			<div class="row mx-5 my-3 rounded border">
				<div class="col-12 mx-3 my-3 offset-2">
					<c:choose>
						<c:when test="${empty LOGINED_USER }">
							<p class="text-center fw-bold">회원가입 하시고</p>
							<p class="text-center">VIP의 풍성한 혜택을 만나보세요.</p>
							<p class="text-center"><a href="../login/" class="btn btn-danger btn-sm text-light">회원가입</a></p>
						</c:when>
						<c:otherwise>
							<div class="row text-center mt-3">
								<c:if test="${LOGINED_USER.grade == 'NORMAL' }">
									<p><span class="fw-bold">${LOGINED_USER.name }</span>님은</p>
									<p><span class="badge rounded-pill bg-dark text-light"> ${LOGINED_USER.grade }</span> 등급입니다.</p>
								</c:if>
								<c:if test="${LOGINED_USER.grade == 'BRONZE' }">
									<p><span class="fw-bold">${LOGINED_USER.name }</span>님은</p>
									<p><span class="badge rounded-pill bg-success text-light"> ${LOGINED_USER.grade }</span> 등급입니다.</p>
								</c:if>
								<c:if test="${LOGINED_USER.grade == 'SILVER' }">
									<p><span class="fw-bold">${LOGINED_USER.name }</span>님은</p>
									<p><span class="badge rounded-pill bg-secondary text-light"> ${LOGINED_USER.grade }</span> 등급입니다.</p>
								</c:if>
								<c:if test="${LOGINED_USER.grade == 'GOLD' }">
									<p><span class="fw-bold">${LOGINED_USER.name }</span>님은</p>
									<p><span class="badge rounded-pill bg-warning text-light"> ${LOGINED_USER.grade }</span> 등급입니다.</p>
								</c:if>
								<c:if test="${LOGINED_USER.grade == 'PLATINUM' }">
									<p><span class="fw-bold">${LOGINED_USER.name }</span>님은</p>
									<p><span class="badge rounded-pill bg-primary text-light"> ${LOGINED_USER.grade }</span> 등급입니다.</p>
								</c:if>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="row my-5">
				<h4>Friends 혜택</h4>
			</div>
			<div class="row">
				<div class="col-3 border rounded my-2" style="background-color: #FFFCEF">
					<div class="col-12 my-2 mx-1 text-center">
						<p class="badge rounded-pill bg-success">BROWNZE</p>
						<p>연 결제금액 20만원 이상</p>
						<p>영화관람권 1매</p>
						<p>가용포인트 10000점</p>
						<p>5천원 할인쿠폰 1매</p>
					</div>
				</div>
				<div class="col-3 border rounded my-2" style="background-color: #FFFCEF">
					<div class="col-12 my-2 mx-1 text-center">
						<p class="badge rounded-pill bg-secondary">SILVER</p>
						<p>연 결제금액 40만원 이상</p>
						<p>영화관람권 2매</p>
						<p>가용포인트 20000점</p>
						<p>5천원 할인쿠폰 1매</p>
					</div>
				</div>
				<div class="col-3 border rounded my-2" style="background-color: #FFFCEF">
					<div class="col-12 my-2 mx-1 text-center">
						<p class="badge rounded-pill bg-warning">GOLD</p>
						<p>연 결제금액 70만원 이상</p>
						<p>영화관람권 4매</p>
						<p>가용포인트 40000점</p>
						<p>5천원 할인쿠폰 2매</p>
					</div>
				</div>
				<div class="col-3 border rounded my-2" style="background-color: #FFFCEF">
					<div class="col-12 my-2 mx-1 text-center">
						<p class="badge rounded-pill bg-primary">PLATINUM</p>
						<p>연 결제금액 100만원 이상</p>
						<p>영화관람권 6매</p>
						<p>가용포인트 60000점</p>
						<p>5천원 할인쿠폰 4매</p>
					</div>
				</div>
			</div>
			<div class="row my-5">
				<h4>Friends 승급안내</h4>
			</div>
			<div class="row border rounded">
				<div class="col-12 mx-2 my-2">
					<p>- 분기별 티켓 누적 금액 기준으로 Friends 등급이 선정되며, 매분기 종료 3일 후 등급이 반영됩니다.</p>
					<p>- VIP회원의 경우 Friends 승급에 해당되지 않습니다.</p>
					<p>- 정회원에 한하여 Friends 승급이 가능하며, 온라인 간편가입 회원의 경우 정회원 전환 후 혜택 이용 가능합니다.</p>
				</div>
			</div>
			<div class="row my-5">
				<h4>Friends 승급 금액 반영 안내</h4>
			</div>
			<div class="row border rounded">
				<div class="col-12 mx-2 my-2">
					<p>- 승급 금액이란 롯데시네마 티켓 구매를 통해 누적되는 결제 금액으로 매점 결제 금액은 제외됩니다.</p>
					<p>- 승급 금액은 영화 관람일로부터 2~3일 후 반영됩니다.</p>
					<p>- 가족 카드로 조회 및 적립을 하신 경우, 가족 카드 명의자에게 승급 금액이 반영됩니다.</p>
					<p>- 법적 가족 관계와 관계없이 승급 금액 합산은 불가합니다.</p>
					<p>- 관람권 사용 시 승급 금액은 관람권 판매 금액으로 반영됩니다. (단, 프로모션 관람권 / 타 사이트 구매 관람권의 경우 승급 금액이 판매 금액과 상이할 수 있습니다.)</p>
					<p>- 관람권 판매 금액보다 낮은 금액의 티켓 구매 시 판매 금액이 아닌 티켓 금액으로 승급 금액이 반영됩니다. (예 : 조조, 문화의 날 등)</p>
				</div>
			</div>
			<div class="row my-5">
				<h4>Friends 쿠폰북 유의사항</h4>
			</div>
			<div class="row border rounded">
				<div class="col-12 mx-2 my-2">
					<p class="fw-bold"><공통></p>
					<p>- Friends 쿠폰은 유효기간 내에서만 사용 가능합니다. (영화 관람쿠폰의 경우 상영일 기준)</p>
					<p>- Friends 영화 관람권 사용 시 L.POINT 적립이 되지 않습니다.</p>
					<p>- 영화 및 콤보 4천원 할인권의 경우 결제금액에 대해서만 L.POINT 적립이 가능합니다.</p>
					<p>- 예매 및 구매 취소 후 쿠폰 재사용이 가능합니다.</p>
					<p>- 환불 시 현금 및 지류 관람권으로 교환이 불가합니다.</p>
					<p>- Friends 혜택을 영리 목적으로 대가를 받고 판매 및 양도하는 경우, 서비스 이용 제한 및 회원 자격이 정지 또는 상실될 수 있습니다.</p>
					<p class="fw-bold"><영화쿠폰></p>
					<p>- 일반관 및 스페셜에서 사용 가능합니다. (샤롯데 및 씨네패밀리 제외)</p>
					<p class="fw-bold"><스위트샵(매점) 쿠폰></p>
					<p>- 영화관 사정에 따라 쿠폰 적용 가능 상품 종류가 상이 할 수 있으며, 이벤트 콤보에 대하여 사용이 제한됩니다.</p>
				</div>
			</div>
		</main>

		<footer>
			<%@ include file="../common/footer.jsp" %>
		</footer>

	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

	<script>
		
	</script>
</body>
</html>