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
<%@ include file="../common/header.jsp" %>
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
	    		<p>${events.name }</p>
	    	</div>
	    </div>
    	<div class="btn-eventJoin" style="text-align:center;">
    		<button id="btn-open-coupon-modal"  class="btn btn-danger btn-lg w-25 text-light" >참여</button>
    	</div>
    	
    	<table class="table" id="table-event"  style="display:block;">
    		<tbody>
    			
    		</tbody>
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
						<form id="form-coupon">
							<input type="hidden" name="code" id="coupon-code">
							<div class="row px-2 mb-2">
								<div class="form-check">
									<div class="form-check form-check-inline">
										<span style="font-size: 1.1rem;">${events.name }</span>
										<br>
										 이벤트에 참여하시겠습니까?
									</div>
								</div>
							</div>
							<div class="row px-2 mb-2">
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
$(function(){
	var request = "등록"
	var requestURI = "/hmc/event/eventJoin";
	
	var eventModal = new bootstrap.Modal(document.getElementById("form-event-modal"), {
		keyboard: false
	})
	
	// 새 쿠폰 등록
	$("#btn-open-coupon-modal").click(function(){
		console.log("등록 실행이에요");
		requestURI = "/hmc/coupon/add";
		request = "등록"
		
		
		eventModal.show();
	})
	
	$("#btn-post-coupon").click(function() {
		$.ajax({
			type: "POST",
			url: requestURI,
			data: $("#form-coupon").serialize(),
			dataType: 'json',
			success: function(coupon) {
				if (request == "등록") {
					console.log("등록이 됌니다");
					$("#table-coupon tbody").prepend(makeRow(coupon));
				} 
			},
			complete: function() {
				couponModal.hide();
			}
		});
		console.log("등록이 됌니다!");
	})
	
	
	function makeRow(coupon) {
		var row = "<tr  class='align-middle' id='coupon-"+coupon.code+"'>"
		row += "<td>"+coupon.code+"</td>";
		row += "<td>"+coupon.name+"</td>";
		row += "<td><button class='btn btn-link' data-coupon-code='"+coupon.code+"'>"+coupon.name+"</td>";
		row += "<td><button class='btn btn-outline-danger btn-sm' data-coupon-code='"+coupon.code+"'>삭제하기</button></td>";
		row += "</tr>";
		return row;
	}
	
})


</script>
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>
</body>
</html>
