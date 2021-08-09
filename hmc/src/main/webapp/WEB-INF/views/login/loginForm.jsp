<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>페이지이름-HMC</title>
</head>
<body>
	<div class="container">

		<header>
			<%@ include file="../common/header.jsp" %>
		</header>

		<main>
			<div class="row mt-5" style="background-color: #F5F5F5;">
				<div class="col-6">
					<div class="row mt-5">
						<p class="fw-bold">L.POINT, 롯데시네마 ID로 별도의 회원가입 없이 이용 가능합니다.</p>
					</div>
					<c:if test="${param.error eq 'deny' }">
					<div class="row">
						<div class="col">
							<div class="alert alert-danger" role="alert">
								요청한 서비스는 로그인 후 사용가능합니다.
							</div>
						</div>
					</div>
					</c:if>
					<c:if test="${not empty error }">
					<div class="row">
						<div class="col">
							<div class="alert alert-danger">
								<strong>${error.title }</strong> ${error.message }
							</div>
						</div>
					</div>
					</c:if>
					<div class="row mt-2 mb-5">
						<form method="post" action="../login/">
							<div class="row">
								<div class="col-9">
									<div class="row mb-2">
										<div class="col-12">
											<input type="text" class="form-control bg-light" name="id" placeholder="아이디를 입력해 주세요.">
										</div>
									</div>
									<div class="row">
										<div class="col-12">
											<input type="password" class="form-control bg-light" name="password" placeholder="비밀번호를 입력해 주세요.">
										</div>
									</div>
								</div>
								<div class="col-3">
									<button class="btn btn-danger w-100 h-100">로그인</button>
								</div>
							</div>
						</form>	
					</div>
					<div class="row">
						<div class="col-12">
							<div class="d-flex justify-content-between mb-2">
								<div class="text-secondary">- 아직 HMC회원이 아니신가요?</div>
								<div class="w-25">
									<a href="../register/" class="btn btn-danger btn-sm w-100 text-light">회원가입</a>
								</div>
							</div>
							<div class="d-flex justify-content-between mb-2">
								<div class="text-secondary">- 아이디를 잊으셨나요?</div>
								<div class="w-25">
									<a href="findId" class="btn btn-danger btn-sm w-100 text-light">아이디 찾기</a>
								</div>
							</div>
							<div class="d-flex justify-content-between mb-2">
								<div class="text-secondary">- 비밀번호를 잊으셨나요?</div>
								<div class="w-25">
									<a href="findPwd" class="btn btn-danger btn-sm w-100 text-light">비밀번호 찾기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-6 my-5">
					<img src="../resources/images/login/loginAD.jpg" width=600 height="300"/>
				</div>
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
	
});
	
</script>
</body>
</html>