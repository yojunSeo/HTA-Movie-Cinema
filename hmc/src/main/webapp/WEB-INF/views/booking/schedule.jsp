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
<title>페이지이름-HMC</title>
</head>
<body>
<div class="container-fluid">

	<header>
	</header>

	<main>
		<div class="row my-5" style="background-color:#444444; height: 800px">
			<div class="row my-5">
				<div class="col-8 offset-2"  style="background-color:#E2E3E5;">
					<div class="row" id="schedule-kind">
						<div class="col-6 text-light text-center" style="background-color: #FF243E" id="branch-schedule"><p class="my-2"><small class="fw-bold">영화관별 상영시간표</small></p></div>
						<div class="col-6 text-light text-center" style="background-color: #000000" id="movie-schdule"><p class="my-2"><small class="fw-bold">영화별 상영시간표</small></p></div>
					</div>
					<div class="row" id="schedule-select">
						<div class="col-4 text-center" style="background-color:#D2D2D2"><p class="fs-5 b my-2">가산디지털</p></div>
						<div class="col-8 text-center border" style="background-color:#D2D2D2"><p class="fs-5 b my-2">2021-7-29(오늘)</p></div>
					</div>
					<div class="row" >
						<div class="col-2 p-0" id="branch-area">
							<p class="list-group-item list-group-item-action list-group-item-secondary border-0 m-0"><span class="fw-bold mx-3">MY 영화관</span></p>
							<p class="list-group-item list-group-item-action list-group-item-secondary border-0 m-0"><span class="fw-bold mx-3">서울</span></p>
						</div>
						<div class="col-2 p-0" style="background-color: #FFFFFF" id="branch-zone">
							<p class="list-group-item list-group-item-action border-0 m-0"><span class="fw-bold mx-3">지점이름</span></p>
						</div>
						<div class="col-8 border-start border-secondary" style="background-color: #FFFFFF" id="schedule-area">
							<div class="row m-3" id="date-zone">
								<ul class="list-group list-group-horizontal mx-4">
								  <li class="list-group-item list-group-item-action boder-0 text-center" style="width: 70px;">
								  	<span class="fw-bold">월/일<small>요일</small></span>
								  </li>
								</ul>
							</div>
							
							<!-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55555 -->
							<div class="row" id="schedule-zone">
								<div>
									<p class="small ml-2 b"><span class="badge rounded-pill bg-success">15</span> 모가디슈</p>
									<ul class="list-inline">
										<li class="list-inline-item">
											<button class="btn btn-outline-secondary position-relative lh-sm"  style="width:100px; height: 55px">
												<span class="fw-bolder"><strong>9:25</strong><br/></span>
												<span class="fw-bold"><em><em class="text-danger">55</em> / 60</em></span>
												<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-warning text-dark">1관</span>
											</button>
										</li>
										<li class="list-inline-item">
											<button class="btn btn-outline-secondary position-relative lh-sm"  style="width:100px; height: 55px">
												<span class="fw-bolder"><strong>11:25</strong><br/></span>
												<span class="fw-bold"><em><em class="text-danger">55</em> / 60</em></span>
												<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-warning text-dark">1관</span>
											</button>
										</li>
										<li class="list-inline-item">
											<button class="btn btn-outline-secondary position-relative lh-sm"  style="width:100px; height: 55px">
												<span class="fw-bolder"><strong>14:00</strong><br/></span>
												<span class="fw-bold"><em><em class="text-danger">55</em> / 60</em></span>
												<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-info text-dark">2관</span>
											</button>
										</li>
										<li class="list-inline-item">
											<button class="btn btn-outline-secondary position-relative lh-sm"  style="width:100px; height: 55px">
												<span class="fw-bolder"><strong>18:30</strong><br/></span>
												<span class="fw-bold"><em><em class="text-danger">55</em> / 60</em></span>
												<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-info text-dark">2관</span>
											</button>
										</li>
									</ul>
								</div>
							</div>
							<!-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% -->
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
	
	// 페이지 로딩시 가장먼저 실행 (영화관별 이 가장먼저)
	(function(){
		$.getJSON("rest/info", function(map){
			console.log(map);
			if(map.defaultArea == "서울"){
				// 선호영화관 없는 경우 그냥 서울을 ACTIVE 하고 모든 지점리스트를 표시한다.
				$('#branch-area > p:eq(1)').addClass('active bg-secondary');
				var branchs = map.allBranchs;
				changeBranchZone(branchs);
			}else{
				// 선호영화관이 있는경우 MY영화관 ACTIVE 하고 선호지점리스트 표시
				$('#branch-area > p:eq(0)').addClass('active bg-secondary');
				var branchs = map.favoriteBranchs;
				changeBranchZone(branchs);
			}
			$('#branch-zone p:first').addClass('active bg-secondary');
		});
		
		// 날짜 부분 생성 - 총 10일간을 보여준다.
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth();
		var day = today.getDate();
		var lastDay = new Date(year, month, day+9);
		var weekOfDay = ["일", "월", "화", "수", "목", "금", "토"];

		$('#date-zone').empty();
		var $ul = "<ul class='list-group list-group-horizontal mx-4'>";
		
		for(i=0; i<=9; i++){
			var date = new Date(year,month, day+i);
			var dayOfWeek = weekOfDay[date.getDay()];
			
			if(date.getDate() == today.getDate() && date.getMonth() == today.getMonth()){
				$ul += "<li class='list-group-item list-group-item-action boder-0 text-center active bg-secondary' style='width: 70px'>";				
			}else{
				$ul += "<li class='list-group-item list-group-item-action boder-0 text-center' style='width: 70px;'>";
			}
			// 토요일이나 일요일이면 색상 바뀜
			if(dayOfWeek == "일"){
				$ul += "<span class='fw-bold'>"+(date.getMonth()+1)+"/"+date.getDate()+"<small class='text-danger'>"+dayOfWeek+"</small></span>";	
			}else if(dayOfWeek == "토"){
				$ul += "<span class='fw-bold'>"+(date.getMonth()+1)+"/"+date.getDate()+"<small class='text-primary'>"+dayOfWeek+"</small></span>";	
			}else{
				$ul += "<span class='fw-bold'>"+(date.getMonth()+1)+"/"+date.getDate()+"<small>"+dayOfWeek+"</small></span>";								
			}
			$ul += "</li>";
			
		}	
		$('#date-zone').append($ul);
		
	})();
	
	function changeScheduleSelect(branchName, screenDate){
		$('#schedule-select').empty();
		var $row = "<div class='col-4 text-center' style='background-color:#D2D2D2'><p class='fs-5 b my-2'>"+branchName+"</p></div>";
		$row += "<div class='col-8 text-center border' style='background-color:#D2D2D2'><p class='fs-5 b my-2'>"+screenDate+"</p></div>";
		$('#schedule-select').append($row);
	}
	
	function changeBranchZone(branchs){
		$('#branch-zone').empty();
		var $row = "";
		$.each(branchs, function(index, branch){
			$row += "<p class='list-group-item list-group-item-action border-0 m-0'><span class='fw-bold mx-3'>"+branch.name+"</span></p>"
		})
		$('#branch-zone').append($row);
	}
	
	function changeScheduleZone(schedules){
		$('#schedule-zone').empty();
		var $schedules = "";
		// 이중 each구문 가능..?
		$.each(schedules, function(index, schedule){
			var $div = "<div>";
			$div += "<p class='small ml-2 b'><span class='badge rounded-pill bg-success'>15</span>"+schedule.movieName+"</p>"
			$div
			
			$div += "</div>";
			
			
		})
		
		$('#schedule-zone').append($schedules);
	}


})

</script>
</body>
</html>