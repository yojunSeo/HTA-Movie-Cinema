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
				<div class="row my-2">
	               <p class="fw-normal fs-4">회원 관리</p>
	            </div>
	            <div class="row">
	            	<div class="col-12"></div>
	            	<div class="col-12 border-bottom border-1 border-dark"></div>
	            </div>
	            <div class="row mb-5">
					<table class="table">
						<thead>
							<colgroup>
									<col width="30%"/>
									<col width="70%"/>
							</colgroup>
						</thead>
						<tbody>
							<tr>
								<th scope="row">아이디</th>
								<td>${user.id }</td>
							</tr>
							<tr>
								<th scope="row">이름</th>
								<td>${user.name }</td>
							</tr>
							<tr>
								<th scope="row">성별</th>
								<c:choose>
									<c:when test="${user.gender == 'F'}">
										<td>여성</td>
									</c:when>
									<c:otherwise>
										<td>남성</td>
									</c:otherwise>
								</c:choose>
							</tr>
							<tr>
								<th scope="row">생년월일</th>
								<td><fmt:formatDate value="${user.birthday }" pattern="yyyy-MM-dd"/></td>
							</tr>
							<tr>
								<th scope="row">이메일</th>
								<td>${user.email }</td>
							</tr>
							<tr>
								<th scope="row">휴대폰</th>
								<td>${user.phone }</td>
							</tr>
							<tr>
								<th scope="row">회원등급</th>
								<td>${user.grade }</td>
							</tr>
							<tr>
								<th scope="row">가용포인트</th>
								<td>${user.point }</td>
							</tr>
							<tr>
								<th scope="row">가입일</th>
								<td><fmt:formatDate value="${user.createdDate }" pattern="yyyy-MM-dd"/></td>
							</tr>
							<tr>
								<th scope="row">상태</th>
								<c:choose>
									<c:when test="${user.status == 'Y'}">
										<td class="text-success fw-bold">사용중인 회원</td>
									</c:when>
									<c:otherwise>
										<td class="text-danger fw-bold">탈퇴한 회원</td>
									</c:otherwise>
								</c:choose>
							</tr>
							<c:choose>
								<c:when test="${user.withdrawalDate == null }">
								</c:when>
								<c:otherwise>
									<tr>
										<th scope="row">탈퇴일</th>
										<td><fmt:formatDate value="${user.withdrawalDate }" pattern="yyyy-MM-dd"/></td>
									</tr>
								</c:otherwise>
							</c:choose>
							<tr>
								<th scope="row">관리자여부</th>
								<c:choose>
									<c:when test="${user.adminYN == 'Y' }">
										<td class="text-primary fw-bold">${user.adminYN }</td>
									</c:when>
									<c:otherwise>
										<td class="text-danger fw-bold">${user.adminYN }</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</tbody>
					</table>
				</div>
	            <div class="row offset-5">
	            	<a href="userList" class="btn btn-dark w-25 text-light">목록</a>
	            </div>
               </div>
            </div>
         </div>
		</main>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<script>

</script>
</body>
</html>