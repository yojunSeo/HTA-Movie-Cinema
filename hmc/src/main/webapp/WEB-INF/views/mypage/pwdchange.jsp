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
               <h5 class="mt-5 fw-normal mb-3">비밀번호 변경</h5>
            </div>
            <div class="row mb-1">
               <p class="fw-normal fs-3">새로운 비밀번호를 입력해주세요</p>
            </div>
            <div class="row">
            	<hr style="border: solid 1px gray;">
            </div>
            <div class="row">
            	<div class="col-9">
	            	<form action="changePwd" method="post" id="changePwd-form">
	            		<div class="row mt-4">
		            		<div class="col-2">
		            			<div class="row mb-2"><p class="fw-lighter">이전 비밀번호</p></div>
		            			<div class="row mb-2"><p class="fw-lighter">비밀번호 </p></div>
		            			<div class="row"><p class="fw-lighter">비밀번호 확인 </p></div>
		            		</div>
		            		<div class="col-8">
		            			<div class="row">
		            				<div class="row">
			            				<div class="col-9">
			            					<input type="password" class="form-control w-100 mb-2 bg-light" id="password" name="password" placeholder="비밀번호를 입력해주세요.">
			            				</div>
			            				<div class="col-3">
			            					<button type="button" class="btn btn-danger" id="btn-post-pwd">본인인증</button>
			            				</div>
		            				</div>
		            				<div class="row">
		            					<p></p>
		            				</div>
		            			</div>
		            			<div class="rowspan">
		            				<input type="password" class="form-control w-100 mb-2 bg-light" id="password" name="password" placeholder="비밀번호를 입력해주세요.">
		            			</div>
		            			<div class="rowspan">
		            				<input type="password" class="form-control w-100 bg-light" id="confirmPwd" name="confirmPwd" placeholder="입력하신 비밀번호를 다시 한번 입력해주세요.">
		            			</div>
		            		</div>
		            		<div class="row my-3 text-center my-5">
								<div class="col-12">
									<a href="home" class="btn btn-dark btn-lg w-25 text-light">취소</a>
									<button type="submit" id="btn-save" class="btn btn-danger btn-lg w-25 text-light" disabled="disabled">변경</button>
								</div>
							</div>
	            		</div>
	            	</form>
            	</div>
            </div>
      </main>

      <footer><%@ include file="../common/footer.jsp"%></footer>

   </div>
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

   <script>
   $(function(){
	   
	   $("#changePwd-form").submit(function(){
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
			return true;
		   
	   })
   })
   </script>
</body>
</html>