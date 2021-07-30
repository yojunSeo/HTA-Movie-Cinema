<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
    <style>
      span {
      	font-family: "Nanum Gothic", sans-serif;
        font-size: 17px;
      }
      p {
        font-family: "Nanum Gothic", sans-serif;
        font-size: 20px;
      }
      em{
      	font-family: "Nanum Gothic", sans-serif;
        font-size: 14px;
      }
      p.small{
      font-size: 17px;
      }

      p.a {
        font-weight: 400;
      }
      p.b {
        font-weight: 700;
      }
      p.c {
        font-weight: 800;
      }
      p.d {
        font-weight: bold;
      }
    </style>
<title>상영스케줄-HMC</title>
</head>
<body>
<div class="container-fluid">

	<header>
	</header>

	<main>
		<div class="row my-5" style="background-color:#444444; height: 800px">
			<div class="row my-5">
				<div class="col-8 offset-2"  style="background-color:#E2E3E5;height: 600px">
					<div class="row" id="schedule-kind">
						<div class="col-6 text-light text-center" style="background-color: #000000" id="branch-schedule"><p class="my-2"><small class="fw-bold">영화관별 상영시간표</small></p></div>
						<div class="col-6 text-light text-center" style="background-color: #FF243E" id="movie-schdule"><p class="my-2"><small class="fw-bold">영화별 상영시간표</small></p></div>
					</div>
					<div class="row" id="schedule-select">
						<div class="col-4 text-center" style="background-color:#D2D2D2"><p class="fs-5 b my-2">영화명</p></div>
						<div class="col-8 text-center border" style="background-color:#D2D2D2"><p class="fs-5 b my-2">날짜</p></div>
					</div>
					<div class="row bg-light" style="height: 600px" >
						<div class="col-4 p-0" id="movie-area">
							<p class="list-group-item list-group-item-action  border-0 m-0" ><span class="fw-bold mx-3">MY 영화관</span></p>
							<p class="list-group-item list-group-item-action  border-0 m-0"><span class="fw-bold mx-3">서울</span></p>
						</div>
						
						<div class="col-8 border-start border-secondary" style="background-color: #FFFFFF" id="schedule-area">
							<div class="row m-3" id="date-zone">
								<ul class="list-group list-group-horizontal mx-4">
								  <li class="list-group-item list-group-item-action boder-0 text-center" style="width: 70px;">
								  	<span class="fw-bold">월/일<small>요일</small></span>
								  </li>
								</ul>
							</div>
							<div class="row" id="schedule-zone">
								<div>
									<p class="small ml-2 b"><span class="badge rounded-pill bg-success">15</span> 모가디슈</p>
									<ul class="list-inline">
										<li class="list-inline-item">
											<button class="btn btn-outline-secondary position-relative lh-sm"  style="width:100px; height: 55px">
												<span class="fw-bolder"><strong>시작시간</strong><br/></span>
												<span class="fw-bold"><em><em class="text-danger">남은좌석</em> / 총좌석</em></span>
												<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-warning text-dark">상영관이름</span>
											</button>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<footer>
	</footer>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script>
$(function(){
	// 페이지 로딩시 바로 가지고 올 것
	(function(){
		$.getJSON("rest/movie/info",function(map){
			console.log(map);
		})
		
		
	})();
})
</script>
</body>
</html>