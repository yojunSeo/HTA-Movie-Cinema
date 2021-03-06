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
      span.big{
      	font-family: "Nanum Gothic", sans-serif;
        font-size: 20px;
      }
      p {
        font-family: "Nanum Gothic", sans-serif;
        font-size: 20px;
      }
      em{
      	font-family: "Nanum Gothic", sans-serif;
        font-size: 12px;
      }
      span.small{
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
					<!-- 영화관 영화 날짜선택 -->
					<div class="row" id="schedule-kind">
						<div class="col-4  text-light text-center border-end border-secondary" style="background-color: #000000" id="branch-schedule"><p class="my-2"><small class="fw-bold">영화관 선택</small></p></div>
						<div class="col-4 text-light text-center border-end border-secondary" style="background-color: #000000" id="movie-schdule"><p class="my-2"><small class="fw-bold">영화 선택</small></p></div>
						<div class="col-4 text-light text-center" style="background-color: #000000" id="movie-schdule"><p class="my-2"><small class="fw-bold">날짜 선택</small></p></div>
					</div>
					<!-- 스케즐 선택 -->
					<div class="row bg-light" style="height: 700px" >
						<!-- 영화관-->
						<div class="col-2 p-0" id="branch-area">
							<p class="list-group-item list-group-item-action  border-0 m-0" ><span class="fw-bold mx-3">MY 영화관</span></p>
							<p class="list-group-item list-group-item-action  border-0 m-0"><span class="fw-bold mx-3">서울</span></p>
						</div>
						<div class="col-2 p-0" style="background-color: #FFFFFF" id="branch-zone">
							<p class="list-group-item list-group-item-action border-0 m-0"><span class="fw-bold mx-3">지점이름</span></p>
						</div>
						<!-- 영화-->						
						<div class="col-4 border-start border-secondary p-0" style="background-color: #FFFFFF; height:700px; overflow-y: scroll;" id="movie-zone">
						</div>
							<!-- 날짜/ 스케줄 -->
						<div class="col-4 border-start border-secondary" style="background-color: #FFFFFF" id="schedule-area">
							<div class="row" id="date-zone">
								<!-- 날짜존 -->
							</div>
							<div class="row mt-3" id="schedule-zone" tabindex="0" style="height: 600px;overflow-y: scroll;">
								<!-- 스케줄존 -->
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
	
	(function(){
		$.getJSON("schedule/rest/branch/info", function(map){
			console.log(map);
			var defaultArea = map.defaultArea;
			if(defaultArea == '서울'){
				$('#branch-area p:last').addClass('active').css('background-color', '#FF243E');
				changeBranchZone(map.allBranchs);
			}else{
				$('#branch-area p:first').addClass('active').css('background-color', '#FF243E');
				changeBranchZone(map.favoriteBranchs);
			}
			$('#branch-zone p:first').addClass('active').css('background-color', '#FF243E');
			changerHeader();
			var branchCode = $('#branch-zone .active').data('branch-code');
			changeMovieZone(branchCode);
			changeSchedule();
		});
		
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth();
		var day = today.getDate();
		var lastDay = new Date(year, month, day+6);
		var weekOfDay = ["일", "월", "화", "수", "목", "금", "토"];

		$('#date-zone').empty();
		var $ul = "<ul class='list-group list-group-horizontal'>";
		
		for(i=0; i<=6; i++){
			var date = new Date(year,month, day+i);
			var dayOfWeek = weekOfDay[date.getDay()];
			
			if(date.getDate() == today.getDate() && date.getMonth() == today.getMonth()){
				$ul += "<li class='list-group-item list-group-item-action boder-0 text-center active text-dark' style='background-color:#DFDFDF; width: 59px'  data-screen-day='"+dayOfWeek+"' data-screendate='"+date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate()+"'>";				
			}else{
				$ul += "<li class='list-group-item list-group-item-action boder-0 text-center' data-screen-day='"+dayOfWeek+"' data-screendate='"+date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate()+"' style='width: 59px;'>";
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
	
	$('#branch-area p').on('click', function(){
		$(this).addClass('active').css('background-color', '#FF243E');
		$(this).siblings().removeClass('active').css('background-color', "#FFFFFF");
		var area = $(this).text();
		$.ajax({
			type:"GET",
			url:"schedule/rest/branch/areaBranch",
			data:{area:area},
			dataType:"json"
		}).done(function(result){
			changeBranchZone(result);
		})
	})
	
	$('#branch-zone').on('click', 'p', function(){
		$(this).addClass('active').css('background-color', '#FF243E');
		$(this).siblings().removeClass('active').css('background-color', "#FFFFFF");
		$('#movie-zone p').removeClass('active').css('background-color', "#FFFFFF");
		var branchCode = $(this).data('branch-code');
		changeMovieZone(branchCode);
		changeSchedule();
		changerHeader();
	})
	
	$('#date-zone').on('click', 'li', function(){
		$(this).addClass('active text-dark').css('background-color', '#DFDFDF');
		$(this).siblings().removeClass('active').css('background-color', "#FFFFFF");
		changerHeader();
		changeSchedule();
	})
	
	$('#movie-zone').on('click', 'p', function(){
		$(this).addClass('active text-dark').css('background-color', '#DFDFDF');
		$(this).siblings().removeClass('active').css('background-color', "#FFFFFF");
		changerHeader();
		changeSchedule();
	})
	
	// 자주쓰는 함수 
	// 영화등급 넣으면 등급이름과 색 반환해줌
	function getMovieGrade(grade){
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
		var result = {movieGrade:movieGrade , gradeClass:gradeClass}
		return result;
	}
	
	function changeMovieZone(branch){
		if(branch){
			$.ajax({
				type:"GET",
				url:"schedule/rest/branch/screenMovie",
				data:{branch:branch},
				dataType:"json"
			}).done(function(movies){
				$('#movie-zone').empty();
				var $row = "";
				if(movies.length == 0){
					$row += "<p class='list-group-item list-group-item-action text-center  border-0 mt-5'><span class='big'>현재상영중인 영화가 없습니다.</span></p>"
					$('#movie-zone').append($row);
				}else{
					$row += "<p class='small text-danger text-center'><small>* 선택하신 상영관에서 현재 상영중인 영화 목록입니다.</small></p>"
					$.each(movies, function(index, movie){
						var movieName = movie.MOVIENAME;
						var screenCode = movie.SCREENCODE;
						var grade = movie.MOVIEGRADE;
						var result = getMovieGrade(grade);
						var movieGrade = result.movieGrade;
						var gradeClass = result.gradeClass;
						$row += "<p class='list-group-item b list-group-item-action  border-0 my-2' data-screen-code='"+screenCode+"' ><span class='badge rounded-pill "+gradeClass+" mx-3'>"+movieGrade+"</span><span>"+movieName+"</span></p>"
					})
					$('#movie-zone').append($row);
				}
			})
		}else{
			$('#movie-zone').empty();
			var $row = "";
			$row += "<p class='list-group-item list-group-item-action text-center border-0 mt-5'><span class='big'>영화관을 선택해주세요.</span></p>"
			$('#movie-zone').append($row);
		}
	}
	
	function changeBranchZone(branchs){
		$('#branch-zone').empty();
		var $row = "";

		if(branchs.length == 0){
			$row += "<p class='list-group-item list-group-item-action disabled border-0 m-0'><span class='fw-bold mx-3'>MY 영화관이 없습니다.</span></p>"
			$('#branch-zone').append($row);
		}else{
			$.each(branchs, function(index, branch){
				$row += "<p class='list-group-item list-group-item-action border-0 m-0' data-branch-name='"+branch.name+"' data-branch-code='"+branch.code+"'><span class='fw-bold mx-3'>"+branch.name+"</span></p>"
			})
			$('#branch-zone').append($row);
			$('#branch-zone p:first').addClass('active').css('background-color', '#FF243E');
		}
		changerHeader();
		var branch = $('#branch-zone .active').data('branch-code');
		changeMovieZone(branch);
		changeSchedule();
	}
	
	function changerHeader(){
		var selectedBranch = $('#branch-zone .active span').text();
		if(selectedBranch == ""){
			selectedBranch = "영화관 선택";
		}
		var selectedMovie = $('#movie-zone .active span:last').text();
		if(selectedMovie == ""){
			selectedMovie = "영화 선택";
		}
		var selectedDate = $('#date-zone ul .active').data('screendate');
		if(selectedBranch){
			$('#schedule-kind p:eq(0) small').text(selectedBranch);		
		}if(selectedMovie){
			$('#schedule-kind p:eq(1) small').text(selectedMovie);		
		}
		if(selectedDate){
			$('#schedule-kind p:eq(2) small').text(selectedDate);
		}
	}
	
	function changeSchedule(){
		var branch = $('#branch-zone .active').data('branch-code');
		var screenDate = $('#date-zone ul .active').data('screendate');
		var screenMovie = $('#movie-zone .active').data('screen-code');
		if(!screenMovie){
			screenMovie = null;
		}
		$.ajax({
			type:"GET",
			url:"schedule/rest/schedule",
			data:{branch:branch,screenDate:screenDate,screenMovie:screenMovie},
			dataType:"json"
		}).done(function(result){
			console.log(result);
			var movies = result.movies;
			changeScheduleZone(movies);
		})
	}

	function changeScheduleZone(movies){
		if(!movies){
			$('#schedule-zone').empty();
			var $div = "<div>";			
			$div += "<p class='text-center mt-5 '>상영스케줄이 존재하지 않습니다.</p>";
			$div += "</div>";
			$('#schedule-zone').append($div);
		}else{
			$('#schedule-zone').empty();
			var $schedules = "";
			// 이중 each구문 가능..?
			$.each(movies, function(index, movie){
				var $div = "<div>";
					var grade = movie.movieGrade;
					var result = getMovieGrade(grade);
					var movieGrade = result.movieGrade;
					var gradeClass = result.gradeClass;
				$div += "<p class='small ml-2 b'><span class='badge rounded-pill "+gradeClass+" mx-2'>"+movieGrade+"</span>"+movie.movieName+"</p>"
				$div += "<ul class='list-inline'>"
				var schedules = movie.schedules;
				$.each(schedules, function(index, schedule){
					$div += "<li class='list-inline-item mb-3 mx-1' data-schedule-code="+schedule.scheduleCode+">";
					$div += "<button class='btn btn-outline-secondary position-relative lh-sm p-0'  style='width:80px; height: 45px'>";
					$div += "<span class='fw-bolder small text-dark'>"+schedule.startTime+"<br/></span>";
					$div += "<span class='fw-bold'><em><em class='text-danger'>"+schedule.emptySeat+"</em> / "+schedule.totalSeat+"</em></span>"
					$div += "<span class='position-absolute top-0 start-100 p-1 translate-middle badge rounded-pill bg-secondary text-right' style='width:30px; height; 10px'>"+schedule.roomName+"</span>";
					$div += "</button>";
					$div += "</li>";
				})
				$div += "</ul>";
				$div += "</div>";
				$schedules += $div;
				})
			$('#schedule-zone').append($schedules);
		}
	}
	
	// 모달부분 시작
	// 스케줄 선택했을때 모달 띄우면서 정보 확인 후 좌석창으로 이동
	var todoModal = new bootstrap.Modal(document.getElementById("cofirm-modal"), {
		keyboard: false
	})
	
	$('#schedule-zone').on('click', 'li', function(){
		var scheduleCode = $(this).data('schedule-code');
		console.log(scheduleCode);
		// 스크린 정보 가져가서 정보 받아와서 모달 띄우기
		$.getJSON("schedule/rest/scheduleDetail?scheduleCode="+scheduleCode)
			.done(function(schedule){
				var grade = schedule.movieGrade;
				var result = getMovieGrade(grade);
				var movieGrade = result.movieGrade;
				var gradeClass = result.gradeClass;
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
		location.href = "seat?scheduleCode="+scheduleCode;
	});
})
</script>
</body>
</html>