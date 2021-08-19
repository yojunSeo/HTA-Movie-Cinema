<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>아이디/비밀번호 찾기-HMC</title>
</head>
<body>
	<div class="container">

		<header>
			<%@ include file="../common/header.jsp" %>
		</header>

		<main>
			<div class="row mb-3">
               <p class="mt-5 fw-normal fs-4"></p>
            </div>
            <div class="row">
            	<p class="fw-bold">아이디/비밀번호 찾기 결과</p>
            </div>
            <div class="row mb-4">
            	<div class="col-12 border-bottom border-2 border-dark"></div>
            </div>
            <div class="row my-3">
            	<p class="fw-bold text-danger fs-3">${error.title }</p>
            	<p class="fw-bold text-danger fs-3">${error.message }</p>
            </div>
            <div class="row">
            	<div class="col-12 border-bottom border-2 border-dark"></div>
            </div>
            <div class="row my-5">
            	<div class="col-2">
            		<a href="../login/" class="btn btn-danger w-100 text-light">확인</a>
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