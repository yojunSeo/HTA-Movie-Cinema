<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>이벤트-HMC</title>
<style>

.text-in-btn-start {
	margin-top:20px;
}

.text-in-btn-end {
	position:relative;
	top: -24px;
}
      
.banner {
		position: relative;
		width:100vw;
		height:296px;
		margin-left: calc(-50vw + 50%);
		margin-right: auto;
	}
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div class="container my-3">
	<img class="banner" src="../resources/images/event/banner.png">
    <main>
    	<div class="row mb-3">
			<div class="col-10">
				<div class=" p-2">
					<h5 style="margin-top:30px; margin-left:10px"><strong>이벤트 목록</strong></h5>
				</div>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-10">
				<c:choose>
						<c:when test="${empty events }">
							<tr>
								<td colspan="4">진행중인 이벤트가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="event" items="${events}" >
								<div class="accordion accordion-flush" id="accordionFlushExample">
									<div class="accordion-item d-grid gap-2">
										<button class="btn btn-outline-secondary" style="height:80px; margin:10px;" type="button" data-bs-toggle="collapse" data-bs-target="#${event.code }" aria-expanded="false" aria-controls="flush-collapseOne">
									  		<div class="text-in-btn-start text-start" >
										  		<span><strong style="">${event.title }</strong></span>
										  	</div>
										  	<div class="text-in-btn-end text-end">									  		
									  			<span>
										  			<fmt:formatDate value="${event.startDate }" pattern="yyyy년  M월  d일"/>
										  			~
										  			<fmt:formatDate value="${event.endDate }" pattern="yyyy년  M월  d일"/>
										  		</span>
									  		</div>
									  	</button>
									  	<div id="${event.code }" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample" style="border:4px solid #e9e9e9; margin-left:10px; margin-right:5px;">
										    <div class="accordion-body">
										    <br>
										    ${event.content }
										    <br>
										    <br>
										    <br>
										    <br>
										    <div class="btn-eventJoin" style="text-align:center;" >
									    		<c:if test="${event.joined eq 'NO' }">
									    			<button data-event-code="${event.code }" data-joined-code="${event.joined }" class="btn btn-danger btn-lg w-25 text-light" >응모하기</button>
									    		</c:if>
									    		<c:if test="${event.joined eq 'YES' }">
									    			<button class="btn btn-danger btn-lg w-25 text-light" >참여하였습니다.</button>
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
    <div class="modal fade" id="form-event-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">이벤트 참여</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form id="form-event">
							<input type="hidden" name="code" id="event-code">
							<div class="row px-2 mb-2">
								<div class="form-check">
								<input type="hidden" id="userIdByJoin" name="userIdByJoin" value="${LOGINED_USER.id }">
									<c:forEach var="join" items="${joins }">
										<input type="text" id="userIdforJoined" name="userIdForJoined" value="${eventJoins.userId }">
										<span style="font-size: 1.1rem;" >${join.name }</span>
									</c:forEach>
									<div class="form-check form-check-inline">
										<br>
										 이벤트에 참여하시겠습니까?
									</div>
								</div>
								
							</div>
							<div class="row px-2 mb-2">
							</div>
						</form>
						<form id="form-eventjoin">
							<div><input type="hidden" id="eventCode" name="eventCode" value="${event.code }"></div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary" id="btn-post-event">등록</button>
					</div>
				</div>
		</div>
	</div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	var requestURI = "/hmc/event/eventJoin";
	
	var eventModal = new bootstrap.Modal(document.getElementById("form-event-modal"), {
		keyboard: false
	})
	
	// 이벤트 등록
	$("button[data-event-code]").click(function(){
		var userId = $("#userIdByJoin").val();
		var eventCode = $(this).data("event-code");
		$("#eventCode").val(eventCode);
		if(!userId){
			alert("이벤트는 회원만 참여할 수 있습니다.");
			return false;
		}
		
		eventModal.show();
	})
	
	$("#btn-post-event").click(function() {
		var userId = $("#userIdByJoin").val();
		var userId2 = $("#userIdForJoined").val();
		console.log(userId);
		console.log(userId2+"이거");
		console.log("1234");
		$.ajax({
			type: "POST",
			url: requestURI,
			data: $("#form-eventjoin").serialize(),
			dataType: 'json',
			success: function(eventJoin) {
				if (request == "등록") {
					console.log("이벤트 참여");
				} 
			},
			complete: function() {
				eventModal.hide();
			}
		});
		console.log("등록이 됌니다!");
		alert("이벤트 신청 완료되었습니다.");
	})
	
	
	
	
})
</script>
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>
</body>
</html>
