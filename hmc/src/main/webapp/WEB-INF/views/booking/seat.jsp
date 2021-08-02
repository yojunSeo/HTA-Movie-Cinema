<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" >
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
      span.big{
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
<title>좌석선택-HMC</title>
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
						<div class="col-12 text-light text-center" style="background-color: #000000"><p class="my-2"><small class="fw-bold">인원/좌석 선택</small></p></div>
					</div>
					<!-- 영화정보 약간 알려주고 인원선택 -->
					<div class="row" id="schedule-select" style="background-color:#FFFFFF">
						<div class="col-6">
							<p class="fs-5 b my-2" ><span class='badge rounded-pill bg-warning mx-3'>12</span>${schedule.movieName }</p>
							<p class="p-0 m-0"><span >${schedule.branchName } / ${schedule.roomName }</span></p>
							<p class="p-0 m-0"><span class="fw-bold">[<fmt:formatDate value="${schedule.scheduleDate }" pattern="yyyy/MM/dd"/>] </span><span><fmt:formatDate value="${schedule.startTime }" pattern="HH:mm"/> ~ <fmt:formatDate value="${schedule.endTime }" pattern="HH:mm"/></span></p>
						</div>
						<div class="col-2">
							<p>
								<span>인원</span>
					  			<button class="btn btn-outline-secondary btn-sm" type="button" id="button-addon1"><i class='fas fa-minus'></i></button>
					  			<input type="text" class="form-control w-20" value="1" > 
					  			<button class="btn btn-outline-secondary btn-sm" type="button" id="button-addon1"><i class='fas fa-plus'></i></button>
							</p>
						</div>
						<div class="col-4">
						</div>
					</div>
					<div class="row" style="height: 600px; background-color: #000000" >
						<div id="seat-zone">
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
	
		(function(){
			$.getJSON("")
		})();
	    
})	
</script>
</body>
</html>