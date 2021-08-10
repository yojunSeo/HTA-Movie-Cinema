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
				              <p class="fw-normal fs-4">회원정보 수정</p>
				           </div>
			           <div class="row mb-2">
				           	<div class="col-12 border-bottom border-1 border-secondary">
				           	</div>
			           </div>
						<div class="row mb-5">
							<form action="userModify" method="post" id="user-form">
								<table class="table">
									<thead>
										<colgroup>
											<col width="30%"/>
											<col width="70%"/>
										</colgroup>
									</thead>
									<tbody>
										<tr>
											<th class="fw-lighter">아이디</th>
											<td>
												<input type="text" class="form-control w-75 bg-light" name="id" id="id" value="${user.id }" placeholder="${user.id }" readonly="readonly">
											</td>
										</tr>
										<tr>
											<th class="fw-lighter">이름</th>
											<td>
												<input type="text" class="form-control w-75 bg-light" name="name" id="name" value="${user.name }" placeholder="${user.name }" readonly="readonly">
											</td>
										</tr>
										<tr>
											<th class="fw-lighter">성별</th>
											<td>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="gender" value="F" ${user.gender == 'F' ? 'checked':'' }> 
													<label class="form-check-label" for="inlineCheckbox1">여성</label>
												</div>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="gender" value="M" ${user.gender == 'M' ? 'checked':'' }> 
													<label class="form-check-label" for="inlineCheckbox1">남성</label>
												</div>
											</td>
										</tr>
										<tr>
											<th class="fw-lighter">생년월일</th>
											<td><fmt:formatDate value="${user.birthday }" pattern="yyyy-MM-dd"/></td>
										</tr>
										<tr>
											<th class="fw-lighter">이메일</th>
											<td>
												<input type="email" class="form-control w-75 bg-light" name="email" id="email" value="${user.email }" placeholder="${user.email }" readonly="readonly">
											</td>
										</tr>
										<tr>
											<th class="fw-lighter">휴대폰</th>
											<td>
												<input type="text" class="form-control w-75 bg-light" name="text" id="text" value="${user.phone }" placeholder="${user.phone }" readonly="readonly">
											</td>
										</tr>
										<tr>
											<th class="fw-lighter">회원등급</th>
											<td>
												<div class="col-3">
													<select class="form-control mr-2" name="grade">
														<option value="NORMAL" ${notice.grade == 'NORMAL' ? 'selected': '' }>NORMAL</option>
														<option value="SILVER" ${notice.grade == 'SILVER' ? 'selected': '' }>SILVER</option>
														<option value="GOLD" ${notice.grade == 'GOLD' ? 'selected': '' }>GOLD</option>
														<option value="PLATINUM" ${notice.grade == 'PLATINUM' ? 'selected': '' }>PLATINUM</option>
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<th class="fw-lighter">가용 포인트</th>
											<td>
												<input type="text" class="form-control w-75 bg-light" name="point" id="point" data-user-point="${user.point }" placeholder="${user.point }">
											</td>
										</tr>
										<tr>
											<th class="fw-lighter">가입일</th>
											<td><fmt:formatDate value="${user.createdDate }" pattern="yyyy-MM-dd"/></td>
										</tr>
										<tr>
										<th class="fw-lighter">상태</th>
										<c:choose>
											<c:when test="${user.status == 'Y'}">
												<td class="text-success">사용중인 회원</td>
											</c:when>
											<c:otherwise>
												<td class="text-danger">탈퇴한 회원</td>
											</c:otherwise>
										</c:choose>
									</tr>
										<c:choose>
											<c:when test="${user.withdrawalDate == null }">
											</c:when>
											<c:otherwise>
												<tr>
													<th scope="row">탈퇴날짜</th>
													<td><fmt:formatDate value="${user.withdrawalDate }" pattern="yyyy-MM-dd"/></td>
												</tr>
											</c:otherwise>
										</c:choose>
										<tr>
										<th class="fw-lighter">관리자여부</th>
										<c:choose>
											<c:when test="${user.adminYN == 'Y' }">
												<td>${user.adminYN }</td>
											</c:when>
											<c:otherwise>
												<td>${user.adminYN }</td>
											</c:otherwise>
										</c:choose>
										</tr>
									</tbody>
								</table>
					            <div class="row my-3 text-center my-5">
									<div class="col-12">
										<a href="userList" class="btn btn-dark btn-lg w-25 text-light">취소</a>
										<button type="submit" class="btn btn-danger btn-lg w-25 text-light">확인</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<script>
$(function(){
	// 답변내용 미입력시 submit 막음
	$("#user-form").submit(function(){
		var userPoint = $("#point").data("user-point");
		var point = $.trim($("#point").val());
		if(!point){
			$("#point").val(userPoint);
		}
		return true;
	});
})
</script>
</body>
</html>