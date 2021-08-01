<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>회원탈퇴-HMC</title>
</head>
<body>
	<div class="container">

		<header>
		</header>

		<main>
			<div class="row mx-auto" style="width: 200px;">
				<h4 class="mt-5 font-weight-bold">회원탈퇴</h4>
				<h4>회원탈퇴 전 유의사항을 확인해 주세요.</h4>
			</div>
			<div>
				<h5 class="mt-5 font-weight-bold">유의사항</h5>
				<hr style="border: solid 1px gray;">
				<p>- 탈퇴 시, 사용하시던 포인트 및 쿠폰 등은 복원할 수 없습니다.</p>
				<p>- 탈퇴 즉시 개인정보가 삭제되면, 어떠한 방법으로도 복원할 수 없습니다. 
					(전자상거래 서비스 등의 거래내역은 전자상거래 등에서의 소비자보호에 관한 법률에 의거하여 보호됩니다.)</p>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="flexRadioDefault"
					id="flexRadioDefault1"> <label class="form-check-label"
					for="flexRadioDefault1"> 위 유의사항을 모두 확인하였고 회원탈퇴에 동의합니다. </label>
			</div>
		</main>

		<footer>
		</footer>

	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

	<script>
	function exit() {
		alert("회원탈퇴가 완료되었습니다.");
		document.getElementById("modify-form").submit();
	}
	</script>
</body>
</html>