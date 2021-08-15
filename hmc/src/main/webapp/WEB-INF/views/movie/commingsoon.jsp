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
<title>현재상영작-HMC</title>
</head>
<style type= "text/css">
html, body {
	width: 100%;
	height: 100%;
}
.topinfo img {
	width: 210px;
	height: 300px;
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

.swiper-pagination-bullet {
	color: #444444;
}

.swiper-pagination-bullet-active {
	color: #FF243E;
	background: #FF243E;
}
.overbox {
	color: #FFF;
	width: 210px;
	height: 300px;
	
}
.inner {
	display: flex;
	justify-content: center;
	align-items: center;
}
.overbox a {	
	outline: solid 1px gray;

}
</style>
<body>
	<div class="container">
	<header><%@ include file="../common/header.jsp"%></header>
		<main>
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
			<div class="row">
				<div class="wrapper mt-5">
					<ul class="nowmovie" style="max-width : 1100px;">
						<div class="mb-3">
							<h5>
								<strong>상영 예정작</strong>
							</h5>
						</div>
						<c:forEach var="commingAllMovies" items="${commingAllMovies }">
							<li>
								<div class="topinfo">
									<span> <img onmouseover="overclass(this)"
										src="${commingAllMovies.poster }" alt=""> 
<!-- 										<em class="numinfo">1</em> -->
<!-- 										<span class="ic_grade gr_15"></span> -->
									</span>
								</div>
								<div class="overbox">
									<div class="inner">
										<a href="detail?movieCode=${commingAllMovies.movieCode }">  상세정보    </a>
									</div>
								</div>
								<div class="btminfo">
									<strong>${commingAllMovies.movieName }</strong><br /> 
									<span>개봉일
										<em><fmt:formatDate value="${commingAllMovies.releaseDate }" pattern="yyyy.MM.dd" /></em>
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

		function overclass(obj) {
			//마우스 인
			obj.className = 'on';
			$(".on").hide();
			$(".on").parent().parent().next().show();

			//마우스 아웃
			obj.onmouseout = function() {
				this.className = '';
				$(this).show();
				$(this).parent().parent().next().hide();
			}
		}
	</script>
</body>
</html>