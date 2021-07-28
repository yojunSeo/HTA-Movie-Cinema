<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>상영스케줄 등록-HMC</title>
</head>
<body>
	<div class="container">

		<header>
		</header>

		<main>
			<div class="row my-3 ">
				<div class="col">
					<h2>상영스케줄 등록</h2>
					<a href="list">스캐줄조회</a>
				</div>
			</div>
			<div class="row">
				<div class="col-6">
				<form id="schedule-form">
					<div class="form-group col-12">
						<div class="row mt-3" id="box-date">
							<label>상영일자를 선택하세요.</label>
							<input type="date" class="form-control mt-2 w-100" name="scheduleDate" id="screen-date" />
						</div>
						<div class="row mt-3" id="box-movie">
							<label>영화를 선택하세요.</label>
							<select class="form-control mt-2 w-100" name="screenCode" id="movie-code">
								<option value="" selected disabled> 선택하세요</option>
								<c:forEach var="movie" items="${movies }">
									<option value="${movie.code }"> ${movie.movieName }</option>
								</c:forEach>
							</select>
						</div>
						<div class="row mt-3">
							<label>영화관을 선택하세요.</label>
							<select class="form-control mt-2 w-100" name="branchCode" id="box-branch">
								<option value="" selected disabled> 선택하세요</option>
								<c:forEach var="branch" items="${branchs }">
									<option value="${branch.code }"> ${branch.name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="row mt-3" id="box-room">
							<label>상영관을 선택하세요.</label>
							<select class="form-control mt-2 w-100" name="roomCode" id="room-code">
							
							</select>
						</div>
						<div id="box-time">
							<div class="row mt-3" id="box-time-1">
								<label>상영시간을 선택하세요.<span class="badge rounded-pill bg-primary mx-3" id="schedule-plus">추가</span></label>
								<div class="col-5">
									<input id="start-time-1" type="datetime-local" class="form-control mt-2 w-30" name="startTime" placeholder="시작시간" />
								</div>
								<div class="col-5">
									<input id="end-time-1" type="datetime-local" class="form-control mt-2 w-30 mx-2" name="endTime" placeholder="종료시간" readonly />
								</div>
							</div>
							<div class="row mt-3" id="box-time-2">
								<div class="col-5">
									<input id="start-time-2" type="datetime-local" class="form-control mt-2 w-30" name="startTime" placeholder="시작시간" />
								</div>
								<div class="col-5">
									<input id="end-time-2" type="datetime-local" class="form-control mt-2 w-30 mx-2" name="endTime" placeholder="종료시간" readonly />
								</div>
							</div>
							<div class="row mt-3" id="box-time-3">
								<div class="col-5">
									<input id="start-time-3" type="datetime-local" class="form-control mt-2 w-30" name="startTime" placeholder="시작시간" />
								</div>
								<div class="col-5">
									<input id="end-time-3" type="datetime-local" class="form-control mt-2 w-30 mx-2" name="endTime" placeholder="종료시간" readonly />
								</div>
							</div>
						</div>
						<div class="row mt-3" id="schedule-submit">
							<div class="col-6 text-end">
								<button type="button" class="btn btn-outline-danger" id="btn-cancel">취소</button>
								<button type="submit" class="btn btn-outline-primary">등록</button>
							</div>
						</div>
					</div>
 				</form>
 			</div>
 			<div class="col-1">
 			</div>
 			<!-- 상영시간표 띄우기 -->
 			<div class="col-5 border p-3" id="schedule-box">
 				<div class="row mb-3" id="schedule-info">
 					<h3>[2021-07-31]</h3>
 					<h4>HMC [왕십리점] 상영시간표</h4>
 				</div>
 				<table class="table table-striped" id="schedule-table">
 					<thead>
 						<tr>
 							<th>번호</th>
 							<th>영화</th>
 							<th>상영시간</th>
 							<th>상영관</th>
 							<th>예매현황</th>
 						</tr>
 					</thead>
 					<tbody>
 						<tr>
 							<td></td>
 							<td>크루엘라</td>
 							<td>19:30~20:~</td>
 							<td>1관</td>
 							<td>55/60</td>
 						</tr>
 					</tbody>
 				</table>
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
		
		$('#box-room').hide();
		$('#box-time-1').hide();
		
		// box-time 2 3 은 disabled 처리
		$('#box-time-2').hide();
		$('#start-time-2').prop("disabled", true)
		$('#end-time-2').prop("disabled", true)
		
		$('#box-time-3').hide();
		$('#start-time-3').prop("disabled", true)
		$('#end-time-3').prop("disabled", true)
		$('#schedule-submit').hide();
		
		$('#schedule-box').hide();
		
		$('#screen-date').change(function(){
			var screenDate = $('#screen-date').val();

			$.ajax({
				type:"GET",
				url:"../rest/screenDate",
				data:{date:screenDate},
				dataType:"text"
			})
			.done(function(date){
				$('#start-time').val(date);
			})
		});
		
		$('#box-branch').change(function(){
			var branchCode = $(this).val();
			
			$.ajax({
				type:"GET",
				url:"../rest/branch",
				data:{code:branchCode},
				dataType:"json"
				
			})
			.done(function(rooms){
				var $select = $('#room-code').empty();
				
 				$select.append("<option value='' selected disabled> 선택하세요</option>");
				$.each(rooms, function(index, room){
					$select.append("<option vlaue='"+room.code+"'>"+room.name+"</option");
				})
				$('#room-code').append($select);

			$('#box-room').show();
			});
		});
		
		$('#box-room').change(function(){
			$('#box-time-1').show();
			// ####################### 상영시간표 띄우기 ################
			var branchCode = $('#box-branch').val();
			var screenDate = $('#screen-date').val();
			
			$.ajax({
				type:"GET",
				url:"../rest/branchSchedule",
				data:{branchCode:branchCode,screenDate:screenDate},
				dataType:"json"
			})
			.done(function(schedules){
				if(schedules.length == 0){
					console.log("스케줄 없음");
				}else{
					
					var branchName;
					
					$.each(schedules, function(index, schedule){
						branchName = schedule.BRANCHNAME;
					})
					console.log(branchName);
					
					var $info = $('#schedule-info').empty();
					$info.append("");
					
					
				}
			})
								
			$('#schedule-box').show();
		});
		
		$('#schedule-plus').click(function(){
			// 1의 값이 있으면 2 띄우기
			if(!$('#start-time-1').val()){
				alert("첫번째로 추가할 상영시간을 먼저 입력하세요!");
				$('#start-time-2').focus();
				return false;
				
			}else if($('#start-time-1').val() && !$('#start-time-2').val()){
				$('#start-time-2').prop("disabled", false);
				$('#end-time-2').prop("disabled", false);
				$('#box-time-2').show();
				
			}else if($('#start-time-1').val() && $('#start-time-2').val()){
				$('#start-time-3').prop("disabled", false);
				$('#end-time-3').prop("disabled", false);
				$('#box-time-3').show();
			}
			if($('#start-time-1').val() && $('#start-time-2').val() && $('#start-time-3').val()){
				alert("상영시간은 최대 3개까지 추가가 가능합니다!");
				return false;
			}
		})
		
		$(":input[name=startTime]").change(function(){
			
			var startTime = $(this).val();
			console.log(startTime);
			var movieCode = $('#movie-code').val();
			var $endTime = $(this).closest("div").next().children();
			
			$.ajax({
				type:"GET",
				url:"../rest/endTime",
				data:{startTime:startTime,movieCode:movieCode},
				dataType:"text"
			})
			.done(function(endTime){
				console.log(endTime);
				$endTime.val(endTime);
			})
		})
		
		$('#box-time').change(function(){			
			$('#schedule-submit').show();
		});
		
		// 취소버튼 클릭했을 때
		$('#btn-cancel').click(function(){
			var confirmValue = confirm("스케줄 등록을 취소하시겠습니까?");
			if(!confirmValue){
				return;
			}
			location.href = "/hmc/admin/schedule/list";
		});
		// 입력값 검사
		$('#schedule-form').submit(function(){
			// 상영일자 입력확인
			if(!$('#screen-date').val()){
				alert("상영일자를 입력하세요!");
				$('#screen-date').focus();
				return false;
			}
			// 상영일자가 오늘보다 뒤인지 확인
			var screenDateString = $('#screen-date').val();
			var today = new Date();
			var screenDate = new Date(screenDateString);
			
			if(today > screenDate){
				alert("이미 지난 날짜입니다!");
				$('#screen-date').focus();
				return false;				
			}
			if(!$('#movie-code').val()){
				alert("영화를 선택하세요!");
				$('#movie-code').focus();
				return false;
			}
			if(!$('#start-time').val()){
				alert("시작시간을 입력하세요!");
				$('#start-time').focus();
				return false;
			}
			// 시작시간 날짜랑 상영날짜랑 같아야한다.
			var startTime = new Date($('#start-time').val());
			
			var startTimeMonth = startTime.getMonth();
			var screenMonth = screenDate.getMonth();
			var startTimeMonthDate = startTime.getDate();
			var screenDate = screenDate.getDate();
			
			if(startTimeMonth != screenMonth || startTimeMonthDate != screenDate){
				alert("상영날짜와 상영시간은 같은 날이여야 합니다!");
				$('#start-time').focus();
				return false;
			}
			return true;
		});

	})
	</script>
</body>
</html>