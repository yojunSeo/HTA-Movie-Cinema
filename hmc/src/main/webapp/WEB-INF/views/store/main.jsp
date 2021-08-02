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

				<div class="col-3 mt-3">
					<div class="card text-center" >
						<img src="../resources/images/store/package_sample.jpg" class="card-img-top" alt="...">
					  	<div class="card-body">
					    	<h5 class="card-title fs-5">데이트의 완성 2인 패키지</h5>
					    	<p class="card-text">2D 일반관람권 2매 + 스위트 콤보</p>
					    	<p class="text-center fs-5"> <strong>27,000원</strong> <p>
					    	<a href="#" class="card-link">상세보기</a>
					  	</div>
					</div>
				</div>
				<div class="col-3 mt-3">
					<div class="card text-center" >
						<img src="../resources/images/store/package_sample.jpg" class="card-img-top" alt="...">
					  	<div class="card-body">
					    	<h5 class="card-title fs-5">데이트의 완성 2인 패키지</h5>
					    	<p class="card-text">2D 일반관람권 2매 + 스위트 콤보</p>
					    	<p class="text-center fs-5"> 
					    		<span style="color:#FF243E;">20%</span>
					    		<strong>28,000원</strong>
					    		<small><s>35,000원</s></small> 
					    	<p>
					    	<a href="#" class="card-link">상세보기</a>
					  	</div>
					</div>
				</div>
				<div class="col-3 mt-3">
					<div class="card text-center" >
						<img src="../resources/images/store/package_sample.jpg" class="card-img-top" alt="...">
					  	<div class="card-body">
					    	<h5 class="card-title fs-5">데이트의 완성 2인 패키지</h5>
					    	<p class="card-text">2D 일반관람권 2매 + 스위트 콤보</p>
					    	<p class="text-center fs-5"> 
					    		<span style="color:#FF243E;">20%</span>
					    		<strong>28,000원</strong>
					    		<small><s>35,000원</s></small> 
					    	<p>
					    	<a href="#" class="card-link">상세보기</a>
					  	</div>
					</div>
				</div>
				<div class="col-3 mt-3">
					<div class="card text-center" >
						<img src="../resources/images/store/package_sample.jpg" class="card-img-top" alt="...">
					  	<div class="card-body">
					    	<h5 class="card-title fs-5">데이트의 완성 2인 패키지</h5>
					    	<p class="card-text">2D 일반관람권 2매 + 스위트 콤보</p>
					    	<p class="text-center fs-5"> 
					    		<span style="color:#FF243E;">20%</span>
					    		<strong>28,000원</strong>
					    		<small><s>35,000원</s></small> 
					    	<p>
					    	<a href="#" class="card-link">상세보기</a>
					  	</div>
					</div>
				</div>
				<div class="col-3 mt-3">
					<div class="card text-center" >
						<img src="../resources/images/store/package_sample.jpg" class="card-img-top" alt="...">
					  	<div class="card-body">
					    	<h5 class="card-title fs-5">데이트의 완성 2인 패키지</h5>
					    	<p class="card-text">2D 일반관람권 2매 + 스위트 콤보</p>
					    	<p class="text-center fs-5"> 
					    		<span style="color:#FF243E;">20%</span>
					    		<strong>28,000원</strong>
					    		<small><s>35,000원</s></small> 
					    	<p>
					    	<a href="#" class="card-link">상세보기</a>
					  	</div>
					</div>
				</div>
				<div class="col-3 mt-3">
					<div class="card text-center" >
						<img src="../resources/images/store/package_sample.jpg" class="card-img-top" alt="...">
					  	<div class="card-body">
					    	<h5 class="card-title fs-5">데이트의 완성 2인 패키지</h5>
					    	<p class="card-text">2D 일반관람권 2매 + 스위트 콤보</p>
					    	<p class="text-center fs-5"> 
					    		<span style="color:#FF243E;">20%</span>
					    		<strong>28,000원</strong>
					    		<small><s>35,000원</s></small> 
					    	<p>
					    	<a href="#" class="card-link">상세보기</a>
					  	</div>
					</div>
				</div>
			</div>
			
			<!-- 관람권 출력 -->
			<div class="row mt-5" id="ticket">
				<h4 ><strong>관람권</strong> </h4><br/>

				<div class="col-3 mt-3">
					<div class="card text-center" >
						<img src="../resources/images/store/ticket_sample.jpg" class="card-img-top" alt="...">
					  	<div class="card-body">
					    	<h5 class="card-title fs-5">일반 관람권</h5>
					    	<p class="card-text">일반관람권 1매</p>
					    	<p class="text-center fs-5"> <strong>12,000원</strong> <p>
					    	<a href="#" class="card-link">상세보기</a>
					  	</div>
					</div>
				</div>
				<div class="col-3 mt-3">
					<div class="card text-center" >
						<img src="../resources/images/store/ticket_sample.jpg" class="card-img-top" alt="...">
					  	<div class="card-body">
					    	<h5 class="card-title fs-5">일반관람권</h5>
					    	<p class="card-text">일반 관람권 1매</p>
					    	<p class="text-center fs-5"> 
					    		<span style="color:#FF243E;">16%</span>
					    		<strong>12,000원</strong>
					    		<small><s>10,000원</s></small> 
					    	<p>
					    	<a href="#" class="card-link">상세보기</a>
					  	</div>
					</div>
				</div>
			</div>
			
			<!-- 스낵름료 출력 -->
			<div class="row mt-5" id="snack">
				<h4 ><strong>스낵/음료</strong> </h4><br/>

				<div class="col-3 mt-3">
					<div class="card text-center" >
						<img src="../resources/images/store/snack_sample.jpg" class="card-img-top" alt="...">
					  	<div class="card-body">
					    	<h5 class="card-title fs-5">스위트 콤보</h5>
					    	<p class="card-text">오리지널L + 탄산음료(M)</p>
					    	<p class="text-center fs-5"> <strong>9,000원</strong> <p>
					    	<a href="#" class="card-link">상세보기</a>
					  	</div>
					</div>
				</div>
				<div class="col-3 mt-3">
					<div class="card text-center" >
						<img src="../resources/images/store/snack_sample.jpg" class="card-img-top" alt="...">
					  	<div class="card-body">
					    	<h5 class="card-title fs-5">스위트 콤보</h5>
					    	<p class="card-text">오리지널L + 탄산음료(M)</p>
					    	<p class="text-center fs-5"> 
					    		<span style="color:#FF243E;">33%</span>
					    		<strong>9,000원</strong>
					    		<small><s>6,000원</s></small> 
					    	<p>
					    	<a href="#" class="card-link">상세보기</a>
					  	</div>
					</div>
				</div>
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