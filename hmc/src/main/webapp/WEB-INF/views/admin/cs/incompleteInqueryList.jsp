<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>1:1문의 관리-HMC</title>
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
		              <p class="fw-normal fs-4">1:1 문의 관리</p>
		           </div>
		           <div class="row mb-2">
		           	<div class="col-12 border-bottom border-1 border-secondary">
		           	</div>
		           </div>
		           <div class="row my-5">
		           	<div class="d-grid gap-2 col-6">
		           		<a href="inqueryList" class="btn btn-dark text-light">미답변 문의</a>
		           	</div>
		           	<div class="d-grid gap-2 col-6">
		           		<a href="incompleteInqueryList" class="btn btn-danger text-light">답변완료 문의</a>
		           	</div>
		           </div>
		           <div class="row mb-5">
					<table class="table text-center" id="inquery-table">
						<thead >
							<colgroup>
								<col width="20%"/>
								<col width="10%"/>
								<col width="20%"/>
								<col width="30%"/>
								<col width="20%"/>
							</colgroup>
							<tr>
								<th scope="col">문의코드</th>
								<th scope="col">문의자</th>
								<th scope="col">카테고리</th>
								<th scope="col">제목</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty inquerys }">
									<tr>
										<td colspan="4">답변완료된 문의가 존재하지 않습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="inquery" items="${inquerys }">
										<tr data-inquery-code="${inquery.code}">
											<td>${inquery.code }</td>
											<td>${inquery.userId }</td>
											<td>${inquery.category }</td>
											<td>${inquery.title }</td>
											<td><fmt:formatDate value="${inquery.createdDate }" pattern="yyyy-MM-dd"/></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<c:if test="${pagination.totalRows gt 0 }">
					<div class="row mb-2">
						<div class="col-12">
							<ul class="pagination justify-content-center">
								<li class="page-item ${pagination.pageNo le 1 ? 'disabled' : ''}">
									<a class="page-link" href="incompleteInqueryList?page=${pagination.pageNo - 1 }">이전</a>
								</li>
								<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
									<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
										<a class="page-link" href="incompleteInqueryList?page=${num }">${num }</a>
									</li>
								</c:forEach>
								<li class="page-item ${pagination.pageNo ge pagination.totalPages ? 'disabled' : ''}">
									<a class="page-link" href="incompleteInqueryList?page=${pagination.pageNo + 1 }">다음</a>
								</li>
							</ul>
						</div>
					</div>
				</c:if>
               </div>
            </div>
         </div>
		</main>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<script>
$(function(){
	// 상세페이지 이동
	$("#inquery-table tr").click(function(){
		var inqueryCode = $(this).data('inquery-code');
		location.href = "incompleteInqueryDetail?code="+inqueryCode;
	})
})
</script>
</body>
</html>