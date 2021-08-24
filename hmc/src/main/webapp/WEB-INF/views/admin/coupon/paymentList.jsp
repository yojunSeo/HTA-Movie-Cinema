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
            		<a href="../coupon/home">전체 쿠폰</a>
            	</div>
            	<div class="col-3 ">
            		<a href="../coupon/eventCouponList" >사용된 쿠폰</a>
            	</div>
            	<div class="col-3 ">
					<a href="../coupon/paymentList" class="btn fw-bold text-danger">지급된 쿠폰</a>
            	</div>
            	<div class="col-3">
            		<a href="../coupon/noPaymentList">쿠폰 생성</a>
            	</div>
            </div>
            <div class="row my-2">
            	<div class="col-12 border-bottom border-1 border-dark">
            	</div>
            </div>
    	<div class="row mb-3">
			<div class="col">
				<div class="border p-2 bg-light d-flex justify-content-between">
					<span>이벤트 쿠폰 목록</span>
				</div>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col">
				<div class="border p-2 bg-light">
					<table class="table" id="publishedCoupons-table">
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
											<td style="cursor:pointer;">
                                          	<a id="btn-publishedCoupons-modify" class="publishedCoupons" data-coupon-code="${coupon.code }">${coupon.name }</a></td>						
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
								<a class="page-link" href="paymentList?page=${pagination.pageNo - 1 }">이전</a>
							</li>
							<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
								<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
									<a class="page-link" href="paymentList?page=${num }">${num }</a>
								</li>
							</c:forEach>
							<li class="page-item ${pagination.pageNo ge pagination.totalPages ? 'disabled' : ''}">
								<a class="page-link" href="paymentList?page=${pagination.pageNo + 1 }">다음</a>
							</li>
							
						</ul>
					</div>
					
				</div>
			</c:if>
    </main>
    
	<div class="modal fade " id="form-publishedCoupons-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">참여한 인원</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body">
                  <form id="form-join">
                     <table class="table" id="table-publishedCoupons">
                        <thead>
                           <tr>
                              <th>아이디</th>
                              <th>지급일</th>
                              <th>기한</th>
                              <th>쿠폰 상태</th>
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
                                 <c:forEach var="publishedCoupons" items="${publishedCoupons }">
                                    <tr id="publishedCoupons-${publishedCoupons.couponCode }" id="pcode" data-publishedCoupons-code="${publishedCoupons.couponCode}" class="align-middle">
                                       <td>${publishedCoupons.userId }</td> 
                                       <td id="givenDate"><fmt:formatDate value="${publishedCoupons.startDate }" pattern="yyyy년  M월  d일"/></td>      
                                       <td id="endDate"><fmt:formatDate value="${publishedCoupons.endDate }" pattern="yyyy년  M월  d일"/></td>  
                                       <td>${publishedCoupons.isUsed }</td>      
                                    </tr>         
                                 </c:forEach>
                              </c:otherwise>
                              
                           </c:choose>
                     
                        </tbody>
                        </table>
                  </form>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
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
	var requestURI = "/hmc/admin/coupon/add";
	var publishedCouponsModal = new bootstrap.Modal(document.getElementById("form-publishedCoupons-modal"), {
		keyboard: false
	})
	
	// 쿠폰받은 사람 조회
	   $("#publishedCoupons-table tbody").on('click', '.publishedCoupons', function() {
	      
	      var couponCode = $(this).data('coupon-code');
	      var givenDate = $("#givenDate").data();
		   var endDate = $("#endDate").val();
		   var date = getFormatDate(new Date());
	      $.getJSON('publishedCoupons', {code:couponCode}, function(publishedCoupons){
	    	 console.log(couponCode);
	         var $tbody = $("#table-publishedCoupons tbody").empty();
	    	 console.log(endDate);
	         $.each(publishedCoupons, function(index,publishedCoupons){
	    	 console.log(givenDate);
	            var row = "<tr>"
	            row += "<td>"+publishedCoupons.userId+"</td>"
	            row += "<td>"+publishedCoupons.givenDate+"</td>"
	            row += "<td>"+publishedCoupons.endDate+"</td>"
	            row += "<td>"+publishedCoupons.isUsed+"</td>"
	            row += "</tr>"
	            $tbody.append(row);
	         })
	         publishedCouponsModal.show();         
	      })
	   })
	
})

function getFormatDate(date){
	var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '-' + month + '-' + day;
}

</script>
</body>
</html>
