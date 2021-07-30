<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>상영스케줄 등록-HMC</title>
</head>
<body>
<div class="container">
	<header>
	</header>

	<main>
		<div class="row my-3 ">
			<div class="col">
				<h2 class="fw-lighter">상영스케줄 등록</h2>
				<a href="list">스캐줄조회</a>
			</div>
		</div>
		<div class="row">
			<div class="col-5">
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
								<div class="col-6">
									<input id="start-time-1" type="datetime-local" class="form-control mt-2 w-30" name="startTime" placeholder="시작시간" />
								</div>
								<div class="col-6">
									<input id="end-time-1" type="datetime-local" class="form-control mt-2 w-30 mx-2" name="endTime" placeholder="종료시간" readonly />
								</div>
							</div>
							<div class="row mt-3" id="box-time-2">
								<div class="col-6">
									<input id="start-time-2" type="datetime-local" class="form-control mt-2 w-30" name="startTime" placeholder="시작시간" />
								</div>
								<div class="col-6">
									<input id="end-time-2" type="datetime-local" class="form-control mt-2 w-30 mx-2" name="endTime" placeholder="종료시간" readonly />
								</div>
							</div>
							<div class="row mt-3" id="box-time-3">
								<div class="col-6">
									<input id="start-time-3" type="datetime-local" class="form-control mt-2 w-30" name="startTime" placeholder="시작시간" />
								</div>
								<div class="col-6">
									<input id="end-time-3" type="datetime-local" class="form-control mt-2 w-30 mx-2" name="endTime" placeholder="종료시간" readonly />
								</div>
							</div>
						</div>
						<div class="row mt-3" id="schedule-submit">
							<div class="col-8"></div>
							<div class="col-4 mt-3 ml-3">
								<button type="button" class="btn btn-outline-danger" id="btn-cancel">취소</button>
								<button type="button" class="btn btn-outline-primary" id="btn-submit">등록</button>
							</div>
						</div>
					</div>
				</form>
			</div>
			<!-- 상영시간표 띄우기 -->
			<div class="col-1"></div>
 			<div class="col-6 border p-3 ml-2" id="schedule-box">
 				<div class="row mb-3" id="schedule-info"></div>
 				<table class="table table-striped" id="schedule-table">
 					<thead>
 						<tr>
 							<th class="text-center">영화</th>
 							<th class="text-center">상영시간</th>
 							<th class="text-center">상영관</th>
 							<th class="text-center">예매현황</th>
 						</tr>
 					</thead>
 					<tbody id="schedule-tbody">

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
		
		// ajax를 함수로 만들어놓을까? ##############################
		// 상영시간표 띄우기##############################
		function scheduleTableAjax(branchCode, screenDate){
			console.log(branchCode);
			console.log(screenDate);
			$.ajax({
				type:"GET",
				url:"../rest/branchName",
				data:{code:branchCode},
//				dataType:"json"
				dataType:"text"
			})
			.done(function(name){
				console.log(name);
				var $info = $('#schedule-info').empty();
				$info.append("<h3 class='fw-lighter mb-2'>[ "+screenDate+" ]</h3>");
				$info.append("<h4 class='fw-lighter text-secondary'>HMC [<span class='fw-bold text-danger'> "+name+" </span>] 상영시간표</h4>");
				$('#schedule-info').append($info);
				
			})
			$.ajax({
				type:"GET",
				url:"../rest/branchSchedule",
				data:{branchCode:branchCode,screenDate:screenDate},
				dataType:"json"
			})
			.done(function(schedules){
				
				if(schedules.length == 0){
					var $tbody = $("#schedule-table tbody").empty();
					var $tr = $("<tr></tr>")
					$tr.append("<td class='text-center' colspan='4'>상영스케줄이 존재하지 않습니다.</td>")
					$tbody.append($tr);
					
				} else{
					var $tbody = $("#schedule-table tbody").empty();
					
					$.each(schedules, function(index, schedule){
						var name = schedule.movieName;
						var startTime = schedule.startTime;
						var endTime = schedule.endTime;
						var roomName = schedule.roomName;
						var emptySeat = schedule.emptySeat;
						var totalSeat = schedule.totalSeat;
						
						var $tr = $('<tr></tr>');
						$("<td class='text-center'></td>").text(name).appendTo($tr);
						$("<td class='text-center'></td>").text(startTime +" ~ "+endTime).appendTo($tr);
						$("<td class='text-center'><span class='badge bg-warning text-dark'>"+roomName+"</span></td>").appendTo($tr);
						$("<td class='text-center'><span class='badge bg-dark'>"+emptySeat+" / "+totalSeat+"</span></td>").appendTo($tr);

						$tbody.append($tr);
					})
				}
			})
								
			$('#schedule-box').show();
		}
		// ############ 여기까지 ##########################
		
		$('#screen-date').change(function(){
			var screenDate = $('#screen-date').val();
			
			$.ajax({
				type:"GET",
				url:"../rest/screenDate",
				data:{date:screenDate},
				dataType:"text"
			})
			.done(function(date){
				$('#start-time-1').val(date);
				$('#start-time-2').val(date);
				$('#start-time-3').val(date);
			})
			// #### 여기서도 호출
			// 상영날짜 중간에 변경하는 경우
			if($('#box-branch').val()){
				var branchCode = $('#box-branch').val();
				scheduleTableAjax(branchCode, screenDate);
			}
		});
		
		$('#box-branch').change(function(){
			var branchCode = $(this).val();
			var screenDate = $('#screen-date').val();
			
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
					$select.append("<option value='"+room.code+"'>"+room.name+"</option>");
				})
				$('#room-code').append($select);

			$('#box-room').show();
			});
			
			scheduleTableAjax(branchCode, screenDate);
		});
		
		$('#box-room').change(function(){
			$('#box-time-1').show();
		});
		
		$('#schedule-plus').click(function(){
			// 1의 값이 있으면 2 띄우기
			if(!$('#end-time-1').val()){
				alert("첫번째로 추가할 상영시간을 먼저 입력하세요!");
				$('#start-time-2').focus();
				return false;
				
			}else if($('#end-time-1').val() && !$('#end-time-2').val()){
				$('#start-time-2').prop("disabled", false);
				$('#end-time-2').prop("disabled", false);
				$('#box-time-2').show();
				
			}else if($('#end-time-1').val() && $('#end-time-2').val()){
				$('#start-time-3').prop("disabled", false);
				$('#end-time-3').prop("disabled", false);
				$('#box-time-3').show();
			}
			if($('#end-time-1').val() && $('#end-time-2').val() && $('#end-time-3').val()){
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
		$('#btn-submit').click(function(){
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
			if(!$('#start-time-1').val()){
				alert("시작시간을 입력하세요!");
				$('#start-time-1').focus();
				return false;
			}
			// 시작시간 날짜랑 상영날짜랑 같아야한다.
			var startTime = new Date($('#start-time-1').val());
			
			var startTimeMonth = startTime.getMonth();
			var screenMonth = screenDate.getMonth();
			var startTimeMonthDate = startTime.getDate();
			var screenDate = screenDate.getDate();
			
			if(startTimeMonth != screenMonth || startTimeMonthDate != screenDate){
				alert("상영날짜와 상영시간은 같은 날이여야 합니다!");
				$('#start-time').focus();
				return false;
			}
			registerSchedule();
		});
		
		function registerSchedule(){
			$.ajax({
				type:"POST",
				url:"../rest/schedule/register",
				data:$('#schedule-form').serialize(),
				dataType:"json",
				success:function(info){
					console.log(info);
					var screenDate = info.pop();
					var branchCode = info.pop();
					
					scheduleTableAjax(branchCode, screenDate);
				}
			});
		}
		// 입력값 검사만 하면됨
	})
	</script>
</body>
</html>