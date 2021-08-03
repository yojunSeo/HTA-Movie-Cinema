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
			<div class="row mb-3">
               <p class="mt-5 fw-normal fs-4">회원가입</p>
            </div>
            <div class="row mb-5">
               <p class="fw-normal fs-3">짠! 벌써 마지막 단계에요!</p>
            </div>
            <c:if test="${not empty error }">
					<div class="row">
						<div class="col">
							<div class="alert alert-danger">
								<strong>${error.title }</strong> ${error.message }
							</div>
						</div>
					</div>
			</c:if>
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
									<input type="password" class="form-control w-50 mb-2 bg-light" name="password" id="password" placeholder="비밀번호를 입력하세요.">
									<p class="text-danger">8~15자리를 사용해야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.</p>
									<input type="password" class="form-control w-50 bg-light" name="confirmPassword" id="confirmPwd" placeholder="입력하신 비밀번호를 다시 한번 입력하세요.">
								</td>
							</tr>
							<tr>
								<th class="fw-lighter">이름</th>
								<td>
									<input type="text" class="form-control w-50 bg-light" name="name" id="name" placeholder="이름을 입력하세요.">
								</td>
							</tr>
							<tr>
								<th class="fw-lighter">이메일</th>
								<td>
									<input type="email" class="form-control w-50 bg-light" name="email" id="email" placeholder="이메일을 입력하세요.">
								</td>
							</tr>
							<tr>
								<th class="fw-lighter">성별</th>
								<td id="gender">
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" id="F" name="gender" value="F" checked> 
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
									<input type="date" class="form-control w-50" name="birthday" id="birthday" placeholder="ex) 2021-01-01">
								</td>
							</tr>
							<tr>
								<th class="fw-lighter">휴대폰</th>
								<td>
									<input type="text" class="form-control w-50 bg-light" name="phone" id="phone" placeholder="ex) 010-1111-1111">
									<p class="text-danger">휴대폰 번호를 정확하게 입력하지 않을 경우 회원 혜택이 제한될 수 있습니다.</p>
								</td>
							</tr>
						</tbody>
					</table>
		            <div class="row my-3 text-center my-5">
						<div class="col-12">
							<a href="../home" class="btn btn-dark btn-lg w-25 text-light">취소</a>
							<button type="submit" id="btn-save" class="btn btn-danger btn-lg w-25 text-light" disabled="disabled">다음</button>
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
						$("#confirmIdResult").text("사용가능한 아이디입니다.").removeClass("text-danger").addClass("text-success");
						$("#btn-save").prop("disabled",false);
					} else if(isExist == "true"){
						$("#confirmIdResult").text("사용하실 수 없는 아이디 입니다.").removeClass("text-success").addClass("text-danger");
						$("#btn-save").prop("disabled",true);
					}
				}
			})
		});
		
		$("#register-form").submit(function(){
			
			var id = $.trim($("#confirmId").val());
			if(!id){
				alert("아이디는 필수 입력값입니다.");
				$("#contirmId").focus();
				return false;
			}
			
			var password = $.trim($("#password").val());
			if(!password){
				alert("비밀번호는 필수 입력값입니다.");
				$("#password").focus();
				return false;
			}
			
			var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,15}$/;
			var pw = $("#password").val();
			if(false === reg.test(pw)) {
				alert('비밀번호는 8~15자리를 사용해야하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
				$("#password").focus();
				return false;
			}
			
			var confirmPwd = $.trim($("#confirmPwd").val());
			if(!confirmPwd){
				alert("비밀번호 확인은 필수 입력사항입니다.");
				$("#confirmPwd").focus();
				return false;
			}
			
			if(password != confirmPwd){
				alert("비밀번호가 일치하지 않습니다.");
				$("#confirmPwd").focus();
				return false;
			}
			
			var name = $.trim($("#name").val());
			if(!name){
				alert("이름은 필수 입력값입니다.");
				$("#name").focus();
				return false;
			}
			
			var email = $.trim($("#email").val());
			if(!email){
				alert("이메일은 필수 입력값입니다.");
				$("#email").focus();
				return false;
			}
			
			var gender = $("#gender :radio:checked").length;
			if(gender == 0){
				alert("성별은 필수 입력값입니다.");
				$("#F").focus();
				return false;
			}
			
			var birthday = $.trim($("#birthday").val());
			if(!birthday){
				alert("생년월일은 필수 입력값입니다.");
				$("#birthday").focus();
				return false;
			}
			
			var phone = $.trim($("#phone").val());
			if(!phone){
				alert("전화번호는 필수 입력값입니다.");
				$("#phone").focus();
				return false;
			}
			return true;
		});
		
	});
	
</script>
</body>
</html>