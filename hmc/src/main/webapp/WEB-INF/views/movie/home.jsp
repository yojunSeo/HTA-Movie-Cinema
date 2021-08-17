<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" >
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<title>영화 홈-HMC</title>
</head>
<style type="text/css">
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
	text-align:center;
	padding-top: 110px;
	padding-bottom: 110px;
}
.overbox a {	
	border: solid 1px gray;
	padding: 3px;
	marging: 2px;
	
}
</style>
<body>
	<div class="container">
		<header><%@ include file="../common/header.jsp"%></header>

		<main>
			<div class="row mt-2">
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
							<div class="swiper-slide">
								<img src="https://caching2.lottecinema.co.kr/lotte_image/2021/Squad/0803/Squad_1920420.jpg">
							</div>
						</div>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
						<div class="swiper-pagination"></div>
					</div>
				</div>
			</div>

			<!-- 현재 상영작 -->
			<div class="row">
				<div class="wrapper mt-3">
					<ul class="nowmovie">
						<p>현재 상영작 <strong>TOP5</strong></p>
						<c:forEach var="nowMovies" items="${nowMovies }">
							<li>
								<div class="topinfo">
									<span> <img onmouseover="overclass(this)"
										src="${nowMovies.poster }" alt=""> 
<!-- 										<em class="numinfo">1</em> -->
<!-- 										<span class="ic_grade gr_15"></span> -->
									</span>
								</div>
								<div class="overbox">
									<div class="inner">
										<a href="/hmc/booking/schedule/movie">예매하기</a><br>
										<a href="detail?movieCode=${nowMovies.movieCode }">상세정보</a>
									</div>
								</div>
								<div class="btminfo">
									<strong>${nowMovies.movieName }</strong><br /> 
									<!-- 리뷰 점수 -->
									<span><em>${nowMovies.totalScore }</em></span>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
				
			<!-- 상영 예정작 -->
				<div class="row mt-5">
					<div class="wrapper">
						<ul class="commingsoonmovie">
							<p>상영 예정작 <strong>TOP5</strong></p>
							<c:forEach var="commingMovies" items="${commingMovies }">
								<li>
									<div class="topinfo">
										<span> <img onmouseover="overclass(this)"
											src="${commingMovies.poster }" alt=""> 
										</span>
									</div>
									<div class="overbox">
										<div class="inner" style="margin-top: -20px;">
											<a href="detail?movieCode=${commingMovies.movieCode }">상세정보</a>
										</div>
									</div>
									<div class="btminfo">
										<strong>${commingMovies.movieName }</strong><br /> 
										<!-- 개봉일 d-day로 변경해야함 -->
										<span>개봉일
										<em><fmt:formatDate value="${commingMovies.releaseDate }" pattern="yyyy.MM.dd" /></em>
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
			$(".overbox").hide();
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
			
		});

		function overclass(obj){
		    //마우스 인
			 obj.className='on';
		    $(".on").hide();
		    $(".on").parent().parent().next().show();
		    
		    //마우스 아웃
		    obj.onmouseout=function(){
		        this.className='';
		        $(this).show();
			    $(this).parent().parent().next().hide();
		    }
		}
// 		//디데이 종료 일자 설정 
// 		var countDownDate = new Date("formatRegDate").getTime(); 
// 		//1초마다 갱신되도록 함수 생성,실행 
// 		var x = setInterval(function() { 
// 			// 오늘 날짜 등록 
// 			var now = new Date().getTime(); 
// 			// 종료일자에서 현재일자를 뺀 시간 
// 			var distance = countDownDate - now; 
// 			// 각 변수에 일 등록 
// 			var d = Math.floor(distance / (1000 * 60 * 60 * 24)); 
			
// 			//id가 d-day인 HTML코드에 내용 삽입 
// 			document.getElementById("d-day").innerHTML = "D-" + d; 
// 		});

	</script>
	
</html>