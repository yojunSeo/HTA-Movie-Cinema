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
<style type = "text/css">
html, body {
	width: 100%;
	height: 100%;
}

.box {
	background-color: #FF243E;
	width: 100vw;
	margin-left: calc(-50vw + 50%);
	height: 350px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.box2 {
	margin-top: 100px;
	margin-left: 220px;
	width: 1280px;
	height: 400px;
	padding: 20px;
	background-color: #FFFFFF;
	background-position: center;
	background-size: cover;
	backgroudd-repeat: no-repeat;
/* 	border: 3px solid black; */
}

.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
    border: none;
    outline: none;
    color: #000000;
    backgrone-color: #FFFFFF;
}
span.large{
        font-size: 18px;
      }

.nav-tabs, .nav-item .nav-link {
	border: none;
	outline: none;
}
.nav-link, .nav-link:hover {
	color: #000000;
}
.nav-link.active {
	font-weight : bold;
}
.dropdown-item, .dropdown-item:hover {
	color: #000000;
	border: none;
	outline: none;
	background-color: #FFFFFF;
}
.dropdown-item.active {
	font-weight : bold;
	color: #000000;
	background-color: #FFFFFF;
}
</style>  
<body>
	<div class="container">
		<main>
			<div class="row">
				<h3 class="mt-5 mb-3 font-weight-bold">회원정보 변경</h3>
				
			</div>
			<div class="row">
				<div class="col">
					<form class="modify-form" action="modify" method="post">
						<h5 class="mb-5 font-weight-bold"></h5>
						<div class="row mb-3">
							<label for="id" class="col-sm-3 col-form-label">아이디</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="id" name="id"
									value="${LOGINED_USER.id }" disabled>
							</div>
						</div>
						<div class="row mb-3">
							<label for="name" class="col-sm-3 col-form-label">이름</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="name" name="name"
									value="${LOGINED_USER.name } " readonly>
							</div>
						</div>
						<div class="row mb-3">
							<label for="name" class="col-sm-3 col-form-label">성별</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="gender" name="gender"
									value="${LOGINED_USER.gender } " readonly>
							</div>
						</div>
						<div class="row mb-3">
							<label for="email" class="col-sm-3 col-form-label">이메일</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="email" name="email"
									value="${LOGINED_USER.email }">
							</div>
						</div>
						<div class="row mb-3">
							<label for="phone" class="col-sm-3 col-form-label">전화번호</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="phone" name="phone"
									value="${LOGINED_USER.phone }">
							</div>
						</div>

						<div class="mt-5 d-md-flex justify-content-md-end">
							<button type="submit" class="btn" style="background-color: #FF243E; color:#FFFFFF;" onclick="modify()">수정</button>
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