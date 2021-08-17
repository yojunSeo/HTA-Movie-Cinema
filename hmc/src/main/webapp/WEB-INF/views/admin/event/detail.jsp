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
.title{
	border-color: black;
}


</style>
</head>
<body>
<div class="col-2">
   <%@include file ="../sidebar.jsp"%>
</div>
<div class="container my-3" style="border:6px solid #e9e9e9;">
	<main>
		<div class="eventHeader">
		    <div class="title" style="text-align:center;">
			    <p class="fw-bold fs-6 mt-2" style="">${events.title }</p>
		    </div>
	    </div>
	    <div>
		    <div class="writer">
		    	<p>${event.writer }</p>
		    </div>
	    	<div  class="eventContent">
	    		<p>${event.content }</p>
	    	</div>
	    	<div class="couponName">
	    		<p>${events.name } </p>
	    	</div>
	    	<div class="test">
	    		<p>${LOGINED_USER.id } </p>
	    	</div>
	    	<div class="test2">
	    		<p>관리자 </p>
	    	</div>
	    </div>
    	<div class="btn-eventJoin" style="text-align:center;">
    		<button id="btn-open-event-modal"  class="btn btn-danger btn-lg w-25 text-light" >뽑기</button>
    	</div>
    	
    	<table class="table" id="table-event"  style="display:block;">
    		
    	</table>
    	
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
									<div class="form-check form-check-inline">
										<span style="font-size: 1.1rem;" >${events.name }</span>
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
							<div><input type="hidden" id="couponCode" name="couponCode" value="${event.couponCode }"></div>
							<div><input type="hidden" id="userId" name="userId" value="${LOGINED_USER.id }"></div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary" id="btn-post-event">뽑기</button>
					</div>
				</div>
		</div>
	</div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	var userid = $("#userId").val();
	
	var eventModal = new bootstrap.Modal(document.getElementById("form-event-modal"), {
		keyboard: false
	})
	
	
	$("#btn-open-event-modal").click(function(){
		console.log("등록 실행이에요");
		
		eventModal.show();
	})
	
	$("#btn-post-event").click(function() {
		$.ajax({
			type: "POST",
			url: "/hmc/admin/event/draw",
			data:{
				eventCode:$("#eventCode").val(),
				couponCode:$("#couponCode").val(),
				userId:$("#userId").val()
				},
			dataType: 'json',
			success: function(eventJoin) {
				console.log(eventJoin);
			},
			complete: function() {
				eventModal.hide();
			}
		});
		console.log("등록이 됌니다!");
	})
	
	
	
	
})


</script>
</body>
</html>
