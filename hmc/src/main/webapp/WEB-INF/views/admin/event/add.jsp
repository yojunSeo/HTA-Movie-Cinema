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
<div class="container-fluid">
      <main>
         <div class="container-fluid mt-5">
            <div class="row">
               <div class="col-2">
                  <%@include file ="../sidebar.jsp"%>
               </div>
               <div class="col-10">
					<div class="row my-3">
	               	<p class="fw-normal fs-4">이벤트 등록</p>
	           </div>
	            <div class="row">
	            	<div class="col-12 border-bottom border-2 border-dark">
	            	</div>
	            </div>
	            <div class="row mt-3">
		            <form action="insertEvent" method="post" id="register-form">
			            <table class="table">
			            	<tbody>
				            		<tr>
				            			<td>
				            				<div class="row">
												<div class="col-9">
													<input type="text" class="form-control bg-light" name="title" id="title" placeholder="제목을 입력해주세요">
												</div>
												<div class="col-3">
													<input type="text" class="form-control bg-light" name="writer" id="writer" placeholder="작성자">
												</div>
											</div>
				            			</td>
				            		</tr>
				            		<tr>
				            			<td>
				            				<div class="row">
												<div class="col-12">
													<textarea class="form-control" id="eventContent" name="eventContent" rows="5" placeholder="내용을 입력해주세요"></textarea>
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
													<select name="selectCoupon" id="selectCoupon">
														<option value="">쿠폰 선택</option>
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
											  <option selected>쿠폰 수</option>
											  <option value="10">10</option>
											  <option value="20">20</option>
											  <option value="30">30</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>
											<select class="form-select-status" aria-label="Default select example" id="status" name="status">
											  <option selected>상태</option>
											  <option value="Y">Y</option>
											  <option value="N">N</option>
											</select>
										</td>
									</tr>
			            	</tbody>
			            </table>
			            <div class="row my-3 text-center my-5">
							<div class="col-12">
								<a href="../home" class="btn btn-dark btn-lg w-25 text-light">취소</a>
								<button type="submit" id="btn-save" class="btn btn-danger btn-lg w-25 text-light" >등록</button>
							</div>
						</div>
					</form>
	            </div>
			</div>
           </div>
		</div>
	</main>

</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>


</script>
<footer>
</footer>
</body>
</html>
