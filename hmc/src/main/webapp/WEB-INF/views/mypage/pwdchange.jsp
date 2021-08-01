<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>비밀번호변경-HMC</title>
</head>
<body>
	<div class="container">

		<header>
		</header>

		<main>
			<div class="row mx-auto" style="width: 200px;">
				<h4 class="mt-5 font-weight-bold">비밀번호 변경</h4>
			</div>
			<div class="row mt-3">
				<div class="col-9 border p-3 bg-light">
					<form id="change-form" action="change" method="post">
						<div class="row mb-3">
							<label for="id" class="col-sm-3 col-form-label">새 비밀번호 입력</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" id="new-pwd"
									name="newPwd">
							</div>
						</div>
						<div class="row mb-3">
							<label for="name" class="col-sm-3 col-form-label">비밀번호 확인</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" id="new-pwd-confirm"
									name="newPwdConfirm ">
							</div>
						</div>
					</form>
					<div class="mt-5 text-right">
						<button type="submit" class="btn btn-success"
							onclick="checkForm()">수정</button>
					</div>
				</div>
			</div>
		</main>

		<footer>
		</footer>

	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

	<script>
	function checkForm() {
		var passwordEl = document.getElementById("new-pwd");
		if (!passwordEl.value.trim()) {	
			alert("비밀번호는 필수입력값입니다.");
			passwordEl.focus();
			return;
		}
		if (passwordEl.value.trim().length < 6) {
			alert("비밀번호는 6글자 이상 입력해야합니다.")
			passwordEl.focus();
			return;
		}
		var passwordConfirmEl = document.getElementById("new-pwd-confirm");
		if (passwordEl.value != passwordConfirmEl.value) {
			alert("비밀번호가 서로 일치하지 않습니다.")
			passwordConfirmEl.value="";
			passwordConfirmEl.focus();
			return;
		}
		alert("비밀번호 변경이 완료되었습니다.");
		document.getElementById("change-form").submit();
	}	
	</script>
</body>
</html>