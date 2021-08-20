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
<title>관리자-HMC</title>
</head>
<body>
	<div class="container-fluid">
		<main>
			<div class="container-fluid mt-5">
				<div class="row">
					<div class="col-2">
						<%@include file ="sidebar.jsp"%>
					</div>
					<div class="col-10">
						<h4 class="my-5">사용자 통계</h4>
							<div class="row" id="user-chart">
								<div class="col-6">
									<p class="fs-5">[사용자 성별]</p>
									<canvas id="gender-chart"></canvas>
								</div>
								<div class="col-6">
									<p class="fs-5">[사용자 연령별]</p>
									<canvas id="age-chart"></canvas>
								</div>
							</div>
						<h4 class="my-5" id="branch-chart">지점별 통계</h4>
							<div class="row">
								<div class="col-8">
									<p class="fs-5">[지점별 매출]  <button type="button" id="search-sales" class="btn btn-outline-primary mx-3">조회</button>
									</p>
									<div class="row">
										<select class="form-select" id="sales-month" style="width: 300px">
										</select>
										<select class="form-select mx-2" id="sales-date" style="width: 300px">
										</select>
									</div>
									<p id="non-sales"></p>
									<div id="sales-canvas-zone">
										<canvas id="sales-chart" class="my-5"></canvas>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-8">
									<p class="fs-5">[지점별 예매울]  <button type="button" id="search-booking" class="btn btn-outline-primary mx-3">조회</button>
									</p>
									<div class="row">
										<select class="form-select" id="booking-month" style="width: 300px">
										</select>
										<select class="form-select mx-2" id="booking-date" style="width: 300px">
										</select>
									</div>
									<p id="non-booking"></p>
									<div id="booking-canvas-zone">
										<canvas id="booking-chart" class="my-5"></canvas>
									</div>
								</div>
							</div>
					</div>
				</div>
			</div>
		</main>
	</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script>
$(function(){
	
	$.getJSON('rest/static/user', function(result){
		var gender = result.gender;
		var age = result.age;
	
		var colors = ['red','skyblue','yellowgreen','#c3e6cb','#dc3545','#6c757d'];
		var donutOptions = {
				cutoutPercentage: 30,
				legend: {position: 'bottom', padding:5, labels:{pointStyle:'circle', usePointStyle:true}}
		};
		// 성별차트
		var genderData = {
				labels: ['여성', '남성'], 
				datasets: [ 
					{ 
						backgroundColor: colors.slice(0,2), 
						borderWidth: 0,
						data: [gender[1].CNT, gender[0].CNT] 
					} 
				]
		};
		
		var genderDonut = $('#gender-chart');
		if(genderDonut){
			new Chart(genderDonut, {
				type: 'pie',
				data: genderData,
				options: donutOptions
			});
		};
		
		// 연령별 차트
		var ageData = {
				labels:[age[0].AGE+"대",age[1].AGE+"대",age[2].AGE+"대",age[3].AGE+"대" ],
				datasets:[
					{ 
						backgroundColor: colors.slice(0,4), 
						borderWidth: 0,
						data: [age[0].CNT, age[1].CNT, age[2].CNT, age[3].CNT,] 
					} 
				]
		};
		
		var ageDount = $('#age-chart');
		if(ageDount){
			new Chart(ageDount, {
				type: 'pie',
				data: ageData,
				options: donutOptions
			})
		}
	});
	
	(function(){
		var today = new Date();
		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
		var day = ('0' + today.getDate()).slice(-2);
		var dateString = year + '-' + month  + '-' + day;
		ajaxSales(dateString);
		ajaxBooking(dateString);
		
		$month = "<option selected disaled>월을 선택하세요</option>";
		for(i=1; i<=month; i++){
			if(i == month){
				$month += "<option value='"+i+"' selected>"+i+"월</option>";		
			}else{
				$month += "<option value='"+i+"'>"+i+"월</option>";			
			}
		}
		$('#sales-month').append($month);
		$('#booking-month').append($month);
		
		selectWeek(month, '#sales-date');
		selectWeek(month, '#booking-date');
		
	})();
	
	
	$('#sales-month').on('change', function(){
		var sMonth = $(this).val();
		selectWeek(sMonth, '#sales-date');
	});
	
	$('#booking-month').on('change', function(){
		var sMonth = $(this).val();
		selectWeek(sMonth, '#booking-date');
	});
	
	function selectWeek(month, id){
		var weeks = printWeek(month);
		var weekDays = weeks.weekDays;
		var weekFirsts = weeks.weekFirsts;
		$(id).empty();
		$week = "<option selected disabled>주를 선택하세요</option>";
		for(i=0; i<weekDays.length; i++){
			$week += "<option value='"+weekFirsts[i]+"'>"+weekDays[i]+"</option>";
		}
		$(id).append($week);
	}
	
	function formatDate(date) {
	       var mymonth = date.getMonth()+1;
	       var myweekday = date.getDate();
	       return (mymonth + "/" + myweekday);
	}

	function printWeek(month) {
		var weekDays = new Array();
		var weekFirsts = new Array();
		var resultWeeks = {weekDays:weekDays, weekFirsts:weekFirsts};
		var lastDay = (new Date(2021, month-1, 0)).getDate();
		for(i=0; i<=5; i++){
			var day = (i*7)+1;
			var now = new Date(2021, month-1, day);
			if(day>lastDay){
				return resultWeeks;
			}
		    // 월화수목금토일 중 어떤거	
		    var nowDayOfWeek = now.getDay();
		    // 오늘 몇일?
		    var nowDay = now.getDate();
		    // 오늘 몇월
		    var nowMonth = now.getMonth();
		    // 년도
		    var nowYear = now.getFullYear();
		    var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek + 1);
		    var weekEndDate = new Date(nowYear, nowMonth, nowDay + (6 - nowDayOfWeek) + 1);
		    var weekData = formatDate(weekStartDate) + " - " + formatDate(weekEndDate);
		    
			var firstYear = weekStartDate.getFullYear();
			var firstMonth = ('0' + (weekStartDate.getMonth() + 1)).slice(-2);
			var firstDay = ('0' + weekStartDate.getDate()).slice(-2);
			var dateString = firstYear + '-' + firstMonth  + '-' + firstDay;
		   
			if(weekDays[weekDays.length-1] != weekData){
		    	weekDays.push(weekData);
		    	weekFirsts.push(dateString);
		    }
		}
		return resultWeeks;
	}
	
	$('#search-booking').on('click', function(){
		$('#booking-canvas-zone').empty();
		$('#booking-canvas-zone').append('<canvas id="booking-chart" class="my-5"></canvas>');
		var startDate = $('#booking-date').val();
		if(!startDate){
			alert("조회할 주를 선택해주세요!");
			return false;
		}
		ajaxBooking(startDate);
	});
	
	function ajaxBooking(startDate){
		$.ajax({
			type:"GET",
			url:'rest/static/branch/booking',
			data:{date:startDate},
			dataType:"json"
		}).done(function(booking){
			console.log(booking);
			if(booking.length !=0){
				$('#non-sales').text('');
				console.log(booking);
				var bookedSeats = [booking[0].BOOKEDSEATS, booking[1].BOOKEDSEATS, booking[2].BOOKEDSEATS,
					booking[3].BOOKEDSEATS, booking[4].BOOKEDSEATS, booking[5].BOOKEDSEATS, booking[6].BOOKEDSEATS]; 
				var scheduleCnt = [booking[0].SCHEDULECNT, booking[1].SCHEDULECNT, booking[2].SCHEDULECNT,
					booking[3].SCHEDULECNT, booking[4].SCHEDULECNT, booking[5].SCHEDULECNT, booking[6].SCHEDULECNT];
				var bookingChart = $('#booking-chart'); 
				var mixedChart = { type: 'bar', labels: [booking[0].BRANCHNAME, booking[1].BRANCHNAME, booking[2].BRANCHNAME,
					booking[3].BRANCHNAME, booking[4].BRANCHNAME, booking[5].BRANCHNAME, booking[6].BRANCHNAME], 
						datasets : [ { label: '예매된 좌석 수', data : bookedSeats, backgroundColor: 'rgba(232, 46, 46, 0.5)' }, 
							{ label: '스케줄 수', data: scheduleCnt, backgroundColor: 'transparent', borderColor: 
								'skyblue', type: 'line' } ] }; var myChart = new Chart(bookingChart, { type: 'bar', 
									data: mixedChart, options: { legend: { display: true } } });

			}else{
				$('#non-booking').addClass('mt-5 text-center fs-5 fw-bold');
				$('#non-booking').text('해당 기간에 조회된 데이터가 없습니다.');
			}
		});
	}
	
	function ajaxSales(startDate){
		$.ajax({
			type:"GET",
			url:'rest/static/branch/sales',
			data:{date:startDate},
			dataType:"json"
		}).done(function(sales){
			if(sales.length != 0){
				$('#non-sales').text('');
				var salesZone = $('#sales-chart'); 
				var salesChart = new Chart(salesZone, 
					{	type: 'bar', 
						data: 
						{ 	labels: [sales[0].BRANCH_NAME, sales[1].BRANCH_NAME, sales[2].BRANCH_NAME, sales[3].BRANCH_NAME,
							sales[4].BRANCH_NAME, sales[5].BRANCH_NAME, sales[6].BRANCH_NAME], 
							datasets: [{ label: '단위(원)', 
										data: [sales[0].SUM, sales[1].SUM, sales[2].SUM, sales[3].SUM,sales[4].SUM, 
											sales[5].SUM, sales[6].SUM], 
										backgroundColor:
										[ 'rgba(232, 46, 46, 0.5)', 'rgba(54, 162, 235, 0.5)', 
											'rgba(255, 206, 86, 0.5)', 'rgba(75, 192, 192, 0.5)', 
											'rgba(153, 102, 255, 0.5)', 'rgba(255, 159, 64, 0.5)', 'rgba(31, 72, 175, 0.5)' ], 
										borderColor: 
										[ 'rgba(232, 46, 46, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 
											'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)', 'rgba(31, 72, 175, 1)' ], 
										borderWidth: 1 
									}] 
						}, 
						options: { scales: { yAxes: [{ ticks: { beginAtZero: true } }] } } });
			}else{
				$('#non-sales').addClass('mt-5 text-center fs-5 fw-bold');
				$('#non-sales').text('해당 기간에 조회된 데이터가 없습니다.');
			}
		})
	}
	
	$('#search-sales').on('click', function(){
		$('#sales-canvas-zone').empty();
		$('#sales-canvas-zone').append('<canvas id="sales-chart" class="my-5"></canvas>');
		var startDate = $('#sales-date').val();
		if(!startDate){
			alert("조회할 주를 선택해주세요!");
			return false;
		}
		ajaxSales(startDate);
	})
	
	
})
	
</script>
</body>
</html>