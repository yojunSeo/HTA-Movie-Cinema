<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<title>마이페이지-HMC</title>
</head>
<style type = "text/css"> 
html, body {
	width: 100%;
	height: 100%;
}

.box {
	background-color: #FF243E;
	width: 100vw;
	margin-left: calc(-50vw + 50%);
	height: 350px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.box2 {
	margin-top: 100px;
	margin-left: 220px;
	width: 1280px;
	height: 400px;
	padding: 20px;
	background-color: #FFFFFF;
	background-position: center;
	background-size: cover;
	backgroudd-repeat: no-repeat;
/* 	border: 3px solid black; */
}

.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
    border: none;
    outline: none;
    color: #000000;
    backgrone-color: #FFFFFF;
}
span.large{
        font-size: 18px;
      }

.nav-tabs, .nav-item .nav-link {
	border: none;
	outline: none;
}
.nav-link, .nav-link:hover {
	color: #000000;
}
.nav-link.active {
	font-weight : bold;
}
.dropdown-item, .dropdown-item:hover {
	color: #000000;
	border: none;
	outline: none;
	background-color: #FFFFFF;
}
.dropdown-item.active {
	font-weight : bold;
	color: #000000;
	background-color: #FFFFFF;
}
</style>  
<body>
	<div class="container">
		<header><%@ include file="../common/header.jsp"%></header>
		<main>
			<%@include file="main.jsp" %>
			<ul class="nav nav-tabs" id="myTab" role="tablist">
			  <li class="nav-item" role="presentation">
			    <button class="nav-link active fs-5" id="give-tab" data-bs-toggle="tab" data-bs-target="#give" type="button" role="tab" aria-controls="give" aria-selected="true">구매내역</button>
			  </li>
			  <li class="nav-item" role="presentation">
			    <button class="nav-link fs-5" id="receive-tab" data-bs-toggle="tab" data-bs-target="#receive" type="button" role="tab" aria-controls="receive" aria-selected="false">선물내역</button>
			  </li>
			</ul>
			<div class="tab-content" id="myTabContent">
			  <div class="tab-pane fade show active mt-2" id="give" role="tabpanel" aria-labelledby="give-tab">
			  	<table class="table table-hover" id="give-table">
					<colgroup>
						<col width="15%"/>
						<col width="*%"/>
						<col width="*%"/>
						<col width="20%"/>
						<col width="15%"/>
						<col width="15%"/>
						<col width="8%"/>
					</colgroup>
					<thead>
						<tr class="text-center">
							<th>구매번호</th>
							<th class="text-start">상품</th>
							<th>선물받은 ID</th>
							<th>상품 개수</th>
							<th>결제금액</th>
							<th>구매일시</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
					<!-- 
						<c:choose>
							<c:when test="${empty bookings }">
								<tr class="text-center">
										<td colspan="5">예매내역이 존재하지 않습니다.</td>
									</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="booking" items="${bookings }">
					 -->
									<tr class="text-center" id="">
										<td>GF000001</td>
										<td>데이트의 완성 2인 패키지</td>
										<td>ham</td>
										<td>1 개</td>
										<td>27,000 원</td>
										<td>2021/08/10 15:04</td>
										<td><button class="btn btn-sm btn-outline-danger">결제취소</button></td>
									</tr>
	
								<!-- 
								</c:forEach>
							</c:otherwise>
						</c:choose>
								 -->
					</tbody>
				</table>
			  </div>
			  <div class="tab-pane fade mt-2" id="receive" role="tabpanel" aria-labelledby="receive-tab">
			  	<table class="table table-hover" id="receive-table">
					<colgroup>
						<col width="15%"/>
						<col width="*%"/>
						<col width="*%"/>
						<col width="20%"/>
						<col width="15%"/>
						<col width="15%"/>
						<col width="10%"/>
					</colgroup>
					<thead>
						<tr class="text-center">
							<th>선물번호</th>
							<th class="text-start">상품</th>
							<th>선물한 ID</th>
							<th>상품 개수</th>
							<th>받은일시</th>
							<th>유효기간</th>
							<th>사용여부</th>
						</tr>
					</thead>
					<tbody>
					<!-- 
						<c:choose>
							<c:when test="${empty bookings }">
								<tr class="text-center">
										<td colspan="5">예매내역이 존재하지 않습니다.</td>
									</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="booking" items="${bookings }">
					 -->
									<tr class="text-center" id="">
										<td>GF000001</td>
										<td>데이트의 완성 2인 패키지</td>
										<td>ham</td>
										<td>1 개</td>
										<td>2021/08/10 15:04</td>
										<td>2022/08/10 15:04</td>
										<td>미사용</td>
									</tr>
	
								<!-- 
								</c:forEach>
							</c:otherwise>
						</c:choose>
								 -->
					</tbody>
				</table>
			  </div>
			</div>
		</main>
		<footer><%@ include file="../common/footer.jsp"%></footer>
	</div>
	 
	 <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
      crossorigin="anonymous"></script>          
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script type="text/javascript">
	$(function(){
		
	})
	</script>
</body>
</html>