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
		</header>

		<main>
			<div class="row mb-3">
               <p class="mt-5 fw-normal fs-4">고객센터</p>
            </div>
            <div class="row mb-2">
            	<div class="col-12 border-bottom border-1 border-secondary">
            	</div>
            </div>
            <div class="row offset-2">
            	<div class="col-4">
            		<a href="../cs/home" class="btn">공지사항</a>
            	</div>
            	<div class="col-4">
            		<a href="../cs/inqueryForm" class="btn">1:1문의</a>
            	</div>
            	<div class="col-4">
            		<a href="../cs/membership" class="btn fw-bold text-danger">멤버십</a>
            	</div>
            </div>
            <div class="row my-2">
            	<div class="col-12 border-bottom border-1 border-dark">
            	</div>
            </div>
            <div class="row my-3">
				<img src="../resources/images/membership/membership.PNG" width=600 height="250"/>
			</div>
			<div class="row mt-3 rounded">
				<div class="col-5 mx-5 my-3">
					<div class="row offset-4">
						<p><span class="fw-bold">${LOGINED_USER.name }</span>님은 <span class="badge rounded-pill bg-warning"> ${LOGINED_USER.grade }</span> 등급입니다.</p>
					</div>
					<div class="row">
					</div>
					<div class="row">
					</div>
				</div>
			</div>
			<div class="row my-3">
				<h4>Friends 혜택</h4>
			</div>
			<div class="row">
				<div class="col-4 border" style="background-color: #FFFCEF">
					<div class="col-4 text-center my-2 mx-1">
						<p class="badge rounded-pill bg-warning">Lv.1</p>
					</div>
					<div class="col-7 my-2 mx-1">
						<p>직전 분기 2만원 이상 이용</p>
						<p>영화 4천원 할인권 x 1매</p>
					</div>
				</div>
				<div class="col-4 border" style="background-color: #FFFCEF">
					<div class="col-4 text-center my-2 mx-1">
						<p class="badge rounded-pill bg-warning">Lv.1</p>
					</div>
					<div class="col-7 my-2 mx-1">
						<p>직전 분기 2만원 이상 이용</p>
						<p>영화 4천원 할인권 x 1매</p>
					</div>
				</div>
				<div class="col-4 border" style="background-color: #FFFCEF">
					<div class="col-4 text-center my-2 mx-1">
						<p class="badge rounded-pill bg-warning">Lv.1</p>
					</div>
					<div class="col-7 my-2 mx-1">
						<p>직전 분기 2만원 이상 이용</p>
						<p>영화 4천원 할인권 x 1매</p>
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
		
	</script>
</body>
</html>