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
               <p class="mt-5 fw-normal fs-4">회원가입</p>
            </div>
            <div class="row mb-5">
               <p class="fw-normal fs-3">짠! 벌써 마지막 단계에요!</p>
            </div>
            <div class="row">
            	<p class="fw-bold fs-5">회원정보입력</p>
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
								<th class="fw-lighter">아이디</th>
								<td>
								<div class="row">
									<div class="col-6">
										<input type="text" class="form-control bg-light" name="id" id="confirmId" placeholder="아이디를 입력하세요.">
										<p class="text-danger" id="confirmIdResult"></p>
									</div>
									<div class="col-6">
										<button type="button" class="btn btn-danger" id="btn-post-id">중복확인</button>
									</div>
								</div>
								</td>
							</tr>
							<tr>
								<th class="fw-lighter">비밀번호</th>
								<td>
									<input type="password" class="form-control w-50 mb-2 bg-light" name="password" placeholder="비밀번호를 입력하세요.">
									<p class="text-danger">8~15자리의 영문/숫자를 함께 입력해주세요</p>
									<input type="password" class="form-control w-50 bg-light" name="confirmPassword" placeholder="입력하신 비밀번호를 다시 한번 입력하세요.">
								</td>
							</tr>
							<tr>
								<th class="fw-lighter">이름</th>
								<td>
									<input type="text" class="form-control w-50 bg-light" name="name" placeholder="이름을 입력하세요.">
								</td>
							</tr>
							<tr>
								<th class="fw-lighter">이메일</th>
								<td>
									<input type="email" class="form-control w-50 bg-light" name="email" placeholder="이메일을 입력하세요.">
								</td>
							</tr>
							<tr>
								<th class="fw-lighter">성별</th>
								<td>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="gender" value="F"> 
										<label class="form-check-label" for="inlineCheckbox1">여성</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="gender" value="M"> 
										<label class="form-check-label" for="inlineCheckbox1">남성</label>
									</div>
								</td>
							</tr>
							<tr>
								<th class="fw-lighter">생년월일</th>
								<td>
									<input type="date" class="form-control w-50" name="birthday" placeholder="ex) 2021-01-01">
								</td>
							</tr>
							<tr>
								<th class="fw-lighter">휴대폰</th>
								<td>
									<input type="text" class="form-control w-50 bg-light" name="phone" placeholder="ex) 010-1111-1111">
									<p class="text-danger">휴대폰 번호를 정확하게 입력하지 않을 경우 회원 혜택이 제한될 수 있습니다.</p>
								</td>
							</tr>
						</tbody>
					</table>
		            <div class="row my-3 text-center my-5">
						<div class="col-12">
							<a href="../home" class="btn btn-dark btn-lg w-25">취소</a>
							<button type="submit" class="btn btn-danger btn-lg w-25">다음</button>
						</div>
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
	$(function(){
	
		$("#btn-post-id").click(function(){
			var userId = $("#confirmId").val();
			
			$.ajax({
				type:"POST",
				url: "confirm",
				data:{id:userId},
				dataType: 'text',
				success: function(isExist){
					console.log(isExist)
					if(isExist == "false"){
						$("#confirmIdResult").text("중복확인완료");
					} else if(isExist == "true"){
						$("#confirmIdResult").text("사용하실 수 없는 아이디 입니다.");
					}
				}
				
				
			})
			
		})
		
	});
	
</script>
</body>
</html>