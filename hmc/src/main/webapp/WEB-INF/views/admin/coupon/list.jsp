<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>쿠폰 관리-HMC</title>
<style>
</style>
</head>
<body>
<div class="container" style="display:inline-flex;">
	<div class="col-2 row-left">
		<%@include file ="../sidebar.jsp"%>
	</div>
    <main class="col-10 mt-4">
    	<div class="row offset-2">
            	<div class="col-3">
            		<a href="../coupon/home" class="btn fw-bold text-danger">전체 쿠폰</a>
            	</div>
            	<div class="col-3 ">
            		<a href="../coupon/eventCouponList" >이벤트용 쿠폰</a>
            	</div>
            	<div class="col-3 ">
					<a href="../coupon/paymentList">지급된 쿠폰</a>
            	</div>
            	<div class="col-3">
            		<a href="../coupon/noPaymentList">할당되지 않은 쿠폰</a>
            	</div>
            </div>
            <div class="row my-2">
            	<div class="col-12 border-bottom border-1 border-dark">
            	</div>
            </div>
    	<div class="row mb-3">
			<div class="col">
				<div class="border p-2 bg-light d-flex justify-content-between">
					<span>쿠폰 목록</span>
				</div>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col">
				<div class="border p-2 bg-light">
					<table class="table" id="table-coupon">
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
									<c:forEach var="coupon" items="${coupons }">
										<tr id="coupon-${coupon.code }" >
											<th>${coupon.code }</th>
											<td>${coupon.name }</td>						
											<td>${coupon.type }</td>		
											<c:if test="${coupon.eventCode==null}">		
												<td>등록된 이벤트가 없습니다</td>
											</c:if>		
											<c:if test="${coupon.eventCode!=null}">
												<td><p id="eventCode"  data-event-code="${coupon.eventCode}">${coupon.eventCode}</p></td>
												
											</c:if>
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
    <div class="modal fade" id="form-coupon-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">새 쿠폰등록</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form id="form-coupon">
							<input type="hidden" name="code" id="coupon-code">
							<div class="row px-2 mb-2">
								<div class="form-check">
									<c:forEach var="category" items="${categories }">
										<div class="form-check form-check-inline">
											<c:choose>
												<c:when test="${category eq '30%할인'}">
													<input class="form-check-input" type="radio" id="type" name="type" value="30%할인">
												</c:when>
												<c:otherwise>
													<input class="form-check-input" type="radio" id="type" name="type" value="${category}" >
												</c:otherwise>
											</c:choose>
											<label class="form-check-label">${category}</label>
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="row px-2 mb-2">
								<input type="text" class="form-control" id="coupon-name" name="name" placeholder="쿠폰 이름을 입력하세요">
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary" id="btn-post-coupon">등록</button>
					</div>
				</div>
		</div>
	</div>
	
	
	
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

</script>
</body>
</html>
