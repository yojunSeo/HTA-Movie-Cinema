<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>아이디 찾기-HMC</title>
</head>
<body>
	<div class="container">

		<header>
			<%@ include file="../common/header.jsp" %>
		</header>

		<main>
			<div class="row mb-3">
               <p class="mt-5 fw-normal fs-4">아이디 찾기</p>
            </div>
            <div class="row mb-5">
               <p class="fw-normal fs-3">등록된 회원정보로 아이디를 찾으실 수 있습니다.</p>
            </div>
            <div class="row">
            	<p class="fw-bold">회원정보입력</p>
            </div>
            <div class="row">
            	<div class="col-12 border-bottom border-2 border-dark"></div>
            </div>
            <div class="row">
            	<div class="col-6">
	            	<form action="findId" method="post" id="findIn-form">
	            		<div class="row mt-4">
		            		<div class="col-2">
		            			<div class="row mb-2"><p class="fw-lighter">이름</p></div>
		            			<div class="row"><p class="fw-lighter">이메일</p></div>
		            		</div>
		            		<div class="col-8">
		            			<div class="row">
		            				<input type="text" class="form-control w-100 mb-2 bg-light" name="name" placeholder="이름을 입력하세요.">
		            			</div>
		            			<div class="row">
		            				<input type="text" class="form-control w-100 bg-light" name="email" placeholder="이메일을 입력하세요.">
		            			</div>
		            		</div>
		            		<div class="col-2">
		            			<button class="btn btn-danger w-100 h-100">찾기</button>
		            		</div>
	            		</div>
	            	</form>
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
		
	</script>
</body>
</html>