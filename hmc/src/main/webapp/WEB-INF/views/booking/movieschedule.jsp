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
						<div class="col-4 p-0" id="movie-zone">
							<p class="list-group-item b small list-group-item-action  border-0 my-1" ><span class='badge rounded-pill bg-warning mx-3'>12</span>영화명</p>
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
									<p class="small ml-3 b">가산디지털</p>
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
			var movies = map.movies;
			var defaultMovie = map.defaultMovie;

			$('#movie-zone').empty();
			var $movie = "";
			$.each(movies, function(index, movie){
				var grade = movie.MOVIEGRADE;
				var movieGrade;
				var gradeClass;
				if(grade == "12세이상관람가"){
					movieGrade = 12;
					gradeClass = "bg-warning";
				}else if(grade == "15세이상관람가"){
					movieGrade = 15;
					gradeClass = "bg-success";
				}else if(grade == "전체관람가"){
					movieGrade = "All";
					gradeClass = "bg-info";
				}else{
					movieGrade = "19";
					gradeClass = "bg-danger";					
				}
				
				if(defaultMovie.SCREENCODE == movie.SCREENCODE){
					$movie += "<p class='list-group-item b small list-group-item-action active border-0 mb-1' style='background-color:#ADB5BD;' data-screen-code='"+movie.SCREENCODE+"' data-movie-name='"+movie.MOVIENAME+"'><span class='badge rounded-pill "+gradeClass+" mx-3'>"+movieGrade+"</span>"+movie.MOVIENAME+"</p>";
				}else{
					$movie += "<p class='list-group-item b small list-group-item-action  border-0 mb-1' data-screen-code='"+movie.SCREENCODE+"' data-movie-name='"+movie.MOVIENAME+"'><span class='badge rounded-pill "+gradeClass+" mx-3'>"+movieGrade+"</span>"+movie.MOVIENAME+"</p>";
				}
			})
			$('#movie-zone').append($movie);
			changeScheduleSelect();
			changeSchedule();
		})
		
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
				$ul += "<li class='list-group-item list-group-item-action boder-0 text-center active' style='background-color:#ADB5BD; width: 70px'  data-screen-day='"+dayOfWeek+"' data-screendate='"+date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate()+"'>";				
			}else{
				$ul += "<li class='list-group-item list-group-item-action boder-0 text-center' data-screen-day='"+dayOfWeek+"' data-screendate='"+date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate()+"' style='width: 70px;'>";
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
	
	// 날짜 클릭했을때
	$('#date-zone').on('click', '.list-group-item' ,function(){
		var screenDate = $(this).data('screendate');
		$(this).addClass('active').css('background-color', '#ADB5BD');
		$(this).siblings().removeClass('active').css('background-color', "#FFFFFF");
		changeScheduleSelect();
		changeSchedule();
	})
	
	// 스케줄 바꾸기 (영화,날짜 받아와서)
	function changeSchedule(){
		var screenDate = $('#date-zone .active').data('screendate');
		var screenCode = $('#movie-zone .active').data('screen-code');
		console.log(screenDate,screenCode)
		$.ajax({
			type:"GET",
			url:"rest/movie/getBranchSchedule",
			data:{screenCode:screenCode,screenDate:screenDate},
			dataType:"json"
		}).done(function(branchs){
			
			if(branchs.length == 0){
				$('#schedule-zone').empty();
				var $div = "<div>";			
				$div += "<p class='text-center mt-3'>상영스케줄이 존재하지 않습니다.</p>";
				$div += "</div>";
				$('#schedule-zone').append($div);
			}else{
				
			$('#schedule-zone').empty();
			var $schedules = "";
			
			$.each(branchs, function(index, branch){
				var $div = "<div>"
				$div += "<p class='small ml-3 b'>"+branch.branchName+"</p>";
				$div += "<ul class='list-inline'>";
				var schedules = branch.schedules;
				$.each(schedules, function(index, schedule){
					$div += "<li class='list-inline-item' data-schedule-code="+schedule.scheduleCode+">";
					$div += "<button class='btn btn-outline-secondary position-relative lh-sm'  style='width:100px; height: 55px'>"
					$div += "<span class='fw-bolder'><strong>"+schedule.startTime+"</strong><br/></span>"
					$div += "<span class='fw-bold'><em><em class='text-danger'>"+schedule.emptySeat+"</em> / "+schedule.totalSeat+"</em></span>"
					$div += "<span class='position-absolute top-0 start-100 translate-middle badge rounded-pill bg-dark'>"+schedule.roomName+"</span>"
					$div += "</button>"
					$div += "</li>";
				})
				$div += "</ul>";
				$div += "</div>";
				$schedules += $div;
			})
			$('#schedule-zone').append($schedules);
			}
		})
	}
	
	
	// 영화존를 클릭했을때 	
	$('#movie-zone').on('click', '.list-group-item', function(){
		$(this).addClass('active').css('background-color', '#ADB5BD');
		$(this).siblings().removeClass('active').css('background-color', '#FFFFFF');
		var screenCode = $('#movie-zone .active').data('screen-code');
		var screenDate = $('#date-zone .active').data('screendate');
		changeScheduleSelect();
		changeSchedule();
	})

	// 상단 바꾸기
	function changeScheduleSelect(){
		var selectMoive = $('#movie-zone .active').data('movie-name');
		var selectdate = $('#date-zone .active').data('screendate');
		var selectday = $('#date-zone .active').data('screen-day');
		$('#schedule-select').empty();
		var $div = "<div class='col-4 text-center' style='background-color:#D2D2D2'><p class='fs-5 b my-2'>"+selectMoive+"</p></div>";
		$div += "<div class='col-8 text-center border' style='background-color:#D2D2D2'><p class='fs-5 b my-2'>"+selectdate+"("+selectday+")</p></div>"
		$('#schedule-select').append($div);
	}
	// 영화별 스케줄 보기로 이동
	$('#branch-schedule').click(function(){
		location.href = "/hmc/booking/schedule/branch";
	});
})
</script>
</body>
</html>