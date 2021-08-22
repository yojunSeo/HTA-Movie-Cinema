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
.eventTitleInfo{
	position:absolute;
	left: 380px;
	margin-top:20px;
}
.eventDateInfo{
	position:absolute;
	right: 350px;
	margin-top:17px;
}

      
.banner {
	position: relative;
	width:1300px;
	height:180px;
}
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div class="container my-3">
	<img class="banner" src="../resources/images/event/banner.png">
    <main>
    	<div class="row mb-3">
			<div class="col">
				<div class=" p-2">
					<h5 style="margin-top:30px; margin-left:10px"><strong>이벤트 목록</strong></h5>
				</div>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col">
				<c:choose>
						<c:when test="${empty events }">
							<tr>
								<td colspan="4">진행중인 이벤트가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="event" items="${events}" >
								<div class="accordion accordion-flush" id="accordionFlushExample">
									<div class="accordion-item">
										<button class="btn btn-outline-secondary d-flex" style="width:1280px; height:80px; margin:10px;"type="button" data-bs-toggle="collapse" data-bs-target="#${event.code }" aria-expanded="false" aria-controls="flush-collapseOne">
									  		<strong class="eventTitleInfo">${event.title }</strong>
									  		<span class="eventDateInfo">
									  			<fmt:formatDate value="${event.startDate }" pattern="yyyy년  M월  d일"/>
									  			~
									  			<fmt:formatDate value="${event.endDate }" pattern="yyyy년  M월  d일"/>
									  		</span>
									  	</button>
									  	<div id="${event.code }" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample" style="border:4px solid #e9e9e9; margin-left:10px; margin-right:5px;">
										    <div class="accordion-body">
										    ${event.content }
										    <br>
										    <br>
										    <br>
										    <br>
										    <br>
										    <div class="btn-eventJoin" style="text-align:center;" >
									    		<c:if test="${event.status eq 'Y' }">
									    			<button id="btn-open-event-modal"  class="btn btn-danger btn-lg w-25 text-light" >응모하기</button>
									    		</c:if>
									    	</div>
										    </div>
									  	</div>
								  	</div>
								</div>
							</c:forEach>
						</c:otherwise>
				</c:choose>
				
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
