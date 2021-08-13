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
               <h5 class="mt-5 fw-normal mb-3">회원정보 변경</h5>
            </div>
            <div class="row mb-1">
               <p class="fw-normal fs-3">개인정보 보호를 위해 본인확인을 진행합니다.</p>
            </div>
            <div class="row mb-2">
            	<h5 class="mt-3">인증정보 입력</h5>
            </div>
            <div class="row">
            	<hr style="border: solid 1px gray;">
            </div>
            <div class="row">
            	<div class="col-9">
	            	<form action="checkUser" method="post" id="checkUser">
	            		<div class="row mt-4">
		            		<div class="col-2">
		            			<div class="row mb-2"><p class="fw-lighter">아이디</p></div>
		            			<div class="row"><p class="fw-lighter">비밀번호</p></div>
		            		</div>
		            		<div class="col-8">
		            			<div class="row">
		            				<input type="text" class="form-control w-100 mb-2 bg-light" name="id" placeholder="아이디를 입력하세요.">
		            			</div>
		            			<div class="row">
		            				<input type="password" class="form-control w-100 bg-light" name="password" placeholder="비밀번호를 입력하세요.">
		            			</div>
		            		</div>
		            		<div class="col-2">
		            			<button type="submit" class="btn btn-danger w-100 h-100 text-light fw-bold">인증요청</button>
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
   	
		// 입력한 정보로 회원을 찾지 못했을 때 실행할 alert창
		var urlParams = new URLSearchParams(window.location.search);
		var savedUser = urlParams.get('notFoundUser');
		if(savedUser != null){
			alert("인증에 실패하셨습니다./n 입력한 정보와 일치하는 회원이 존재하지 않습니다.");
			location.href = "checkUser";
		}
   })
   </script>
</body>
</html>