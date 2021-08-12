<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<div class="container">

		<header>
			<%@ include file="../common/header.jsp" %>
		</header>

		<main>
            <div class="row">
            	<p class="fw-bold fs-5">쿠폰</p>
            </div>
            <div class="row">
            	<div class="col-12 border-bottom border-2 border-dark">
            	</div>
            </div>
            <div class="row">
	            <form action="form" method="post" id="register-form">
					<table class="table">
						<tbody>
							<tr>
								<th class="fw-lighter">이름</th>
								<td>
									<input type="text" class="form-control w-50 bg-light" name="name" id="name" placeholder="이름을 입력하세요.">
								</td>
							</tr>
							<tr>
								<th class="fw-lighter">쿠폰종류</th>
								<td>
									<input type="type" class="form-control w-50 bg-light" name="type" id="type" placeholder="쿠폰종류를 입력하세요.">
								</td>
							</tr>
						</tbody>
					</table>
		            <div class="row my-3 text-center my-5">
						<div class="col-12">
							<a href="../home" class="btn btn-dark btn-lg w-25 text-light">취소</a>
							<button type="submit" id="btn-save" class="btn btn-danger btn-lg w-25 text-light" disabled="disabled">등록</button>
						</div>
					</div>
				</form>
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