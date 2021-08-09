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
		</header>

		<main>
			<div class="row mb-3">
               <p class="mt-5 fw-normal fs-4">회원관리</p>
            </div>
            <div class="row mb-2">
            	<div class="col-12 border-bottom border-1 border-secondary">
            	</div>
            </div>
            <div class="row border my-5 bg-light">
            </div>
			<div class="row border my-5 bg-light">
            	<form id="form-search" class="form-inline justify-content-center my-4 mx-4" method="get" action="userList">
            		<div class="row">
            			<div class="col-2">
            				<div>
								<input type="hidden" name="no" value="" /> 
								<input type="hidden" name="page" value="${pagination.pageNo }"> 
								<select class="form-control mr-2" name="opt">
									<option value="userId" ${param.opt eq 'userId' ? 'selected' : '' }>아이디</option>
									<option value="name"${param.opt eq 'name' ? 'selected' : '' }>이름</option>
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
            <div class="row">
				<table class="table text-center" id="notice-table">
					<thead>
						<colgroup>
							<col width="10%"/>
							<col width="10%"/>
							<col width="40%"/>
							<col width="20%"/>
							<col width="20%"/>
						</colgroup>
						<tr>
							<th scope="col">아이디</th>
							<th scope="col">이름</th>
							<th scope="col">탈퇴여부</th>
							<th scope="col">가입일</th>
							<th scope="col">비고</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty users }">
								<tr>
									<td colspan="4">검색결과가 존재하지 않습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="user" items="${users }">
									<tr data-user-code="${user.id }">
										<th scope="row">${user.id }</th>
										<td>${user.name }</td>
										<td class="${user.status eq 'N' ? 'text-danger' : '' } text-start" id="goDetail">${user.status }</td>
										<td><fmt:formatDate value="${user.createdDate }" pattern="yyyy-MM-dd"/></td>
										<td><a class="btn btn-outline-danger mx-2 h-5">탈퇴</a><a href="userModify?code=${user.id }" class="btn btn-outline-warning h-5">수정</a></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<div class="row">
				<div class="col-12 text-end">
					<a href="insertNotice" class="btn btn-success">추가</a>
				</div>
			</div>
			<c:if test="${pagination.totalRows gt 0 }">
				<div class="row mb-2">
					<div class="col-12">
						<ul class="pagination justify-content-center">
							<li class="page-item ${pagination.pageNo le 1 ? 'disabled' : ''}">
								<a class="page-link" href="userList?page=${pagination.pageNo - 1 }">이전</a>
							</li>
							<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
								<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
									<a class="page-link" href="userList?page=${num }">${num }</a>
								</li>
							</c:forEach>
							<li class="page-item ${pagination.pageNo ge pagination.totalPages ? 'disabled' : ''}">
								<a class="page-link" href="userList?page=${pagination.pageNo + 1 }">다음</a>
							</li>
						</ul>
					</div>
				</div>
			</c:if>
		</main>

		<footer>
		</footer>

	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<script>
$(function(){
	$("#notice-table tbody tr #goDetail").click(function(){
		var noticeCode = $(this).closest('tr').data('notice-code');
		
		location.href = "noticeDetail?code=" + noticeCode;
		
	});
	
	$("#notice-table tbody tr .btn-outline-danger").on('click',function(){
		var returnValue = confirm("공지사항을 삭제하시겠습니까?");
		if(returnValue){
			var noticeCode = $(this).closest('tr').data('notice-code');
			location.href = "noticeDelete?code="+noticeCode;
		}
			return false;
	})
})
</script>
</body>
</html>