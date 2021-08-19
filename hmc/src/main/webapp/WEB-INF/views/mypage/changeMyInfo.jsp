<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>마이페이지-HMC</title>
</head>
<style type = "text/css">
html, body {
   width: 100%;
   height: 100%;
}
.box {
   width: 100vw;
   margin-left: calc(-50vw + 50%);
   
}
.box1 {
   background-color: #FF243E;
   width: 100vw;
   margin-left: calc(-50vw + 50%);
   height: 350px;   
}

.box2 {
   margin-top: 100px;

   width: 1280px;
   height: 400px;
   padding: 20px;
   background-color: #FFFFFF;
   background-position: center;
   background-size: cover;
   backgroudd-repeat: no-repeat;
}

.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
    border: none;
    outline: none;
    color: #000000;
    backgrone-color: #FFFFFF;
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

      <header><%@ include file="../common/header.jsp"%></header>
      
      <main>
         <%@include file="main.jsp" %>   
         <div class="row mb-3">
               <p class="mt-5 fw-normal fs-4">회원정보변경</p>
            </div>
            <div class="row mb-5">
               <p class="fw-normal fs-3">회원정보를 정확하게 입력해주세요.</p>
            </div>
            <div class="row">
            	<p class="fw-bold fs-5">회원정보입력</p>
            </div>
            <div class="row mb-2">
            	<div class="col-12 border-bottom border-2 border-dark">
            	</div>
            </div>
            <div class="row">
	            <form action="changeMyInfo" method="post" id="changeMyInfo-form">
					<table class="table">
						<tbody>
							<tr>
								<th class="fw-lighter">아이디</th>
								<td>${LOGINED_USER.id }<input type="hidden" name="id" value="${LOGINED_USER.id }"></td>
							</tr>
							<tr>
								<th class="fw-lighter">이름</th>
								<td>${LOGINED_USER.name }</td>
							</tr>
							<tr>
								<th class="fw-lighter">이메일</th>
								<td>
									<div class="row">
										<div class="col-6">
											<input type="email" class="form-control bg-light" name="email" id="email" data-user-email="${LOGINED_USER.email }" placeholder="${LOGINED_USER.email }">
											<p class="text-danger" id="confirmEmailResult"></p>
										</div>
										<div class="col-6">
											<button type="button" class="btn btn-danger" id="btn-post-email">중복확인</button>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th class="fw-lighter">성별</th>
								<c:choose>
									<c:when test="${LOGINED_USER.gender eq 'F' }">
										<td>여성</td>
									</c:when>
									<c:otherwise>
										<td>남성</td>
									</c:otherwise>
								</c:choose>
							</tr>
							<tr>
								<th class="fw-lighter">생년월일</th>
								<td><fmt:formatDate value="${LOGINED_USER.birthday }" pattern="yyyy-MM-dd"/> </td>
							</tr>
							<tr>
								<th class="fw-lighter">휴대폰</th>
								<td>
									<div class="row">
									<div class="col-6">
										<input type="text" class="form-control bg-light" name="phone" id="phone" data-user-phone="${LOGINED_USER.phone }" placeholder="${LOGINED_USER.phone }">
										<p class="text-danger" id="confirmPhoneResult"></p>
									</div>
									<div class="col-6">
										<button type="button" class="btn btn-danger" id="btn-post-phone">중복확인</button>
									</div>
								</div>
								</td>
							</tr>
						</tbody>
					</table>
		            <div class="row my-3 text-center my-5">
						<div class="col-12">
							<a href="home" class="btn btn-dark btn-lg w-25 text-light">취소</a>
							<button type="submit" id="btn-save" class="btn btn-danger btn-lg w-25 text-light" disabled="disabled">변경</button>
						</div>
					</div>
				</form>
            </div>
      </main>

      <footer><%@ include file="../common/footer.jsp"%></footer>

   </div>
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

   <script>
   $(function(){
	   // 이메일 중복 확인
	   $("#email").change(function(){
		   $("#btn-save").prop("disabled",true);
		   
		   $("#btn-post-email").click(function(){
			   var email = $("#email").val();
			   
			   $.ajax({
				   type:"POST",
				   url:"rest/confirmEmail",
				   data:{email:email},
				   dataType: 'text',
				   success: function(isExist){
					   if(isExist == "false"){
						   $("#confirmEmailResult").text("사용가능한 이메일입니다.").removeClass("text-danger").addClass("text-success");
						   $("#btn-save").prop("disabled",false);
						   
					   } else if(isExist == "true"){
						   $("#confirmEmailResult").text("사용하실 수 없는 이메일입니다.").removeClass("text-success").addClass("text-danger");
						   $("#btn-save").prop("disabled",true);
						   
					   }
				   }
			   })
		   })
	   })
	   // 휴대폰번호 중복확인
	   $("#phone").change(function(){
		   $("#btn-save").prop("disabled",true);
		   
		   $("#btn-post-phone").click(function(){
			   var phone = $("#phone").val();
			   
			   $.ajax({
				   type:"POST",
				   url:"rest/confirmPhone",
				   data:{phone:phone},
				   dataType: 'text',
				   success: function(isExist){
					   if(isExist == "false"){
						   $("#confirmPhoneResult").text("사용가능한 휴대폰 번호입니다.").removeClass("text-danger").addClass("text-success");
						   $("#btn-save").prop("disabled",false);
					   } else if(isExist == "true"){
						   $("#confirmPhoneResult").text("사용하실 수 없는 휴대폰 번호입니다.").removeClass("text-success").addClass("text-danger");
						   $("#btn-save").prop("disabled",true);
						   
					   }
				   }
			   })
		   })
	   })
	   
	   
	   $("#changeMyInfo-form").submit(function(){
		   var userPhone = $("#phone").data("user-phone");
		   var phone = $.trim($("#phone").val());
		   if(!phone){
			   $("#phone").val(userPhone);
			   return false;
		   }
		   var userEmail = $("#email").data("user-email");
		   var email = $.trim($("#email").val());
		   if(!email){
			   $("#email").val(userEmail);
		   }
		   return true;
	   })
   })
   </script>
</body>
</html>