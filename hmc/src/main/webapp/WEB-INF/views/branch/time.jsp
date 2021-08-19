<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<title>페이지이름-HMC</title>
<style type="text/css">
	.banner {
		position: relative;
		width:100vw;
		margin-left: calc(-49vw + 50%);
		padding-right: 15px;
		padding-left: 15px;
		margin-right: auto;
	}
	.tab {
		border-width: 0px 0px 2px 0px;
		border-style: solid;
		border-color: #FF243E;
	}
	.tab_selected {
		border-width: 2px 2px 0px 2px;
		border-style: solid;
		border-color: #FF243E;
		font-weight: bold;
		color: #FF243E;
	}
	.calendar-btn {
		background-color: transparent;
		margin-left: 20px;
		margin-right: 20px;
		border: none;
		text-align: center;
		font-size: 18px;
	}
	.calendar-btn p {
		margin: 0px;
	}
	.calendar-btn .dayNumber {
		font-size: 20px;
		height:30px;
		width:30px;
		text-align:center;
		line-height:30px;
		margin: 0px;
	}
	.calendar-btn .circle {
		width:30px;
		height:30px;
		border-radius:50%;
		background:#FF243E;
		color: white;
	}
</style>
</head>
<body>
	<div class="container">

		<header>
			<%@ include file="../common/header.jsp" %>
		</header>

		<main class="mt-5">
			<!-- 상단 배너 출력 -->
			<table class="table table-borderless banner" style="color:#FFFFFF; background-image: url(../resources/images/branch/thater_room.png); background-repeat: no-repeat; width:98vw; height:280px;">
				<colgroup>
					<col width="15%">
					<col width="60%">
					<col width="15%">
				</colgroup>
				<tr>
					<td></td>
					<td class="text-end">
						<c:choose>
							<c:when test="${empty LOGINED_USER}">	<!-- 로그인이 안되어 있을때 -->
								<button id="btn-my-theater" class="btn btn-outline-secondary">
									<img alt="" src="../resources/images/branch/unfavorite.png" width="30px">
									나의 영화관 등록
								</button>
							</c:when>
							<c:when test="${LOGINED_USER.favoriteBranch1 == branchCode || LOGINED_USER.favoriteBranch2 == branchCode || LOGINED_USER.favoriteBranch3 == branchCode}">
								<!-- 로그인 되어있고 나의 영화관 일때 -->
								<span class="p-3 mt-2">
									<img alt="" src="../resources/images/branch/favorite.png" width="30px">
									나의 영화관
								</span>
							</c:when>
							<c:otherwise>
								<!-- 로그인 되어 있고 나의 영화관이 아닐때 -->
								<button id="btn-my-theater" class="btn btn-outline-secondary">
									<img src="../resources/images/branch/unfavorite.png" width="30px">
									나의 영화관 등록
								</button>
							</c:otherwise>
						</c:choose>
			  		</td>
					<td></td>
			  	</tr>
				<tr>
					<td></td>
					<td class="align-middle text-center" style="">
					<h2>${branchDetail.name }</h2>
					</td>
					<td></td>
				</tr>
			</table>
			<!-- 상단배너 출력 끝 -->
			
			<!-- 탭 구현 -->
			<div class="row fs-6 justify-content-center text-center" style="display: flex;">
				<div class="col-4 p-2 tab">
					<a href="detail?code=${branchCode}" class="btn">지점상세</a>
				</div>
				<div class="col-4 p-2 tab_selected" >
					<a href="timetable?code=${branchCode}" class="btn">상영시간표</a>
				</div>
				<div class="col-4 p-2 tab">
					<a href="price?code=${branchCode}" class="btn">가격</a>
				</div>
			</div>
			
			<div class="row mt-5 p-3" >
				<!-- 날짜 선택 -->
				<div class="row justify-content-center">
					<div class="col-10 p-2" style="border-top: solid 1px black; border-bottom: solid 1px black; ">
					  <div class="btn-group text-center" id="box-day-selector" style="left:11%;">
					    
					  </div>
					</div>
				</div>
				<!-- 관람등급 -->
				<div class="row justify-content-center" >
					<div class="col-10 text-end p-3" style="background-color:#F2F2F2; font-size:13px;">
						<span class="badge rounded-pill bg-info">All</span> 전체 관람가 
						<span class="badge rounded-pill bg-warning ms-2">12</span> 12세 관람가 
						<span class="badge rounded-pill bg-success ms-2">15</span> 15세 관람가 
						<span class="badge rounded-pill bg-danger ms-2">19</span> 청소년 관람불가 
					</div>
				</div>
				<!-- 상영 영화 -->
				<div class="row justify-content-center">
					<div class="col-10" id="movie-time" data-branch-code="${branchCode}">

					</div>
				</div>
			</div>
			
			<div class="modal fade" id="booking-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header" style="background-color: #666666">
								<p class="modal-title text-white fw-bold fs-3" id="modalLabel"><span class='badge rounded-pill mx-3' id="modalGrade"></span><span id="modalMovieName"></span></p>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<table class="table table-bordered text-center" id="todal-table">
									<colgroup>
										<col width="40%">
										<col width="60%">
									</colgroup>
									<tr>
										<th>상영지점</th>
										<td>지점</td>
									</tr>
									<tr>
										<th>상영일</th>
										<td>1월 1일</td>
									</tr>
									<tr>
										<th>시작시간</th>
										<td>00:00</td>
									</tr>
									<tr>
										<th>종료시간</th>
										<td>00:00</td>
									</tr>
									<tr>
										<th>잔여좌석</th>
										<td>50석</td>
									</tr>
									<tr>
										<td colspan="2" class="fs-4">OO 관람등급입니다.</td>
									</tr>
								</table>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
								<button type="button" class="btn btn-primary" data-schedule-code="" id="btn-post-todo">예매하러가기</button>
							</div>
						</div>
				</div>
			</div>
		</main>

		<footer>
			<%@ include file="../common/footer.jsp" %>
		</footer>

	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

	<script>
		$(function() {
			// 일자 선택 출력 정보
			var today = new Date();
			var year = today.getFullYear();	// 이번 해
			var month = today.getMonth();	// 이번 달 (0~11의 값)
			var date = today.getDate();	// 오늘 일(0~31의 값)
			var $selectDayBtn;
			var selectDay;
			
			var dayOfWeek = ['일', '월', '화', '수', '목', '금', '토']	// 요일(0~6의 값, 일요일이 0)
			
			var $daySelectorBox = $('#box-day-selector').empty();
			
			// 오늘 포함 10일간 선택지 출력 
			for(var i=0; i<10; i++) {
				var tempDay = new Date(year, month, date+i);
				var day = tempDay.getDay();
				
				var div = '<button type="button" class="calendar-btn" data-date="'+ tempDay.getFullYear()+"/"+(tempDay.getMonth()+1)+"/"+tempDay.getDate() +'">';
				if(tempDay.getDate() == 1) {
					var tempMonth = tempDay.getMonth()+1;
					div += '<p>' + tempMonth +'월 </p>';
				}
				else div += '<p><br/> </p>';
				div	+= '<p class="dayNumber" id="day-selector-number">' + tempDay.getDate() + '</p>';
				// 오늘일 경우 요일칸을 오늘로 표시
				if(i == 0) div += '<p>오늘</p>';
				else div += '<p id="day-selector-day">' + dayOfWeek[day] + '</p>';
				div	+= '</button>';
				
				$daySelectorBox.append(div);
			}
			
			// 토, 일은 color 부여
			//$(".calendar-btn p:contains('토')").css("color","blue").prev().css("color","blue");
			$(".calendar-btn p:contains('토')").addClass("text-primary");
			//$(".calendar-btn p:contains('일')").css("color","red").prev().css("color","red");
			$(".calendar-btn p:contains('일')").addClass("text-danger");
			
			// 오늘이 토,일 일 경우 color 부여
			if(today.getDay() == 6) {
				//$(".calendar-btn p:contains('오늘')").css("color","blue").prev().css("color","blue");
				$(".calendar-btn p:contains('오늘')").addClass("text-primary");
			} else if(today.getDay() == 0) {
				//$(".calendar-btn p:contains('오늘')").css("color","red").prev().css("color","red");
				$(".calendar-btn p:contains('오늘')").addClass("text-danger");
			}
			
			
			var branchCode = $("#movie-time").data("branch-code");
			
			
			// 선택일이 없을 경우(페이지 초기) 첫번째 일자(오늘)을 선택함
			if(!$selectDayBtn) {
				if($("#day-selector-number").text() == today.getDate()) {
					$("#day-selector-number").addClass('circle');
					$selectDayBtn = $("#day-selector-number").closest(".calendar-btn");
					selectDay = $selectDayBtn.data("date");
					
					getMovieScheduleByDateAndBranch(branchCode, selectDay);
				}
			}

			// click 이벤트가 발생할 경우 실행되는 기능
			$(".calendar-btn").click(function() {
				$selectDayBtn.find("#day-selector-number").removeClass('circle');
				
				$selectDayBtn = $(this);
				selectDay = $selectDayBtn.data("date");
				$(this).find("#day-selector-number").addClass('circle');
				getMovieScheduleByDateAndBranch(branchCode, selectDay);
			})
			
			
			// 지점코드와 상영일로 스케줄 불러오기
			function getMovieScheduleByDateAndBranch(branchCode, screenDate){
				$.ajax({
					type:"GET",
					url:"../booking/schedule/rest/branch/getMovieSchedule",
					data:{branchCode:branchCode,screenDate:screenDate},
					dataType:"json"
				}).done(function(movies){
					printTimeTable(movies);
				})
			}
			
			// 상영시간표 출력
			function printTimeTable(movies) {
				
				var TTdiv;
				
				$('#movie-time').empty();
				
				$.each(movies, function(index, movie) {
					TTdiv = '<div id="box-movie-time" class="mt-4"> <div>';
					if(movie.movieGrade == "12세이상관람가") {
						TTdiv += '<span class="badge rounded-pill bg-warning mx-2">12</span>';						
					} else if(movie.movieGrade == "15세이상관람가") {
						TTdiv += '<span class="badge rounded-pill bg-success mx-2">15</span>';						
					} else if(movie.movieGrade == "청소년관람불가") {
						TTdiv += '<span class="badge rounded-pill bg-danger mx-2">19</span>';						
					} else if(movie.movieGrade == "전체관람가") {
						TTdiv += '<span class="badge rounded-pill bg-info mx-2">All</span>';						
					}
						
					TTdiv += '<span id="movieName">' + movie.movieName + '</sapn></div><div class="row">';
					
					$.each(movie.schedules, function(index, schedule) {

						TTdiv += '<div class="col-2 mt-3 d-grid gap-4">';
						TTdiv += '<button id="movie-time-item" class="btn btn-outline-secondary position-relative"'
						 	  +  ' data-end-time="' + schedule.endTime + '" data-schedule-code="' + schedule.scheduleCode + '">';
						if(schedule.roomName == "3D관") {
							TTdiv += '<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">' + schedule.roomName + '</span>';
						} else {
							TTdiv += '<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-dark">' + schedule.roomName + '</span>';
						}
						TTdiv += '<p style="margin:0px;">' + schedule.startTime +'</p>'
						TTdiv += '<p style="margin:0px;">' + schedule.emptySeat + '/'+ schedule.totalSeat +'</p>'
						TTdiv += '</button>';
						TTdiv += '</div>'
					})
					TTdiv += '</div></div>';
					$('#movie-time').append(TTdiv);
				})
			}
			
			// 마우스 오버시 종료시간 출력
			// 구현중
			var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
			var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
			  return new bootstrap.Popover(popoverTriggerEl)
			})
			
			// 마우스 엔터
			$("#movie-time").on('mouseenter', '.btn-outline-secondary', function() {
				var endTime = $(this).data("end-time");
				$(this)
				
			})
			
			// 영화 시간을 클릭하면 모달창 띄우기
			var bookingModal = new bootstrap.Modal(document.getElementById("booking-modal"), {
			keyboard: false
			})
			
			// 스케줄 클릭시 모달 form 정보 입력 후 모달 출력
			$("#movie-time").on('click', '.btn-outline-secondary', function() {
				var schCode = $(this).data("schedule-code");
				
				$.getJSON("../booking/schedule/rest/scheduleDetail?scheduleCode=" + schCode)
				.done(function(schedule) {
					
					var grade = schedule.movieGrade;
					if(grade == "12세이상관람가") {
						$("#modalGrade").addClass("bg-warning").text("12");
					} else if(grade == "15세이상관람가") {
						$("#modalGrade").addClass("bg-success").text("15");						
					} else if(grade == "청소년관람불가") {
						$("#modalGrade").addClass("bg-danger").text("19");						
					} else if(grade == "전체관람가") {
						$("#modalGrade").addClass("bg-info").text("All");
					}
					
					$("#modalMovieName").text(schedule.movieName);
					
					$("#todal-table tr td").eq(0).text(schedule.branchName);
					$("#todal-table tr td").eq(1).text(schedule.scheduleDate);
					$("#todal-table tr td").eq(2).text(schedule.startTime);
					$("#todal-table tr td").eq(3).text(schedule.endTime);
					$("#todal-table tr td").eq(4).text(schedule.emptySeat);
					$("#todal-table tr td").eq(5).text($("#modalGrade").html()).append("<span> 관람등급입니다</span>");
					
				})
				$("#btn-post-todo").data("schedule-code", schCode);
				
				bookingModal.show();
			})
			
			// 모달창에서 예매하기 버튼 클릭시 예매화면으로 이동
			$("#btn-post-todo").click(function() {
				
				location.href = '/hmc/booking/seat?scheduleCode='+$("#btn-post-todo").data("schedule-code");
				
			})
		});
	</script>
</body>
</html>