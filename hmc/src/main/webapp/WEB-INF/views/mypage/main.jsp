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
span.large{
        font-size: 18px;

      }
.box {
	width: 100vw;
	margin-left: calc(-50vw + 50%);
	
}
.box1 {
	background-color: #FF243E;
	width: 100vw;
	margin-left: calc(-50vw + 50%);
	height: 350px;	
}

.box2 {
	margin-top: 100px;

	width: 1280px;
	height: 400px;
	padding: 20px;
	background-color: #FFFFFF;
	background-position: center;
	background-size: cover;
	backgroudd-repeat: no-repeat;
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
		<main>
			<div class="box row mb-5 ">
				<div class="box1">
					<div class="box2 col-9 rounded-3 border border-2 offset-2">
						<table id="user-info-table">
							<tr style="vertical-align: top">
								<td style="width: 750px; height:350px; border-right: 1px solid lightgray; padding-right: 12px; text-align: justify">
									<span class="large badge rounded-pill">${LOGINED_USER.grade }</span>
									<div class="my-4" style="font-size: 25px;">
										<strong>${LOGINED_USER.name }</strong>님 반가워요!
									</div>
									<div class="text-center my-3" id="user-point-grade">
										<p class="fs-5 mt-3">현재 보유 포인트는 <strong><fmt:formatNumber>${LOGINED_USER.point }</fmt:formatNumber></strong> 점 입니다.</p>
										<p class="fs-5 mt-3"><span class="large badge rounded-pill"></span> 등급까지 <strong id="remain-price">40,000원</strong> 원 남았어요!</p>
										<p class="my-5"></p>
										<p class="my-5"></p>
										<p id="membership"><span class="large badge rounded-pill text-white m-3 p-2" style="background-color: #FF243E">Membership 페이지 가기</span></p>
									</div>
									</td>
								<td style="width: 550px; height:350px; padding-left: 20px" class="fs-6 fw-bold">
									<p>My영화관 <span id="mymovie-modify" class="badge bg-dark rounded-pill float-end">수정</span></p>
									<div id="mybranch-btn" class="my-2 offset-2">
									</div>
									<img class="mx-5 mt-4" src="../resources/images/mypage/mymovie.jpg" width="450" height="200">
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col" style="margin-top: 120px;">
					<ul class="nav nav-tabs nav-justified" id="nav-bar">
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
							href="#" role="button" aria-expanded="false">결제내역</a>
							<ul class="dropdown-menu" id="payment-dropdown">
								<li><a class="dropdown-item" href="booking">예매내역</a></li>
								<li><a class="dropdown-item" href="payment">구매/선물내역</a></li>
							</ul>
						</li>
						<li class="nav-item"><a class="nav-link" href="coupon">쿠폰함</a></li>
						<li class="nav-item"><a class="nav-link" href="event">My이벤트</a></li>
						<li class="nav-item"><a class="nav-link" href="/hmc/cs/myInqueryList">1:1문의</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" aria-current="page" data-bs-toggle="dropdown" 
							href="#" role="button" aria-expanded="false">My정보관리</a>
							<ul class="dropdown-menu" id="user-dropdown">
								<li><a class="dropdown-item" href="checkUser">회원정보변경</a></li>
								<li><a class="dropdown-item" href="changePwd">비밀번호변경</a></li>
								<li><a class="dropdown-item" href="withdrawal">회원탈퇴</a></li>
							</ul>
					</ul>
				</div>
			</div>
			<!-- my영화관 모달 -->
			<div class="modal fade" id="branch-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">MY영화관 설정</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p class="text-center"><small>* 첫번째 등록된 영화관이 대표 선호 영화관으로 설정됩니다.</br>
							회원님께서 자주 방문하는 영화관을 <strong>MY 영화관</strong>으로 등록해주시면</br>
							등록하신 영화관에서 제공하는 다양한 맞춤 정보를 제공 받으실 수 있습니다.</small></p>
						<div id="mybranch-zone" class="offset-3"></div>
						<div class="border mt-4"></div>
						<div id="branch-zone" class="mt-4 offset-1"></div>
					</div>
					<div class="modal-footer row mt-5 mb-3 text-center my-5 border-0">
                  		<div class="col-12">
							<button type="button" class="btn btn-outline-dark" style="width: 230px; height: 50px" data-bs-dismiss="modal">취소</button>
							<button type="button" class="btn btn-dark text-white" style="width: 230px; height: 50px" id="mybranch-submit">완료</button>
                  		</div>
              		</div>
				</div>
				</div>
			</div>
		</main>

	</div>
	 
	 <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
      crossorigin="anonymous"></script>          
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script type="text/javascript">
	$(function() {
		
			function changeMyBranchs(){
				$.getJSON("rest/user/branchs", function(branchs){
						console.log(branchs)
					$('#mybranch-btn').empty();
					$('#mybranch-zone').empty();
					var $btn1 = "";
					var $btn2 = "";
					$.each(branchs, function(index, branch){
						if(branch){
							// null이 아니면
							$btn1 += "<button class='btn btn-outline-dark mx-2 fw-bold' style='width: 100px; height: 50px' id="+branch.code+">"+branch.name+"</button>"
							if(index == 0){
								$btn2 += "<button class='btn btn-outline-dark mx-2 fw-bold' style='width: 120px; height: 60px' id="+branch.code+">1st</br><span>"+branch.name+"</span></button>"
							}else if(index == 1){
								$btn2 += "<button class='btn btn-outline-dark mx-2 fw-bold' style='width: 120px; height: 60px' id="+branch.code+">2nd</br><span>"+branch.name+"</span></button>"
							}else if(index == 2){
								$btn2 += "<button class='btn btn-outline-dark mx-2 fw-bold' style='width: 120px; height: 60px' id="+branch.code+">3rd</br><span>"+branch.name+"</span></button>"
							}
						}else{
							// null 이면
							if(index == 0){
								$btn1 += "<button class='btn btn-outline-dark mx-2 fw-bold' style='width: 100px; height: 50px' disabled>1st</button>"
								$btn2 += "<button class='btn btn-outline-dark mx-2 fw-bold' style='width: 120px; height: 60px' disabled>1st</br><span>+</span></button>"
							}else if(index == 1){
								$btn1 += "<button class='btn btn-outline-dark mx-2 fw-bold' style='width: 100px; height: 50px' disabled>2nd</button>"
								$btn2 += "<button class='btn btn-outline-dark mx-2 fw-bold' style='width: 120px; height: 60px' disabled>2nd</br><span>+</span></button>"
							}else if(index == 2){
								$btn1 += "<button class='btn btn-outline-dark mx-2 fw-bold' style='width: 100px; height: 50px' disabled>3rd</button>"
								$btn2 += "<button class='btn btn-outline-dark mx-2 fw-bold' style='width: 120px; height: 60px' disabled>3rd</br><span>+</span></button>"
							}
						}
					});
					$('#mybranch-btn').append($btn1);
					$('#mybranch-zone').append($btn2);
				})
			}
			changeMyBranchs();
		
		var ugrade = $('#user-info-table .badge:first').text();
		var color = changeUserGradeColor(ugrade);
		$('#user-info-table .badge:first').addClass(color);
		
		$.getJSON("rest/user/grade", function(result){
			var nextGrade = result.nextGrade;
			var remainPrice = parseInt(result.remainPrice).toLocaleString();
			var color = changeUserGradeColor(nextGrade);
			if(remainPrice == 0 && nextGrade == "PLATINUM" ){
				$('#user-point-grade p:eq(1)').html("<strong>이미 최고의 등급이에요!</strong>");
			}else{
				$('#user-info-table .badge:eq(1)').addClass(color);
				$('#user-info-table .badge:eq(1)').text(nextGrade);
				$('#user-info-table #remain-price').text(remainPrice);
			}
		});
		
		// active 상태
		$('#nav-bar .dropdown-item').on('click', function(){
			$('#nav-bar .dropdown-item').removeClass('active');
			$(this).addClass('active');
		})

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
		
		// my영화관 클릭시 그 영화관의 타임테이블로
		$('#mybranch-btn').on('click', '.btn', function(){
			// 있을때만 실행됨
			if($(this).attr('id')){
				var branchCode = $(this).attr('id');
				location.href = "../branch/timetable?code="+branchCode;
			}
		})
		
		var branchModal = new bootstrap.Modal(document.getElementById("branch-modal"), {
			keyboard: false
		});
		
		// my영화관 모달띄우기
		$('#mymovie-modify').on('click',function(){
			changeMyBranchs();
			$.getJSON("rest/mybranchs", function(result){
				$('#branch-zone').empty();
				var branchs = result.branchs;
				var myBranchs = result.myBranchs;
				var $btns = "";
				$.each(branchs, function(index, branch){
					var isMyBranch = "N";
					$.each(myBranchs, function(index, mybranch){
						if(mybranch != null){
							if(branch.code == mybranch.code){
								isMyBranch = "Y";
								return;
							}
						}
					})
					if(isMyBranch == 'Y'){
						$btns += "<button class='btn btn-outline-dark mx-2 my-2 fw-bold text-danger' style='width: 300px; height: 50px' id="+branch.code+">"+branch.name+"</button>";
					}else{
						$btns += "<button class='btn btn-outline-dark mx-2 my-2 fw-bold' style='width: 300px; height: 50px' id="+branch.code+">"+branch.name+"</button>";
					}
				});
				$('#branch-zone').append($btns);
			})
			branchModal.show();
		});
		
		// my영화관존에서 클릭하면 -> 삭제
		$('#mybranch-zone').on('click', '.btn', function(){
			var branchCode = $(this).attr('id');
			$(this).find('span').text('+');
			$(this).removeAttr('id');
			$(this).prop('disabled', true);
			$("#branch-zone #"+branchCode+"").removeClass('text-danger');
		})
		
		// branch존에서 빨간거 클릭하면 -> 삭제 
		// 검정클릭하면 -> 등록
		$('#branch-zone').on('click', '.btn', function(){
			var branchCode = $(this).attr('id');
			if($(this).hasClass('text-danger')){
				$(this).removeClass('text-danger');
				$("#mybranch-zone #"+branchCode+"").find('span').text('+');
				$("#mybranch-zone #"+branchCode+"").prop('disabled', true);
				$("#mybranch-zone #"+branchCode+"").removeAttr('id');
			}else{
				// 등록
				var branchName = $(this).text();
				// 비어있는 버튼에다가 등록
				if(!$('#mybranch-zone .btn:eq(0)').attr('id')){
					$(this).addClass('text-danger');
					$('#mybranch-zone .btn:eq(0)').attr('id', branchCode);
					$('#mybranch-zone .btn:eq(0)').find('span').text(branchName);
					$('#mybranch-zone .btn:eq(0)').prop('disabled', false);
					return;
				}
				if(!$('#mybranch-zone .btn:eq(1)').attr('id')){
					$(this).addClass('text-danger');
					$('#mybranch-zone .btn:eq(1)').attr('id', branchCode);
					$('#mybranch-zone .btn:eq(1)').find('span').text(branchName);
					$('#mybranch-zone .btn:eq(1)').prop('disabled', false);
					return;
				}
				if(!$('#mybranch-zone .btn:eq(2)').attr('id')){
					$(this).addClass('text-danger');
					$('#mybranch-zone .btn:eq(2)').attr('id', branchCode);
					$('#mybranch-zone .btn:eq(2)').find('span').text(branchName);
					$('#mybranch-zone .btn:eq(2)').prop('disabled', false);
					return;
				}
				alert('MY영화관은 최대 3개까지 등록 가능합니다.');
			}
		});
		
		// my영화관 제출할때
		$('#mybranch-submit').on('click',function(){
			var branch1 = $('#mybranch-zone .btn:eq(0)').attr('id');
			var branch2 = $('#mybranch-zone .btn:eq(1)').attr('id');
			var branch3 = $('#mybranch-zone .btn:eq(2)').attr('id');
			console.log(branch1)
			console.log(branch2)
			console.log(branch3)
			$.ajax({
				type:"GET",
				url:"rest/mybranchs/update",
				data:{branch1:branch1,branch2:branch2,branch3:branch3},
				dataType:"json",
				complete: function() {
					branchModal.hide();
				}
			})
			alert('MY영화관이 수정되었습니다.');
			location.href = "home";
		})
		
	})	
	</script>
</body>
</html>