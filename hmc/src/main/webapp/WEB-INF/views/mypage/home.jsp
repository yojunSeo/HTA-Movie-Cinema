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
}

.box2 {
	margin-top: 100px;
	margin-left: 335px;
	width: 1280px;
	height: 400px;
	padding: 20px;
	background-color: #FFFFFF;
	background-position: center;
	background-size: cover;
	backgroudd-repeat: no-repeat;
/* 	border: 3px solid black; */
}

.nav-link {
	color: #000000;
	background-color: #000000;
	border-bottom: 3px solid #FF243E;
}
.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
    border: none;
    outline: none;
}

</style>  
<body>
	<div class="container">
	<header><%@ include file="../common/header.jsp"%></header>
		<main>
			<div class="box row mb-5">
				<div class="box1">
					<div class="box2 col-9 rounded-3">
						<table>
							<tr style="vertical-align: top">
								<td style="width: 750px; height:350px; border-right: 1px solid lightgray; padding-right: 12px; text-align: justify">
									멤버십 등급${saveduser.grade }
									<div class="mt-2" style="font-size: 25px;">
										<strong>회원${saveduser.name }</strong>님 반가워요!
									</div>
									<div class="mt-5">
										${saveduser.name }회원님의 잔여포인트는 ${saveduser.point }점입니다.
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
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle active" aria-current="page" data-bs-toggle="dropdown"
							href="#payment" role="button" aria-expanded="false">결제내역</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">예매내역</a></li>
								<li><a class="dropdown-item" href="#">구매/선물내역</a></li>
							</ul>
						</li>
						<li class="nav-item"><a class="nav-link" href="#coupon">쿠폰함</a></li>
						<li class="nav-item"><a class="nav-link" href="#event">My이벤트</a></li>
						<li class="nav-item"><a class="nav-link" href="#inquery">1:1문의</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle active" aria-current="page" data-bs-toggle="dropdown"
							href="#myinfo" role="button" aria-expanded="false">My정보관리</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">회원정보변경</a></li>
								<li><a class="dropdown-item" href="#">비밀번호변경</a></li>
								<li><a class="dropdown-item" href="#">회원탈퇴</a></li>
							</ul>
					</ul>
					<div class="tab-content mt-3" id="myTabContent"> 
						<div class="tab-pane fade" id="payment" role="tabpanel"
							aria-labelledby="payment-tab">
							<h3>결제내역 화면</h3>

						</div>
						<div class="tab-pane fade" id="coupon" role="tabpanel"
							aria-labelledby="coupon-tab">
							<h3>쿠폰함 화면</h3>

						</div>
						<div class="tab-pane fade" id="event" role="tabpanel"
							aria-labelledby="event-tab">
							<h3>My이벤트 화면</h3>

						</div>
						<div class="tab-pane fade" id="inquery" role="tabpanel"
							aria-labelledby="inquery-tab">
							<h3>1:1문의 화면</h3>

						</div>
						<div class="tab-pane fade" id="myinfo" role="tabpanel"
							aria-labelledby="myinfo-tab">
							<h3>My정보관리</h3>

						</div>
					</div>
				</div>
			</div>
<!-- 			<div class="row mb-3"> -->
<!-- 				<div class="col" style="margin-top: 120px;"> -->
<!-- 					<ul class="nav nav-tabs nav-justified" id="myTab" role="tablist"> -->
<!-- 						<li class="nav-item active" role="presentation"> -->
<!-- 							<button class="nav-link" id="payment-tab" data-bs-toggle="tab" -->
<!-- 								data-bs-target="#payment" type="button" role="tab" -->
<!-- 								aria-controls="payment" aria-selected="false">결제내역</button> -->
							
<!-- 						</li> -->
<!-- 						<li class="nav-item" role="presentation"> -->
<!-- 							<button class="nav-link" id="coupon-tab" data-bs-toggle="tab" -->
<!-- 								data-bs-target="#coupon" type="button" role="tab" -->
<!-- 								aria-controls="coupon" aria-selected="false">쿠폰함</button> -->
<!-- 						</li> -->
<!-- 						<li class="nav-item" role="presentation"> -->
<!-- 							<button class="nav-link" id="event-tab" data-bs-toggle="tab" -->
<!-- 								data-bs-target="#event" type="button" role="tab" -->
<!-- 								aria-controls="event" aria-selected="false">My이벤트</button> -->
<!-- 						</li> -->
<!-- 						<li class="nav-item" role="presentation"> -->
<!-- 							<button class="nav-link" id="inquery-tab" data-bs-toggle="tab" -->
<!-- 								data-bs-target="#inquery" type="button" role="tab" -->
<!-- 								aria-controls="inquery" aria-selected="false">1:1문의</button> -->
<!-- 						</li> -->
<!-- 						<li class="nav-item" role="presentation"> -->
<!-- 							<button class="nav-link" id="myinfo-tab" data-bs-toggle="tab" -->
<!-- 								data-bs-target="#myinfo" type="button" role="tab" -->
<!-- 								aria-controls="myinfo" aria-selected="false">My정보관리</button> -->
<!-- 						</li> -->
<!-- 					</ul> -->
<!-- 					<div class="tab-content mt-3" id="myTabContent"> -->
<!-- 						<div class="tab-pane fade" id="payment" role="tabpanel" -->
<!-- 							aria-labelledby="payment-tab"> -->
<!-- 							<h3>결제내역 화면</h3> -->

<!-- 						</div> -->
<!-- 						<div class="tab-pane fade" id="coupon" role="tabpanel" -->
<!-- 							aria-labelledby="coupon-tab"> -->
<!-- 							<h3>쿠폰함 화면</h3> -->

<!-- 						</div> -->
<!-- 						<div class="tab-pane fade" id="event" role="tabpanel" -->
<!-- 							aria-labelledby="event-tab"> -->
<!-- 							<h3>My이벤트 화면</h3> -->

<!-- 						</div> -->
<!-- 						<div class="tab-pane fade" id="inquery" role="tabpanel" -->
<!-- 							aria-labelledby="inquery-tab"> -->
<!-- 							<h3>1:1문의 화면</h3> -->

<!-- 						</div> -->
<!-- 						<div class="tab-pane fade" id="myinfo" role="tabpanel" -->
<!-- 							aria-labelledby="myinfo-tab"> -->
<!-- 							<h3>My정보관리</h3> -->

<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->

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
		
		// 각각의 탭이 화면에 표시될 때 show.bs.tab 이벤트가 발생함.
		// 각각의 탭이 화면에 표시될 때 브라우져 쿠키에 사용자정의 쿠키값을 저장함
		$("#payment-tab").on("show.bs.tab", function() {
			// 브라우저 쿠키에 step=level1 값을 저장하고, 만료시간을 1시간 후로 설정한다.
			setCookie("step", "level1", 1)		
		})
		$("#coupon-tab").on("show.bs.tab", function() {
			// 브라우저 쿠키에 step=level2 값을 저장하고, 만료시간을 1시간 후로 설정한다.
			setCookie("step", "level2", 1)		
		})
		$("#event-tab").on("show.bs.tab", function() {
			// 브라우저 쿠키에 step=level3 값을 저장하고, 만료시간을 1시간 후로 설정한다.
			setCookie("step", "level3", 1)		
		})
		$("#inquery-tab").on("show.bs.tab", function() {
			// 브라우저 쿠키에 step=level3 값을 저장하고, 만료시간을 1시간 후로 설정한다.
			setCookie("step", "level3", 1)		
		})
		$("#myinfo-tab").on("show.bs.tab", function() {
			// 브라우저 쿠키에 step=level3 값을 저장하고, 만료시간을 1시간 후로 설정한다.
			setCookie("step", "level3", 1)		
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
				$("#home-tab").trigger('click');
			} else if (step == "level2") {
				$("#profile-tab").trigger('click');
			} else if (step == "level3") {
				$("#contact-tab").trigger('click');
			}
		})();	
	})	
	</script>
</body>
</html>