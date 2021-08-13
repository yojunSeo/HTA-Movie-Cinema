<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>회원탈퇴-HMC</title>
<style type="text/css">
input[type='radio']:checked {
  background-color: #FF243E;
  border-color:#FF243E;
}
hr {
	width : 1280px;
}
</style>
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
span.large{
        font-size: 18px;
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
			<div class="row">
				<h3 class="mt-5 font-weight-bold">회원탈퇴</h3>
				<h4 class="mb-3">회원탈퇴 전 유의사항을 확인해 주세요.</h4>
				
			</div>
			<div>
				<form action="userexit" method="post" id="userexit-form">
					<div>
						<h5 class="mt-3">유의사항</h5>
						<hr style="border: solid 1px gray;">
						<p>- 탈퇴 시, 사용하시던 포인트 및 쿠폰 등은 복원할 수 없습니다.</p>
						<p>- 탈퇴 즉시 개인정보가 삭제되면, 어떠한 방법으로도 복원할 수 없습니다. (전자상거래 서비스 등의
							거래내역은 전자상거래 등에서의 소비자보호에 관한 법률에 의거하여 보호됩니다.)</p>
						<p></p>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio"
							name="flexRadioDefault" id="flexRadioDefault"> <label
							class="form-check-label" for="flexRadioDefault1"> 위 유의사항을
							모두 확인하였고 회원탈퇴에 동의합니다. </label>
					</div>
					<div class="mt-5 d-md-flex justify-content-md-end">
						<button type="submit" class="btn"
							style="background-color: #FF243E; color: #FFFFFF;"
							onclick="exit()">탈퇴</button>
					</div>
				</form>
			</div>
		</main>

		<footer>
		</footer>

	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

	<script>
	
$(function(){
	
})
	</script>
</body>
</html>