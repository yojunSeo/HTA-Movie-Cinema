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
						<div class="col-4 border-start border-secondary" style="background-color: #FFFFFF" id="movie-zone">
							<p class="list-group-item b small list-group-item-action  border-0 my-1" ><span class='badge rounded-pill bg-warning mx-3'>12</span>영화명</p>
						</div>
							<!-- 날짜/ 스케줄 -->
						<div class="col-4 border-start border-secondary" style="background-color: #FFFFFF" id="schedule-area">
							<div class="row" id="date-zone">
								<!-- 날짜존 -->
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
				$('#branch-area p:last').addClass('active').css('background-color', '#ADB5BD');
				changeBranchZone(map.allBranchs);
			}else{
				$('#branch-area p:first').addClass('active').css('background-color', '#ADB5BD');
				changeBranchZone(map.favoriteBranchs);
			}
			$('#branch-zone p:first').addClass('active').css('background-color', '#ADB5BD');
			changerHeader();
		});
		
		// 날짜 총 7일간 보여줌
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
				$ul += "<li class='list-group-item list-group-item-action boder-0 text-center active' style='background-color:#ADB5BD; width: 59px'  data-screen-day='"+dayOfWeek+"' data-screendate='"+date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate()+"'>";				
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
		$(this).addClass('active').css('background-color', '#ADB5BD');
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
		$(this).addClass('active').css('background-color', '#ADB5BD');
		$(this).siblings().removeClass('active').css('background-color', "#FFFFFF");
		changerHeader();
	})
	
	$('#date-zone').on('click', 'li', function(){
		$(this).addClass('active').css('background-color', '#ADB5BD');
		$(this).siblings().removeClass('active').css('background-color', "#FFFFFF");
		changerHeader();
		
	})
	
	function changeMovieZone(branch){
		$.ajax({
			type:"GET",
			url:""
		})
	}
	
	function changeBranchZone(branchs){
		$('#branch-zone').empty();
		var $row = "";

		if(branchs.length == 0){
			$row += "<p class='list-group-item list-group-item-action border-0 m-0'><span class='fw-bold mx-3'>MY 영화관이 없습니다.</span></p>"
			$('#branch-zone').append($row);
		}else{
			$.each(branchs, function(index, branch){
				$row += "<p class='list-group-item list-group-item-action border-0 m-0' data-branch-name='"+branch.name+"' data-branch-code='"+branch.code+"'><span class='fw-bold mx-3'>"+branch.name+"</span></p>"
			})
			$('#branch-zone').append($row);
			$('#branch-zone p:first').addClass('active').css('background-color', '#ADB5BD');
		}
		changerHeader();
	}
	
	function changerHeader(){
		var selectedBranch = $('#branch-zone .active span').text();
		if(selectedBranch == ""){
			selectedBranch = "영화관 선택";
		}
		var selectedMovie = $('#movie-zone .active').text();
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
})
</script>
</body>
</html>