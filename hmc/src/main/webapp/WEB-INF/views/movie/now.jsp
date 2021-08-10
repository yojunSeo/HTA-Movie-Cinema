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
.poster {
	width: 210px;
	height: 300px;
}

.wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
}
html, body {
    width: 100%;
    height: 100%;
}
* {
	margin: 0px;
	padding: 0px;
}
/* 슬라이드 */
.swiper-container {
	width: 100vw; /* 가로전체 */
    margin-left: calc(-50vw + 50%); /* 가로전체 */
	height: 500px; /* 여기 픽셀값을 조정하면 이미지의 높이를 조절할 수 있음 */
}

.swiper-wrapper {
	width: 100%;
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
					<ul class="nowmovie">
						<p>
							현재 상영작 <strong>TOP5</strong>
						</p>
						<li>
							<div class="topinfo">
								<span> <img class="poster"
									src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202107/17616_103_1.jpg"
									alt="모가디슈"> <!-- 								<em class="numinfo">1</em> --> <!-- 								<span class="ic_grade gr_15"> :: before</span> -->
								</span>
								<div class="overbox">
									<div class="inner" style="margin-top: -20px;">
										<a href="예매페이지">예매하기</a> <a href="/movie/detail.jsp">상세정보</a>
									</div>
								</div>
							</div>
							<div class="btminfo">
								<strong>모가디슈</strong><br /> 
								<span> 
									<span>예매율<em>54.0%</em></span>
									<span>${movie.totalScore }</span>
								</span>
							</div>
						</li>
						<li>
							<div class="topinfo">
								<span> <img class="poster"
									src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202107/17623_103_1.jpg" alt="보스 베이비2"> <!-- 								<em class="numinfo">1</em> -->
<!-- 								<span class="ic_grade gr_15"> :: before</span> -->
								</span>
								<div class="overbox">
									<div class="inner" style="margin-top: -20px;">
										<a href="예매페이지">예매하기</a> <a href="/movie/detail.jsp">상세정보</a>
									</div>
								</div>
							</div>
							<div class="btminfo">
								<strong>보스 베이비2</strong><br /> <span> <span>예매율<em>14.4%</em></span>
									<span>${movie.totalScore }</span>
								</span>
							</div>
						</li>
						<li>
							<div class="topinfo">
								<span> <img class="poster"
									src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202004/15496_103_1.jpg" alt="블랙 위도우"> 
<!-- 								<em class="numinfo">1</em> -->
<!-- 								<span class="ic_grade gr_15"> :: before</span> -->
								</span>
								<div class="overbox">
									<div class="inner" style="margin-top: -20px;">
										<a href="예매페이지">예매하기</a> 
										<a href="/movie/detail.jsp">상세정보</a>
									</div>
								</div>
							</div>
							<div class="btminfo">
								<strong>블랙 위도우</strong><br /> 
								<span> 
									<span>예매율<em>7.7%</em></span>
									<span>${movie.totalScore }</span>
								</span>
							</div>
						</li>
						<li>
							<div class="topinfo">
								<span> <img class="poster"
									src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202107/17530_103_1.jpg" alt="정글크루즈"> 
<!-- 								<em class="numinfo">1</em> -->
<!-- 								<span class="ic_grade gr_15"> :: before</span> -->
								</span>
								<div class="overbox">
									<div class="inner" style="margin-top: -20px;">
										<a href="예매페이지">예매하기</a> 
										<a href="/movie/detail.jsp">상세정보</a>
									</div>
								</div>
							</div>
							<div class="btminfo">
								<strong>정글 크루즈</strong><br /> 
								<span> 
									<span>예매율<em>4.1%</em></span>
									<span>${movie.totalScore }</span>
								</span>
							</div>
						</li>
						<li>
							<div class="topinfo">
								<span> <img class="poster"
									src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202107/17624_103_1.jpg" alt="방법:재차의"> 
<!-- 								<em class="numinfo">1</em> -->
<!-- 								<span class="ic_grade gr_15"> :: before</span> -->
								</span>
								<div class="overbox">
									<div class="inner" style="margin-top: -20px;">
										<a href="예매페이지">예매하기</a> <a href="/movie/detail.jsp">상세정보</a>
									</div>
								</div>
							</div>
							<div class="btminfo">
								<strong>방법: 재차의</strong><br /> 
								<span> 
									<span>예매율<em>1.6%</em></span>
									<span>${movie.totalScore }</span>
								</span>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</main>

		<footer>
		</footer>

	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script type="text/javascript">
	$(function() {
	    var swiper = new Swiper(".mySwiper", {
	      spaceBetween: 30,
	      centeredSlides: true,
	      autoplay: {
	        delay: 2500,
	        disableOnInteraction: false,
	      },
	      pagination: {
	        el: ".swiper-pagination",
	        clickable: true,
	      },
	      navigation: {
	        nextEl: ".swiper-button-next",
	        prevEl: ".swiper-button-prev",
	      },
	    });
	})
	</script>
</body>
</html>