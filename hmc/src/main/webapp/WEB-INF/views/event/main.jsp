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
					<span>이벤트 목록</span>
				</div>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col">
				<div class="border p-2 bg-light">
					<table class="table" id="event-table">
						<colgroup>
							<col width="10%">
							<col width="*">
							<col width="20%">
							<col width="20%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>시작일</th>
								<th>마감일</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty events }">
									<tr>
										<td colspan="4">진행중인 이벤트가 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="event" items="${events }">
										<tr data-event-code="${event.code }" class="align-middle">
											<th>${event.code }</th>
											<td style="cursor:pointer;">
											<a href="/hmc/event/detail?no=${event.code }">
											${event.title }</a>
											</td>						
											<td><fmt:formatDate value="${event.startDate }" pattern="yyyy년  M월  d일"/></td>						
											<td><fmt:formatDate value="${event.endDate }" pattern="yyyy년  M월  d일"/></td>
											<td>
												<c:choose>
													<c:when test="${event.status eq 'Y' }">진행중</c:when>
													<c:when test="${event.status eq 'N' }">종료</c:when>
													<c:when test="${event.status eq 'A' }">상시</c:when>
												</c:choose>
											
											</td>		
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
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

</script>
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>
</body>
</html>
