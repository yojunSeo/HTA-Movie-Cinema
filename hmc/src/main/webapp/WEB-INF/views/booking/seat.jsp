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
      span.large{
        font-family: "Nanum Gothic", sans-serif;
        font-size: 18px;

      }
      span.big{
        font-family: "Nanum Gothic", sans-serif;
        font-size: 20px;
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
        font-size: 16px;
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
		<%@ include file="../common/header.jsp" %>
	</header>

	<main>
		<div class="row my-5" style="background-color:#444444; height: 900px">
			<div class="row my-5">
				<div class="col-8 offset-2"  style="background-color:#E2E3E5;height: 600px">
					<div class="row" id="schedule-kind">
						<div class="col-12 text-light text-center" style="background-color: #000000"><p class="my-2"><small class="fw-bold">인원/좌석 선택</small></p></div>
					</div>
					<!-- 영화정보 약간 알려주고 인원선택 -->
					<div class="row" id="schedule-select" style="background-color:#FFFFFF" data-schedule-code="${schedule.scheduleCode }">
						<div class="col-4 mb-1">
							<p class="fs-5 b my-2"><span class='badge rounded-pill mx-3' data-movie-grade="${schedule.movieGrade }">12</span>${schedule.movieName }</p>
							<p class="p-0 m-0"><span >${schedule.branchName } / ${schedule.roomName }</span></p>
							<p class="p-0 m-0"><span class="fw-bold">[<fmt:formatDate value="${schedule.scheduleDate }" pattern="yyyy/MM/dd"/>] </span><span><fmt:formatDate value="${schedule.startTime }" pattern="HH:mm"/> ~ <fmt:formatDate value="${schedule.endTime }" pattern="HH:mm"/></span></p>
						</div>
						<div class="col-4 mt-3 text-center">
							<p>
								<span class="large mx-2">인원  </span>
					  			<button class="btn btn-outline-secondary btn-sm" type="button" id="button-minus"><i class='fas fa-minus'></i></button>
					  			<input type="text" id="booking-cnt" class="m-0 text-center" value="0" style="width: 32px; height: 32px"> 
					  			<button class="btn btn-outline-secondary btn-sm" type="button" id="button-plus"><i class='fas fa-plus'></i></button>
							</p>
						</div>
					</div>
					<div class="row" style="background-color: #000000">
						<p></p>
						<p class="text-center text-white" style="background-color: #6E6E6E">S C R E E N</p>
					</div>
					<div class="row" style="height: 500px; background-color: #000000" >
						<div id="seat-zone" class="offset-4 mt-5" >
							<div id="seat-zone-a" class="mb-1" >
							</div>
							<div id="seat-zone-b" class="mb-1">
							</div>
							<div id="seat-zone-c" class="mb-1">
							</div>
							<div id="seat-zone-d" class="mb-1">
							</div>
							<div id="seat-zone-e" class="mb-1">
							</div>
							<div id="seat-zone-f" class="mb-1">
							</div>
							<div id="seat-zone-g" class="mb-1">
							</div>
						</div>
					</div>
					<div class="row" style="background-color: #000000">
						<p class="text-white small">
							<span class="badge rounded-pill bg-white" style="width: 10px; height: 10px"> </span> 일반석
							<span class="badge rounded-pill bg-danger" style="width: 10px; height: 10px"> </span> 프리미엄
							<span class="badge rounded-pill bg-warning" style="width: 10px; height: 10px"> </span> 커플석
							<span class="badge rounded-pill bg-success" style="width: 10px; height: 10px"> </span> 장애인석
						
						</p>
					</div>
					<div class="row" style="background-color: #6E6E6E" id="booking-total">
						<p class="text-white fw-bold mb-2" style="background-color: #6E6E6E">
							<span class="big float-start mt-3 mx-3">총 결제금액 : <strong class="text-warning"><fmt:formatNumber value="0"></fmt:formatNumber></strong> 원</span>
						<button class="btn btn-lg float-end mt-2 text-white" style="background-color:#FF243E "><span class="large">결제하기</span></button>
						<button class="btn btn-light btn-lg float-end mt-2 mx-2"><span class="large">취소</span></button>
						</p>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<script>
$(function(){

	var scheduleCode = $("#schedule-select").data("schedule-code");
	var roomSeats;
	var bookedSeats;
	var selectedSeats = new Array();
	
	function getSelectedSeats(){
		selectedSeats = [];
		var seats = $('#seat-zone .bg-danger');
		$.each(seats, function(index, seat){selectedSeats.push(seat.id)});
		console.log(selectedSeats)
		console.log(selectedSeats.length)
	}
	
	$.getJSON("book/rest/seat/info?code="+scheduleCode, function(result){
		roomSeats = result.roomSeats;
		bookedSeats = result.bookedSeats;
		for(var i=0; i<roomSeats.length; i++){
			// 좌석하나마다 버튼을 생성해서 
			var seat = roomSeats[i];
			var input = document.createElement('input');
			input.type= "button";
			input.style = "width:40px; height: 40px"
			input.value = seat.SEATROW + seat.SEATCOL;
			input.id = seat.SEATCODE;
			if(seat.TYPE == "일반"){
				input.classList = "seat general btn btn-outline-dark bg-light";
			}else if(seat.TYPE == "프리미엄"){
				input.classList = "seat premium btn btn-outline-danger bg-light";				
			}else if(seat.TYPE == "커플"){
				input.classList = "seat couple btn btn-outline-warning bg-light";								
			}else if(seat.TYPE  =="장애인"){
				input.classList = "seat dp btn btn-outline-success bg-light";												
			}else if(seat.TYPE  =="3D일반"){
				input.classList = "seat 3D btn btn-outline-dark bg-light";												
			}else if(seat.TYPE  =="3D장애인"){
				input.classList = "seat 3Ddp btn btn-outline-success bg-light";																	
			}
			if(seat.SEATROW == "A"){
				$('#seat-zone-a').append(input);
			}else if(seat.SEATROW == 'B'){
				$('#seat-zone-b').append(input);
			}else if(seat.SEATROW == 'C'){
				$('#seat-zone-c').append(input);
			}else if(seat.SEATROW == 'D'){
				$('#seat-zone-d').append(input);
			}else if(seat.SEATROW == 'E'){
				$('#seat-zone-e').append(input);
			}else if(seat.SEATROW == 'F'){
				$('#seat-zone-f').append(input);
			}else if(seat.SEATROW == 'G'){
				$('#seat-zone-g').append(input);
			}
		}
		nonabledSeat(bookedSeats);
		chageGrade();
		
		var moviegrade = $('#schedule-select p:first span').data('movie-grade');
		if(moviegrade == "청소년관람불가"){
			confirm('본 영화는 청소년 관람불가로, 관람시 신분증을 반드시 지참하셔야 합니다.');
		}
	}); 
		

	function nonabledSeat(bookedSeats){
		for(var i=0; i<bookedSeats.length; i++){
			var bookedSeat = bookedSeats[i];
			var val = bookedSeat.SEATCODE;
			var nonabled = document.getElementById(val);
			nonabled.disabled = true;
		}
		var bookingCnt = $('#booking-cnt').val();
		if(bookingCnt%2!=0 || selectedSeats.length%2 !=0 || (bookingCnt%2==0 && selectedSeats.length%2 !=0)){
			$('.couple').prop('disabled', true);
		}
	}
	
	// 버튼 클릭했을때 상태 변경
	$('#seat-zone').on('click', '.seat', function(){
		var bookingCnt = $('#booking-cnt').val();
		if(bookingCnt == 0){
			alert('인원을 먼저 선택해주세요!');
		}else{
			//  ########커플석 처리하기 ########
			if($(this).hasClass('couple')){
				// 좌석번호의 뒷자리 알아내기
				var seat = $(this).val();
				var number = seat.substr(1);
				if($(this).hasClass('bg-danger')){
					// 이미 선택된 좌석을 눌렀을때
					$(this).removeClass('bg-danger text-white');
					$(this).addClass('bg-light');
					if(number%2 == 0){
						// 짝수 
						$(this).prev().removeClass('bg-danger text-white');
						$(this).prev().addClass('bg-light');
					}else{
						// 홀수
						$(this).next().removeClass('bg-danger text-white');
						$(this).next().addClass('bg-light');
					}
					getSelectedSeats();
					
					if(selectedSeats.length < bookingCnt){
						$('#seat-zone :input').prop('disabled', false);
						nonabledSeat(bookedSeats);
					}
					totalPrice();
				}else{
					// 선택되지 않은 좌석을 눌렀을때
					$(this).removeClass('bg-light');
					$(this).addClass('bg-danger text-white');
					if(number%2 == 0){
						// 짝수 
						$(this).prev().removeClass('bg-light');
						$(this).prev().addClass('bg-danger text-white');
					}else{
						// 홀수
						$(this).next().removeClass('bg-light');
						$(this).next().addClass('bg-danger text-white');
					}
					getSelectedSeats();
					if(selectedSeats.length == bookingCnt){
						$('#seat-zone :input').prop('disabled', true);
						$('#seat-zone .bg-danger').prop('disabled', false);
						nonabledSeat(bookedSeats);
					}
					totalPrice();
				}
				// 커플석 끝 ##########################
			}else{
				if($(this).hasClass('bg-danger')){
					$(this).removeClass('bg-danger text-white');
					$(this).addClass('bg-light');
					getSelectedSeats();
					if(selectedSeats.length < bookingCnt){
						$('#seat-zone :input').prop('disabled', false);
						nonabledSeat(bookedSeats);
					}
					totalPrice();
				}else{				
					if($(this).hasClass('btn-outline-success')){
						var confirmValue = confirm('장애인석을 예매할 경우 입장시 관련 증명서를 지참하셔야 합니다.');
						if(!confirmValue){
							return false;
						}
					}
					var seatCode = $(this).attr('id');
					$(this).removeClass('bg-light');
					$(this).addClass('bg-danger text-white');
					getSelectedSeats();
					nonabledSeat(bookedSeats);
					if(selectedSeats.length == bookingCnt){
						$('#seat-zone :input').prop('disabled', true);
						$('#seat-zone .bg-danger').prop('disabled', false);
						nonabledSeat(bookedSeats);
					}
					totalPrice();
				}
			}
		}
	})
	// 인원선택 - 클릭시
	$('#button-minus').on('click', function(){
		if(selectedSeats.length >= 1){
			$('.seat').prop('disabled', false);
			$('.seat').removeClass('bg-danger text-white');
			$('.seat').addClass('bg-light');
			selectedSeats = [];
			nonabledSeat(bookedSeats);
		}
		var cnt = $('#booking-cnt').val()
		if(cnt == 0){
			return;
		}else{
			if(cnt%2 == 0){
				$('.couple').prop('disabled', true);
			}else{
				$('.couple').prop('disabled', false);
			}
			$('#button-minus').prop('disabled', false);
			$('#booking-cnt').val(cnt-1);
			nonabledSeat(bookedSeats);
		}
		totalPrice();
	})	
	// 인원선택 + 클릭시
	$('#button-plus').on('click', function(){
		if(selectedSeats.length >= 1){
			$('.seat').prop('disabled', false);
			$('.seat').removeClass('bg-danger text-white');
			$('.seat').addClass('bg-light');
			selectedSeats = [];
			nonabledSeat(bookedSeats);
		}
		var cnt = parseInt($('#booking-cnt').val())
		if(cnt%2 == 0){
			$('.couple').prop('disabled', true);
		}else{
			$('.couple').prop('disabled', false);
		}
		if(cnt == 4){
			alert('예매는 최대 4명까지만 가능합니다.');
			return
		}else{
			$('#booking-cnt').val(cnt+1);			
		}
		nonabledSeat(bookedSeats);
		totalPrice();
	})
	// 결제하기/예매하기 클릭시
	$('#booking-total button:first').on('click', function(){
		// 제대로 선택했는지 확인 (선택한 인원수만큼 선택하지 않았거나, 0명 선택했거나)
		var bookingCnt = $('#booking-cnt').val();
		if(bookingCnt != selectedSeats.length || bookingCnt == 0){
			alert('죄석을 다시 선택하세요!');
			return;
		}
		// 결제창으로 좌석정보랑 예약스케줄 정보 넘김
		// 스케줄정보는 scheduleCode 넘기고
		// 예약된 좌석은 selectedSeats 배열로 넘긴다.
		console.log("결제로 넘길정보");
		console.log(scheduleCode);
		console.log(selectedSeats);
		var totalPrice = $('#booking-total span strong').text();
		
		location.href = "book?code="+scheduleCode+"&seats="+selectedSeats;
	})
	$('#booking-total .btn-light').on('click', function(){
		var confirmValue = confirm('예매를 취소하시겠습니까?');
		if(confirmValue){
			location.href = "schedule/branch";
		}
	})
	// 총 결제금엑
	function totalPrice(){
		var totalPrice = 0;
		var cnt = $('#booking-cnt').val()
		if(selectedSeats.length == cnt){
			$.each(selectedSeats, function(index, seat){
				if($("#"+seat).hasClass('general')){
					totalPrice += 12000;
				}else if($("#"+seat).hasClass('premium')){
					totalPrice += 15000;				
				}else if($("#"+seat).hasClass('couple')){
					totalPrice += 13000;								
				}else if($("#"+seat).hasClass('dp')){
					totalPrice += 6000;												
				}else if($("#"+seat).hasClass('3D')){
					totalPrice += 14000;												
				}else if($("#"+seat).hasClass('3Ddp')){
					totalPrice += 7000;												
				}
			})
		}
		$('#booking-total span strong').text(new Number(totalPrice).toLocaleString());
	}
	
	// 관람등급
	function chageGrade(){
		var grade = $('#schedule-select span:first').data('movie-grade');
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
		$('#schedule-select span:first').addClass(gradeClass);
		$('#schedule-select span:first').text(movieGrade);
	}
	
});
</script>
</body>
</html>