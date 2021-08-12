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
            	<div class="col-12 border-bottom border-1 border-dark">
            	</div>
            </div>
			<div class="row border my-5 bg-light">
	           	<form id="form-search" class="form-inline justify-content-center my-4 mx-4" method="get" action="myInqueryList">
	           		<div class="row">
	           			<div class="col-2">
	           				<div>
								<input type="hidden" name="page" value="${pagination.pageNo }"> 
								<select class="form-control mr-2" name="opt">
									<option value="title" ${param.opt eq 'title' ? 'selected' : '' }>제목</option>
									<option value="content"${param.opt eq 'content' ? 'selected' : '' }>내용</option>
								</select>
							</div> 
	           			</div>
	           			<div class="col-8">
	           				<input type="text" class="form-control" name="keyword" value="${param.keyword }" placeholder="검색어를 입력해주세요.">
	           			</div>
	           			<div class="col-2">
	           				<button type="submit" class="btn btn-dark">검색</button>
	           			</div>
	           		</div>
	           	</form>
	           </div>
            <div class="row mb-5">
				<table class="table text-center" id="inquery-table">
					<thead>
						<colgroup>
							<col width="20%"/>
							<col width="10%"/>
							<col width="20%"/>
							<col width="20%"/>
							<col width="20%"/>
							<col width="10%"/>
						</colgroup>
						<tr>
							<th scope="col">문의코드</th>
							<th scope="col">문의자</th>
							<th scope="col">카테고리</th>
							<th scope="col">제목</th>
							<th scope="col">등록일</th>
							<th class="text-start">답변상태</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty inquerys }">
								<tr>
									<td colspan="6">문의내역이 존재하지 않습니다.</td>
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
										<c:choose>
											<c:when test="${inquery.respondStatus == 'Y'}">
												<td class="text-success text-start fw-bold">완료</td>
											</c:when>
											<c:otherwise>
												<td class="text-danger text-start fw-bold">미완료</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<c:if test="${pagination.totalRows gt 0 }">
				<div class="row mb-2" id="page-zone">
					<div class="col-12">
						<ul class="pagination justify-content-center">
							<li class="page-item ${pagination.pageNo le 1 ? 'disabled' : ''}">
								<a class="page-link" data-pageno = "${pagination.pageNo - 1 }">이전</a>
							</li>
							<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
								<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
									<a class="page-link" data-pageno = "${num }">${num }</a>
								</li>
							</c:forEach>
							<li class="page-item ${pagination.pageNo ge pagination.totalPages ? 'disabled' : ''}">
								<a class="page-link" data-pageno = "${pagination.pageNo + 1 }">다음</a>
							</li>
						</ul>
					</div>
				</div>
			</c:if>
		</main>

		<footer>
			<%@ include file="../common/footer.jsp" %>
		</footer>

	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<script>
$(function(){
	$("#inquery-table tbody tr").click(function(){
		var inqueryCode = $(this).data('inquery-code');
		
		location.href = "myInqueryDetail?code=" + inqueryCode;
		
	})
	
	// 검색기능
	$("#form-search .btn-dark").on('click', function(){
		$("#form-search :input:first").val(1);
		$("#form-search").submit();
	})	
	
	// 페이지 이동
	$("#page-zone").on('click', 'a', function(){
		var pageNo = $(this).data('pageno');
		$("#form-search :input:first").val(pageNo);
		$("#form-search").submit();
	})
	
})
</script>
</body>
</html>