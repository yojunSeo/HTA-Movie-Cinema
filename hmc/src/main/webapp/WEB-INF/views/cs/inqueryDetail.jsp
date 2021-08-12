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
            	<div class="col-12 border-bottom border-1 border-secondary"></div>
            </div>
            <div class="row offset-2">
            	<div class="col-4">
            		<a href="../cs/home" class="btn">공지사항</a>
            	</div>
            	<div class="col-4 mt-2">
            		<ul>
						<li class="dropdown">
							<a href="../cs/inqueryForm" class="text-danger fw-bold">1:1문의</a>
							<div class="dropdown-content">
								<a href="myInqueryList" class="mt-3">나의 문의 내역</a>
							</div>
						</li>
					</ul>	
            	</div>
            	<div class="col-4">
            		<a href="../cs/membership" class="btn">멤버십</a>
            	</div>
            </div>
           	<div class="row my-2">
           		<div class="col-12 border-bottom border-1 border-secondary"></div>
           	</div>
           	<div class="row mt-4">
		    	<p class="fw-bold fs-6 mt-2">${inquery.title }</p>
            </div>
            <div class="row border border-top border-bottom bg-light">
            	<div class="row my-2 mx-5">
	            	<div class="col-3 mt-3">
	            		<p>문의코드 | <span class="fw-bold">${inquery.code }</span></p>
	            	</div>
	            	<div class="col-3 mt-3">
	            		<p>문의자 | <span class="fw-bold">${inquery.userId }</span></p>
	            	</div>
	            	<div class="col-3 mt-3">
	            		<p>카테고리 | <span class="fw-bold">${inquery.category }</span></p>
	            	</div>
	            	<div class="col-3 mt-3">
	            		<p>등록일 | <span class="fw-bold"><fmt:formatDate value="${inquery.createdDate }" pattern="yyyy-MM-dd"/></span></p>
	            	</div>
            	</div>
            </div>
            <div class="row my-5">
            	<div class="col-7 offset-2">
            		<div>
            			${inquery.content }
					</div>
            	</div>
            </div>
            <div class="row my-5">
            	<div class="col-12 border-bottom border-2 border-danger">
            	</div>
            </div>
            <div class="row border border-1 bg-light">
            	<div class="row my-2 mx-5">
	            	<div class="col-3 mt-3">
	            		<p>문의코드 | <span class="fw-bold">${inquery.code }</span></p>
	            	</div>
	            	<div class="col-3 mt-3">
	            		<p>답변자 | <span class="fw-bold">${inquery.responder }</span></p>
	            	</div>
	            	<div class="col-3 mt-3">
	            		<p>답변일 | <span class="fw-bold"><fmt:formatDate value="${inquery.respondDate }" pattern="yyyy-MM-dd"/></span></p>
	            	</div>
	            	<div class="col-3 mt-3">
	            		<c:choose>
		            		<c:when test="${inquery.respondStatus eq 'Y'}">
		            			<p>답변상태 | <span class="fw-bold text-success">답변완료</span></p>
		            		</c:when>
		            		<c:otherwise>
		            			<p>답변상태 | <span class="fw-bold text-danger">답변 미완료</span></p>
		            		</c:otherwise>
	            		</c:choose>
	            	</div>
            	</div>
            </div>
            <div class="row my-5">
            	<div class="col-7 offset-2">
            		<div>
            			${inquery.respondContent }
					</div>
            	</div>
            </div>
             <div class="row my-5">
            	<div class="col-12 border-bottom border-2 border-danger"></div>
            </div>
            <div class="row text-center my-5">
				<div class="col-12">
					<a href="myInqueryList" class="btn btn-dark w-25 h-100 text-light fs-5">목록</a>
				</div>
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