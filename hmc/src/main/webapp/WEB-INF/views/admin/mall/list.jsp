<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<title>상품관리-HMC</title>
</head>
<body>
	<div class="container">

		<header>
		</header>

		<main class="mt-5">
			<h3>상품관리</h3>
			
			<button class="btn btn-primary" id="btn-open-product-modal">새 상품 등록하기</button>
			
			<div class="row">
				<div class="col-12">
					<table class="table text-center">
						<thead>
							<tr>
								<th>상품코드</th>
								<th>카테고리</th>
								<th>상품명</th>
								<th>가격</th>
								<th>할인율</th>
								<th>할인가격</th>
								<th>재고</th>
								<th>등록일</th>
								<th>수정/삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="product" items="${productList}">
								<tr>
									<td>${product.code}</td>
									<td>${product.category}</td>
									<td>${product.name}</td>
									<c:choose>
										<c:when test="${product.discountRate > 0}">
											<td><del><fmt:formatNumber value="${product.price}" type="number"/> 원</del></td>
											<td style="color:red;">
													<fmt:formatNumber value="${product.discountRate}"/>%
											</td>
											<td><strong><fmt:formatNumber value="${product.price * (1-(product.discountRate)*0.01)}" type="number"/> 원</strong></td>
										</c:when>
										<c:otherwise>
											<td><strong><fmt:formatNumber value="${product.price}" type="number"/> 원</strong></td>
											<td></td>
											<td></td>
										</c:otherwise>
									</c:choose>
									<td>${product.stock}</td>
									<td>${product.createdDate}</td>
									<td>
										<button class="btn btn-success" data-product-code="${product.code}">수정</button>
										<button class="btn btn-danger" data-product-code="${product.code}">삭제</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<c:if test="${pagination.totalRows gt 0 }">
						<div class="row mb-2">
							<div class="col-12">
								<ul class="pagination justify-content-center">
									<li class="page-item ${pagination.pageNo le 1 ? 'disabled' : ''}">
										<a class="page-link" href="list?page=${pagination.pageNo - 1 }">이전</a>
									</li>
									<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
										<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
											<a class="page-link" href="list?page=${num }">${num }</a>
										</li>
									</c:forEach>
									<li class="page-item ${pagination.pageNo ge pagination.totalPages ? 'disabled' : ''}">
										<a class="page-link" href="list?page=${pagination.pageNo + 1 }">다음</a>
									</li>
								</ul>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</main>

		<footer>
		</footer>
		
		
		<div class="modal fade" id="form-product-modal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" style="background-color:#01DF3A;">
						<h5 class="modal-title fw-bold" id="exampleModalLabel">새 상품 등록하기</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body" style="background-color:#E0F8EC;">
						<form id="form-product" method="post" action="add" enctype="multipart/form-data">
							<div class="row px-2 mb-2">
								<div class="col-3">
									<label class="form-label fw-bold" for="product-code">상품코드</label>								
								</div>
								<div class="col-9">
									<input type="text" class="form-control" id="product-code" name="productCode" placeholder="자동부여" readonly="readonly">
								</div>
							</div>
							<div class="row px-2 mb-2">
								<div class="col-3">
									<label class="form-label fw-bold">카테고리</label>
								</div>
								<div class="col-9">
									<div class="form-check">
										<c:forEach var="category" items="${categories }">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category" value="${category}" >
												<label class="form-check-label">${category}</label>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>

							<div class="row px-2 mb-2">
								<div class="col-3">
									<label class="form-label fw-bold" for="product-name">상품명</label>								
								</div>
								<div class="col-9">
									<input type="text" class="form-control" id="product-name" name="name" placeholder="상품명을 입력하세요">
								</div>
							</div>
							<div class="row px-2 mb-2">
								<div class="col-3">
									<label class="form-label fw-bold">상품가격</label>
								</div>
								<div class="col-9">
									<input type="number" class="form-control" id="price" name="price" placeholder="상품가격을 입력하세요">
								</div>
							</div>
							<div class="row px-2 mb-2">
								<div class="col-3">
									<label class="form-label fw-bold">할인율</label>
								</div>
								<div class="col-9">
									<input type="number" max="100" class="form-control" id="discount-rate" name="discountRate" placeholder="할인율을 입력하세요">
								</div>
							</div>
							<div class="row px-2 mb-2">
								<div class="col-3">
									<label class="form-label fw-bold">수량</label>
								</div>
								<div class="col-9">
									<input type="number" class="form-control" id="stock" name="stock" placeholder="수량을 입력하세요">
								</div>
							</div>
							<div class="row px-2 mb-2">
								<label class="form-label fw-bold">상품 설명</label>
								<textarea rows="2" class="form-control" id="memo" name="memo" placeholder="상품 설명을 입력하세요"></textarea>
							</div>
							<div class="row px-2 mb-2">
								<label class="form-label fw-bold" for="image">상품이미지</label>
								<span id="uploaded-image-file">기존 선택된 파일 : </span>
								<input type="file" class="form-control" id="image-file" name="imageFile">
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary" id="btn-post-product">등록</button>
					</div>
				</div>
		</div>
	</div>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

	<script>
		$(function() {
		
			var productModal = new bootstrap.Modal(document.getElementById("form-product-modal"), {
				keyboard: false
			})
			var request;
			var requestURI;
			
			// 새상품 등록하기 버튼을 클릭했을 때
			$("#btn-open-product-modal").click(function() {
				requestURI = "add";
				request = "등록";
				
				$(".btn-primary").text("등록");
				$("#product-code").val("").prop("readonly", true);
				$(":radio[name=category]").eq(0).prop("checked", true);
				$("#product-name").val("");
				$("#price").val("");
				$("#discount-rate").val("");
				$("#stock").val("");
				$("#memo").val("");
				$("#uploaded-image-file").css("display","none");
				$("#image-file").val("");
				
				productModal.show();
			});
			
			$(".btn-success").click(function() {
				requestURI = "modify";
				request = "수정";
				var productCode = $(this).data("product-code");
				$.getJSON("detail?code=" + productCode)
					.done(function(product) {
						$(".btn-primary").text("수정");
						$("#product-code").val(product.code).prop("readonly", true);
						$(":radio[name=category][value="+product.category+"]").prop("checked", true);
						$("#product-name").val(product.name);
						$("#price").val(product.price);
						$("#discount-rate").val(product.discountRate);
						$("#stock").val(product.stock);
						$("#memo").val(product.memo);
						$("#uploaded-image-file").css("display","").text("기존 선택 파일 : " + product.imageFileName);
						$("#image-file").prepend("<span>"+product.imageFileName+"</span>");
						productModal.show();
					})
			})
			
			// 모달창에서 등록/수정 버튼을 클릭했을 때
			$("#btn-post-product").click(function() {
				
				$("#form-product").prop("action", requestURI);
				
				// 폼 입력값 유효성 검사
				if(!$("#product-name").val()) {
					alert("상품명을 입력하세요");
					$("#product-name").focus();
					return;
				}
				if(!$("#price").val()) {
					alert("가격을 입력하세요")
					$("#price").focus();
					return;
				}
				if(!$("#stock").val()) {
					$("#stock").attr("disabled",true);
				}
				if(!$("#discount-rate").val()) {
					$("#discount-rate").attr("disabled",true);
				}
				
				$("#form-product").submit();
			});

			$(".btn-danger").click(function() {
				var productCode = $(this).data("product-code");
				var $tr = $(this).closest("tr");
								
				alert("[" + productCode + "] 상품을 정말 삭제하시겠습니까?");
				
				$.ajax({
					type:"GET",
					url:"delete",
					data: {code: productCode},
					success: function() {
						$tr.remove();
					}
				})

			})			
			
		})
		
	</script>
</body>
</html>