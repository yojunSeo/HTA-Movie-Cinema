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
<title>영화상세정보-HMC</title>
</head>
<style type="text/css">
.box1 {
	max-width: 980px;
	margin: auto;
	display: flex;
	justify-content: center;
	align-items: center;
}

.card {
	border: none;
}

.poster {
	width: 210px;
	height: 270px;
}
/* 슬라이드 */
.swiper-container {
	width: 100%;
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
.nav-tabs, .nav-item .nav-link {
	border: none;
	outline: none;
}
.nav-link, .nav-link:hover {
	color: #000000;
}
.nav-link.active {
	font-weight : bold;
}
ul.nav.nav-tabs li.nav-item button.active {
	border-bottom : 3px solid #FF243E;
}
.score-box {
	display: flex;
	justify-content: center;
	align-items: center;
}

</style>
<body>
	<div class="container">
		<header><%@ include file="../common/header.jsp"%></header>
		<main>
			<div class="box1 row">
				<div class="col-12 mt-5">
					<div class="card mb-3">
						<div class="row g-0">
							<div class="poster col-md-4">
								<img
									src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202107/17616_103_1.jpg"
									class="img-fluid rounded-start" alt="...">
							</div>
							<div class="col-md-8">
								<div class="card-body">
									<h5 class="card-title">${movie.movieGrade }모가디슈${movie.movieName }</h5>
									<p class="card-text">
										관람객 평점 <strong>${movie.reviewCnt }</strong>예매순위 <strong>${savedMovie.totalScore }</strong>
									</p>
									<hr style="border: solid 1px gray;">
									<p class="card-text">
										<small class="text-muted">장르 ${movie.genre }
											${movie.releaseDate }개봉 ${movie.runningTime }분 </br> 출연
											${movie.acterName } </br> ${movie.company }
										</small>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row" style="margin-top: 100px;">
						<div class="col" style="border:none; outline:none;">
							<ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
								<li class="nav-item active" role="presentation">
									<button class="nav-link active" id="info-tab" data-bs-toggle="tab" data-bs-target="#info" type="button" role="tab"
										aria-controls="info" aria-selected="false">영화정보</button>
								</li>
								<li class="nav-item" role="presentation">
									<button class="nav-link" id="review-tab" data-bs-toggle="tab" data-bs-target="#review" type="button" role="tab"
										aria-controls="review" aria-selected="false">평점 및 관람평</button>
								</li>

							</ul>
							<div class="tab-content mt-5" id="myTabContent">
								<div class="tab-pane show active" id="info" role="tabpanel" aria-labelledby="info-tab">
									
									<h5><b>시놉시스</b></h5>
									<p> ${movie.synopsis }
										내전으로 고립된 낯선 도시, 모가디슈 <br /> 지금부터 우리의 목표는 오로지 생존이다! <br /> <br />
										대한민국이 UN가입을 위해 동분서주하던 시기 <br /> 1991년 소말리아의 수도 모가디슈에서는 일촉즉발의
										내전이 일어난다. <br /> 통신마저 끊긴 그 곳에 고립된 대한민국 대사관의 직원과 가족들은 총알과 포탄이
										빗발치는 가운데, <br />살아남기 위해 하루하루를 버텨낸다. <br /> 그러던 어느 날 밤, 북한 대사관의 일행들이
										도움을 요청하며 문을 두드리는데…
									</p>
									<br />
									<h5><b>트레일러</b></h5>
									<div class="mt-4 mb-4" style="margin-left: 60px">
										<iframe width="853" height="480"
											src="https://www.youtube.com/embed/VOdDMmSjle0"
<%-- 											"${movie.trailer }"  --%>
											title="YouTube video player" frameborder="0"
											allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
											allowfullscreen></iframe>
									</div>
									<br />
									<h5><b>스틸컷</b></h5>
									<div class="row mb-3">
										<div class="col mt-4">
											<div class="swiper-container mySwiper">
												<div class="swiper-wrapper">
													<div class="swiper-slide">
														<img src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202107/17616_105_1.jpg">
													</div>
													<div class="swiper-slide">
														<img src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202107/17616_105_4.jpg">
													</div>
													<div class="swiper-slide">
														<img src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202107/17616_105_5.jpg">
													</div>
													<div class="swiper-slide">
														<img src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202107/17616_105_11.jpg">
													</div>
												</div>
												<div class="swiper-button-next"></div>
												<div class="swiper-button-prev"></div>
												<div class="swiper-pagination"></div>
											</div>
										</div>
									</div>

								</div>
								<div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
									<div class="score-box">
										<p>총 평점 <strong>${movie.totalScore }</strong></p><br/>
										<p>영화 관람 후 관람평을 작성하시면 50P를 적립해드립니다.</p>
									</div>
									<div class="reivew-list">
										<div class="review-info">
											<p>총 ${movie.reviewCnt }건</p>
											<hr style="border: solid 1px gray;">
										</div>
										<div class="review">
											<div>
												<span>${LOGINED_USER.name }</span>
												<span>${review.score }</span>
											</div>
											<div>
												<span>${review.content }</span>
											</div>
										</div>
									</div>

								</div>

							</div>
						</div>
					</div>
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
		// 각각의 탭이 화면에 표시될 때 show.bs.tab 이벤트가 발생함.
		// 각각의 탭이 화면에 표시될 때 브라우져 쿠키에 사용자정의 쿠키값을 저장함
		$("#info-tab").on("show.bs.tab", function() {
			// 브라우저 쿠키에 step=level1 값을 저장하고, 만료시간을 1시간 후로 설정한다.
			setCookie("step", "level1", 1)		
		})
		$("#review-tab").on("show.bs.tab", function() {
			// 브라우저 쿠키에 step=level2 값을 저장하고, 만료시간을 1시간 후로 설정한다.
			setCookie("step", "level2", 1)		
		})
		// 브라우져 쿠키에 값을 저장한다.
		// name은 쿠키명, value는 쿠키값, days는 만료일까지의 일 수
		function setCookie(name, value, days) {
			var d = new Date();
			d.setTime(d.getTime() + (days*24*60*60*1000));
			var expires = "expires=" + d.toUTCString();
			// 쿠키는 name=value; expires=Thu, 18 Dec 2021 12:00:00 UTC; path=/
			document.cookie = name + "=" + value + ";" + expires + ";path=/";
		};
		
		// 브라우져 쿠키저장소에 지정된 이름의 쿠키값을 찾아서 반환한다.
		function getCookie(name) {
			name = name + "=";
			var decodedCookie = decodeURIComponent(document.cookie);
			var items = decodedCookie.split(";");
			for (var i=0; i<items.length; i++) {
				var item = items[i];
				while (item.charAt(0) == ' ') {
					item = item.substring(1);
				}
				if (item.indexOf(name) == 0) {
					return item.substring(name.length, item.length);
				}
			}
			return "";
		};
		
		// 웹 페이지 로딩시 쿠키값을 조회해서 적절한 작업을 수행하는 함수다.
		(function () {
			// 브라우져 쿠키에서 step이라는 이름으로 저장된 쿠키값을 조회한다.
			var step = getCookie("step");
			
			// 웹페이지가 로딩될 때 쿠키값을 사용해서 구현할 내용을 코딩한다.
			if (step == "" || step == "level1") {
				$("#home-tab").trigger('click');
			} else if (step == "level2") {
				$("#profile-tab").trigger('click');
			} 
		})();	
	})	

	// 슬라이드 구현
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