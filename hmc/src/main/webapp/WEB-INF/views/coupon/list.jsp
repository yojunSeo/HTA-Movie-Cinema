<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>이벤트 페이지</title>
<style>
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div class="container my-3">
    <main>
    	<div class="row mb-3">
			<div class="col">
				<div class="border p-2 bg-light d-flex justify-content-between">
					<span>쿠폰 목록</span>
					<button class="btn btn-primary btn-sm" id="btn-open-coupon-modal">새 쿠폰 등록</button>
				</div>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col">
				<div class="border p-2 bg-light">
					<table class="table" id="coupon-table">
						<colgroup>
							<col width="10%">
							<col width="*">
							<col width="20%">
							<col width="20%">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>이름</th>
								<th>쿠폰종류</th>
								<th>연관 이벤트</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty coupons }">
									<tr>
										<td colspan="4">쿠폰이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="coupons" items="${coupons }">
										<tr data-coupon-code="${coupons.code }" class="align-middle">
											<th>${coupons.code }</th>
											<td style="cursor:pointer;">
											<a href="/hmc/coupon/detail?no=${coupons.code }">
											${coupons.name }</a>
											</td>						
											<td>${coupons.type }</td>					
											<td>${event.code }</td>		
										</tr>			
									</c:forEach>
								</c:otherwise>
								
							</c:choose>
						
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<c:if test="${pagination.totalRows gt 0 }">
				<div class="row mb-2">
					<div class="col-12">
						<ul class="pagination justify-content-center">
							<li class="page-item ${pagination.pageNo le 1 ? 'disabled' : ''}">
								<a class="page-link" href="home?page=${pagination.pageNo - 1 }">이전</a>
							</li>
							<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
								<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
									<a class="page-link" href="home?page=${num }">${num }</a>
								</li>
							</c:forEach>
							<li class="page-item ${pagination.pageNo ge pagination.totalPages ? 'disabled' : ''}">
								<a class="page-link" href="home?page=${pagination.pageNo + 1 }">다음</a>
							</li>
							
						</ul>
					</div>
					
				</div>
			</c:if>
    </main>
    <div class="modal fade" id="form-todo-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
				<input type="hidden" name="no" id="coupon-no">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">쿠폰 등록</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form id="form-todo">
							<div class="row px-2 mb-2">
								<div class="form-check">
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="category" value="50%할인" checked="checked">
										<label class="form-check-label">50%할인</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="category'" value="30%할인">
										<label class="form-check-label">30%할인</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="category" value="5000원 할인">
										<label class="form-check-label">5000원 할인</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="category" value="영화관람권">
										<label class="form-check-label">영화관람권</label>
									</div>
								</div>
							</div>
							<div class="row px-2 mb-2">
								<input type="text" class="form-control" id="coupon-title" name="title" placeholder="쿠폰 이름을 입력하세요">
							</div>
							<div class="row px-2 mb-2">
								<div class="form-check">
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="status" value="등록" checked="checked">
										<label class="form-check-label">등록</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="status" value="완료" disabled="disabled">
										<label class="form-check-label">완료</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="status" value="보류" disabled="disabled">
										<label class="form-check-label">보류</label>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary" id="btn-post-todo">등록</button>
					</div>
				</div>
		</div>
	</div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	var request = "등록"
	var requestURI = "coupon/add";
	
	var todoModal = new bootstrap.Modal(document.getElementById("form-todo-modal"), {
		keyboard: false
	})
	
	$("#btn-open-coupon-modal").click(function() {
		requestURI = "coupon/add";
		request = "등록"
		
		$("#coupon-no").val("").prop("disabled", true);
		$(":radio[name=category]").eq(0).prop("checked", true);
		$("#coupon-title").val("");
		$("#btn-post-todo").text("등록");
		
		todoModal.show();
	});
})
</script>
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>
</body>
</html>
