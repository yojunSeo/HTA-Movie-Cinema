<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>회원정보수정-HMC</title>
</head>
<body>
	<div class="container">

		<header>
		</header>

		<main>
			<div class="row mx-auto" style="width: 200px;">
				<h4 class="mt-5 font-weight-bold">회원정보 수정</h4>
			</div>
			<div class="row mt-3">
				<div class="col-9 border p-3 bg-light">
					<form class="modify-form" action="modify" method="post">
						<h5 class="mb-5 font-weight-bold">필수 입력 정보</h5>
						<div class="row mb-3">
							<label for="id" class="col-sm-3 col-form-label">아이디</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="id" name="id"
									value="${LOGIN_USER.id }" disabled>
							</div>
						</div>
						<div class="row mb-3">
							<label for="name" class="col-sm-3 col-form-label">이름</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="name" name="name"
									value="${LOGIN_USER.name } " readonly>
							</div>
						</div>
						<div class="row mb-3">
							<label for="email" class="col-sm-3 col-form-label">이메일</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="email" name="email"
									value="${LOGIN_USER.email }">
							</div>
						</div>
						<div class="row mb-3">
							<label for="phone" class="col-sm-3 col-form-label">전화번호</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="phone" name="phone"
									value="${LOGIN_USER.phone }">
							</div>
						</div>

						<div class="mt-5 text-right">
							<button type="submit" class="btn btn-success" onclick="modify()">수정</button>
						</div>
					</form>
				</div>

			</div>
		</main>

		<footer>
		</footer>

	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

	<script>
	function modify() {
		alert("회원정보 수정이 완료되었습니다.");
		document.getElementById("modify-form").submit();
	}
	</script>
</body>
</html>