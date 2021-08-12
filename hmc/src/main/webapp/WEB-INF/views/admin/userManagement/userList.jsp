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
	<div class="container-fluid">
		<main>
			<div class="container-fluid mt-5">
				<div class="row">
					<div class="col-2">
						<%@include file ="../sidebar.jsp"%>
					</div>
					<div class="col-10">
						<div class="row mt-3 mb-2">
			               <p class="fw-normal fs-4">회원관리</p>
			            </div>
			            <div class="row mb-2">
			            	<div class="col-12 border-bottom border-1 border-secondary">
			            	</div>
			            </div>
						<div class="row border my-5 bg-light">
			            	<form id="form-search" class="form-inline justify-content-center my-4 mx-4" method="get" action="userList">
			            		<div class="row">
			            			<div class="col-2">
			            				<div>
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
							<table class="table text-center" id="user-table">
								<thead>
									<colgroup>
										<col width="15%"/>
										<col width="15%"/>
										<col width="20%"/>
										<col width="10%"/>
										<col width="20%"/>
										<col width="15%"/>
									</colgroup>
									<tr>
										<th scope="col">아이디</th>
										<th scope="col">이름</th>
										<th scope="col">탈퇴여부</th>
										<th scope="col">가입일</th>
										<th scope="col">비고</th>
										<th scope="col">관리자</th>
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
													<td scope="row" id="goDetail">${user.id }</td>
													<td id="goDetail">${user.name }</td>
													<c:choose>
														<c:when test="${user.status == 'N' }">
															<td class="text-danger text-center fw-bold">탈퇴한 회원</td>
														</c:when>
														<c:otherwise>
															<td class="text-success text-center fw-bold">사용중인 회원</td>
														</c:otherwise>
													</c:choose>
													<td><fmt:formatDate value="${user.createdDate }" pattern="yyyy-MM-dd"/></td>
													<c:choose>
														<c:when test="${user.status == 'Y' }">
															<td><a href="userModify?id=${user.id }" class="btn btn-outline-warning text-warning h-5">수정</a><a class="btn btn-outline-danger mx-2 h-5">탈퇴</a></td>
														</c:when>
														<c:otherwise>
															<td><a class="btn btn-outline-success mx-2 h-5">회원권한 부여</a></td>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${user.adminYN == 'N' }">
															<td><a class="btn btn-outline-primary mx-2 h-5">관리자권한 부여</a></td>
														</c:when>
														<c:otherwise>
															<td><a class="btn btn-outline-dark mx-2 h-5">관리자권한 해제</a></td>
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
							<div class="row my-5" id="page-zone">
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
					</div>
				</div>
			</div>
		</main>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<script>
$(function(){
	$("#user-table tbody tr #goDetail").click(function(){
		var userCode = $(this).closest('tr').data('user-code');
		
		location.href = "userDetail?id=" + userCode;
		
	});
	
	$("#user-table tbody tr .btn-outline-danger").on('click',function(){
		var returnValue = confirm("해당 회원을 탈퇴처리하시겠습니까?");
		if(returnValue){
			var userCode = $(this).closest('tr').data('user-code');
			location.href = "userDelete?id="+userCode;
		}
			return false;
	})
	
	$("#user-table tbody tr .btn-outline-success").on('click', function(){
		var returnValue = confirm("해당 회원의 회원권한을 복구시키시겠습니까?");
		if(returnValue){
			var userCode = $(this).closest('tr').data('user-code');
			location.href = "userRollback?id="+userCode;
		}
			return false;
	})
	
	$("#user-table tbody tr .btn-outline-primary").on('click', function(){
		var returnValue = confirm("해당 회원을 관리자로 지정하시겠습니까?");
		if(returnValue){
			var userCode = $(this).closest('tr').data('user-code');
			location.href = "setAdmin?id="+userCode;
		}
			return false;
	})
	
	$("#user-table tbody tr .btn-outline-dark").on('click', function(){
		var returnValue = confirm("해당 회원의 관리자권한을 해제하시겠습니까?");
		if(returnValue){
			var userCode = $(this).closest('tr').data('user-code');
			location.href = "removeAdmin?id="+userCode;
		}
			return false;
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