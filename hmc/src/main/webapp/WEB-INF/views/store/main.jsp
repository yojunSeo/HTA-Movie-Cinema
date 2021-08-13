<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<title>스토어-HMC</title>
<style type="text/css">
	.banner {
		position: relative;
		width:100vw;
		margin-left: calc(-50vw + 50%);
		margin-right: auto;
	}
</style>
</head>

<body>
	<div class="container">

		<header>
			<%@ include file="../common/header.jsp" %>
		</header>

		<img class="banner" src="../resources/images/store/banner.png">
		<main class="mt-5">
			<div class="row justify-content-center">
				<div class="col-3 ">
					<ul class="list-group list-group-horizontal text-center">
						<li class="list-group-item"><a href="#package" style="text-decoration:none;">패키지</a> </li>
						<li class="list-group-item"><a href="#ticket" style="text-decoration:none;">관람권</a> </li>
						<li class="list-group-item"><a href="#snack" style="text-decoration:none;">스낵/음료</a> </li>
					</ul>
				</div>
			</div>

			<!-- 패키지 출력 -->
			<div class="row mt-5" id="package">
				
				<h4 ><strong>패키지</strong> </h4><br/>
					
				<c:forEach var="product" items="${products}">
					<c:if test="${product.category eq '패키지'}">
						<div class="col-3 mt-3">
							<div class="card text-center" >
								<img src="../resources/images/store/product/${product.imageFileName}" class="card-img-top" alt="...">
							  	<div class="card-body">
							    	<h5 class="card-title fs-5">${product.name}</h5>
							    	<p class="card-text" style="height:30px;">${product.memo}</p>
							    	<c:choose>
							    		<c:when test="${product.discountRate eq 0}">
									    	<p class="text-center fs-5"> <strong><fmt:formatNumber value="${product.price}" type="number"/>원</strong> <p>							    		</c:when>
							    		<c:otherwise>
							    			<p class="text-center fs-5"> 
									    		<span style="color:#FF243E;">${product.discountRate}%</span>
									    		<strong><fmt:formatNumber value="${product.discountPrice}"/>원</strong>
									    		<small><del><fmt:formatNumber value="${product.price}"/>원</del></small> 
								    		</p>
							    		</c:otherwise>
							    	</c:choose>
							    	<a href="detail?code=${product.code}" class="card-link" data-product-code="${product.code}">상세보기</a>
							  	</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
			
			<!-- 관람권 출력 -->
			<div class="row mt-5" id="ticket">
				<h4 ><strong>관람권</strong> </h4><br/>

				<c:forEach var="product" items="${products}">
					<c:if test="${product.category eq '관람권'}">
						<div class="col-3 mt-3">
							<div class="card text-center" >
								<img src="../resources/images/store/product/${product.imageFileName}" class="card-img-top" alt="...">
							  	<div class="card-body">
							    	<h5 class="card-title fs-5">${product.name}</h5>
							    	<p class="card-text" style="height:30px;">${product.memo}</p>
							    	<c:choose>
							    		<c:when test="${product.discountRate eq 0}">
									    	<p class="text-center fs-5"> <strong><fmt:formatNumber value="${product.price}"/>원</strong> <p>
							    		</c:when>
							    		<c:otherwise>
							    			<p class="text-center fs-5"> 
									    		<span style="color:#FF243E;">${product.discountRate}%</span>
									    		<strong><fmt:formatNumber value="${product.price * (1-product.discountRate*0.01) }"/>원</strong>
									    		<small><del><fmt:formatNumber value="${product.price}"/>원</del></small> 
								    		</p>
							    		</c:otherwise>
							    	</c:choose>
							    	<a href="detail?code=${product.code}" class="card-link" data-product-code="${product.code}">상세보기</a>
							  	</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
			
			<!-- 스낵음료 출력 -->
			<div class="row mt-5" id="snack">
				<h4 ><strong>스낵/음료</strong> </h4><br/>

				<c:forEach var="product" items="${products}">
					<c:if test="${product.category eq '스낵/음료'}">
						<div class="col-3 mt-3">
							<div class="card text-center" >
								<img src="../resources/images/store/product/${product.imageFileName}" class="card-img-top" alt="...">
							  	<div class="card-body">
							    	<h5 class="card-title fs-5">${product.name}</h5>
							    	<p class="card-text" style="height:30px;">${product.memo}</p>
							    	<c:choose>
							    		<c:when test="${product.discountRate eq 0}">
									    	<p class="text-center fs-5"> <strong><fmt:formatNumber value="${product.price}"/>원</strong> <p>
							    		</c:when>
							    		<c:otherwise>
							    			<p class="text-center fs-5"> 
									    		<span style="color:#FF243E;">${product.discountRate}%</span>
									    		<strong><fmt:formatNumber value="${product.price * (1-product.discountRate*0.01) }"/>원</strong>
									    		<small><del><fmt:formatNumber value="${product.price}"/>원</del></small> 
								    		</p>
							    		</c:otherwise>
							    	</c:choose>
							    	<a href="detail?code=${product.code}" class="card-link" data-product-code="${product.code}">상세보기</a>
							  	</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</main>

		<footer>
			<%@ include file="../common/footer.jsp" %>
		</footer>

	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

	<script>
		
	</script>
</body>
</html>