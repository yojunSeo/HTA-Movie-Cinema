<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" >
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<title>상영 예정작-HMC</title>
</head>
<style type= "text/css">
html, body {
	width: 100%;
	height: 100%;
}
.topinfo img {
	width: 230px;
	height: 320px;
}
.wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
	
}
/* 슬라이드 */
.swiper-container {
	width: 100vw; /* 가로전체 */
    margin-left: calc(-50vw + 50%); /* 가로전체 */
	height: 500px; /* 여기 픽셀값을 조정하면 이미지의 높이를 조절할 수 있음 */
}

.swiper-wrapper {
	height: 100%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.swiper-slide img {
	display: block;
	width: 100%;
	height: 100%;
	object-fit: cover;
	
}

.swiper-button-next, .swiper-button-prev {
	color: #444444;
}

.swiper-pagination {
	top: 620px;
}
.swiper-pagination-bullet {
	color: #444444;
}

.swiper-pagination-bullet-active {
	color: #FF243E;
	background: #FF243E;
}
.topinfo {
	position: relative !important;
	width: 230px;
	height: 320px;
	
}
.topinfo .overbox {
	position: absolute;
	opacity: 0;
	top : 135px;
	left : 67px;
}
</style>
<body>
	<div class="container">
	<header><%@ include file="../common/header.jsp"%></header>
		<main>
			<!-- 상단 슬라이드 부분 -->
			<div class="row mb-3">
				<div class="col">
					<div class="swiper-container mySwiper">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<img src="https://caching2.lottecinema.co.kr/lotte_image/2021/Inzil/Inzil_1920420.jpg">
							</div>
							<div class="swiper-slide">
								<img src="https://caching2.lottecinema.co.kr/lotte_image/2021/Sence/Sence_1920420.jpg">
							</div>
							<div class="swiper-slide">
								<img src="https://caching2.lottecinema.co.kr/lotte_image/2021/Free/Free_1920420.jpg">
							</div>
						</div>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
						<div class="swiper-pagination"></div>
					</div>
				</div>
			</div>
			
			<!-- 상영 예정작 목록 전체 출력 -->
			<div class="row">
				<div class="wrapper mt-5 mb-3">
					<ul class="commingsoonmovie" style="max-width : 1280px;">
						<h5><strong>상영 예정작</strong></h5>
						<c:forEach var="commingAllMovies" items="${commingAllMovies }">
							<li class="mt-2" style="margin-left:5px; margin-right:5px;">
								<div class="topinfo">
									<img src="${commingAllMovies.poster }" alt=""> 
									<div class="overbox">
										<a class="btn btn-dark text-white" href="detail?movieCode=${commingAllMovies.movieCode }">상세정보 </a>
									</div>
								</div>
								<div class="btminfo">
									<strong>
										<c:choose>
											<c:when test="${commingAllMovies.grade == '전체관람가' }"><span class="badge rounded-pill bg-info">All</span></c:when>
											<c:when test="${commingAllMovies.grade == '12세이상관람가' }"><span class="badge rounded-pill bg-warning">12</span></c:when>
											<c:when test="${commingAllMovies.grade == '15세이상관람가' }"><span class="badge rounded-pill bg-success">15</span></c:when>
											<c:when test="${commingAllMovies.grade == '청소년관람불가' }"><span class="badge rounded-pill bg-danger">19</span></c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose>${commingAllMovies.movieName }
									</strong><br /> 
									<span>
										<em><fmt:formatDate value="${commingAllMovies.releaseDate }" pattern="yyyy.MM.dd" /></em> 개봉
									</span>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</main>
		<footer><%@ include file="../common/footer.jsp"%></footer>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script type="text/javascript">
		// 상단 슬라이드 부분
		$(function() {
			var swiper = new Swiper(".mySwiper", {
				spaceBetween : 30,
				centeredSlides : true,
				autoplay : {
					delay : 2500,
					disableOnInteraction : false,
				},
				pagination : {
					el : ".swiper-pagination",
					clickable : true,
				},
				navigation : {
					nextEl : ".swiper-button-next",
					prevEl : ".swiper-button-prev",
				},
			});
		})
		
		// 상영 예정작 전체 목록 마우스오버 이벤트
		$('.commingsoonmovie .topinfo').hover(function() {
			$(this).find('img').css('opacity', 0);
			$(this).find('.overbox').css('opacity', 1);
		}, function() {
			$(this).find('img').css('opacity', 1);
			$(this).find('.overbox').css('opacity', 0);
		});
	</script>
</body>
</html>