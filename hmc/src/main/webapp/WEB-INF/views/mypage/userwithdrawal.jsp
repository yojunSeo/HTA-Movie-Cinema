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
         <div class="row">
            <h4 class="mb-5 mt-5" >회원탈퇴 전 <span class="text-danger">유의사항</span>을 확인해 주세요.</h4>
         </div>
         <div>
            <form action="successWithdrawal" method="get" id="userwithdrawal-form">
               <div class="my-3">
                  <h5 class="mt-3">유의사항</h5>
                  <hr style="border: solid 1px gray;">
                  <p>- 아이디를 탈퇴하시면 서비스 부정 이용 방지를 위하여 제휴사 회원정책에 따라 일정 기간 동안 회원 재 가입이 불가합니다.</p>
                  <p>- 탈퇴시, 사용하시던 포인트 및 쿠폰 등은 복원할 수 없습니다.</p>
                  <p>- 탈퇴 즉시 개인정보가 삭제되면, 어떠한 방법으로도 복원할 수 없습니다.</p>
                  <p>- 전자상거래 서비스 등의 거래내역은 전자상거래 등에서의 소비자보호에 관한 법률에 의거하여 보호됩니다.</p>
                  <hr style="border: solid 1px gray;">
               </div>
               <div class="row my-3" id="agreeCheck">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="agree" value="Y" id="agree"> 
						<label class="form-check-label" for="inlineCheckbox1">위  유의사항을 모두 확인하였고 회원탈퇴에 동의합니다.</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="agree" value="N"> 
						<label class="form-check-label" for="inlineCheckbox1">동의하지않음</label>
					</div>
				</div>
               <div class="row mt-5 mb-3 text-center my-5">
                  <div class="col-12">
                     <a href="home" class="btn btn-dark btn-lg w-25 text-light">취소</a>
                     <button type="submit" class="btn btn-danger btn-lg w-25 text-light">탈퇴</button>
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
	   $("#userwithdrawal-form").submit(function(){
		   var agree = $("#agree:radio:checked").length;
			if(agree == 0){
				alert("회원탈퇴에 동의하셔야 탈퇴가 가능합니다.");
				$("#agree").focus();
				return false;
			}	
			return true;
		   })
   
   })
   </script>
</body>
</html>