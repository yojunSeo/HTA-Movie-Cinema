<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<title>마이페이지-HMC</title>
</head>
<style type = "text/css">
html, body {
	width: 100%;
	height: 100%;
}

.box {
	background-color: #FF243E;
	width: 100vw;
	margin-left: calc(-50vw + 50%);
	height: 350px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.box2 {
	margin-top: 100px;
	margin-left: 220px;
	width: 1280px;
	height: 400px;
	padding: 20px;
	background-color: #FFFFFF;
	background-position: center;
	background-size: cover;
	backgroudd-repeat: no-repeat;
/* 	border: 3px solid black; */
}

.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
    border: none;
    outline: none;
    color: #000000;
    backgrone-color: #FFFFFF;
}

.nav-tabs, .nav-item .nav-link {
	border: none;
	outline: none;
}
.nav-link, .nav-link:hover {
	color: #000000;
}
.nav-link.active {
	font-weight : bold;
}
.dropdown-item, .dropdown-item:hover {
	color: #000000;
	border: none;
	outline: none;
	background-color: #FFFFFF;
}
.dropdown-item.active {
	font-weight : bold;
	color: #000000;
	background-color: #FFFFFF;
}
</style>  
<body>
	<div class="container">
	<header><%@ include file="../common/header.jsp"%></header>
		<main>
			<div class="box row mb-5 ">
				<div class="box1">
					<div class="box2 col-9 rounded-3 border border-2">
						<table id="user-info-table">
							<tr style="vertical-align: top">
								<td style="width: 750px; height:350px; border-right: 1px solid lightgray; padding-right: 12px; text-align: justify">
									<span class="large badge rounded-pill">${LOGINED_USER.grade }</span>
									<div class="my-4" style="font-size: 25px;">
										<strong>${LOGINED_USER.name }</strong>님 반가워요!
									</div>
									<div class="text-center my-3">
										<p class="fs-5 mt-3">현재 보유 포인트는 <strong><fmt:formatNumber>${LOGINED_USER.point }</fmt:formatNumber></strong> 점 입니다.</p>
										<p class="fs-5 mt-3"><span class="large badge bg-success rounded-pill">BRONZE</span> 등급까지 <strong id="remain-price">40,000원</strong> 원 남았어요!</p>
										<p class="my-5"></p>
										<p class="my-5"></p>
										<p id="membership"><span class="large badge rounded-pill text-white m-3 p-2" style="background-color: #FF243E">Membership 페이지 가기</span></p>
									</div>
									</td>
								<td style="padding-left: 20px">My영화관</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col" style="margin-top: 120px;">
					<ul class="nav nav-tabs nav-justified">
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle active" data-bs-toggle="dropdown"
							href="#" role="button" aria-expanded="false">결제내역</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item active" id="booking-tab" href="#booking" data-bs-toggle="tab" 
								data-bs-target="#booking">예매내역</a></li>
								<li><a class="dropdown-item" id="payment-tab" href="#payment" data-bs-toggle="tab" 
								data-bs-target="#payment">구매/선물내역</a></li>
							</ul>
						</li>
						<li class="nav-item"><a class="nav-link" id="coupon-tab" href="#coupon" data-bs-toggle="tab" 
								data-bs-target="#coupon">쿠폰함</a></li>
						<li class="nav-item"><a class="nav-link" id="event-tab" href="#event" data-bs-toggle="tab" 
								data-bs-target="#event">My이벤트</a></li>
						<li class="nav-item"><a class="nav-link" href="/hmc/cs/inqueryForm">1:1문의</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" aria-current="page" data-bs-toggle="dropdown"
							href="#" role="button" aria-expanded="false">My정보관리</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" id="usermodify-tab" href="#usermodify" data-bs-toggle="tab" 
								data-bs-target="#usermodify">회원정보변경</a></li>
								<li><a class="dropdown-item" id="pwdchange-tab" href="#pwdchange" data-bs-toggle="tab" 
								data-bs-target="#pwdchange">비밀번호변경</a></li>
								<li><a class="dropdown-item" id="userexit-tab" href="#userexit" data-bs-toggle="tab" 
								data-bs-target="#userexit">회원탈퇴</a></li>
							</ul>
					</ul>
					<div class="tab-content mt-3" id="myTabContent"> 
						<div class="tab-pane show active" id="booking" role="tabpanel"
							aria-labelledby="booking-tab">
							<%@include file ="booking.jsp"%>
						</div>
						<div class="tab-pane fade" id="payment" role="tabpanel"
							aria-labelledby="payment-tab">
							<%@include file ="gift.jsp"%>
						</div>
						<div class="tab-pane fade" id="coupon" role="tabpanel"
							aria-labelledby="coupon-tab">
							<h3>쿠폰함 화면</h3>

						</div>
						<div class="tab-pane fade" id="event" role="tabpanel"
							aria-labelledby="event-tab">
							<h3>My이벤트 화면</h3>
						</div>
						<div class="tab-pane fade" id="usermodify" role="tabpanel"
							aria-labelledby="usermodify-tab">
							<h3>회원정보변경 화면</h3>

						</div>
						<div class="tab-pane fade" id="pwdchange" role="tabpanel"
							aria-labelledby="pwdchange-tab">
							<h3>비밀번호변경 화면</h3>

						</div>
						<div class="tab-pane fade" id="userexit" role="tabpanel"
							aria-labelledby="userexit-tab">
							<h3>회원탈퇴 화면</h3>
						</div>
					</div>
				</div>
			</div>
		</main>

		<footer><%@ include file="../common/footer.jsp"%></footer>
	</div>
	 
	 <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
      crossorigin="anonymous"></script>          
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script type="text/javascript">
	$(function() {
		var ugrade = $('#user-info-table .badge').text();
		var color = changeUserGradeColor(ugrade);
		$('#user-info-table .badge:first').addClass(color);
		
		$.getJSON("rest/user/grade", function(result){
			console.log(result)
			var nextGrade = result.nextGrade;
			var remainPrice = parseInt(result.remainPrice).toLocaleString();
			var color = changeUserGradeColor(nextGrade);
			$('#user-info-table .badge:eq(1)').addClass(color);
			$('#user-info-table #remain-price').text(remainPrice);
			
		});
		
		// 각각의 탭이 화면에 표시될 때 show.bs.tab 이벤트가 발생함.
		// 각각의 탭이 화면에 표시될 때 브라우져 쿠키에 사용자정의 쿠키값을 저장함
		$("#booking-tab").on("show.bs.tab", function() {
			// 브라우저 쿠키에 step=level1 값을 저장하고, 만료시간을 1시간 후로 설정한다.
			setCookie("step", "level1", 1)		
		})
		$("#payment-tab").on("show.bs.tab", function() {
			// 브라우저 쿠키에 step=level2 값을 저장하고, 만료시간을 1시간 후로 설정한다.
			setCookie("step", "level2", 1)		
		})
		$("#coupon-tab").on("show.bs.tab", function() {
			// 브라우저 쿠키에 step=level3 값을 저장하고, 만료시간을 1시간 후로 설정한다.
			setCookie("step", "level3", 1)		
		})
		$("#event-tab").on("show.bs.tab", function() {
			// 브라우저 쿠키에 step=level4 값을 저장하고, 만료시간을 1시간 후로 설정한다.
			setCookie("step", "level4", 1)		
		})
		$("#inquery-tab").on("show.bs.tab", function() {
			// 브라우저 쿠키에 step=level5 값을 저장하고, 만료시간을 1시간 후로 설정한다.
			setCookie("step", "level5", 1)		
		})
		$("#usermodify-tab").on("show.bs.tab", function() {
			// 브라우저 쿠키에 step=level6 값을 저장하고, 만료시간을 1시간 후로 설정한다.
			setCookie("step", "level6", 1)		
		})
		$("#pwdchange-tab").on("show.bs.tab", function() {
			// 브라우저 쿠키에 step=level7 값을 저장하고, 만료시간을 1시간 후로 설정한다.
			setCookie("step", "level7", 1)		
		})
		$("#userexit-tab").on("show.bs.tab", function() {
			// 브라우저 쿠키에 step=level8 값을 저장하고, 만료시간을 1시간 후로 설정한다.
			setCookie("step", "level8", 1)		
		})

		// 브라우져 쿠키에 값을 저장한다.
		// name은 쿠키명, value는 쿠키값, days는 만료일까지의 일 수
		function setCookie(name, value, days) {
			
			var d = new Date();
			d.setTime(d.getTime() + (days*24*60*60*1000));
			var expires = "expires=" + d.toUTCString();
			// 쿠키는 name=value; expires=Thu, 18 Dec 2021 12:00:00 UTC; path=/
			document.cookie = name + "=" + value + ";" + expires + ";path=/";
		};
		
		// 브라우져 쿠키저장소에 지정된 이름의 쿠키값을 찾아서 반환한다.
		function getCookie(name) {
			name = name + "=";
			var decodedCookie = decodeURIComponent(document.cookie);
			var items = decodedCookie.split(";");
			for (var i=0; i<items.length; i++) {
				var item = items[i];
				while (item.charAt(0) == ' ') {
					item = item.substring(1);
				}
				if (item.indexOf(name) == 0) {
					return item.substring(name.length, item.length);
				}
			}
			return "";
		};
		
		// 웹 페이지 로딩시 쿠키값을 조회해서 적절한 작업을 수행하는 함수다.
		(function () {
			// 브라우져 쿠키에서 step이라는 이름으로 저장된 쿠키값을 조회한다.
			var step = getCookie("step");
			
			// 웹페이지가 로딩될 때 쿠키값을 사용해서 구현할 내용을 코딩한다.
			if (step == "" || step == "level1") {
				$("#booking-tab").trigger('click');
			} else if (step == "level2") {
				$("#payment-tab").trigger('click');
			} else if (step == "level3") {
				$("#coupon-tab").trigger('click');
			} else if (step == "level4") {
				$("#event-tab").trigger('click');
			} else if (step == "level5") {
				$("#inquery-tab").trigger('click');
			} else if (step == "level6") {
				$("#usermodify-tab").trigger('click');
			} else if (step == "level7") {
				$("#pwdchange-tab").trigger('click');
			} else if (step == "level8") {
				$("#userexit-tab").trigger('click');
			} 
		})();	
		
		function changeUserGradeColor(ugrade){
			
			var gradeColor = "bg-dark";
			if(ugrade == "BRONZE"){
				gradeColor = "bg-success";
			}else if(ugrade == "SILVER"){
				gradeColor = "bg-secondary";
			}else if(ugrade == "GOLD"){
				gradeColor = "bg-warning";
			}else if(ugrade == "PLATINUM"){
				gradeColor = "bg-primary";
			}
			return gradeColor;
		}
		
		$('#membership').on('click',function(){
			location.href = "/hmc/cs/membership";
		})
		
	})	
	</script>
</body>
</html>