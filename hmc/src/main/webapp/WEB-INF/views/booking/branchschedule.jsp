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
		<%@ include file="../common/header.jsp" %>
	</header>

	<main>
		<div class="row my-5" style="background-color:#444444; height: 900px">
			<div class="row my-5">
				<div class="col-8 offset-2"  style="background-color:#E2E3E5;height: 600px">
					<div class="row" id="schedule-kind">
						<div class="col-6 text-light text-center" style="background-color: #FF243E" id="branch-schedule"><p class="my-2"><small class="fw-bold">영화관별 상영시간표</small></p></div>
						<div class="col-6 text-light text-center" style="background-color: #000000" id="movie-schdule"><p class="my-2"><small class="fw-bold">영화별 상영시간표</small></p></div>
					</div>
					<div class="row" id="schedule-select">
						<div class="col-4 text-center" style="background-color:#D2D2D2"><p class="fs-5 b my-2">지점명</p></div>
						<div class="col-8 text-center border" style="background-color:#D2D2D2"><p class="fs-5 b my-2">날짜</p></div>
					</div>
					<div class="row bg-light" style="height: 600px" >
						<div class="col-2 p-0" id="branch-area">
							<p class="list-group-item list-group-item-action  border-0 m-0" ><span class="fw-bold mx-3">MY 영화관</span></p>
							<p class="list-group-item list-group-item-action  border-0 m-0"><span class="fw-bold mx-3">서울</span></p>
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
			<!-- ***********************모달시작******************************** -->
			<div class="modal fade" id="cofirm-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header" id="schedule-detail-head" style="background-color: #666666">
								<p class="modal-title text-white fw-bold" id="exampleModalLabel"><span class='badge rounded-pill bg-warning mx-3'>15</span>정글크루즈</p>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body" id="schedule-detail">
								<p><span class="big fw-bolder">날짜</span> : 2021/07/31</p>
								<p><span class="big fw-bolder">지점</span> : 왕십리점</p>
								<p><span class="big fw-bolder">상영관</span> : 1관</p>
								<p><span class="big fw-bolder">상영시간</span> : 18:30 ~ 20:55</p>
								<p><span class="big fw-bolder">잔여좌석</span> : <span class="text-danger big fw-bolder">55</span> / 60</p>
								<p><span class='badge rounded-pill bg-warning mx-3'>15</span> 본 영화는 15세 이상 관람가 영화입니다.</p>
							</div>
							<div class="modal-footer" id="schedule-detail-footer">
								<button type="button" class="btn btn-dark" data-bs-dismiss="modal">취소</button>
								<button type="button" id="go-booking" class="btn text-white" style="background-color: #FF243E" >인원/좌석 선택</button>
							</div>
						</div>
				</div>
			</div>
			<!-- ***********************모달끝******************************** -->
		</div>
	</main>

	<footer>
		<%@ include file="../common/footer.jsp" %>
	</footer>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script>
$(function(){
	
	// 페이지 로딩시 가장먼저 실행 (영화관별 이 가장먼저)
	(function(){
		var movies;
		$.getJSON("rest/branch/info", function(map){
			console.log(map)
			var allbranchs = map.allBranchs;
			if(map.defaultArea == "서울"){
				// 선호영화관 없는 경우 그냥 서울을 ACTIVE 하고 모든 지점리스트를 표시한다.
				$('#branch-area > p:eq(1)').addClass('active').css('background-color', '#ADB5BD');
				console.log(allbranchs);
				changeBranchZone(allbranchs);
			}else{
				// 선호영화관이 있는경우 MY영화관 ACTIVE 하고 선호지점리스트 표시
				$('#branch-area > p:eq(0)').addClass('active').css('background-color', '#ADB5BD');
				var branchs = map.favoriteBranchs;
				changeBranchZone(branchs);
			}
			$('#branch-zone p:first').addClass('active').css('background-color', '#ADB5BD');
			changeScheduleSelect();
			if(map.schedules){
				movies = map.schedules.movies;
				changeScheduleZone(movies);
			}else{
				noSchedule();
			}
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
			$row += "<p class='list-group-item list-group-item-action border-0 m-0' data-branch-name='"+branch.name+"' data-branch-code='"+branch.code+"'><span class='fw-bold mx-3'>"+branch.name+"</span></p>"
		})
		$('#branch-zone').append($row);
	}
	
	function changeScheduleZone(movies){
		$('#schedule-zone').empty();
		var $schedules = "";
		
		// 이중 each구문 가능..?
		$.each(movies, function(index, movie){
			var $div = "<div>";
				var grade = movie.movieGrade;
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
			$div += "<p class='small ml-2 b'><span class='badge rounded-pill "+gradeClass+" mx-2'>"+movieGrade+"</span>"+movie.movieName+"</p>"
			$div += "<ul class='list-inline'>"
			var schedules = movie.schedules;
			$.each(schedules, function(index, schedule){
				$div += "<li class='list-inline-item' data-schedule-code="+schedule.scheduleCode+">";
				$div += "<button class='btn btn-outline-secondary position-relative lh-sm'  style='width:100px; height: 55px'>";
				$div += "<span class='fw-bolder'><strong>"+schedule.startTime+"</strong><br/></span>";
				$div += "<span class='fw-bold'><em><em class='text-danger'>"+schedule.emptySeat+"</em> / "+schedule.totalSeat+"</em></span>"
				$div += "<span class='position-absolute top-0 start-100 translate-middle badge rounded-pill bg-dark'>"+schedule.roomName+"</span>";
				$div += "</button>";
				$div += "</li>";
			})
			$div += "</ul>";
			$div += "</div>";
			$schedules += $div;
			})
		
		$('#schedule-zone').append($schedules);
	}
	
	function noSchedule(){
		$('#schedule-zone').empty();
		var $div = "<div>";			
		$div += "<p class='text-center mt-3'>상영스케줄이 존재하지 않습니다.</p>";
		$div += "</div>";
		$('#schedule-zone').append($div);
	}
	$('#branch-area').on('click', '.list-group-item', function(){
		// my영화관이나 서울을 클릭한다. -> active 변경시키고
		$(this).closest('p').addClass('active').css('background-color', '#ADB5BD');
		$(this).siblings('p').removeClass('active').css('background-color', '#FFFFFF');
		var text = $(this).text();
		$.ajax({
			type:"GET",
			url:"rest/branch/areaBranch",
			data:{area:text},
			dataType:"json"
		})
		.done(function(branchs){
			if(branchs.length ==0){
				$('#branch-zone').empty();
				var $row = "";
				$row += "<p class='list-group-item list-group-item-action border-0 m-0'><span class='fw-bold mx-3'>MY 영화관이 없습니다.</span></p>"
				$('#branch-zone').append($row);
			}else{
				changeBranchZone(branchs);				
				$('#branch-zone p:first').addClass('active').css('background-color', '#ADB5BD');
			}
			
		});
		var branchCode = $('#branch-zone .active').data('branch-code');
		var screenDate = $('#date-zone .active').data('screendate');
		getMovieScheduleByDateAndBranch(branchCode,screenDate);
		changeScheduleSelect();
	})
	
	
	// 지점존을 클릭했을떄
	$('#branch-zone').on('click', '.list-group-item', function(){
		$(this).addClass('active').css('background-color', '#ADB5BD');
		$(this).siblings().removeClass('active').css('background-color', '#FFFFFF');
		var branchCode = $(this).data('branch-code');
		var screenDate = $('#date-zone .active').data('screendate');
		getMovieScheduleByDateAndBranch(branchCode, screenDate);
		changeScheduleSelect();
	})
	
	// 지점코드와 상영일로 스케줄 불러오기
	function getMovieScheduleByDateAndBranch(branchCode, screenDate){
		$.ajax({
			type:"GET",
			url:"rest/branch/getMovieSchedule",
			data:{branchCode:branchCode,screenDate:screenDate},
			dataType:"json"
		}).done(function(movies){
			if(movies.length==0){
				// 스케줄 없으면
				noSchedule();
			}else{
				// 있으면
				changeScheduleZone(movies);
			}
		})
		
	}
	// 날짜 클릭했을때
	$('#date-zone').on('click', '.list-group-item' ,function(){
		var screenDate = $(this).data('screendate');
		$(this).addClass('active').css('background-color', '#ADB5BD');
		$(this).siblings().removeClass('active').css('background-color', "#FFFFFF");
		var branchCode = $('#branch-zone .active').data('branch-code');
		getMovieScheduleByDateAndBranch(branchCode,screenDate);
		changeScheduleSelect();
	})
	
	// 상단 바꾸기
	function changeScheduleSelect(){
		var selectBranch = $('#branch-zone .active').data('branch-name');
		var selectdate = $('#date-zone .active').data('screendate');
		var selectday = $('#date-zone .active').data('screen-day');
		$('#schedule-select').empty();
		var $div = "<div class='col-4 text-center' style='background-color:#D2D2D2'><p class='fs-5 b my-2'>"+selectBranch+"</p></div>";
		$div += "<div class='col-8 text-center border' style='background-color:#D2D2D2'><p class='fs-5 b my-2'>"+selectdate+"("+selectday+")</p></div>"
		$('#schedule-select').append($div);
	}

	// 영화별 스케줄 보기로 이동
	$('#movie-schdule').click(function(){
		location.href = "/hmc/booking/schedule/movie";
	});
	
	// 스케줄 선택했을때 모달 띄우면서 정보 확인 후 좌석창으로 이동
	var todoModal = new bootstrap.Modal(document.getElementById("cofirm-modal"), {
		keyboard: false
	})
	
	$('#schedule-zone').on('click', 'li', function(){
		var scheduleCode = $(this).data('schedule-code');
		// 스크린 정보 가져가서 정보 받아와서 모달 띄우기
		$.getJSON("rest/scheduleDetail?scheduleCode="+scheduleCode)
			.done(function(schedule){
				var grade = schedule.movieGrade;
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
				$('#schedule-detail-head').empty();
				$header = "<p class='modal-title text-white fw-bold' id='exampleModalLabel'><span class='badge rounded-pill "+gradeClass+" mx-3'>"+movieGrade+"</span>"+schedule.movieName+"</p>";
				$header += "<button type='button' class='btn-close' data-bs-dismiss='modal' aria-label='Close'></button>";
				$('#schedule-detail-head').append($header);
				
				$('#schedule-detail').empty();
				$detail = "<p><span class='big fw-bolder'>날짜</span> : "+schedule.scheduleDate+"</p>";
				$detail += "<p><span class='big fw-bolder'>지점</span> : "+schedule.branchName+"</p>";
				$detail += "<p><span class='big fw-bolder'>상영관</span> : "+schedule.roomName+"</p>";
				$detail += "<p><span class='big fw-bolder'>상영시간</span> : "+schedule.startTime+" ~ "+schedule.endTime+"</p>";
				$detail += "<p><span class='big fw-bolder'>잔여좌석</span> : <span class='text-danger big fw-bolder'>"+schedule.emptySeat+"</span> / "+schedule.totalSeat+"</p>";
				$detail += "<p><span class='badge rounded-pill "+gradeClass+" mx-3'>"+movieGrade+"</span> 본 영화는 "+grade+" 영화입니다.</p>";
				$('#schedule-detail').append($detail);
				
				$('#schedule-detail-footer').empty();
				$footer = "<button type='button' class='btn btn-dark' data-bs-dismiss='modal'>취소</button>";
				$footer += "<button type='button' id='go-booking' class='btn text-white' style='background-color: #FF243E' data-schedulecode="+schedule.scheduleCode+" >인원/좌석 선택</button>";
				$('#schedule-detail-footer').append($footer);
				
				todoModal.show();
				
			})
	});
	// 인원.좌석 선택 누르면 좌석창으로 이동
	$('#schedule-detail-footer').on('click', '#go-booking',function(){
		var scheduleCode = $(this).data('schedulecode');
		console.log(scheduleCode);
		location.href = "../seat?scheduleCode="+scheduleCode;
	});
})

</script>
</body>
</html>