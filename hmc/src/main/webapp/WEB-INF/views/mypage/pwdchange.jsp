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
		<main>
			<div class="row">
				<h3 class="mt-5 mb-3 font-weight-bold">비밀번호 변경</h3>
				
			</div>
			<div class="row mx-auto mt-3">
				<div class="col">
					<form id="change-form" action="change" method="post">
						<div class="row mb-3">
							<label for="id" class="col-sm-3 col-form-label">새 비밀번호 입력</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" id="new-pwd"
									name="newPwd">
								<p>8~15자리를 사용해야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.</p>
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
					<div class="mt-5 d-md-flex justify-content-md-end">
						<button type="submit" class="btn" style="background-color: #FF243E; color:#FFFFFF;"
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
		var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,15}$/;
		var pw = $("new-pwd").val();
		if(false === reg.test(pw)) {
			alert('비밀번호는 8~15자리를 사용해야하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
			$("new-pwd").focus();
			return false;
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