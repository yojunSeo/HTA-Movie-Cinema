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
               <p class="mt-5 fw-normal fs-4">고객센터</p>
            </div>
            <div class="row mb-2">
            	<div class="col-12 border-bottom border-1 border-secondary">
            	</div>
            </div>
            <div class="row offset-2">
            	<div class="col-4">
            		<a href="../cs/home" class="btn fw-bold text-danger">공지사항</a>
            	</div>
            	<div class="col-4">
            		<a href="../cs/inqueryForm" class="btn">1:1문의</a>
            	</div>
            	<div class="col-4">
            		<a href="../cs/membership" class="btn">멤버십</a>
            	</div>
            </div>
            <div class="row my-2">
            	<div class="col-12 border-bottom border-1 border-dark"></div>
            </div>
            <div class="row my-2">
            	<div class="col-12 my-4"></div>
            	<div class="col-12 border-bottom border-1 border-dark"></div>
            </div>
            <div class="row">
		    	<p class="fw-bold fs-6 mt-2">${notice.title }</p>
            </div>
            <div class="row border border-top border-bottom bg-light">
            	<div class="row my-2 mx-5">
	            	<div class="col-4 mt-2">
	            		<p>영화관 | <span class="fw-bold">${notice.category }</span></p>
	            	</div>
	            	<div class="col-4 mt-2">
	            		<p>등록일 | <span class="fw-bold"><fmt:formatDate value="${notice.createdDate }" pattern="yyyy-MM-dd"/></span></p>
	            	</div>
	            	<div class="col-4 mt-2">
	            		<p>조회수 | <span class="fw-bold">${notice.viewCnt }</span></p>
	            	</div>
            	</div>
            </div>
            <div class="row my-5">
            	<div class="col-7 offset-2">
            		<div>
            			${notice.content }
					</div>
            	</div>
            </div>
            <div class="row offset-5">
            	<a href="../cs/home" class="btn btn-dark w-25 text-light">목록</a>
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