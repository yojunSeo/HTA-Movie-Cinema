<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>이벤트관리-HMC</title>
<style>
</style>
</head>
<body>
    <main>
       <div class="container-fluid mt-5">
         <div class="row">
            <div class="col-2">
               <%@include file ="../sidebar.jsp"%>
            </div>
             <div class="col-10">
               <div class="mt-3">
                  <div class="border p-2 bg-light d-flex justify-content-between col-10">
                     <span>이벤트 목록</span>
                     <button class="btn btn-primary btn-sm" id="btn-open-event-modal">이벤트 등록</button>
                  </div>
               </div>
               <div class="row my-3">
                  <div class="col-10">
                     <div class="border p-2 bg-light">
                        <table class="table" id="event-table">
                           <colgroup>
                              <col width="5%">
                              <col width="10%">
                              <col width="*">
                              <col width="15%">
                              <col width="15%">
                              <col width="7%">
                              <col width="10%">
                              <col width="7%">
                           </colgroup>
                           <thead class="text-center">
                              <tr>
                                 <th>번호</th>
                                 <th>이벤트코드</th>
                                 <th>제목</th>
                                 <th>시작일</th>
                                 <th>마감일</th>
                                 <th>당첨결과</th>
                                 <th>수정</th>
                                 <th></th>
                              </tr>
                           </thead>
                           <tbody>
                              <c:choose>
                                 <c:when test="${empty events }">
                                    <tr>
                                       <td colspan="7">진행중인 이벤트가 없습니다.</td>
                                    </tr>
                                 </c:when>
                                 <c:otherwise>
                                    <c:forEach var="event" items="${events }" varStatus="status">
                                       <tr id="event-${event.code }" data-event-code="${event.code }" class="align-middle">
                                          <td class="text-center">${status.count + (pagination.pageNo-1) * 10}</td>
                                          <td class="text-center">${event.code }</td>
                                          <td class="text-center" >${event.title }</td>                  
                                          <td class="text-center"><fmt:formatDate value="${event.startDate }" pattern="yyyy년  M월  d일"/></td>                  
                                          <td class="text-center"><fmt:formatDate value="${event.endDate }" pattern="yyyy년  M월  d일"/></td>
                                          <td class="text-center">
                                          		<c:choose>
                                          			<c:when test="${event.status eq 'Y' }">진행중</c:when>
													<c:when test="${event.status eq 'S' }">대기</c:when>
													<c:when test="${event.status eq 'N' }">종료</c:when>
													<c:when test="${event.status eq 'A' }">상시</c:when>
                                          		</c:choose>
                                          		
                                          </td>
                                          <td class="text-center"><button id="btn-open-join-modal" class="btn btn-outline-primary btn-sm rm-2" data-event-code="${event.code }" data-coupon-code="${event.couponCode }">조회</button> </td>
                                          <td class="text-center"><button id="btn-open-modify-modal" class="btn btn btn-outline-success btn-sm rm-2" data-event-code="${event.code }" data-coupon-code="${event.couponCode }" data-drawed-code="${event.drawed }">수정</button></td>
                                          <td class="text-center"><button id="btn-event-delete" class="btn btn-outline-danger btn-sm rm-2" data-event-code="${event.code }" data-coupon-code="${event.couponCode }">삭제</button></td>
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
                              <a class="page-link" href="/hmc/admin/event/eventList?page=${pagination.pageNo - 1 }">이전</a>
                           </li>
                           <c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
                              <li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
                                 <a class="page-link" href="/hmc/admin/event/eventList?page=${num }">${num }</a>
                              </li>
                           </c:forEach>
                           <li class="page-item ${pagination.pageNo ge pagination.totalPages ? 'disabled' : ''}">
                              <a class="page-link" href="/hmc/admin/event/eventList?page=${pagination.pageNo + 1 }">다음</a>
                           </li>
                        </ul>
                     </div>
                  </div>
               </c:if>
            </div>
         </div>
            
      </div>
    </main>
    
    <div class="modal fade" id="form-event-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">이벤트 등록</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body">
                  <form action="insertEvent" method="post" id="form-event">
					 <input type="hidden" name="code" id="event-code">
                     <table class="table" id="table-modal-event">
                        <tbody>
                              <tr>
                                 <td>
                                    <div class="row">
                                    <div class="col-9">
                                       <input type="text" class="form-control bg-light" name="title" id="title" placeholder="제목을 입력해주세요">
                                    </div>
                                    <div class="col-3">
                                       <input type="text" class="form-control bg-light" name="writer" id="writer" placeholder="${LOGINED_USER.id }" readonly>
                                    </div>
                                 </div>
                                 </td>
                              </tr>
                              <tr>
                                 <td>
                                    <div class="row">
                                    <div class="col-12">
                                       <textarea class="form-control" id="content" name="content" rows="5" placeholder="내용을 입력해주세요"></textarea>
                                    </div>
                                 </div>
                                 </td>
                              </tr>
                              <tr>
                                 
                              </tr>
                              <tr>
                              <td>
                                 <label class="form-label">이벤트 시작일</label>
                                 <input type="date" class="form-control" name="startDate" id="startDate" placeholder="ex) 2021-01-01">
                                 <label class="form-label">이벤트 마감일</label>
                                 <input type="date" class="form-control col-3" name="endDate" id="endDate" placeholder="ex) 2021-01-01">
                              </td>
                           </tr>
                           
                              <c:choose>
                              <c:when test="${empty coupons }">
                                 <tr>
                                    <td>생성된 쿠폰이 없습니다!.</td>
                                 </tr>
                              </c:when>
                              <c:otherwise>
                                 <tr>
                                    <td>
                                       <select name="couponCode" id="couponCode">
                                          <option value="0">쿠폰 선택</option>
                                          <option value="NULL">쿠폰 없음</option>
                                          <c:forEach var="coupons" items="${coupons}">
                                             <option value="${coupons.code}">${coupons.name}</option>
                                          </c:forEach>
                                       </select>
                                    </td>
                                 </tr>
                              </c:otherwise>
                           </c:choose>
                           <tr>
                              <td>
                                 <select class="form-select-coupon" aria-label="Default select example" name="couponAmount" id="couponAmount">
                                   <option value="0" selected>쿠폰 수</option>
                                   <option value="10">10</option>
                                 </select>
                              </td>
                           </tr>
                           <tr>
                           </tr>
                        </tbody>
                     </table>
                     <div class="row my-3 text-center my-5">
                     <div class="col-12">
                        <button type="button" id="btn-cancle" class="btn btn-dark btn-lg w-25 text-light" >취소</button>
                        <button type="button" id="btn-save" class="btn btn-danger btn-lg w-25 text-light" >등록</button>
                     </div>
                  </div>
               </form>
               </div>
            </div>
      </div>
   </div>
   
   
   
   <div class="modal fade" id="form-join-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">참여한 인원</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body">
                  <form id="form-join">
                     <table class="table" id="table-join">
                        <thead>
                           <tr>
                              <th>아이디</th>
                              <th>상태</th>
                           </tr>
                        </thead>
                           <tbody>
                           <c:choose>
                              <c:when test="${empty joins }">
                                 <tr>
                                    <td colspan="4">참여자가 없습니다..</td>
                                 </tr>
                              </c:when>
                              <c:otherwise>
                                 <c:forEach var="joins" items="${joins }">
                                    <tr id="joins-${joins.eventCode }" id="jcode" data-join-code="${joins.eventCode}" class="align-middle">
                                       <td>${joins.userId }</td>
                                       <c:when test="${empty joins.result}">
									   		<td>당첨 대기</td>
									   </c:when>
									   <c:otherwise>
									   		<td>${joins.result }</td>
									   </c:otherwise>
                                    </tr>
                                 </c:forEach>
                                 <c:if test="${joins.result eq 'Y'}">
					    			<input type="hidden" id="userId" name="userId" value="${LOGINED_USER.id }">
					    			<button class="btn btn-danger btn-lg w-25 text-light" >응모하기</button>
					    		</c:if>
                              </c:otherwise>
                           </c:choose>
                        </tbody>
                        </table>
                  </form>
                  <form id="form-eventjoin">
							<div><input type="hidden" id="userId" name="userId" value="${LOGINED_USER.id }"></div>
					</form>
               </div>
               <div class="modal-footer">
               		<button type="button" class="btn btn-primary" id="btn-post-event" data-joins-code="${joins.eventCode }" data-coupon-code="${event.couponCode }">뽑기</button>
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
               </div>
            </div>
      </div>
   </div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
// 이벤트 삭제
$("#event-table tbody").on('click', '.btn-outline-danger', function() {
   
	var result = confirm("정말삭제하시겠습니까?");
	if(!result) {
		return;
	}
	
   var $tr = $(this).closest("tr");
   $.ajax({
      type: "GET",
      url: "/hmc/admin/event/delete",
      data: {eventCode: $(this).data("event-code"),
    	  	code :$(this).data("coupon-code")},
      success: function() {
         $tr.remove();
      }
   });
});

$(function(){
   	var request = "등록"
   	var requestURI
   	var eventModal = new bootstrap.Modal(document.getElementById("form-event-modal"), {
      keyboard: false
   	})
	var today = new Date;
	var todayDate = today.getFullYear() + "-" + 0 +(today.getMonth()+1) + "-" + today.getDate();
	// 새 이벤트
	$("#btn-open-event-modal").click(function(){
	   request = "등록"
	   $("#code").val();
	   $("#btn-save").text("등록");
	   console.log(todayDate)
	   eventModal.show();
	})
	
	// 이벤트등록 모달 취소 버튼 클릭시
	$("#btn-cancle").click(function() {
	 eventModal.hide(); 
	})
	
	// 이벤트등록 모달 등록 버튼 클릭시
	$("#btn-save").click(function() {
	   
	   $("#form-event").prop("action", requestURI);
	   // 유효성 검사
	   if(!$("#title").val()) {
	      alert("제목을 입력하세요");
	      $("#title").focus();
	      return false;
	   }
	   if(!$("#content").val()) {
	      alert("내용을 입력하세요")
	      $("#eventContent").focus();
	      return false;
	   }
	   if(!$("#startDate").val()) {
	      alert("시작일을 입력하세요")
	      var startDate = $("#startDate").val()
	      $("#startDate").focus();
	      return false;
	   }
	   if(!$("#endDate").val()) {
	      alert("마감일을 입력하세요")
	      $("#endDate").focus();
	      return false;
	   }
	   if($("#couponCoupon").val()==0) {
	      alert("쿠폰을 선택해주세요")
	      $("#selectCoupon").focus();
	      return false;
	   }
	   if($("#couponAmount").val()==0) {
	      alert("쿠폰수를 선택하세요")
	      $("#couponAmount").focus();
	      return false;
	   }
	   
	   // 날짜 비교
	   var startDate = $("#startDate").val();
	   var endDate = $("#endDate").val();
	   if(todayDate > startDate){
		   alert("오늘 이전 날짜를 선택할 수 없습니다.")
		   return false;
		}
	   if(startDate > endDate){
		   alert("마감일을 시작일 이전 날짜로 선택할 수 없습니다.")
		   return false;
	   }
	   
	   $("#form-event").submit();
	})
	
	
	function makeRow(event) {
	   var row = "<tr  class='align-middle' id='events-"+events.code+"'>"
	   row += "<td>"+events.code+"</td>";
	   row += "<td>"+events.title+"</td>";
	   row += "<td>"+events.startDate+"</td>";
	   row += "<td>"+events.endDate+"</td>";
	   row += "<td>"+events.status+"</td>";
	   row += "</tr>";
	   return row;
	}
	
	
	
	var joinModal = new bootstrap.Modal(document.getElementById("form-join-modal"), {
	   keyboard: false
	})
	
	
	// 참여한 인원
	$("#event-table tbody").on('click', '#btn-open-join-modal', function() {
	   
	   var eventCode = $(this).data('event-code');
	   var couponCode = $(this).data('coupon-code');
	   $.getJSON('joins', {code:$(this).data('event-code')}, function(joins){
	      var $tbody = $("#table-join tbody").empty();
	      $.each(joins, function(index,joins){
	         var row = "<tr>"
	         row += "<td>"+joins.userId+"</td>"
	         row += "<td>"+joins.result+"</td>"
	         row += "</tr>"
	         $tbody.append(row);
	      })
	      joinModal.show();    
	      
	      
	      
	      // 뽑기
	      $("#btn-post-event").click(function() {
	  		$.ajax({
	  			type: "POST",
	  			url: "/hmc/admin/event/draw",
	  			data:{
	  				eventCode:eventCode,
	  				couponCode:couponCode,
	  				joins:$("#joins").val(),
	  				userId:$("#userId").val()
	  				},
	  			dataType: 'json',
	  			success: function(eventJoin) {
	  				console.log(eventJoin);
	  			},
	  			complete: function() {
	  				alert("쿠폰 추첨을 완료했습니다.");
	  				eventModal.hide();
	  		console.log("등록");
	  			}
	  		});
	  		console.log("등록이 됌니다!");
	  	})
	   })
	})
	
	// 수정
	$("#event-table tbody").on('click', '#btn-open-modify-modal', function(event){
		$("#exampleModalLabel").text("이벤트 수정");
		request = "수정";
		requestURI = "/hmc/admin/event/modify";
		data:{
			eventContent:$("#eventContent").val();
			startDate:$("#startDate").val();
			endDate:$("#endDate").val();
			selectCoupon:$("#couponCode").val();
			couponAmount:$("#couponAmount").val();
		};
		$("#btn-save").text("수정");
		console.log("수정 실행임니당");
		var b = $("#eventContent").val();
		console.log(b);
		event.preventDefault();
		$.getJSON("/hmc/admin/event/detail?code=" + $(this).data("event-code"))
			.done(function(events) {
				$("#event-code").val(events.code);
				$("#title").val(events.title);
				$("#content").val(events.content);
				$("#writer").val(events.writer);
				$("#startDate").val(events.startDate);
				$("#endDate").val(events.endDate);
				$("#couponCode").val(events.selectCoupon);
				$("#couponAmount").val(events.couponAmount);
				eventModal.show();
			})
	})
	
	
	// 뽑기
	var is_action =false;
	
	
   
})


</script>
</body>
</html>