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
	$('input:checkbox[input[name="flexRadioDefault"]').is(':checked'); // 체크 여부(checked)
	function exit() {
	var check = $('input:checkbox[input[name="flexRadioDefault"]:checked').val(); // 체크된 값(checked value)
		if (check == false) {
			alert("유의사항을 확인 후 동의하셔야 탈퇴가 가능합니다.")
		} else{
			alert("회원탈퇴가 완료되었습니다.");
			
		}
	}
	$(function(){
		$("#userexit-form-form").submit(function(){
			
			var agree = $("#agree:radio:checked").length;
			if(agree == 0){
				alert("유의사항을 확인 후 동의하셔야 탈퇴가 가능합니다.");
				$("#agree").focus();
				return false;
			}	
			return true;
		});
	})
	</script>
</body>
</html>