<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>공지사항 관리-HMC</title>
</head>
<body>
	<div class="container-fluid">
      <main>
         <div class="container-fluid mt-5">
            <div class="row">
               <div class="col-2">
                  <%@include file ="../sidebar.jsp"%>
               </div>
               <div class="col-10">
					<div class="row mt-3 mb-2">
		               <p class="fw-normal fs-4">공지사항 관리</p>
		            </div>
		            <div class="row ">
		            	<div class="col-12"></div>
		            	<div class="col-12 border-bottom border-1 border-dark"></div>
		            </div>
		            <div class="row mt-4 mb-3">
				    	<p class="fw-bold fs-6 mt-2">${notice.title }</p>
		            </div>
		            <div class="row border border-top border-bottom bg-light">
		            	<div class="row my-2 mx-5">
			            	<div class="col-4 mt-3">
			            		<p>영화관 | <span class="fw-bold">${notice.category }</span></p>
			            	</div>
			            	<div class="col-4 mt-3">
			            		<p>등록일 | <span class="fw-bold"><fmt:formatDate value="${notice.createdDate }" pattern="yyyy-MM-dd"/></span></p>
			            	</div>
			            	<div class="col-4 mt-3">
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
		            	<a href="noticeList" class="btn btn-dark w-25 text-light">목록</a>
		            </div>
               </div>
            </div>
         </div>
		<main>
		</main>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

	<script>
		
	</script>
</body>
</html>